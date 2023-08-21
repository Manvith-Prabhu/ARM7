		AREA myData, DATA, READWRITE 	
num 	DCB 10  ; define the number to be checked

        AREA reset, CODE, READWRITE 
		EXPORT Reset_Handler2 
Reset_Handler2
		; check if the number is odd or even
start	MOV r0, #0  ; clear the least significant bit
		LDRB r1, num  ; load the number into r1
		AND r1, r1, #1  ; check if the least significant bit is set
		CMP r1, #0  ; compare with zero
		BNE store
		MOV r0, #1  ; if the number is even, set the least significant bit to 1
		B stop
; store the result
store		MOV r0, #0xFF  ; store the result variable with 1 or 0xFF
stop    B stop
		ALIGN  ; align the code to a word boundary
		END
