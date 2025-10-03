.global _start
_start:
	MOV r0, #0b10010011 //0000 0000 0000 0000 0000 0000 1001 0011
	ROR r1, r0, #4      // r4 = r0 ROR 4 (immediate)
    
	