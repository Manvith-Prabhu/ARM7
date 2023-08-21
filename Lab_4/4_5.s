        AREA myData, DATA, READWRITE 	
num 	DCD 0x6 
		
		AREA    Example, CODE, READWRITE
        EXPORT Reset_handler5
Reset_handler5
START
; Define the number in the program
        LDR     R0, num          ; Replace with the number to check
        ; Initialize variables
        MOV     R1, #0          ; R1 will hold the first Fibonacci number
        MOV     R2, #1          ; R2 will hold the second Fibonacci number
        MOV     R3, #0          ; R3 will hold the next Fibonacci number

LOOP    CMP     R3, R0          ; Compare the next Fibonacci number with the given number
        BEQ     FIBONACCI       ; If they are equal, the number is a Fibonacci number

        ADD     R3, R1, R2      ; Calculate the next Fibonacci number
        MOV     R1, R2          ; Move R2 to R1
        MOV     R2, R3          ; Move R3 to R2
        CMP     R3, R0          ; Compare the next Fibonacci number with the given number
        BLS     LOOP            ; If the next Fibonacci number is less than or equal to the given number, repeat the loop

NOT_FIB CMP     R0, #0          ; Check if the given number is zero
		MOV     R5, #0xFF
        BEQ     STOP		; If it is zero, it is not a Fibonacci number
		CMP     R0, R3
		BLT     STOP
       

FIBONACCI
        MOV     R5, #1
       
STOP    B  STOP
        END
