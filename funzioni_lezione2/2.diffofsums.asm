.text
main: 
#voglio che result sia in $s0
li $a0, 2 # f
li $a1, 3 # g
li $a2, 4 # h
li $a3, 5  # i
jal diffofsums # diffofsums (f,g,h,i)
move $a0, $v0
li $v0, 1 #stampa intero 
syscall 


li $v0,10
syscall

diffofsums: 
#allocazione in memoria 
#prima addi che alloca memoria  poi sw
addi $sp, $sp, -12 # 3 registri da 4 byte stack pointer 
sw $s0, 8($sp) #ultima posizione salvo 
sw $t0, 4($sp) #penultima 
sw $t1, 0($sp) #ultima 


#f in $a0, g in $a1, h in $a2, i in $a3
add $t0, $a0, $a1 # f+g
add $t1, $a2, $a3 # h+i
sub $v0, $t0, $t1 # (f+g) - (h+i)

#ripristino valori originali 
#prima lw poi addi che dealloca
lw $t1, 0($sp)
lw $t0, 4 ($sp)
lw $s0, 8 ($sp)
addi $sp, $sp, 12

jr $ra #alla fine di ogni funzione 