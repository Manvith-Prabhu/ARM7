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
		UMULL P1L, P3L, AL, CL
		UMLAL P3L, P4L, AH, CL
		UMLAL P3L, P4L, AL, CH
		UMLAL P4L, P4H, AH, CH
		STR P4H, [R0, #4]!
		STR P4L, [R0, #4]!
		STR P3L, [R0, #4]!
		STR P1L, [R0, #4]
STOP    B STOP
		END