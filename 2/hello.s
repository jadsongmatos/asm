.section .data
hello_str: .string "Hello, World! %d\n"
index: .int 100 

.section .text
.global main

main:
    mov index(%rip), %ecx         #Recupera o valor de index em %ecx

loop:
    # Preparar argumentos para printf
    lea hello_str(%rip), %rdi     # Primeiro argumento (format string)
    xor %rax, %rax                # Valor zero para %rax indica que não há argumentos de ponto flutuante
    call printf                   # Chamar printf

    mov index(%rip), %ecx         #Recupera o valor de index em %ecx
    dec %ecx                      # Decrementa o contador (ECX)
    mov %ecx, index(%rip)         # Salvar o valor atual de %ecx em index
    jnz loop                      # Se ECX não é zero, salta para o início do loop

    call exit                     # Sair do programa
