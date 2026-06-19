.data 
.text
main: 
#a
addi $s0, $zero 7 
#b
addi $s1, $zero,  4 
#c
addi $s3, $zero, 4
#d
addi $s4, $zero, 2

#salvo v in s4

#sposto valori in parametri a0 a1 a2 a3
move $a0, $s0
move $a1, $s1
move $a2, $s2
move $a3, $s3
jal dist

move $s4, $v0 #risultato v=dist (a,b,c,d)

#stampo
li $v0, 1 
move $a0, $s4
syscall

li $v0, 10
syscall

dist: 
#gestione stack 
addi $sp, $sp, -12
sw $s0, 0($sp)
sw $t0, 4($sp)
sw $t1, 8($sp)

#result in s0
add $t0, $a0, $a1 #a+b
sub $t1, $a2, $a3 #c-d
srlv $t0, $t0, $t1 #registro invece di una costante shift a destra >>
sllv $t1, $a1, $a3#shift a sinistra << b<<d
add $s0, $t0, $t1 #tutta espressione 
move $v0, $s0

lw $t1, 8($sp)
lw $t0, 4($sp)
lw $s0, 0($sp)
addi $sp, $sp, 12 

jr $ra