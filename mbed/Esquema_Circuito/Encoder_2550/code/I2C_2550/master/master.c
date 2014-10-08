// I2C source code for testing functionality

//  PIC 18F2550 @ 48MHz
//  Crystal 4Mhz
//
//


#include <18F2550.h>
#fuses XTPLL,NOMCLR,NOWDT,NOPROTECT,NOLVP,NODEBUG,USBDIV,PLL1,CPUDIV1,VREGEN
#use delay(clock=48M) 
#use i2c( MASTER, fast, sda=PIN_B0, scl=PIN_B1, FORCE_HW )

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

#define  led_alive  PIN_A0   // [02] AN0
#define  test       PIN_B4
#define  leer       PIN_B5

//--------_________VARIABLES GLOBALES_________----------------------------------

byte i2c_rx [10];       // Cadena de caracteres Recibida
int32 count;

//--------_________INTERRUPCION EXTERNA_______----------------------------------
#INT_RB
void external_RB4()
{
   int8 c;
   if( input( test ) )
   {
      i2c_start();
      i2c_write(0x36); //Direccion
      i2c_write(0x02); //Led_On
      i2c_stop();
   }
   else if( input( leer ) )
   {
      i2c_start();
      i2c_write( 0x36+1 );
      i2c_rx[0] = i2c_read(0);
      i2c_stop();
   }

   c = PORTB;
   
}

//------------------------------------------------------------------------------
void main( void )
{
   enable_interrupts( GLOBAL );
   enable_interrupts( INT_RB );    // Enviar comando
   
   count = 0;
   
   bit_clear(TRISA,0);        //  Led como salida
   bit_set  (TRISA,2);       // Enc_A <- entrada
   bit_set  (TRISB,4);      // Enc_B <- entrada

   while(1)
   {


  
   }
}
