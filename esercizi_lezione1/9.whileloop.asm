.text 
main: 

li $s0, 0 # i
li $s1, 10 # max

whileloop: 
# slt $t0, $s0, $s1 # i< max
# bne $t0, $zero, exit # se i< max esci
#oppure 
bge $t0, $s1, exit 
move $a0, $s0
li $v0, 1
syscall
addi $s0, $s0, 1 #incremenro i
j whileloop

exit:
li $v0, 10
syscall
