.data 
	 array: .word 0, 1, 4, 2, 7, 8, 4, 6 
	
.text 
# istanziare variabili
	 addi $s0, $zero, 1 # ord_c
	 addi $s1, $zero, 1 # ord_sc
	 addi $s2, $zero, 0 # i
	 
	 addi $t0, $zero, 7
	 addi $t1, $zero, 0
	  
	 lw $t2, array($t1) 
	   
# loop
	loop: 
		beq $s2, $t0, endloop
		addi $s2, $s2, 1
		sll $t1, $s2, 2 # addr = 4 * i
		lw $t3, array ($t1) # array [i+1]
		slt $t4, $t2, $t3 
		bne $t4, $zero, label0
		addi $s1, $zero, 0
		
		label0: 
			slt $t4, $t3, $t2
			beq $t4, $zero, label1
			addi $s0, $zero, 0
			
		label1: 
			addi $t2, $t3, 0
			j loop 
	endloop: 
		li $v0, 10
		syscall
		
	
