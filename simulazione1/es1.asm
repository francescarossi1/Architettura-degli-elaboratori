.data 
.text

addi $s0, $zero, 4 #a
addi $s1, $zero, 10 #b
addi $s2, $zero, 8 #c 
add $s3, $zero, $s2 #x=c 

slt $t0, $s1, $s0 #b<a 
slt $t1, $s2, $s0 #c<a
and $t3, $t0, $t1 # &&

beq $t3, $zero, else ###################################
add $s3, $zero, $s0 #x=a
j stampa ######################################

else: 
slt $t1, $s2, $s1 #c<b
beq $t1, $zero, stampa ##########################
add $s3, $zero, $s1 #x=b

add $v0, $zero, $s3 #move 

stampa:
add $a0, $zero, $s3 #move 
li $v0, 1 #######################
syscall 

exit:
li $v0, 10
syscall 