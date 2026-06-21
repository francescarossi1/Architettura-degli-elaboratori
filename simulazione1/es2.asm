.data
array: .word 0,1,4,2,7,8,4,6

.text
addi $s0, $zero, 4
lw $s1, array #x=array[i]

addi $t0, $zero, 32 #dim array

while: 
beq $s0, $t0, stampa
lw $t2, array($s0) #array[i] in t2

slt $t1, $s1, $t2 #if
beq $t1, $zero, label #array[i] <x
add $s1, $t2, $zero
add $s1, $t2, $zero

label: 
addi $s0,$s0, 4 
j while  

stampa: 
add $a0, $zero, $s1 #move 
li $v0, 1
syscall 
exit: 
li $v0, 10
syscall 
 