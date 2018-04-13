# The makefile of minumum OS

# Variables
IPL = ipl10
HEADER = minimum

# Commands
default:
	make img

ipl.bin: $(IPL).asm Makefile
	nasm $(IPL).asm -o $(IPL).bin -l $(IPL).lst

minimum.sys: $(HEADER).asm Makefile
	nasm $(HEADER).asm -o $(HEADER).sys -l $(HEADER).lst

minimum.img: $(IPL).bin $(HEADER).sys Makefile
	mformat -f 1440 -C -B $(IPL).bin -i $(HEADER).img ::
	mcopy $(HEADER).sys -i $(HEADER).img ::

asm:
	make -r ipl.bin

img:
	make -r minimum.img

run:
	make asm
	make img
	qemu-system-i386 -fda $(HEADER).img

clean:
	rm *.bin
	rm *.lst
	rm *.img
	rm *.o
	rm *.sys

