.text
main:
    # --- INIZIALIZZAZIONE DEI REGISTRI ---
    addi $s0, $zero, 9    # Carica 9 in $s0 ($s0 = 0 + 9). In binario: 1001
    addi $s1, $zero, 7    # Carica 7 in $s1 ($s1 = 0 + 7). In binario: 0111
    addi $s2, $zero, 0    # Inizializza $s2 a 0 (registro di controllo del risultato)

    # --- TEST 1: AND BIT-A-BIT (&) ---
    # Esegue l'AND tra i singoli bit di $s0 e $s1:
    # 1001 (9) & 0111 (7) = 0001 (1). Salva il risultato (1) in $t0.
    and $t0, $s0, $s1     

    # Se $t0 è uguale a 0, salta all'etichetta 'label' (l'AND bit-a-bit ha dato FALSO).
    # Nel nostro caso $t0 vale 1, quindi NON salta.
    beq $t0, $zero, label 

    # Se il programma arriva qui, l'AND bit-a-bit ha dato un risultato != 0 (VERO).
    addi $s2, $zero, 1    # Imposta $s2 a 1 per indicare "Test & Riuscito"
    j join                # Salta incondizionatamente a 'join' per terminare il programma

label:
    # --- TEST 2: AND LOGICO (&&) ---
    # Questo blocco viene eseguito SOLO SE l'AND bit-a-bit precedente ha fallito (producendo 0).
    
    # Controlla il primo operando: se $s0 è 0 (FALSO), la condizione && fallisce. 
    # Salta a 'join' lasciando $s2 a 0.
    beq $s0, $zero, join  

    # Controlla il secondo operando: se $s1 è 0 (FALSO), la condizione && fallisce.
    # Salta a 'join' lasciando $s2 a 0.
    beq $s1, $zero, join  

    # Se il programma non ha saltato nei due passaggi precedenti, significa che 
    # sia $s0 che $s1 sono diversi da zero (quindi entrambi logicanente VERI).
    addi $s2, $zero, 2    # Imposta $s2 a 2 per indicare "Test && Riuscito"

join:
    # --- FINE DEL PROGRAMMA ---
    # Punto di uscita. A questo punto $s2 conterrà:
    # 1 se ha avuto successo l'AND bit-a-bit
    # 2 se ha avuto successo l'AND logico
    # 0 se hanno fallito entrambi