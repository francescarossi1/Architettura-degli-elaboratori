.text
main: 

jal simple #chiama funzione 
add $s0, $s1, $s1 #parametri


#exit 
li $v0, 10
syscall


simple: 
jr $ra #ritorno funzione 