; Programme assembleur pour resoudre l'equation du 1er degré ax+b=c

extern printf, scanf

segment .data
    promptDouble db "%lf", 0
    promptDoubleA db "Entrez la valeur de a : ", 0
    promptDoubleB db "Entrez la valeur de b : ", 0
    promptDoubleC db "Entrez la valeur de c : ", 0
    promptResultat db "La solution de l'equation %lf*x+%lf=%lf est %lf", 10, 0

segment .bss
    a      resq 1
    b      resq 1
    c      resq 1
    result resq 1

segment .text
    global main
main: 
    push rbp

  

    ;saisie et lecture de a
    mov rdi, promptDoubleA
    mov rax, 0
    call printf
    mov rdi, promptDouble
    mov rsi, a
    mov rax, 0
    call scanf

    ;saisie et lecture de b
    mov rdi, promptDoubleB
    mov rax, 0
    call printf
    mov rdi, promptDouble
    mov rsi, b
    mov rax, 0
    call scanf

    ;saisie et lecture de c
    mov rdi, promptDoubleC
    mov rax, 0
    call printf
    mov rdi, promptDouble
    mov rsi, c
    mov rax, 0
    call scanf

    ; traitement
    movsd xmm0, [c]  ; xmm0 <- c
    subsd xmm0, [b]  ; c <- c-b
    divsd xmm0, [a]  ; c <- c/a
    movsd [result], xmm0

    ; affichage result
    mov rdi, promptResultat
    movsd xmm3, [result]
    movsd xmm2, [c]
    movsd xmm1, [b]
    movsd xmm0, [a]
    mov rax, 2
    call printf

    pop rbp
    ret

