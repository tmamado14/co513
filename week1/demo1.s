.global _start
_start:
	MOV r0, #42
	MOV r7, #1
	
	SWI 0
	
	