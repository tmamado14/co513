.global _start
_start:
	mov r0, #2 //arg1
	mov r1, #3 //arg 2

	push {r0, r1} 	// Save arguments r0 and r1 on the stack (to restore later)
	bl add_nums  	// Branch with link: call add_nums function
	
	mov r2, r0
	pop {r0, r1} 	// Restore original arguments from the stack into r0 and r1
	
	b end

add_nums:
	add r0, r0, r1
	bx lr			// Return from function, jump back to caller
	
end:
	