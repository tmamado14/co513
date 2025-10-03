.global _start
_start:
    LDR r0, =num1       // Load address of num1
    LDR r1, [r0]        // Indirect addressing: load value of num1 into r1
    LDR r0, =num2       // Load address of num2
    LDR r2, [r0]        // Indirect addressing: load value of num2 into r2

    CMP r1, r2          // Compare num1 with num2
    BLT less_than       // If num1 < num2, branch to less_than

greater_equal:
    ADD r3, r1, r2      // r3 = num1 + num2
    ORR r4, r1, r2      // r4 = bitwise OR of num1 and num2
    B end

less_than:
    SUB r3, r2, r1      // r3 = num2 - num1
    AND r4, r1, r2      // r4 = bitwise AND of num1 and num2

end:
    // Program flow continues here

.data
num1:   .word 4
num2:   .word 7
