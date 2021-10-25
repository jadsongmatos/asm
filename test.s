.global main

main:
	mov $mensagem, %rdi
	call puts
	ret

mensagem:
	.asciz	"Olá Mundo"