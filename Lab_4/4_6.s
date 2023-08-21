        AREA myData, DATA, READWRITE 	
num 	DCD 0x21
		
		AREA    Example, CODE, READWRITE
		EXPORT Reset_Handler6
Reset_Handler6
Start
        ; Define the number in the program
        LDR     R0, num         ; Replace with the number to generate Fibonacci numbers up to

        ; Initialize variables
        MOV     R1, #0           ; R1 will hold the first Fibonacci number
        MOV     R2, #1           ; R2 will hold the second Fibonacci number
        MOV     R3, #0           ; R3 will hold the next Fibonacci number

        ; Generate and print Fibonacci numbers up to the given number
        MOV     R4, #0           ; R4 will be the counter
		MOV     R5, #0X40000000
        B       FIBONACCI

NEXT    CMP     R3, R0		; Compare the current Fibonacci number with the given number
		BHS     STOP
		STRB     R3, [R5], #1
        ; Replace this with any other action you want to take with the current Fibonacci number
        ADD     R4, R4, #1       ; Increment the counter
        CMP     R3, R0		; Compare the current Fibonacci number with the given number
        BLT     FIBONACCI        ; If the current Fibonacci number is less than or equal to the given number, continue generating Fibonacci numbers

		MOV     R0, #0
STOP    B STOP  ; Exit the program
        

FIBONACCI
        ; Generate the next Fibonacci number
        ADD     R3, R1, R2       ; Calculate the next Fibonacci number
        MOV     R1, R2           ; Move R2 to R1
        MOV     R2, R3           ; Move R3 to R2

        ; Print the current Fibonacci number and continue generating Fibonacci numbers
        B       NEXT

        END
