.data 
stringa: .asciiz

.text 
la $a0, stringa  #x="stringa inserita dall'utente"
la $a1, 5 #lunghezza stringa 
li $v0, 8
syscall 

la $a0, stringa #memoria 
li $v0, 4 #stampa
syscall


li $v0, 10
syscall