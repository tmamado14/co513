.global _start
_start:
	MOV r0, #4
	MOV r1, #5
	
	cmp r0, r1	// Compare r0 with r1 (sets condition flags)
	beq cond1 	// Branch to cond1 if r0 == r1
	b cond2  	// Otherwise, jump to cond2

cond1:
	mov r2, #3

cond2:
	mov r3, #3