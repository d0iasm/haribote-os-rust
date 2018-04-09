# The makefile of minumum OS
# Variables
NAME = minimumos

# Commands
asm:
	nasm -o $(NAME).img $(NAME).asm

run:
	qemu-system-i386 -fda $(NAME).img
