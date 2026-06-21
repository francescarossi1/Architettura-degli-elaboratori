.data 
.text
addi $s0, $zero, 0 #i
addi $s1, $zero, 0 #n
addi $s2, $zero, 18# x
addi $s3, $zero, 0 #y
addi $t0, $zero, 32 #condizione while 

while: 
beq $s0, $t0, label
andi $s3, $s2, 1 
add $s1, $s1, $s3 
srl $s2, $s2, 1
addi $s0, $s0, 1 
j while 

li $v0, 10
syscall 

label:
#stampa
add $a0, $s1, $zero
li $v0, 1 
syscall

li $v0, 10
syscall 