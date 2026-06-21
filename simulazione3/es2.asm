.data 
.text

addi $s0, $zero, 47 #a 
addi $s1, $zero, 4 #b 
addi $s2, $zero, 0 #v 

addi $a0, $s0, 0 
addi $a1, $s1, 0

jal ror

addi $s2, $v0, 0 #returned value

addi $a0, $s2, 0     # move
#stampa
li $v0, 1            
syscall

# Exit
li $v0, 10

ror: 

addi $t0, $zero, 32 

sub $t0, $t0, $a1 #32-n 
sllv $t1, $a0, $t0 #<<
srlv $t2, $a0, $a1 #>>
or $v0, $t1, $t2 # OR |


jr $ra