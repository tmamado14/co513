.global _start
_start:
	MOV r0, #4
	MOV r1, #5
	MOV r2, #3
	MOV r3, #4
	
	cmp r0, r1 	// r0 < r1, result is -ve, set N to 1
	cmp r0, r2 	// r0 > r2, result is +ve, set C to 1
	cmp r0, r3 	// r0 == r3, result is 0, set Z and C to 1
	
	
	