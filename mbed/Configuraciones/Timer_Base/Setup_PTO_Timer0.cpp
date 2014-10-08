Setup_PTO_Timer0(){
	
	// power up TIMER0 (PCONP[1])
    LPC_SC->PCONP |= 1 << 1; 

    // reset and set TIMER0 to timer mode
    LPC_TIM0->TCR  = 0x2; 
    LPC_TIM0->CTCR = 0x0; 

    // set prescaler
    LPC_TIM0->PR = 1000;

    // calculate period (1 interrupt every second)
    uint32_t period = ( SystemCoreClock / 4000 ) * 1000; 

	// set Extyernat match register
    LPC_TIM0->MR2 = period;
    LPC_TIM0->MR3 = period * 2;
    LPC_TIM0->EMR |= 0x7 << 8;  // Toogle Pin MAT2.2 
                               //  and MAT2.3

    LPC_PINCON->PINSEL0 |= 0x7 << 16;  //Set Funtcion to MAT2.2 
                                      // and MAT2.3 

    //Start the Timer 0
    LPC_TIM0->TCR = 1;

    //OUTPUT ON PIN_5 AND PIN_6
    // OF MBED WILL TOGGLE EVERY 
    // SECOND...   I hope!
}