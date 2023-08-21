	AREA reset, CODE, READONLY 
	EXPORT Reset_Handler
Reset_Handler 
MAX1 	RN R2
MIN1	RN R3
MAX2    RN R4
MIN2    RN R5
AVG1	RN R6
AVG2	RN R11
Start
	 MOV R0, #0X40000000 ; QUIZ1 ADDRESS
	 MOV R1, #0X40000020 ; QUIZ2 ADDRESS
	 MOV R9, #0X40000030
	 MOV R12, #8; Let no. of students = 8
	 LDRB MAX1, [R0] ; Max = 1st entry
	 LDRB MIN1, [R0] ; Min = 1st entry
	 LDRB MAX2, [R1] ; Max = 1st entry
	 LDRB MIN2, [R1] ; Min = 1st entry
	 
FIND_MAX_MIN
		LDRB R7, [R0], #1
		LDRB R8, [R1], #1
		ADD R10, R10, #1
		CMP R10, R12
		BEQ FIND_AVG
		
		ADD AVG1, AVG1, R7
		ADD AVG2, AVG2, R8
		CMP R7, MAX1
		BGT UPDATE_MAX1
		CMP R7, MIN1
		BLT UPDATE_MIN1
		CMP R8, MAX2
		BGT UPDATE_MAX2
		CMP R8, MIN2
		BLT UPDATE_MIN2
		B FIND_MAX_MIN
		
UPDATE_MAX1
		MOV MAX1, R7
		B FIND_MAX_MIN
		
UPDATE_MAX2
		MOV MAX2, R8
		B FIND_MAX_MIN
		
UPDATE_MIN1
		MOV MIN1, R7
		B FIND_MAX_MIN
		
UPDATE_MIN2
		MOV MIN2, R8
		B FIND_MAX_MIN
		
FIND_AVG
		LSR AVG1, #3
		LSR AVG2, #3
		
STORE_RESULT
		STMIA R9, {R2-R6,R11}
		
SORT1		
	MOV R2, #1                ; USING INSERTION SORT ALGORITHM
	MOV R0, #0X40000000 ; QUIZ1 ADDRESS
OUTER_LOOP1
		CMP R2,R12
		BEQ SORT2	; Reset pointer to start of array
		MOV R3, R2                ; Set flag to 0
INNER_LOOP1
		CMP R3, #0
		BEQ NEXT1
		SUB R4, R3, #1
		LDRB R5, [R0, R3]        ; Load current number into R2
		LDRB R6, [R0, R4]
		CMP R5, R6                ; Check if end of array
		BLT SWAP1            ; If so, exit inner loop
CNTNUE1	SUB R3, R3, #1
		B INNER_LOOP1

NEXT1	ADD R2, R2, #1	
		B OUTER_LOOP1
		
SWAP1
		STRB R6, [R0, R3]
		STRB R5, [R0, R4]
		B CNTNUE1
		
SORT2		
	MOV R2, #1                ; USING INSERTION SORT ALGORITHM
	MOV R1, #0X40000020 ; QUIZ1 ADDRESS
OUTER_LOOP2
		CMP R2,R12
		BEQ STOP	; Reset pointer to start of array
		MOV R3, R2                ; Set flag to 0
INNER_LOOP2
		CMP R3, #0
		BEQ NEXT2
		SUB R4, R3, #1
		LDRB R5, [R1, R3]        ; Load current number into R2
		LDRB R6, [R1, R4]
		CMP R5, R6               ; Check if end of array
		BLT SWAP2            ; If so, exit inner loop
CNTNUE2	SUB R3, R3, #1
		B INNER_LOOP2

NEXT2	ADD R2, R2, #1	
		B OUTER_LOOP2
		
SWAP2
		STRB R6, [R1, R3]
		STRB R5, [R1, R4]
		B CNTNUE2
		
STOP    B STOP
		END