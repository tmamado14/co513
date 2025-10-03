.global _start
_start:
	MOV r0, #42 //data processing with immediate operand
	MOV r1, r0 //data processing with register operand
	LDR r2, =list //literal addressing (loads address of list in r2)
	LDR r3, [r2] //register indirect addressing
	LDR r4, [r2, #4] //register indirect addressing with increment
	LDR r5, [r2, #4]! //reg.indirect adrressing with pre-increment
	LDR r6, [r2],#4 //reg.indirect addressing with post-increment

.data
list: .word 4, 5, -9, 1, 0, -2, 3
	
	