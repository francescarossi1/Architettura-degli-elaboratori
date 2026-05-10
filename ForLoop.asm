.data

.text
Main:
    li $t0, 0          # Inizializza il contatore: i = 0
    li $v0, 1          # Codice syscall per stampare un intero

ForLoop:
    beq $t0, 10, Exit  # Se $t0 == 10, esce dal ciclo e va a Exit
    
    move $a0, $t0      # Prepara il numero da stampare (argomento $a0)
    syscall            # Stampa il valore contenuto in $t0
    
    addi $t0, $t0, 1   # Incrementa il contatore: i = i + 1
    j ForLoop          # Salta all'inizio del ciclo (ForLoop)

Exit:
    li $v0, 10         # Codice syscall per terminare il programma
    syscall
