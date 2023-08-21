myDataSize 	EQU 1024 
abc			EQU stop+8 
aaa 		EQU myDataStart 
sum 		RN 3 
carry 		RN 4 
num 		RN 1 
count 		RN 2 
			AREA myData, DATA,NOINIT, READWRITE 
myDataStart SPACE myDataSize 
			AREA reset, CODE, READWRITE 
			EXPORT Reset_Handler1 
Reset_Handler1 
Start 		LDR R0, =myDataStart 
			LDR count, N 
 
loop 		LDR num, [R0], #4 
			ADDS sum, sum, num 
			ADDCS carry, carry,#1 
			SUBS count, count,#1 
			BNE loop 
			STR sum, [R0], #4 
			STR carry,[r0],#4 
			LDR r4,=aaa 
			LDR r5,=abc 
 
stop 		B stop 
N 			DCB 0xF 
 
			ALIGN 
myConstants DCD 0xAAAABBBB, 0x12345678, 0x88881111 
			DCD 0x00000013, 0x80808080, 0xFFFF0000 
 
			END 