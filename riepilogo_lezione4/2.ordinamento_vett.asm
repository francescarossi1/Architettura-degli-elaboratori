.data 
array: .word 0,1,4,2,7,8,4,6

.text
# i in t0 I=0
add $t0, $zero, $zero 

#array in s0 indirizzo primo elemento 
la $s0, array 

# ord crescente s1
addi $s1, $zero, 1 
# ord decrescente s2
addi $s2, $zero, 1

while: 
#i<7
slti $t2, $t0, 7 # dim array-1
beq $t2, $zero, endwhile 

ifsc: #decrescente 
sll $t1, $t0, 2 #shift a sinistra 
lw $t2, $t1($s0) #array[i]
addi $t1, $t1, 4 #offset da aggiungere a array per ottenere l'indirizzo di array [i+1]
lw $t3, $t1 ($s0) #array [i+1] 
#il contrario di >= è < 
slt $t4, $t2, $t3 #array[i] < array[i+1]
bne $t4,$zero, ifc
add $s2, $zero, $zero  #ord decrescente =0

ifc:
slt $t4, $t3, $t2 #array[i+1] < array[i]
beq $t4, $zero, endifc
add $s1, $zero, $zero # ord crescente =0

endifc: 
addi $t0, $t0,1
j while

endwhile: 

