	AREA SAMPLE,CODE,READONLY
	EXPORT RESET_HANDLER
RESET_HANDLER
DI1		RN R0 ; Dividend
DI2		RN R1 ; Divisor
Q		RN R2 ; Quotient
R		RN R3 ; Remainder
START

; Inputs:
; r0 - 32-bit number to be divided
; r1 - 16-bit divisor

; Outputs:
; r0 - quotient
; r1 - remainder
	MOV R4, #0X40000000
	LDR R0, [R4], #4
	LDRH R1, [R4]
	MOV R2, #0  ; initialize quotient to 0
loop
  cmp r0, r1  ; compare dividend with divisor
  blo NEXT     ; if dividend is less than divisor, exit loop
  sub r0, r0, r1  ; subtract divisor from dividend
  add r2, r2, #1  ; increment quotient
  b loop      ; repeat loop  ; check if remainder is 0

NEXT  MOV R3, R0
  
STOP B STOP
      END
; quotient is in r2, remainder is in r1
