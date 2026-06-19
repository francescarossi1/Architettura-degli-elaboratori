# calcolo del prodotto fra due numeri
.data 
.text 
main: 
# salvo x in s0
addi $s0, $zero, 16 
#y in s1 
addi $s1, $zero, 18
# p in s2 
add $s2, $zero, $zero 
# i in s3 
add $s3, $zero, $zero
# tmp in t0
add $t0, $zero, $zero 
# 32 in t2
addi $t1, $zero, 32

# ciclo while 
while: 
slt $t2, $s3, $t1 # i<32
beq $t2, $zero, endwhile 
andi $t0, $s1, 1  #and e salva in temp y & 1
beq $t0, $zero, skip # temp != 0 continua se =0 salta
add $s2, $s2, $s0 # p=p+x 

skip: 
srl $s1, $s1, 1  # y/2 cioè y=y>>1
sll $s0, $s0, 1  #x= x<<1
addi $s3, $s3, 1 # i=i+1
j while #fine while risultato in $s2

endwhile: 
#stampa
li $v0, 1 
add $a0, $zero, $s2 
syscall 

li $v0, 10
syscall