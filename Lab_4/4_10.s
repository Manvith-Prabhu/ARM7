str_dst EQU 0x40000000
 
	AREA reset, CODE, READONLY 
	EXPORT Reset_Handler
Reset_Handler
START
	MOV R0, #6
	LDR R1, =str_src
	LDR R2, =str_dst
	LDR R4, =str_sub
	MOV R5, #0
	MOV R6, #0x20

str_cpy
	CMP R5, R0
	BEQ NEXT
	LDRB R3, [R1], #1 
	CMP R3, #0
	BEQ STOP
	STRB R3, [R2], #1
	ADD R5, #1
	B str_cpy

NEXT
	LDRB R3, [R4], #1
	CMP R3, #0
	BEQ ADD_SPACE
	STRB R3, [R2], #1
	B NEXT

ADD_SPACE
	STRB R6, [R2], #1
	B ADD_RIGHT

ADD_RIGHT
	LDRB R3, [R1], #1
	CMP R3, #0
	BEQ STOP
	STRB R3, [R2], #1
	B ADD_RIGHT

STOP B STOP

str_src DCB "Hello World", 0 
str_sub DCB "Beautiful", 0
	END