.global _start

/* ===== Base addresses (CPUlator DE1-SoC) ===== */
        .equ    LED_BASE, 0xFF200000      /* LEDs */
        .equ    SW_BASE,  0xFF200040      /* Switches */

/* ===== Constants ===== */
        .equ    LED_MASK, 0x000003FF      /* 10 LEDs (L9..L0) */

_start:
        /* Pointers */
        LDR     r4, =LED_BASE
        LDR     r5, =SW_BASE

        /* Constants */
        LDR     r6, =LED_MASK             /* r6 = 0x3FF */
        MOV     r7, #1                    /* r7 = RIGHTMOST (LED0) */
        MOV     r8, #1
        LSL     r8, r8, #9                /* r8 = LEFTMOST (LED9) */

        /* State */
        MOV     r0, r7                    /* start at LED0 */

main_loop:
        /* Read switches; isolate SW0 (bit 0) */
        LDR     r1, [r5]                  /* r1 = switches */
        AND     r2, r1, #1                /* r2 = SW0 */

        /* ----- SW0 ON: run scanner (continue from where we left off) ----- */
        CMP     r2, #0
        BEQ     sw_off

        BL      show_leds
        BL      very_slow_delay

        /* Move RIGHT with wrap */
        LSR     r0, r0, #1
        CMP     r0, #0
        BNE     main_loop
        MOV     r0, r8                    /* wrapped past LED0 -> go to LED9 */
        B       main_loop

/* ----- SW0 OFF: hold current LED (stopped) ----- */
sw_off:
        BL      show_leds                 /* display current LED */
        BL      very_slow_delay
        B       main_loop

/* ----- Subroutines ----- */
show_leds:                                 /* r0 = pattern */
        AND     r3, r0, r6
        STR     r3, [r4]
        BX      lr

/* Much slower delay */
very_slow_delay:
        LDR     r3, =2000000              /* adjust for taste */
1:      SUBS    r3, r3, #1
        BNE     1b
        BX      lr
