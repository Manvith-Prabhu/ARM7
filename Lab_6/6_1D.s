	AREA SAMPLE,CODE,READONLY
	EXPORT RESET_HANDLER
RESET_HANDLER
AH		RN R1 ; Multiplicand msb side
AL		RN R2 ; Multiplicabd lsb side
CH		RN R3 ; Multiplicand msb side
CL		RN R4 ; Multiplicabd lsb side

P1H		RN R5 ; MSB side of Product
P1L		RN R6 ; LSB side of Product

P2H		RN R7 ; MSB side of Product
P2L		RN R8 ; LSB side of Product

P3H		RN R9 ; MSB side of Product
P3L		RN R10 ; LSB side of Product

P4H		RN R11 ; MSB side of Product
P4L		RN R12 ; LSB side of Product
START
		MOV R0, #0X40000000
		LDR AH, [R0]
		LDR AL, [R0, #4]!
		LDR CH, [R0, #4]!
		LDR CL, [R0, #4]!
		
		CMP AH, #0
		MOVPL R12, #0
		MOVMI R12,#1
		
		
		CMP CH, #0
		BMI CHECK
		BPL NEGATE
		
CHECK	CMP R12, #0
		MOVEQ R12, #2
		MOVNE R12, #3

NEGATE  CMP R12, #1
		MVNEQ AH, AH
		MVNEQ AL, AL
		ADDEQ AH, AH, #1
		ADDEQ AL, AL, #1
		
		CMP R12, #2
		MVNEQ CH, CH
		MVNEQ CL, CL
		ADDEQ CH, CH, #1
		ADDEQ CL, CL, #1
		
		CMP R12, #3
		MVNEQ AH, AH
		MVNEQ AL, AL
		MVNEQ CH, CH
		MVNEQ CL, CL
		ADDEQ AH, AH, #1
		ADDEQ AL, AL, #1
		ADDEQ CH, CH, #1
		ADDEQ CL, CL, #1
		STR R12, [R0,#4]!
		
		UMULL P1L, P1H, AL, CL
		UMULL P2L, P2H, AH, CL
		UMULL P3L, P3H, AL, CH
		UMULL P4L, P4H, AH, CH

		ADDS  P2L, P2L, P1H
		ADCS  P3H, P3H, P2H
		ADC   P4H, P4H, #0
		ADDS  P2L, P3L, P2L
		ADCS  P3H, P4L, P3H
		ADC   P4H, P4H, #0
		
		LDR R1, [R0]
		CMP R1, #0
		BEQ STORE
		CMP R1, #3
		BEQ STORE
		
		MVN P4H, P4H
		ADD P4H, P4H, #1
		MVN P3H, P3H
		ADD P3H, P3H, #1
		MVN P2L, P2L
		ADD P2L, P2L, #1
		MVN P1L, P1L
		ADD P1L, P1L, #1
		
		
STORE	STR P4H, [R0, #4]!
		STR P3H, [R0, #4]!
		STR P2L, [R0, #4]!
		STR P1L, [R0, #4]
STOP    B STOP
		END