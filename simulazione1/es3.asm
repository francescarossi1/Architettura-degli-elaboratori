.data 
.text 
addi $s0, $zero, 7
addi $s1, $zero, 4

#parametri da passare alla funzione
addi $a0, $s0, 0
addi $a1, $s1, 0

jal dist 

add $a0, $v0, 0 #parametro di ritorno

#stampa
li $v0, 1 
syscall

#exit
li $v0, 10
syscall

dist: 
#allocazione memoria 
addi $sp, $sp, -8
sw $t0, 0($sp)
sw $t1, 4($sp)


slt $t0, $a1, $a0
beq $t0, $zero, label
sub $t1, $a0, $a1 #a-b
j join

label: 
sub $t1, $a1, $a0

join: 
add $v0, $t1, 0
#deallocazione memoria
lw $t0, 0($sp)
lw $t1, 4($sp) 
addi $sp, $sp, 8

jr $ra