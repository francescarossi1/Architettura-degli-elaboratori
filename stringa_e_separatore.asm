.data
    stringa:   .space 5
    separatore: .asciiz "!\n"

.text
Main:
    # Lettura stringa (fino a 4 caratteri + terminatore)
    li $v0, 8
    la $a0, stringa
    li $a1, 5
    syscall

    # Sposta l'indirizzo della stringa in $t0 ("travasare")
    move $t0, $a0

    # Stampiamo il separatore
    li $v0, 4
    la $a0, separatore
    syscall

    # Prende di nuovo l'indirizzo della stringa da $t0 e viene stampato
    move $a0, $t0
    li $v0, 4
    syscall

    # Fine programma
    li $v0, 10
    syscall
