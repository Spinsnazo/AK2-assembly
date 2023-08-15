SYSEXIT = 1
EXCODE = 0

.data
num1: .float 1
num2: .float 0.0
num3: .float -1

down: .short 0x400
up: .short 0x800

flo: .short 0b1111110011111111
doub: .short 0b1111111011111111

contr: .short 0x0


.global _start

.text

_start:
	finit

	fstcw contr
	mov contr, %eax
	#or down, %eax
	or up, %eax
	#and flo, %eax
	and doub, %eax
	mov %eax, contr
	fldcw contr

	flds num1
	fdiv num2
	flds num3
	fdiv num2
	flds num2
	fdiv num2
	flds num2
	fdiv num1
	flds num2
	fdiv num3
	
end:
	mov $SYSEXIT, %eax
	mov $EXCODE, %ebx
	int $0x80

