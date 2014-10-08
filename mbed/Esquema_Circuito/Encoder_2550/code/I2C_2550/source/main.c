/*__________ Quadrature De-coder I2C ___________/*
##                                              ##
##     Autor : Ernesto V. Palacios              ##
##                                              ##
##                                              ##
##     Titulo: QED_PIC  v1.0                    ##
##     Fecha : 01/07/2012                       ##
##                                              ##
##----------------------------------------------##
## Descripción: El presente es el código fuente ##
## destinado al PIC 18F2550 para el monitoreo   ##
## de un encoder de cuadratura. Lee las líneas  ##
## A y B, determinando el ángulo relativo de gi ##
## ro y la dirección, luego envía estos datos   ##
## mediante comunicación I2C.                   ##
## _____________________________________________##  */
////////                                  \\\\\\\\
///////        PIC 18F2550 @ 48MHz         \\\\\\\
//////             Crystal 4Mhz             \\\\\\
/////                                        \\\\\
////    Comando 0x01 = Resetear contador      \\\\ 
///   Comando 0x10 = Cambia estado PIN_A2.     \\\
//                                              \\
                                              

#include <18F2550.h>
#fuses XTPLL,NOMCLR,NOWDT,NOPROTECT,NOLVP,NODEBUG,USBDIV,PLL1,CPUDIV1,VREGEN
#use delay(clock=48M) 
#use i2c( SLAVE, fast, sda=PIN_B0, scl=PIN_B1, ADDRESS = 0x36, FORCE_HW, )

//--------------_________ DEFINICIONES___________-------------------------------
#byte     PORTA=0xF80
#byte     PORTB=0xF81
#byte     PORTC=0xF82
#byte     PORTD=0xF83
#byte     TRISA=0xF92
#byte     TRISB=0xF93
#byte     TRISC=0xF94
#byte     TRISD=0xF95
#byte    INTCON=0xFF2
#byte   INTCON2=0xFF1
//------------------------------------------------------------------------------

#define  write      PIN_A0     // [02]   Led de Prueba
#define  blinky     PIN_A1    //  [03]   Led de Prueba
#define  entra      PIN_A3
#define  sale       PIN_A4
#define  A          PIN_B4   //  [25]   ENCONDER_A
#define  B          PIN_A2  //   [04]   ENCODER_B

//--------_________VARIABLES GLOBALES_________----------------------------------

int32 count = -21910;      // valor actual del enconder
int32 test = -45360;
int   dir;            // sentido de giro del motor
byte  state;         // Estado de la interrupción i2c
int   leer_i2c;     //  Comando recibido desde I2C

int  i; //Contador del I2C
int8 bit8;

//--------_________INTERRUPCION EXTERNA_______----------------------------------
#INT_RB
void external_RB4()
{
   int8 dummy;
   output_toggle( entra );
   
   if( input(B) && input(A) )   // Ambas señales en alto +1
      count++;                // Incrementa contador
   else if( !input(B) && input(A) ) // Sólo A en alto -1
      count--;           // Decrementa contador

   dummy = PORTB;    // Lee el puerto B para limpiar la interrupción
   
}

//--------_________INTERRUPCION I2C_BUS______----------------------------------
#INT_SSP
void ISR_I2C()
{
   // Interrupcion en el bus I2c
   i++;
   output_toggle( sale );
   state = i2c_isr_state();
   
   if( state < 0x80 )                   //Envio de datos desde maestro
   {
      if( i == 1 )
      {
         leer_i2c = i2c_read(0);
         output_toggle( entra );
      }
      else
         leer_i2c = 0xFF;
      
      if(leer_i2c == 0x01)//
         count = 0;                  // Resetear contador
      if(leer_i2c == 0x02)          // 
         output_toggle( write );   // Alternar Led
      
      
      if( leer_i2c == 0x10 )
         bit8 = count;
      if( leer_i2c == 0x11 )
         bit8 = count >> 8;
      if( leer_i2c == 0x12 )
         bit8 = count >> 16;
      if( leer_i2c == 0x13 )
         bit8 = count >> 24;
         
         
   }
   
   if(state >= 0x80)                //Maestro pide datos
   {
      i2c_write( bit8 );
      i=0;
   }

}
//------------------------------------------------------------------------------
void main( void )
{
   enable_interrupts( GLOBAL );
   enable_interrupts( INT_RB );    // Contador Encoder
   enable_interrupts( INT_SSP );  //  ComunicaciÃ³n i2c 
   disable_interrupts( INT_EXT );
   
   count = 0;
   i = 0;
   
   bit_clear(TRISA,0);          //  Led como salida - I2C_WRITE
   bit_clear(TRISA,1);         //  Led como salida - Blinky
   bit_set  (TRISA,2);        // Enc_A <- entrada
   bit_clear(TRISA,3);       //  Led como salida - Sale de  READ

   bit_set  (TRISB,4);      // Enc_B <- entrada


   output_low( entra );
   output_low( sale  );

   output_high( write );
   delay_ms( 250 );
   output_low( write );
   delay_ms( 250 );
   output_high( write );
   delay_ms( 250 );
   output_low( write );
   while(1)
   {
       //  Estar atento al cambio de estado en el bus I2C
      //   o en la interrupción del encoder
      output_toggle( blinky );
      delay_ms(30);
      i=0;
   }
}
