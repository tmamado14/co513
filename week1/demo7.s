.global _start
_start:
	MOV r0, #-325 //1111 1111 1111 1111 1111 1110 1011 1011
				  //0xffffebb
	
	ASR r1, r0, #2 // r1 = r0 >> 2 (Arithmetic Shift)
	LSR r2, r0, #2 // r1 = r0 >> 2 (Logical Shift)
	