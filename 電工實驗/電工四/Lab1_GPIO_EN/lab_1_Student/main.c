#include "M480.h"

int32_t main(void)
{
	
	// Input Pin set
	GPIO_SetMode(PA, BIT0, GPIO_MODE_INPUT);  // SW1
	GPIO_SetMode(PA, BIT1, GPIO_MODE_INPUT);  // SW2
	GPIO_SetMode(PG, BIT2, GPIO_MODE_INPUT);  // Joystick Up
	GPIO_SetMode(PC, BIT10, GPIO_MODE_INPUT);  // Joystick Down
	GPIO_SetMode(PG, BIT3, GPIO_MODE_INPUT);  // Joystick Center
	
	// Output Pin set
	GPIO_SetMode(PH, BIT6, GPIO_MODE_OUTPUT);  // LEDR1
	GPIO_SetMode(PH, BIT7, GPIO_MODE_OUTPUT);  // LEDG1
	
	// Always check
	while(1) {
		
		PH6 = (PA0 == 0 || PG2 == 0 || PG3 == 0) ? 0 : 1; // when SW1 is on or joystick either up or center, 
														  // LEDR1 lighted up
														  
		PH7 = (PA1 == 0 || PC10 == 0 || PG3 == 0) ? 0 : 1; // when SW2 is on or joystick either down or center, 
														   // LEDG1 lighted up

	}
}


