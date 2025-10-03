.global _start
_start:
	MOV r0, #0x032E // sample operand: 0000 0011 0010 1110
    MOV r1, #2      // shift amount for the register form
	
	LSL r2, r0, #2  // r2 = r0 << 2 (immediate)
	LSL r3, r0, r1  // r3 = r0 << r1 (register)
	
	