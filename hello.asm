.data #variabili
  MyMessage: .asciiz "Hello, World!\n" #etichetta 

.text #istruzioni
  Main: 
    li $v0, 4 #load immediate 
    la $a0, MyMessage #load address 
    syscall #chiamata di sistema 

  Exit: 
    li $v0, 10 #termina programma 
    syscall
    
