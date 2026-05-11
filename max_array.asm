.data
    array0: .word 0, 1, 4, 2, 7, 8, 4, 6   # Array di 8 elementi
    # Dimensione array: 8 word * 4 byte = 32 byte

.text
    # --- INIZIALIZZAZIONE ---
    addi $s0, $zero, 4	    # i
    lw   $s1, array0($zero) # x = array0[0] (inizializzo x col primo elemento)
    addi $t0, $zero, 32     # t0 = 32 (limite superiore dell'array in byte)

loop:
    # --- CONDIZIONE DI USCITA ---
    # Se l'indice i ($s0) ha raggiunto la dimensione 32, esci
    beq $s0, $t0, exit

    # --- CORPO DEL CICLO ---
    lw $t1, array0($s0)     # Carica l'elemento corrente: t1 = array0[i]
    
    # Se l'elemento corrente è maggiore di x, aggiorna x
    slt $t2, $s1, $t1       # $t2 = 1 se x < array0[i]
    beq $t2, $zero, label    # Se x >= array0[i], non fare nulla e vai al prossimo (label)
    addi $s1, $t1, 0        # Altrimenti x = array0[i]

label:
    addi $s0, $s0, 4        # Incrementa l'indice di 4 byte (prossima word)
    j loop                  # Torna all'inizio del ciclo

exit:
    # --- FINE PROGRAMMA ---
    # In $s1 ora c'è il valore massimo trovato nell'array (8)
   li $v0, 10              # Termina il programma
   syscall
