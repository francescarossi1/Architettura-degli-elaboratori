.text 
main: 

#registro a 0
li $s0, 0 #s0=i
# addi $s0, $zero, 0
# add $s0, $zero, $zero
li $s1, 10

forloop: 
beq $s0, $s1, exit #se i=10 exit 
move  $a0, $s0 #sposto valore di i
li $v0, 1
syscall #stampa i
addi $s0, $s0, 1 #incremenro i
j forloop

exit:
li $v0, 10
syscall


# alternativa 
# slt $t0, $s0, $s1
# bne $t0, $zero, exit 