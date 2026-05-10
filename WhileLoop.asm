.data

.text
    li $t0, 0          # Inizializza il contatore a 0

Main:
    li $v0, 1          # Codice per stampare un intero

WhileLoop:
    # Se $t0 è maggiore o uguale a 10, esce dal ciclo
    bge $t0, 10, Exit  
    
    move $a0, $t0      # Copia il contatore in $a0 per la stampa
    syscall            # Stampa il numero
    
    addi $t0, $t0, 1   # Incrementa il contatore: $t0 = $t0 + 1
    j WhileLoop        # Torna all'inizio del ciclo

Exit:
    li $v0, 10         # Termina il programma
    syscall
