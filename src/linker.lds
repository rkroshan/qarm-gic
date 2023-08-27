ENTRY(_Reset)
SECTIONS
{
    /* 1GB is the start for RAM */
	. = 0x40000000; 
	.text : { 
        *(.boot_text)
        *(.text) 
        }
	.data : { *(.data) }
	.bss : { *(.bss COMMON) }
	. = ALIGN(8);
	. = . + 0x1000; /* 4kB of stack memory */
	stack_top = .;
}