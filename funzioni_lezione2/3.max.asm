.data 
a: .word 10, 11, 13, 14, 17, 9, 7, 1 , 99
stampa: .asciiz "\n Il massimo dell'array è "  

.text
main: 
# massimo in $s0 
la $a0, a #indirizzo etichetta a 
li $a1, 9 #dimensione di a (corretto da 10 a 9)
jal massimo #chiama funzione massimo 
move $s0, $v0 # sposto in s0

la $a0, stampa 
li $v0, 4 #stampa stringa 
syscall

move $a0, $s0
li $v0, 1 #stampa intero
syscall

#exit 
li $v0, 10
syscall
  

massimo: 
#gestione dello stack 
addi $sp, $sp, -20 # CORRETTO: allocazione di 20 byte usando $sp
sw $s4, 16($sp)
sw $s3, 12($sp)
sw $s2, 8($sp)
sw $s1, 4($sp)
sw $s0, 0($sp)

# max in s0, i in s1, 
li $s0, 0 # max 
move $s1, $a1 # size
li $s2, 0 # i
li $s3, 0 #i*4
move $s4, $a0

loop: 
slt $t0, $s2, $s1 # i<size
beq $t0, $zero, endloop 
# a [i]
sll $s3, $s2, 2 #sposto a sinistra i*4
add $t0, $s4, $s3 # a +i*4
lw $t1, 0($t0) # a[i]

if:
slt $t2, $s0, $t1 #max <a[i]
beq $t2, $zero, endif # CORRETTO: usa il risultato di slt ($t2), non $t1
move $s0, $t1

endif: 
addi $s2, $s2, 1 
j loop

endloop: 
move $v0, $s0 # Copia il valore massimo in $v0 prima di ripristinare lo stack

#gestione dello stack (ripristino)
lw $s0, 0($sp)
lw $s1, 4($sp)
lw $s2, 8($sp)
lw $s3, 12($sp)
lw $s4, 16($sp)

addi $sp, $sp, 20 # CORRETTO: deallocazione usando $sp

jr $ra # torna al chiamante