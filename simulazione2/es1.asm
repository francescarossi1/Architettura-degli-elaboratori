.data 
.text

addi $s0, $zero, 16 #x
addi $s1, $zero, 18 #y
addi $s2, $zero, 0 #p

addi $t0, $zero, 0 #i
addi $t1, $zero, 32
addi $t2, $zero, 0 #tmp

while: 
beq $t0, $t1, label
andi $t2, $s1, 1 
beq $t2, $zero, skip_sum
add $s2, $s2, $s0

skip_sum:
srl $s1, $s1, 1 
sll $s0, $s0, 1 
addi $t0, $t0, 1 

j while

label: 
addi $a0, $s2, $zero
li $v0,1
syscall

li $v0, 10
syscall
