.data 
.text
addi $s0, $zero, 7 #a
addi $s1, $zero, 4 #b
addi $s2, $zero, 4 #c
addi $s3, $zero, 2 #d

addi $a0, $s0, 0 
addi $a1, $s1, 0
addi $a2, $s2, 0
addi $a3, $s3, 0

jal dist 

dist: 
#allocazione 
addi $sp, $sp, -20
sw $t0, 0($sp)
sw $t1, 4($sp)
sw $t2, 8($sp)
sw $t3, 12($sp)
sw $t4, 16($sp)

addi $t0, $a0, $a1 #a+b
sub $t1, $a2, $s3 #c-d 
srlv $t2, $t0, $t1 #>>
sllv $t3, $a1, $a2 #<<
addi $t4, $t2, $t3 #espressione 

addi $v0, $t4, 0 #move 

#deallocazione
lw $t0, 0($sp)
lw $t1, 4($sp)
lw $t2, 8($sp)
lw $t3, 12($sp)
lw $t4, 16($sp)
addi $sp, $sp, 20

jr $ra