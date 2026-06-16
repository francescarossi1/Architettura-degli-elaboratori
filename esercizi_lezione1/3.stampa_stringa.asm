.data 
stringa: .asciiz "Ciao" # asciiz con terminatore, stringa finita 

.text
la $a0, stringa #indirizzo stringa in a0
li $v0, 4 #stampa stringa 
syscall 

addi $v0, $zero, 10
syscall