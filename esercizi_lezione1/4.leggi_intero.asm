.text
li $v0, 5 #chiede inserimento utente
syscall

add $s0, $zero, $v0 #salva valore 

li $v0, 10 
syscall 