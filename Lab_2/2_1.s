	AREA FIRST, CODE, READONLY
	EXPORT RESET_HANDLER1

RESET_HANDLER1
START

    MOV R0, #1000   
    MOV R1, #2000   

    ADD R2, R0, R1  
    ADDS R3, R0, R1 
	ADC R4, R0, R1  

    SUB R5, R0, R1  
    SUBS R6, R0, R1 
	SBC R7, R0, R1  


    RSB R8, R0, R1  
    RSC R9, R0, R1  

STOP B STOP
	END