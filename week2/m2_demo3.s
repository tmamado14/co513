.global _start
.equ SWITCH_BASE, 0xFF200040
.equ SEG_BASE, 0xFF200020
_start:
    /* Load memory-mapped I/O addresses */
    LDR r0, =SWITCH_BASE    // Switch base address
    LDR r1, =SEG_BASE    	// Seven-segment display base (HEX3-HEX0)
    LDR r2, =SEG_PATTERNS   // Load address of segment pattern table

MAIN_LOOP:
    /* Read switch values */
    LDR r3, [r0]            // Read all switches into R3
    
    /* Process lower 4 bits (SW0-SW3) for HEX0 */
    AND r4, r3, #0xF        // Mask lower 4 bits
    LDR r5, [r2, r4, LSL #2] // Load 7-seg pattern for HEX0
    
    /* Process bits 4-7 (SW4-SW7) for HEX1 */
    LSR r6, r3, #4          // Shift right by 4 to get SW4-SW7
    AND r6, r6, #0xF        // Mask to ensure only 4 bits
    LDR r7, [r2, r6, LSL #2] // Load 7-seg pattern for HEX1
    
    /* Combine patterns: HEX1 in bits 8-15, HEX0 in bits 0-7 */
    LSL r7, r7, #8          // Shift HEX1 pattern to bits 8-15
    ORR r8, r5, r7          // Combine HEX0 and HEX1 patterns
    
    /* Write to seven-segment displays */
    STR r8, [r1]            // Write to HEX3-HEX0 register
    
    /* Continue loop */
    B MAIN_LOOP

/* Seven-segment display patterns for hexadecimal digits 0-F
 * Bit mapping: .gfedcba (active low, but we use active high here)
 * Segments:  a
 *          f   b
 *            g
 *          e   c
 *            d
 */
.align 2
SEG_PATTERNS:
    .word 0x3F  // 0: abcdef
    .word 0x06  // 1: bc
    .word 0x5B  // 2: abdeg
    .word 0x4F  // 3: abcdg
    .word 0x66  // 4: bcfg
    .word 0x6D  // 5: acdfg
    .word 0x7D  // 6: acdefg
    .word 0x07  // 7: abc
    .word 0x7F  // 8: abcdefg
    .word 0x6F  // 9: abcdfg
    .word 0x77  // A: abcefg
    .word 0x7C  // b: cdefg
    .word 0x39  // C: adef
    .word 0x5E  // d: bcdeg
    .word 0x79  // E: adefg
    .word 0x71  // F: aefg

.end