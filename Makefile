#Absoulte Paths
export SRC_DIRECTORY=${PWD}/src
export BIN_DIRECTORY=${PWD}/bin
export BUILD_DIRECTORY=${PWD}/build

export CC = aarch64-none-elf-gcc
export DUMP = aarch64-none-elf-objdump
export AR = aarch64-none-elf-ar
export LD = aarch64-none-elf-ld
export OBJCPY =  aarch64-none-elf-objcopy
export GDB = aarch64-none-elf-gdb
export INCLUDES = -I$(SRC_DIRECTORY)
export CFLAGS = -mcpu=cortex-a57 -Wall -Wextra -g -ffreestanding -mgeneral-regs-only
export LDFLAGS = -nostdlib

export KERNEL_ELF = kernel.elf
export KERNEL_BIN = kernel.bin
export LINKER_SCRIPT = linker.lds

.PHONY: all clean build run 

all:clean build dump

build:
	$(MAKE) -C $(SRC_DIRECTORY)

clean:
	$(MAKE) -C $(SRC_DIRECTORY) clean
	rm -rf $(BIN_DIRECTORY)/kernel.txt
	

#run the emulator
run: run_qemu

run_qemu:
	qemu-system-aarch64 -M virt -cpu cortex-a57 -nographic -kernel $(BIN_DIRECTORY)/$(KERNEL_ELF)

gdb1:
	qemu-system-aarch64 -M virt -cpu cortex-a57 -nographic -gdb tcp::5416 -S -kernel $(BIN_DIRECTORY)/$(KERNEL_ELF)
gdb2:
	aarch64-none-elf-gdb -x gdbx

dump:
	$(DUMP) -S $(BIN_DIRECTORY)/$(KERNEL_ELF) > $(BIN_DIRECTORY)/kernel.txt
