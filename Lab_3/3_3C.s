	AREA SIXTH, CODE, READONLY
    EXPORT RESET_HANDLER33C
	
RESET_HANDLER33C
START     
		MOV R1, #0X40000000
		MOV R2, #0X40000020
		MOV R10, #0X40000030
		LDR R4, [R1], #4
		LDR R3, [R1]
		LDR R6, [R2], #4
		LDR R5, [R2]
		SUBS R8, R4, R6
		SBC R7, R3, R5
		STR R8, [R10], #4
		STR R7, [R10], #4

STOP    B       STOP

        END
