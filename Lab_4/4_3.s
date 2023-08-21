		AREA    Example, CODE, READONLY
        EXPORT Reset_handler3
Reset_handler3
START       ; Define the number in the program
        LDR     R0, =0x17745638  ; Replace with the number to search in
        MOV     R1, #7          ; Replace with the digit to search for
        MOV     R2, #0          ; Initialize the count to zero

LOOP    CMP     R0, #0          ; Check if the number is zero
        BEQ     DONE

        MOV     R3, R0
        AND     R3, #0xF        ; Mask off all but the last digit
        CMP     R3, R1
        BNE     NEXT

        ADD     R2, R2, #1      ; Increment the count if the digit matches

NEXT    LSR     R0, R0, #4      ; Shift the number right by one digit
        B       LOOP            ; Repeat the loop

DONE    ; The count is now in R2
        ; Do something with it here (e.g. print it)

        MOV     R0, #0          ; Exit the program
        
STOP    B  STOP
        END
