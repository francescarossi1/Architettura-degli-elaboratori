.text
      # a, b, c, x mappati su $s0, $s1, $s2, $s3
      addi $s0, $zero, 4    # a = 4
      addi $s1, $zero, 10   # b = 10
      addi $s2, $zero, 8    # c = 8

      addi $s3, $s2, 0      # x = c (inizializzazione)

      slt $t0, $s1, $s0     # $t0 = (b < a)
      slt $t1, $s2, $s0     # $t1 = (c < a)
      and $t2, $t0, $t1     # $t2 = (b < a && c < a)

      bne $t2, $zero, label0 # Se vero, vai a label0
      
      slt $t3, $s2, $s1     # Altrimenti, controlla se c < b
      beq $t3, $zero, end   # Se falso (c >= b), vai alla fine
      addi $s3, $s1, 0      # Se vero, x = b
      j end

label0:
      addi $s3, $s0, 0      # Esempio: x = a

end:
      li $v0, 10            # System call per terminare il programma
      syscall
