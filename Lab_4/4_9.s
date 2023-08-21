str_dst EQU 0x40000000

	AREA reset,CODE, READONLY 
	EXPORT Reset_Handler
Reset_Handler
START
	LDR R1, = str_src
	LDR R2, = str_sub
	MOV R6, #0
	
str_len
	LDRB R3, [R2], #1
	CMP R3, #0 
	BEQ str_check
	ADD R6, #1
	B str_len

str_check
	LDR R2, = str_sub
	LDRB R3, [R1], #1

CHECK
	LDRB R4, [R2], #1
	CMP R4, #0
	BEQ NEXT
	CMP R4, R3
	ADDEQ R5, #1
	BNE NEXT
	CMP R5, R6
	BEQ DONE
	LDRB R3, [R1], #1
	B CHECK

NEXT
	CMP R3, #0
	BNE str_check

DONE
	CMP R6, R5 
	MOVEQ R4, #1
	MOVNE R4, #0XFF

STOP B STOP

str_src DCB "I am at Surathkal", 0
str_sub DCB "Surat"

	END