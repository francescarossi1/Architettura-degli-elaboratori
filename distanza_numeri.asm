.text 
	main: 
		addi $s0, $zero, 7 #x 
		addi $s1, $zero, 4 #y
		
		addi $a0, $s0, 0
		addi $a1, $s1, 0    
		
		jal dist 
		addi $s2, $v0, 0 
		
	exit: 
		addi $a0, $s2 , 0
		addi $v0, $zero, 1  
		syscall 
		
		addi $v0, $zero, 10
		syscall
	
	dist: 
		addi $sp, $sp, -8
		sw $t0, 0($sp)
		sw $t1, 4($sp)
		slt $t0, $a1, $a0 # y < x
		beq $t0, $zero, else
			sub $t1, $a0, $a1
			j join
		else: 
			sub $t1, $a1, $a0
		join: 
			addi $v0, $t1, 0
			
			lw $t0 , 0( $sp ) 
			lw $t1 , 4( $sp ) 
			addi $sp , $sp , 8 
			jr $ra
		
		
