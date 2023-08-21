	AREA DATA1,DATA, NOINIT,READWRITE
DATA_START SPACE 1024
	AREA CONVERT,CODE,READONLY
	EXPORT RESET_HANDLER
RESET_HANDLER

START	LDR R0,=DATA_START
		LDRH R1,[R0],#4
		MOV R2,#1
		MOV R3,#0XF
		MOV R6,#0
		
LP		CMP R1,#0
		BEQ EX
		
		AND R4,R1,R3
		ADD R4,R4,#0X30
		ORR R5,R5,R4,LSL R6
		
		LSR R1,R1,#4
		ADD R6,R6,#8
		B LP
		
EX		STR R5,[R0],#4
		
STOP	B STOP
		END