.global _start
_start:
	MOV r0, #0xA
	MOV r1, #0x7
	
	AND r2, r0, r1 //bitwise AND
	ORR r3, r0, r1 //bitwise OR
	EOR r4, r0, r1 //bitwise XOR
	MVN r5, r0     //bitwise inversion
	
	