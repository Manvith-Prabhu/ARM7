	AREA SAMPLE,CODE,READONLY
	EXPORT RESET_HANDLER
RESET_HANDLER
START
		MOV R6, #0X40000000
		LDR R0, [R6]
		MOV R1, #1
		MOV R5, #10
		
LOOP
		AND R3, R0, #0XF
		MLA R4, R3, R1, R4
		ADD R2, R2, #1
		LSR R0, R0, #4
		MUL R1, R5, R1		
		CMP R2, #4
		BNE LOOP
		
STOP 	B STOP
		END
	