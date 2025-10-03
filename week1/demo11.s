.global _start
_start:
	MOV r0, #4
	MOV r1, #5
	
	cmp r0, r1 	// Compare r0 with r1 (sets condition flags)
	bne cond1 	// Branch to cond1 if r0 != r1
	b cond2 	// Otherwise, jump to cond2

cond1:
	mov r2, #3
	b end 		// Prevent falling through into cond2

cond2:
	mov r3, #3

end: // Program flow continues here


