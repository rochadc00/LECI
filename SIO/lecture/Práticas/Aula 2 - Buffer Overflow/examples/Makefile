
CC=gcc -masm=intel -g0 -fno-exceptions -fno-asynchronous-unwind-tables -fno-stack-protector

all: asm bin

bin:
	$(CC) -S -o bo bo.c
	$(CC) -S -o stack stack.c
	$(CC) -S -o mem mem.c

asm:
	$(CC) -S -o bo.s bo.c
	$(CC) -S -o stack.s stack.c

clean:
	rm -f bo.s stack.s mem bo stack
