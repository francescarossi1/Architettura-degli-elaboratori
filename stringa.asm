.data
    # .space per riservare i 6 byte 
    stringa: .space 6

.text
Main:
    # lettura stringa
    li $v0, 8
    la $a0, stringa
    li $a1, 6
    syscall

    # stampa stringa
    li $v0, 4
    la $a0, stringa
    syscall

    # Termina programma
    li $v0, 10
    syscall
