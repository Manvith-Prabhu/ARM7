	AREA reset, CODE, READONLY 
	EXPORT Reset_Handler
Reset_Handler 
Start
	 MOV R0, #0X40000000
	 LDR R1, [R0] ; Max = 1st entry
	 MOV R5, #0
; Assume there are 10 numbers in list	 
FIND_MAX
		LDR R2, [R0], #4
		ADD R5, R5, #1
		CMP R5, #10
		BEQ STOP
		CMP R2, R1
		BGT UPDATE_MAX
		B FIND_MAX
		
UPDATE_MAX
		MOV R1, R2
		B FIND_MAX
		
STOP    B STOP
		END
		
		