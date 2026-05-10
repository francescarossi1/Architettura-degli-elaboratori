.data
  stringa: .asciiz "Ciao\n"

.text #istruzioni
  Main: 
    la $a0, stringa  # carica l'indirizzo
    li $v0, 4        # stampa stringa   
    syscall 

  Exit: 
    li $v0, 10 
    syscall
    
