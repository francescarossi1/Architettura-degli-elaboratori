.text 
	addi $s0, $zero, 9
	addi $s1, $zero, 6
	addi $s3, $zero, 0
	
	and $t0, $s0, $s1
	beq $t0, $zero, label
	addi $s2, $zero, 1 # w = 1 
	j join
	label: 
	beq $s0, $zero, join 
	beq $s1, $zero, join
	addi $s2, $zero, 2 
	
	join: 
	li $v0, 10
	syscall
