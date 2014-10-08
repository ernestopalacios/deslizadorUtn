// El siguiente codigo sirve de ejemplo para 
// establecer un tren de impulsos y controlar
// su frecuencia.
 
#include "mbed.h"
#include "setup.h"

Serial     pc( USBTX, USBRX );

void Setup_PTO_Timer2();
void ISR_Serial();

int main() {
    

    pc.printf( "\n Ingrese un numero entero seguido de un comando\n luego presione enter por ejemplo: 500-p  " );
    pc.printf( "\n Comandos:" );
    pc.printf( "\n p = para cambiara el prescaler por el numero ingresado" );
    pc.printf( "\n m = para cambiara el valor de MR2 por el numero ingresado:" );
    pc.printf( "\n n = para cambiara el valor de MR2 por el numero ingresado:" );
    pc.printf( "\n a = Inicia el timer, no importa el numero" );
    pc.printf( "\n s = Detiene el timer, no importa el numero" );
    
    Setup_PTO_Timer2();
    pc.attach( &ISR_Serial );

    uint32_t prescaler = (uint32_t ) LPC_TIM2->PR ;
    pc.printf( "\n\nPreescaler Actual = %d\n\n", prescaler );

    while(1) {
   
    
     }
}
