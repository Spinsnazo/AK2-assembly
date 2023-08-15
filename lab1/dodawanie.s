.code32

.data
liczba1:
    	.long 0x10304008, 0x701100FF, 0x45100020, 0x08570030
liczba2:
    	.long 0xF040500C, 0x00220026, 0x321000CB, 0x04520031
dlugosc_liczby = (.-liczba2)

.text
.global _start

_start:
	clc
	pushf
	movl $dlugosc_liczby, %ecx
addition:
	sub $1, %ecx
	movl liczba1(,%ecx,4), %eax
	popf
	adcl liczba2(,%ecx,4), %eax	
	push %eax
	pushf
	cmp $0, %ecx
	je end_of_addition
	jmp addition

end_of_addition:
	popf
	jnc no_carry
	push $1
	jmp end

no_carry:
	push $0

end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
