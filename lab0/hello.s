# Nazwy symboliczne
SYSWRITE = 4
STDOUT = 1
SYSEXIT = 1
EXIT_SUCCESS = 0

# Dyrektywa
.text
msg: .ascii "Hello! \n"
msg_len = . - msg


.global _start
_start:
# Skopiowanie numeru funkcji i jej argumentow do rejestrow
mov $SYSWRITE, %eax 
mov $STDOUT, %ebx
mov $msg, %ecx
mov $msg_len, %edx
int $0x80   # Przerwanie
mov $SYSEXIT, %eax
mov $EXIT_SUCCESS, %ebx
int $0x80

