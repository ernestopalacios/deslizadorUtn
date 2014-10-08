/*__________ Control del deslizador ______________/*
##                                              ##
##     Autor : Ernesto V. Palacios              ##
##                                              ##
##                                              ##
##     Titulo: deslizador v0.1                  ##
##     Fecha : 25/06/2012                       ##
##                                              ##
##----------------------------------------------##
## Descripción: El presente es el código fuente ##
## destinado al PIC 18F2550 para el control del ##
## delizador lineal del laboratiorio de mecatro ##
## nica. Utilizando como entrada el sensor  ul- ##
## trasonico SRF-05.                            ##
##                                              ##
## _____________________________________________##  */

#include <18F2550.h>
#include <stdlib.h>

#fuses   XTPLL,NOMCLR,NOWDT,NOPROTECT,NOLVP,NODEBUG,USBDIV,PLL1,CPUDIV1,VREGEN
#use     delay(clock=48000000)  // 4MHz Proto   -> PlL1
                               //12MHz OnBoard -> PLL3
#use rs232(BAUD = 9600, UART1 )
#use      standard_io(A)
#use      standard_io(B)
#use      standard_io(C)
#use      standard_io(D)
#use      standard_io(D)

#include "Funciones.h"


//--------_________VARIABLES GLOBALES_________----------------------------------

char  envia_rx [11];         //Cadena de caracteres a enviar
char  recibe_rx [11];       //Cadena de caracteres a enviar

