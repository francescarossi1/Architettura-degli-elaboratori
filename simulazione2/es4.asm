.data 
.text 
addi $s0, $zero, 9 #x
addi $s1, $zero, 6 #y
addi $s2, $zero, 0 #w

and $t0, $s0, $s1 #&
#if x & y
beq $t0, $zero, label 
# w=1
addi $s2, $zero, 1 

j join 

label: 
#else x&&y
beq $s0, $zero, join 
beq $s1, $zero, join
# w=2
addi $s2, $zero, 2 

join: 
addi $a0, $s2, 0

#stampa 
li $v0, 1
syscall 

li $v0, 10
syscall 