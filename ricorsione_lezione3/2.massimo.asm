.data 
.text 
main: 
# a in s0
# b in s1
# c in s2
# x in s3

# senza macro ( addi )
addi $s0, $zero, 4
addi $s1, $zero, 10
addi $s2, $zero, 8
add $s3, $zero, $s2 # ADD x=c

#if 
# a<b e a<c => x=a
slt $t0, $s1, $s0 # b<a se vero in t0=1 
slt $t1, $s2, $s0 # c<a 
#&&
and $t0, $t0, $t1 

# se and è falso
beq $t0, $zero, else # t0=1 t1=1
add $s3, $zero, $s0 #uguale alla move 
j endif  #importante
else: 
slt $t0, $s2, $s1 # c<b
beq $t0, $zero, endif 
add $s3, $zero, $s1 # x=b

endif: 
add $a0, $zero, $s3 
addi $v0, $zero, 1 #stampa max 
syscall

#termina programma 
li $v0, 10
syscall 