; Assembly source line config statements

#include "p16f84a.inc"

 __CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _CP_OFF
RES_VECT  CODE    0x0000            ; processor reset vector

   

START
   ORG 0
    BSF STATUS,5
    MOVLW 0X0F
    MOVWF TRISA
    MOVLW 0X00
    MOVWF TRISB
    BCF STATUS,5
    
LOOP1    MOVLW 0X09
         MOVWF PORTB
	 
ATTETE	 
		
	 BTFSS PORTA,0
	 GOTO LOOP1
	 BTFSS PORTA,1
	 GOTO MODE_NUIT
	       MOVLW 0XAF
               MOVWF 0X0C
	       MOVLW 0X04
	       MOVWF 0X0D
	      
	      MOVLW 0X21
	      MOVWF PORTB
	      CALL TEMPO2
	      CALL TEMPO2
	      CALL TEMPO2
	      MOVLW 0X11
	      MOVWF PORTB
	      CALL TEMPO2
	      MOVLW 0X0C
	      MOVWF PORTB
	      CALL TEMPO2
	      CALL TEMPO2
	      CALL TEMPO2
	      MOVLW 0X0A
	      MOVWF PORTB
	      CALL TEMPO2
	      GOTO ATTETE
	 
MODE_NUIT     MOVLW 0X12
	      MOVWF PORTB
	      CALL TEMPO2
	      CLRF PORTB
	      CALL TEMPO2
	      GOTO ATTETE
	      

	      
             
	      
	      
	      
TEMPO2	      DECFSZ 0X0C,F
	      GOTO TEMPO2
	      MOVLW 0XAF
	      MOVWF 0X0C
	      DECFSZ 0X0D,F
	      GOTO TEMPO2
	        
	      RETURN
	      
	      
	      

	      
	      
    
    GOTO START

    END
