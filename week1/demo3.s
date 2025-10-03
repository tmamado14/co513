.global _start
_start:
	MOV r0, #4
	ADD r1, r0, #5 //immediate ADD
	ADD r2, r1, r0 //register ADD
	
	SUB r3, r1, #2 //immedaite SUB
	SUBS r3, r1, r0 //register SUB
	
	SUB r4, r0, r1 
	SUBS r5, r0,r1 //subtract enabling CPSR
	
	MUL r6, r0, r1 //register MUL (no immediate MUL operand)
	
	