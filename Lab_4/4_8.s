str_dst EQU 0x40000000

	AREA reset,CODE, READONLY 
	EXPORT Reset_Handler
Reset_Handler
START

	LDR R1, =str_src
	LDR R2, =str_dst

str_len
	LDRB R3, [R1], #1
	CMP R3, #0 
	BEQ NEXT
	ADD R4, #1
	B str_len
	
NEXT
	SUB R1, R1, #2 
	LDR R5, = str_src

str_rev
	LDRB R3, [R1], #-1
	CMP R4, #0
	BEQ DONE
	STRB R3, [R2], #1
	SUB R4, R4, #1
	LDRB R0, [R5], #1 
	CMP R3, R0
	BNE NO
	ADD R6, #1
	B str_rev

NO
	MOV R6, #0
	B DONE

DONE  
	CMP R6, #0
	ADDEQ R6, #0XFF 
	MOVNE R6, #1

COMPLETE
	CMP R4, #0 
	LDRB R3, [R1], #-1
	BEQ STOP
	STRB R3, [R2], #1
	SUB R4, R4, #1
	B COMPLETE

STOP BAL STOP

str_src DCB "RACECAR", 0 
	END
