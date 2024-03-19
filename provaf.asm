section .data

	msg1 db "1 - Quadrado", 0xa
	tam_msg1 equ $ - msg1

	msg2 db "2 - Triangulo", 0xa
	tam_msg2 equ $ - msg2

	msg3 db "3 - Sair", 0xa
        tam_msg3 equ $ - msg3

	msg4 db "Escolha uma opcao: "
        tam_msg4 equ $ - msg4

	msg5 db "Area:  "
        tam_msg5 equ $ - msg5

	msg6 db "Entre com a base: "
        tam_msg6 equ $ - msg6

	msg7 db "Entre com a altura: "
        tam_msg7 equ $ - msg7

	msg8 db "", 0xa
        tam_msg8 equ $ - msg8

section .bss
        num1 resq 1 
	num2 resq 1
	op resq 1
	r resq 1
	rt resq 1
	rs resq 1

section .text

global _start

_start:
	mov rax, 0x4
        mov rbx, 0x1
        mov rcx, msg1
        mov rdx, tam_msg1
        int 0x80

	mov rax, 0x4
        mov rbx, 0x1
        mov rcx, msg2
        mov rdx, tam_msg2
        int 0x80

	mov rax, 0x4
        mov rbx, 0x1
        mov rcx, msg3
        mov rdx, tam_msg3
        int 0x80

	mov rax, 0x4
        mov rbx, 0x1
        mov rcx, msg4
        mov rdx, tam_msg4
        int 0x80

	mov rax, 0x3
        mov rbx, 0x0
        mov rcx, op
        mov rdx, 2
        int 0x80

	mov r8, [op]
	sub r8, 0xa30

	cmp r8, 1
	je _quadrado

	cmp r8, 2
	je _triangulo

	cmp r8, 3
	je _sair

_quadrado:
	mov rax, 0x4
        mov rbx, 0x1
        mov rcx, msg8
        mov rdx, tam_msg8
        int 0x80

	mov rax, 0x4
        mov rbx, 0x1
        mov rcx, msg6
        mov rdx, tam_msg6
        int 0x80

	mov rax, 0x3
        mov rbx, 0x0
        mov rcx, num1
        mov rdx, 2
        int 0x80

	mov rax, 0x4
	mov rbx, 0x1
	mov rcx, msg7
	mov rdx, tam_msg7
	int 0x80

	mov rax, 0x3
	mov rbx, 0x0
	mov rcx, num2
	mov rdx, 2
	int 0x80

	mov rax, [num1]
        mov r8, [num2]
        sub rax, '0'
        sub r8, '0'
        mul r8
        add rax, '0'
        mov [r], rax

	mov rax, 0x4
        mov rbx, 0x1
        mov rcx, msg5
        mov rdx, tam_msg5
        int 0x80

	mov rax, 0x4
	mov rbx, 0x1
	mov rcx, r
	mov rdx, 1
	int 0x80

	mov rax, 0x4
        mov rbx, 0x1
        mov rcx, msg8
        mov rdx, tam_msg8
        int 0x80
	
	mov rax, 0x4
        mov rbx, 0x1
        mov rcx, msg8
        mov rdx, tam_msg8
        int 0x80

	jmp _start

_triangulo:
	mov rax, 0x4
        mov rbx, 0x1
        mov rcx, msg8
        mov rdx, tam_msg8
        int 0x80

        mov rax, 0x4
        mov rbx, 0x1
        mov rcx, msg6
        mov rdx, tam_msg6
        int 0x80

        mov rax, 0x3
        mov rbx, 0x0
        mov rcx, num1
        mov rdx, 2
        int 0x80

	mov rax, 0x4
        mov rbx, 0x1
        mov rcx, msg7
        mov rdx, tam_msg7
        int 0x80

        mov rax, 0x3
        mov rbx, 0x0
        mov rcx, num2
        mov rdx, 2
        int 0x80

	mov rax, [num1]
        mov r8, [num2]
        sub rax, '0'
        sub r8, '0'
        mul r8
        add rax, '0'
        mov [rt], rax

	mov rax, [rt]
        mov rbx, 2
        sub rax, 0xa30
	div rbx
	add rax, '0'
	mov [r], rax

	mov rax, 0x4
        mov rbx, 0x1
        mov rcx, msg5
        mov rdx, tam_msg5
        int 0x80

        mov rax, 0x4
        mov rbx, 0x1
        mov rcx, r
        mov rdx, 1
        int 0x80

        mov rax, 0x4
        mov rbx, 0x1
        mov rcx, msg8
        mov rdx, tam_msg8
        int 0x80

        mov rax, 0x4
        mov rbx, 0x1
        mov rcx, msg8
        mov rdx, tam_msg8

	jmp _start

_sair:
	jmp end
	
end:
        mov rax, 0x1
        int 0x80
