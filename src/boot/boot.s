.section .boot_text

.global _Reset
.global _start

_start:
_Reset: //reset handler which invokes at boot up
    ldr x30, =stack_top	    // setup stack pointer from linker script
    mov sp, x30
    bl main                 //jump to main
end:
    b end
    