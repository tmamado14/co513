.global _start

/* Device base addresses */
.equ SWITCH_BASE, 0xff200040
.equ LED_BASE,    0xff200000

_start:
    /* Load base addresses */
    LDR r0, =SWITCH_BASE    // Switch base address
    LDR r1, =LED_BASE       // LED base address

main_loop:
    /* Read switch values */
    LDR r2, [r0]           // Load switch state into r2
    
    /* Write to LEDs */
    STR r2, [r1]           // Store switch state to LEDs
    
    /* Repeat forever */
    B main_loop

.end

