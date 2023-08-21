str_dst 	EQU 0x040000000 
myDataSize  EQU 1024 
		AREA myData, DATA, READWRITE 
myDataStart SPACE myDataSize 
 
		AREA reset, CODE, READONLY 
		EXPORT Reset_Handler 
 
Reset_Handler 
			LDR R1, =str_src ; Pointer to the first string 
			LDR R2, =str_dst ; Pointer to the second string 
 
str_cpy 	LDRB R3, [R1],#1 ; load a byte and update the pointer 
			STRB R3, [R2],#1 ; store byte and update the pointer 
			CMP R3, #0 ; Check for End of string 
			BNE str_cpy 
stop 		BAL stop 
 
str_src 	DCB "This my string start.",0 
		END