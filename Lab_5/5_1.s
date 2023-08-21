	AREA reset, CODE, READONLY 
	EXPORT Reset_Handler
Reset_Handler 
main 
	MOV R3, #0x40000
	MOV R4, # 0 ; clear shift count 
	CMP R3, # 0 ; compare whether original number is zero
				; (N=0) 
	BLE finish ; if yes, done 
loop 
	MOVS R3, R3, LSL # 1 ; shift one bit 
	ADD R4, R4, # 1 ; increment shift counter 
	BPL loop 
	
finish B finish 
	END 