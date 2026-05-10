.data
    prompt: .asciiz "Inserisci un numero: "
    output: .asciiz "Hai inserito: "

.text
Main:
    # 1. Stampa il messaggio di richiesta (Input prompt)
    la $a0, prompt      # Carica l'indirizzo della stringa 'prompt'
    li $v0, 4           # Codice syscall 4: stampa stringa
    syscall

    # 2. Leggi il numero intero da tastiera
    li $v0, 5           # Codice syscall 5: leggi intero
    syscall             # Il numero inserito viene salvato dal sistema in $v0
    
    # 3. Proteggi il dato inserito
    move $t0, $v0       # Sposta il valore da $v0 a $t0 per non perderlo
                        # (perché useremo $v0 per la prossima stampa)

    # 4. Stampa il messaggio di risposta
    la $a0, output      # Carica l'indirizzo della stringa 'output'
    li $v0, 4           # Codice syscall 4: stampa stringa
    syscall

    # 5. Stampa il numero che l'utente aveva inserito
    move $a0, $t0       # Sposta il valore salvato in $t0 nel registro $a0 (argomento)
    li $v0, 1           # Codice syscall 1: stampa intero
    syscall

    # 6. Exit
    li $v0, 10          # Codice syscall 10: exit
    syscall
