	AREA reset, CODE, READONLY 
	EXPORT Reset_Handler
Reset_Handler 
Start
	MOV R0, #0X40000000
	MOV R1, #0X40000020
	MOV R3, #0
	MOV R2, #5 ; Let size of block be = 5 words
LOOP
		LDR R4, [R0]
		SWP R4, R4, [R1]
		STR R4, [R0], #4
		ADD R1, R1, #4
		ADD R3, R3, #1
		CMP R3, R2
		BNE LOOP
		
STOP B STOP
		END