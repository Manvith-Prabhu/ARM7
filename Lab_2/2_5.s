	AREA SIXTH, CODE, READONLY
    EXPORT RESET_HANDLER5
	
RESET_HANDLER5
START
    MOV R0, #0x12
    MOV R1, #0X80000000
    
    ; Direction of shift (0 = right, 1 = left)
    MOV R2, #0
    
    TEQ R2, #1
	BNE NOT_EQUAL
        ASRS R0, R0, #1
        ADDCS R3, R3, #1
		LSL R3, R3, #31
        LSR R1, R1, #1
		ADD R1, R1, R3
		B DONE
		
NOT_EQUAL
        LSLS R1, R1, #1
        LSL R0, R0, #1
        ADC R0, R0, #0
    

DONE
; Result in R0 (bits shifted out of R1 are lost)
STOP   B STOP
    END
