#include <stdio.h>
#include "sysreg.h"
#include <stdint.h>

//https://developer.arm.com/documentation/ddi0183/f/programmer-s-model/register-descriptions/data-register--uartdr?lang=en
volatile unsigned int* const UARTDR = (unsigned int*)VIRT_UART_ADDR;

char uart_read()
{
    return (char)*UARTDR;
}

void uart_write(char data)
{
    *UARTDR = data;
}
