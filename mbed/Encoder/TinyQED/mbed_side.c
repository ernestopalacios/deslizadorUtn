//Interfaz con I2C ATtiny45

#include "mbed.h"

Serial          pc( USBTX, USBRX ); //Comunicacion Serial directa al computador
I2C             encoder(p28, p27);  //Comunicacion I2C para los encoders
DigitalOut myled(LED1);

const int addres = 0x3E;
char cmd [3];


int main() {

    cmd[0] = 10;
    cmd[1] = 1;
    
    char rcv [2];

    rcv[0] = 'A';
    rcv[1] = 'B';

    pc.printf("\nComando enviado @ default");
    encoder.write( addres, cmd, 1 );
    encoder.read( addres, rcv, 2 );
    pc.printf(": %d - %d", rcv[0], rcv[1]);
    
    
    encoder.frequency( 100000 );    

	
	pc.printf("\nComando enviado @ 100k");
    encoder.write( addres, cmd, 1 );
    encoder.read( addres, rcv, 2 );
    pc.printf(": %d - %d", rcv[0], rcv[1]);
    
    
}
