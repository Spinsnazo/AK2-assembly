float: float.o
	ld -m elf_i386 -o float float.o
float.o: float.s
	as --32 --gstabs -o float.o -g float.s 
clean:
	rm float.o
