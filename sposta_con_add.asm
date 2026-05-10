.data
    messaggio: .asciiz "Inserisci un numero: "

.text
Main:
    # 1. Chiede all'utente di inserire un numero
    la $a0, messaggio
    li $v0, 4
    syscall

    # 2. Legge l'intero (syscall 5)
    li $v0, 5
    syscall             # Il numero va in $v0

    # 3. Copia il valore da $v0 a $a0 usando la somma
    # Sommare 0 a un numero non lo cambia, quindi: $a0 = 0 + $v0
    add $a0, $zero, $v0

    # 4. Stampa l'intero (syscall 1)
    li $v0, 1
    syscall

    # 5. Termina il programma (sempre necessario!)
Exit:
    li $v0, 10
    syscall
