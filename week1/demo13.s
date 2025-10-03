.global _start
_start:
	mov r0, #0  // Store 0 to r0
	
loop:			
	cmp r0, #5	// Compare r0 with #5
	bge end		// Branch to end if r0 >= 5
	ADD r0, #1	// r0 = r0 + 1
	b loop		// Branch to loop

end:			
				//Program flow continues here
				
				