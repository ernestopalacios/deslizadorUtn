//-------  Inicializacion PIC --------------------

void init()
{
   enable_interrupts( GLOBAL );
   enable_interrupts( INT_RDA );             // Escuchar XBEE
   disable_interrupts( INT_EXT );           // INT_ENCODER
   disable_interrupts( INT_RTCC );         // INT_GYRO 
   disable_interrupts( INT_TIMER1 );      // Escalable_SRF05

   setup_timer_0( RTCC_DIV_16 );                  // Timer Gyro
   setup_timer_1( T1_INTERNAL | T1_DIV_BY_8 );   //  No usado _ SRF05 
   setup_timer_2( T2_DIV_BY_4,255,1 );  //

   set_timer0(0x00);
   ext_int_edge(0,H_TO_L);

   count = 0x00;                      // Contador Encoder
   
   bit_clear(TRISC,1);              //  CCP1 y CCP2
   bit_clear(TRISC,2);             // configurados como salida
   bit_clear(TRISB,5);
   bit_clear(TRISB,4);
   bit_clear(TRISB,3);
   bit_clear(TRISD,0);
   bit_clear(TRISD,1);
   bit_clear(TRISD,2);
   bit_clear(TRISD,3);
   bit_clear(TRISD,4);

}

//--------_______DEFINICION DE FUNCIONES________--------------------------------

char rda_assemble()
{
   /*  Estructura de la Instruccion:
    *
    *  [a][i][0][0][0][M][0][0][0][0][0]
    * 
    *  a   = angulo       ||  p    = pwm           ||  s  = scanear
    *  i/d = CW / CCW,    || +/-   = add           || i/d = CW /CCW
    *  000 = angulo (360) || 0-255 = pwm motores   || 000 = angulo
    *  M   = movimiento   ||  -    = no se aplica  ||  -  = no se aplica
    *  00000 = mag. en cm || 0-255 = pwm1-pwm2     ||  -  = no se aplica
    *
    *   --Instruccion extra [t] para testear el gripper... --
    */
   
   char ang_str [3] = " ";
   int i = 13;                       // Return
   char cnt_str [5];
   
   sentido = xbee_rx[1];        // CW - CCW

   ang_str[0] = xbee_rx[2];
   ang_str[1] = xbee_rx[3];
   ang_str[2] = xbee_rx[4];

   for( i=6 ; i<11; i++ )
      cnt_str[i-6] = xbee_rx[i];

   if ( xbee_rx[0] == 'a')
   {
      target_count   = atol( cnt_str );
      tmpTargetAngle = atol( ang_str );
      target_angle   = tmpTargetAngle;
   }
   if ( xbee_rx[0] == 'p' )
   {
      pwm_global  = atol( ang_str );
      pwm_diff    = atoi( cnt_str );
   }
   if ( xbee_rx[0] == 's')
   {
      target_count   = atol( cnt_str );
      tmpTargetAngle = atol( ang_str );
      target_angle   = tmpTargetAngle;
   } 
   
   return  xbee_rx[0];  // Regresa la instruccion dada
}

float get_distance()
{

   long  echo_delay;
   float distance;
   
   /*
    * T1_DIV_BY_8 ;
    * 12/8 = 1.5 MHz = 0.6666 us
    *
    * ( #ticks * 0.66666 )/58 = cm
    *          
    * # ticks / 87 = cm
    */
   
   // Lectura de Distancia
   
   output_high( triger );
   delay_us(15);
   output_low( triger );

   while(!input( echo ));
   set_timer1(0x00);
   while(input(echo));
   echo_delay = get_timer1();
   
   distance = echo_delay / 87.0;

   return ( distance );
}
