        AREA myData, DATA, READWRITE 	
num 	DCD 0x12345678  ; define the number to be checked
		
		AREA    Example, CODE, READWRITE
        EXPORT Reset_handler4
Reset_handler4
START

        ; Define the number in the program
        LDR     R0, num  ; Replace with the number to reverse

        ; Initialize variables
        MOV     R1, #0          ; R1 will hold the reversed number
        MOV     R2, #0          ; R2 will hold the current digit

LOOP    AND     R2, R0, #0xF    ; Extract the least significant digit
        LSL     R1, R1, #4      ; Shift the reversed number left by one digit
        ADD     R1, R1, R2      ; Add the current digit to the reversed number
        LSR     R0, R0, #4      ; Shift the original number right by one digit
        CMP     R0, #0          ; Check if all digits have been processed
        BNE     LOOP            ; Repeat the loop

        ; The reversed number is now in R1
        ; Do something with it here (e.g. print it)

        MOV     R0, #0          ; Exit the program
        
STOP    B  STOP
        END
