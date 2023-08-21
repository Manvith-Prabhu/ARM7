IO1DIR EQU 0xE0028018 
IO1SET EQU 0xE0028014 
IO1CLR EQU 0xE002801C 
	AREA BlinkyTest, CODE, READONLY 
	EXPORT __main
__main 
	LDR r1, =IO1DIR ; load the address of the IODIR reg to R1 
	LDR r0, =0x00FF0000 ; To set pins P1.16 to P1.23 as output pins 
 
	STR r0, [r1] 
	LDR r2, =IO1SET ; load the address of the IOSET reg to R2 
	LDR r3, =IO1CLR ; load the address of the IOCLR reg to R3 
repeat 
	MOV r4, #0x00010000 ; write a control word to set one bit 
next 
	STR r4, [r2] 
	LDR r5, =0xFFF00 ; Delay program to retain the bit for some time. 
delay 
	SUBS r5, r5, #1 
	BNE delay 
	STR r4, [r3] ; write a control word to clear the same bit 
 
	MOV r4, r4, LSL #1 
	CMP r4, #0x800000 
	BNE next 
	B repeat 
	END 