# commands

asm:
	nasm -o helloos.img helloos.asm

run:
	qemu-system-i386 -fda helloos.img
