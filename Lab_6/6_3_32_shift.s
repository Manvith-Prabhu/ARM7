	AREA SAMPLE,CODE,READONLY
	EXPORT RESET_HANDLER
RESET_HANDLER
START
	LDR R0,DVD ; DIVIDEND
	LDRH R1,DVS ; DIVISOR
	MOV R2,#0 ; REMAINDER
	MOV R3,#1 ; 32 BIT COUNTER
; HERE DIVIDEND CHANGES TO QUOTIENT
LOOP
	CMP R3,#32
	BGT DONE
	ADD R3,R3,#1
	MOV R2,R2,LSL #1
	MOVS R0,R0,LSL #1
	ADC R2,R2,#0
	SUBS R2,R2,R1
	ADDPL R0,R0,#1
	ADDMI R2,R2,R1
	B LOOP

DONE
	MOV R4, R0 ; R4= QUOTIENT
STOP B STOP
DVD DCD 0XFFFFFFED
DVS DCW 0XFF
	END