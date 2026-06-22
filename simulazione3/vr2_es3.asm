.data
array: .word 0,1,2,4,4,6,7,9
elem: .word 6 
n: .word 8 
 
.text 
lw $s4, elem 
lw $s5, n 
addi $s0, $zero, -1 #found 
srl $s1, $5, 1 #i 
addi $s2, $zero, 0 #low 
sub $s3, $s5, 1 #up

loop: 
beq $s3, $s2, $s2 #up!=low 
bgez $s0, endloop
all $t0, $s1, 2 #offset 
lw $t1, array($t0) #array#i] in t1

bne $t1, $s4, elseif #diversi 
move $s0, $s1
j ultima 

elseif: ble $t1, $t2, else 
move $s3, $s1
j ultima

ultima: 
add $t2, $s3, $s2 
arl $s1, $t2, 1 
j loop

exit: 
