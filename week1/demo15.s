.global _start
_start:
    // Prepare six arguments for function call
    // First 4 arguments go in r0-r3 (ARM calling convention)
    mov r0, #1         // First argument
    mov r1, #2         // Second argument
    mov r2, #3         // Third argument
    mov r3, #4         // Fourth argument
    
    // Arguments 5 and 6 must be pushed onto stack
    mov r4, #6         // Sixth argument
	push {r4}		   // Push sixth argument on stack
    mov r4, #5         // Fifth argument
    push {r4}          // Push fifth argument on stack
    
    // Call add_six function
    bl add_six          // Branch with link to add_six
    
    add sp, sp, #8      // Adjust stack pointer (2 words = 8 bytes)
    
    // r0 contains the sum
    
    // End program - infinite loop for CPUlator
end:
    b end               // Branch to self (infinite loop)

add_six:
    push {lr}           // Save link register
    
    // Arguments 1-4 are already in r0-r3
    // Arguments 5-6 are on the stack
    
    // Add first four arguments
    add r0, r0, r1      // r0 = arg1 + arg2
    add r0, r0, r2      // r0 = r0 + arg3
    add r0, r0, r3      // r0 = r0 + arg4
    
    // Get arguments 5 and 6 from stack
    // Stack layout: [top] -> return_addr, arg5, arg6
    ldr r4, [sp, #4]    // Load fifth argument (offset 4)
    
    add r0, r0, r4      // r0 = r0 + arg5
   	ldr r4, [sp, #8]    // Load sixth argument (offset 8)
   	add r0, r0, r4      // r0 = r0 + arg6
    
    // Result is in r0 (return value)
    pop {lr}            // Restore link register
    bx lr               // Return to caller
	
	