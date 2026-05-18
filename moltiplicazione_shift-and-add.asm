.text 
	addi $s0, $zero, 16 # x
	addi $s1, $zero, 18 # y
	addi $s2, $zero, 0 # p
	
	addi $t0, $zero, 0 # i
	addi $t1, $zero, 32 # limite ciclo (32 bit)
	
	loop: 
		beq $t0, $t1, endloop
		andi $t2, $s1, 1 # temp
		beq $t2, $zero, label # se è 0, salta l'addizione
			add $s2, $s2, $s0 # p = p + x
		
		label: 
		srl $s1, $s1, 1 # shift a destra di y (y = y >> 1)
		sll $s0, $s0, 1  # shift a sinistra di x (x = x << 1)
		addi $t0, $t0, 1 # i=i+1
		j loop
		
	endloop: 
		li $v0, 10
		syscall
