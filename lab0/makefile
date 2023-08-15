all: hello writeText compareText

hello: hello.o
	ld hello.o -m elf_i386 -o hello
hello.o:
	as --32 hello.s -g -o hello.o

writeText: writeText.o
	ld writeText.o -m elf_i386 -o writeText
writeText.o:
	as --32 writeText.s -g -o writeText.o
	
compareText: compareText.o
	ld compareText.o -m elf_i386 -o compareText
compareText.o:
	as --32 compareText.s -g -o compareText.o

clean:
	rm hello.o writeText.o compareText.o

