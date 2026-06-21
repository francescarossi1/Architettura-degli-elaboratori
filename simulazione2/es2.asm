.data 
array: .word 0,1,4,2,7,8,4,6
.text
addi $s0, $zero, 0 #i
addi $s1, $zero, 1 #ord_c
addi $s2, $zero, 1 #ord_sc
addi $t0, $zero, 28 #7*4=28

addi $t1, $zero, 0 #offset
lw $t2, array($t1)

while: 
beq $s0, $t0, end

addi $t1, $s0, 4 # offset i+4

lw $t2, array($s0) #array[i]
lw $t3, array($t1) #array[i+1]

slt $t4, $t2, $t3 #if >=
bne $t4, $zero, skip1
addi $s2, $zero, 0

skip1: 
slt $t4, $t3, $t2 
beq $t4, $zero, skip2
addi $s1, $zero, 0

skip2: 
addi $s0, $s0, 4 #i+1

j while

end: 
li $v0, 4
syscall

li $v0, 10
syscall 