	AREA Example, CODE, READONLY
	EXPORT RESET_HANDLER5
RESET_HANDLER5
START
	MOV     R0, #0X40000000
    MOV     R3, #0                          
LOOP
	LDR     R1, [R0]
    ADD     R2, R1, #0XFF              
    ADD     R3, R3, #1 
	STR     R2, [R0]
	ADD     R0, R0, #4
    CMP     R3, #10               
    BNE     LOOP                           



STOP B STOP

    END
