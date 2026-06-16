.data 
stringa: .asciiz
.space 5 #5 caratteri
separatore: .asciiz "\n"

.text
li $v0, 8
la $a0, stringa 
li $a1, 5 #numero caratteri da leggere 
syscall

li $v0, 4 #stampo separatore 
move $t0, $a0 #salvo indirizzo stringa acquisita
la $a0, separatore #carico indirizzo separatore 
syscall 

move $a0, $t0 #ripristino indirizzo di memoria della stringa acquisita 
syscall 