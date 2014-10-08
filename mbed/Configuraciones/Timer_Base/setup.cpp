/// Codigo Fuente para configurar al 

#include "setup.h"
#include "mbed.h"


// Esta variable global determina
// los incrementos del Preescaler
extern uint32_t PRESCALER_STEP; 

// Salida Serial de mbed
extern Serial pc;


/** @brief: Esta funci�n configura al Timer2
 *  para que las salidas p5 y p6 del mbed
 *  se alternen cada vez que se iguala al
 *  registro MR2 y MR3.
 */
void Setup_PTO_Timer2()
{
    // Encender Timer2 (PCONP[22])
    LPC_SC->PCONP |= 1 << 22; 

    // Resetear y parar el Timer
    LPC_TIM2->TCR  = 0x2; 
    LPC_TIM2->CTCR = 0x0; 

    // Establecer el Preescaler inicial 0.5 seg
    LPC_TIM2->PR = 100;

    // Calcular el periodo 
    uint32_t periodo = ( SystemCoreClock / 4000 ); 

    // Establecer los Registros de Coincidencia
    // ( Match Register )
    LPC_TIM2->MR2 = periodo;
    LPC_TIM2->MR3 = periodo * 2;
    
    LPC_TIM2->MCR |= 1 << 10;    // Resetear Timer en MR3
    
    LPC_TIM2->EMR |= 15UL << 8;  // Alternar Pin MAT2.2 
                                //      y MAT2.3

    LPC_PINCON->PINSEL0 |= 15UL << 16;  //Activar  MAT2.2 
                                       // y MAT2.3 como salidas

    // Arrancer el Timer 2
    LPC_TIM2->TCR = 1;

}


/** @brief: Esta es la rutina que maneja las interrupciones
 *  seriales, al recibir un caracter.
 */
void ISR_Serial()
{
    int newValue;
    char command;

    pc.scanf( "%d-%c", &newValue, &command ) ;
    pc.printf("\n %d-%c \n", newValue, command );

    if( command == 'p')
       setPrescaler( newValue );
    else if( command == 'm')
        setMR2( newValue );
    else if( command == 'n')
        setMR3( newValue );
    else if( command == 'a')
        startTimer2();
    else if( command == 's')
        stopTimer2();


}


/** @brief: Esta Funcion cambia el preescaler
 *  directamente
 */
void setPrescaler( int newValue)
{
    LPC_TIM2->PR = newValue; 
}


void setMR2( int newValue )
{
    LPC_TIM2->MR2 = newValue;
}


void setMR3( int newValue )
{
    LPC_TIM2->MR3 = newValue;
}

void startTimer2()
{
    // Arrancer el Timer 2
    LPC_TIM2->TCR = 1;
}

void stopTimer2()
{
    // Arrancer el Timer 2
    LPC_TIM2->TCR = 0x2;
}