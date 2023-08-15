SYSWRITE = 4
STDOUT = 1
SYSEXIT = 1
EXIT_SUCCESS = 0
SYSREAD = 3
STDIN = 0

.global _start

.text

msg: .ascii "Write text (5): \n"
msg_len = . - msg

msg2: .ascii "Hello\n"
msg2_len = . - msg

same: .ascii "Strings are the same!\n"
same_len = . - same

not_same: .ascii "Strings are not the same!\n"
not_same_len = . - not_same

.data
buf: .ascii "      "      # Dlugosc bufora = 6 (z newline)
buf_len = . - buf

_start:
# Wypisz "Write text"
mov $SYSWRITE, %eax
mov $STDOUT, %ebx
mov $msg, %ecx
mov $msg_len, %edx
int $0x80

# Wczytaj lancuch znakow
mov $SYSREAD, %eax
mov $STDIN, %ebx
mov $buf, %ecx
mov $buf_len, %edx
int $0x80

# Zainicjalizuj licznik petli
mov $0, %ebx
# Maksymalna liczba wykonan petli
mov $buf_len, %ecx
dec %ecx  # -1 by obsluzyc wprowadzenie newline

# Petla porownujaca ciagi znak po znaku
loop:
mov msg2(%ebx), %al # Uzycie rejestru akumulatora - mozna porownywac tylko wartosci 1-bajtowe (znaki ASCII)
cmp %al, buf(%ebx)  
jne not_equal
inc %ebx
cmp %ecx, %ebx
jl loop
jmp equal

# Odpowiednia wiadomosc, gdy ciagi znakow sa rozne
not_equal:
mov $not_same, %ecx
mov $not_same_len, %edx
int $0x80
jmp end

# Wiadomosc, gdy ciagi sa takie same
equal:
mov $same, %ecx
mov $same_len, %edx
int $0x80
jmp end

# Wypisanie wiadomosci i zakonczenie programu
end:
mov $SYSWRITE, %eax
mov $STDOUT, %ebx
int $0x80
mov $SYSEXIT, %eax
mov $EXIT_SUCCESS, %ebx
int $0x80
