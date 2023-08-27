#include <stdio.h>
#include "utils/utils.h"

void print_test()
{
    printk("Hi just checking %d %x %s %u %d\n", 123, 0x123, "0x123", -123, -123);
}

int main(void)
{
    /*uart read test*/
    print_test();
    return 0;
}