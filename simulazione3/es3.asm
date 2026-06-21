.data
array: .word 0,1,2,4,4,6,7,9 
.text 
addi $s0, $zero, 0 #i 
addi $s1, $zero, 0 #up 
addi $s2, $zero, 0 #low 
addi $s3, $zero, -1 #found 
addi $s4, $zero, 8 #n= dim array
addi $s5, $zero, 6   # elem = 6 (elemento da cercare)

addi $t0, $zero, 2 

div  $s4, $t0 
mflo $s0             # i = n / 2 (quindi i = 4)

addi $s1, $s4, -1

while: 
bgez $s3, end #found >= 0
beq $s1, $s2, end # up == low

sll $t0, $s0, 2      # $t0 = i * 4 (offset in byte)
lw $t1, array($t0)   # $t1 = array[i]

#if 
bne $t1, $s5, if_greater
addi $s3, $s0, 0     # found = i
j fine_if

if_greater:
    # ELSE IF: if (array[i] > elem) -> ovvero se elem < array[i]
    slt $t2, $s5, $t1    # $t2 = 1 se elem < array[i]
    beq $t2, $zero, else_less
    addi $s1, $s0, 0     # up = i
    j fine_if

else_less:
    # ELSE
    addi $s2, $s0, 0     # low = i

fine_if:
    # Ricalcolo di i = (up + low) / 2
    add $t3, $s1, $s2    # $t3 = up + low
    addi $t4, $zero, 2
    div $t3, $t4
    mflo $s0             # i = (up + low) / 2

    j while              # Torna all'inizio del ciclo

end:
    li $v0, 10
    syscall
