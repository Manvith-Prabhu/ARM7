	AREA Example, CODE, READONLY
	EXPORT RESET_HANDLER6
RESET_HANDLER6
START
	MOV     R8, #0X40000000
	MOV     R9, #0X40000020
	MOV		R0, #1
    MOV     R1, #2 
	MOV     R2, #3
	MOV     R3, #4
	MOV     R4, #5
	MOV     R5, #6
	MOV     R6, #7
	MOV     R7, #8
	MOV     R10, #0
	STMIA   R9, {R0,R1,R2,R3,R4,R5,R6,R7}
	LDMIA   R8, {R0,R1,R2,R3,R4,R5,R6,R7}
LOOP
	LDR     R11, [R9]
	STR     R11, [R8]
	ADD     R8, R8, #4
	ADD     R9, R9, #4
	ADD     R10, R10, #1
    CMP     R10, #8               
    BNE     LOOP                           

	SWP 	R1, R1, [R8]
STOP B STOP

    END
