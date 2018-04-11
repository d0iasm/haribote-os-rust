# The makefile of minumum OS

# Variables
IPL_NAME = ipl10
OS_NAME = minimum

# Commands
default:
	make img

ipl.bin: $(IPL_NAME).asm Makefile
	nasm $(IPL_NAME).asm -o $(IPL_NAME).bin -l $(IPL_NAME).lst

minimum.sys: $(OS_NAME).asm Makefile
	nasm $(OS_NAME).asm -o $(OS_NAME).sys -l $(OS_NAME).lst

minimum.img: $(IPL_NAME).bin $(OS_NAME).sys Makefile
	mformat -f 1440 -C -B $(IPL_NAME).bin -i $(OS_NAME).img ::
	mcopy $(OS_NAME).sys -i $(OS_NAME).img ::

asm:
	make -r ipl.bin

img:
	make -r minimum.img

run:
	make asm
	make img
	qemu-system-i386 -fda $(OS_NAME).img

clean:
	rm *.bin
	rm *.lst
	rm *.img
	rm *.sys

