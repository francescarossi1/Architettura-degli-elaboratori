.data 
.text 
main: 
li, $a0, 4 
jal fib
move $a0, $v0
li $v0, 1
syscall 

#termina programma 
li $v0, 10
syscall 

fib: 
#caso base
bgt $a0, 1, recurse # n <= 1  salta n>1 
move $v0, $a0 # n>1 sposto valore in v0
jr $ra 

#chiamata ricorsiva 
#n<=1
recurse:
#stack chimante e chiamato  
sub $sp, $sp, 12 #3 registri: ra, a0, v0 4byte
sw $ra, 0($sp)#primo
sw $a0, 4($sp)#secondo

addi $a0, $a0, -1 #n-1
jal fib #chiama funzione fib
sw $v0, 8($sp)#terzo

lw $a0, 4($sp) #tolgo valore di n, libero spazio
addi $a0, $a0, -2 #n-2
jal fib

lw $t0, 8($sp) #recupero il risultato della prima funzione 
add $v0, $v0, $t0
lw $ra, 0($sp) #recuperare return address 
addi $sp, $sp, 12 #dealloco memoria 
jr $ra #torno al chiamante 