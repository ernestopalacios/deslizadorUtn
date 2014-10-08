//--------------_________ DEFINICIONES___________-------------------------------
#byte     PORTA = 0xF80
#byte     PORTB = 0xF81
#byte     PORTC = 0xF82
#byte     PORTD = 0xF83
#byte     TRISA = 0xF92
#byte     TRISB = 0xF93
#byte     TRISC = 0xF94
#byte     TRISD = 0xF95
#byte    ADCON0 = 0xFC2
#byte    ADCON1 = 0xFC1
#byte    ADCON2 = 0xFC0
#byte     T0CON = 0xFD5
#byte   INTCON2 = 0xFF1
//------------------------------------------------------------------------------

#define  echo       PIN_B7
#define  triger     PIN_B6     


//--------_________DECLARACION DE FUNCIONES______-------------------------------
void  init();
float get_distance();
char  rda_assemble();
void  acercarse();
