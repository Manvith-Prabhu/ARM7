
SRC EQU 0X40000000

	AREA SAMPLE,CODE,READONLY
	EXPORT RESET_HANDLER
RESET_HANDLER
START
	LDR R0,=INPUT
	LDR R1,=STRING1
	LDR R2,=STRING2
; COMPARE FOR NAME
CHECK_NAME
	LDRB R3,[R1],#1
	CMP R3,#0
	BEQ NEXT1
	LDRB R4,[R0],#1
	CMP R4,R3
	BEQ CHECK_NAME
	LDR R0,=INPUT
CHECK_AGE
	LDRB R3,[R2],#1
	CMP R3,#0
	BEQ NEXT2
	LDRB R4,[R0],#1
	CMP R4,R3
	BEQ CHECK_AGE
	BNE STOP
NEXT1
	BL SORT_NAME
	B STOP
NEXT2
	BL SORT_AGE
STOP B STOP
SORT_AGE
	LDR R0,=SRC
	ADD R2,R0,#40
	ADD R0,R0,#3
LOOP1
	LDRB R1,[R0],#4
	CMP R0,R2
	BGE DONE
	MOV R3,R0
SORT1
	CMP R3,R2
	BGE LOOP1
	LDRB R4,[R3]
	CMP R1,R4
	MOVHI R5,#0
	MOVHI R8,#-4
	BHI SWAP1
L1
	LDRB R1, [R0, #-4]
	ADD R3,R3,#4
	B SORT1
SWAP1
	CMP R5,#-4
	BEQ L1
	LDRB R6,[R3,R5]
	LDRB R7,[R0,R8]
	STRB R6,[R0,R8]
	STRB R7,[R3,R5]
	SUB R5,R5,#1
	SUB R8,R8,#1
	B SWAP1
DONE
	BX LR
SORT_NAME
	LDR R0,=SRC
	ADD R2,R0,#40
LOOP2
	ADD R3,R0,#3
	MOV R6,R0
	ADD R7,R6,#4
	MOV R4,R7
L2
	LDRB R1,[R6],#1
	CMP R6,R2
	BGE DONE
	CMP R6,R3
	ADDGT R7,#4
	MOVGT R4,R7
	MOVGT R6,R0 
	BGT L2
	LDRB R5,[R4],#1
	CMP R4,R2
	ADDGE R0,#4
	BGE LOOP2
	CMP R1,R5
	BLT SORT2
	MOVGT R8,#0
	BGT SWAP2
	B L2
SORT2
	MOV R6,R0
	ADD R7,#4
	MOV R4,R7
	B L2
SWAP2
	CMP R8,#4
	BEQ SORT2
	LDRB R1,[R0,R8]
	LDRB R5,[R7,R8]
	STRB R1,[R7,R8]
	STRB R5,[R0,R8]
	ADD R8,#1
	B SWAP2
STRING1 DCB "NAME",0
STRING2 DCB "AGE",0
INPUT DCB "AGE",0
	END
