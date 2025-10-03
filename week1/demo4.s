.global _start
_start:
	LDR r0, =buff //loads the address of buff on r0
	MOV r1, #3 
	MOV r2, #14
	
	STR r1, [r0] //strores r1 to address pointed by r0
	STR r2, [r0, #4] //stores r2 to address pointed by r0+1
	
	

.data
.align 4 // align the next label (buff) on a 16-byte boundary
buff: .space 8 //reserve 8 bytes of uninitialized space
			  // starting at label 'buff'

	