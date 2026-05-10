.data
  A: .word 42 

.text #istruzioni
  Main: 
    lw $a0, A   #carica il contenuto di A (42) in $a0
    li $v0, 1   #stampa intero
    syscall 

  Exit: 
    li $v0, 10 
    syscall
    
