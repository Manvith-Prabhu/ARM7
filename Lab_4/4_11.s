str_dst EQU 0X40000000
	AREA Example, CODE, READONLY
	EXPORT Reset_Handler
Reset_Handler
START
	LDR R1, =str_src
	LDR R2, =str_dst
	
LOOP
	LDRB R3, [R1], #1
	CMP R3, #0
	BEQ STORE
	CMP R3, #0X20
	BEQ LOOP
	STRB R3, [R2], #1
	B LOOP
	
STORE
	LDR R1, =str_src
	LDR R2, =str_dst
	
SQUEEZE
	LDRB R4, [R2], #1
	CMP R4, #0
	BEQ DONE
	CMP R4, #0X20
	BEQ SQUEEZE
	STRB R4, [R1], #1
	B SQUEEZE

DONE STRB R4, [R1], #1
STOP B STOP

str_src DCB "Hello world hello", 0
	END

	