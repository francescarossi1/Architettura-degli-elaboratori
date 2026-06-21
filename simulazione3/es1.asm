.data 
.text
addi $s0, $zero, 16 #x 
addi $s1, $zero, 0 #y 
addi $s2, $zero, 0 #i

addi $t0, $zero, 32 #32
 
while: 
beq  $s2, $t0, end #i<32 
and $t1, $s0, 1 
addi $s1, $s1, $t1
srl $s0, $s0, 1 
addi $s2, $s2, 1 
j while 

end: 
andi $s3, $s1, 1 # p=y%2 &&

addi $a0, $s3, 0 #move 

li $v0, 1
syscall

li $v0, 10
syscall