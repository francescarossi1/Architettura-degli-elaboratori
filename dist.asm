.text 

main: 
	# Inizializzazione delle variabili nel main
	addi $s0, $zero, 7
	addi $s1, $zero, 4
	addi $s2, $zero, 4
	addi $s3, $zero, 2
	
	# Passaggio dei parametri alla funzione (registri $a0-$a3)
	addi $a0, $s0, 0
	addi $a1, $s1, 0
	addi $a2, $s2, 0
	addi $a3, $s3, 0
	
	jal dist             # Chiamata alla funzione dist
	addi $s4, $v0, 0     # Salva il risultato restituito ($v0) in $s4
	
	# Fine del programma principale (Risolto il refuso £$zero)
	addi $v0, $zero, 10
	syscall
	
dist: 
	# PUSH: Salva il contesto dei registri callee-saved nello Stack
	addi $sp, $sp, -16   # Alloca spazio per 4 registri (4 * 4 byte = 16 byte)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	
	
	add $s0, $a1, $a0    # $s0 = 4 + 7 = 11
	sub $s1, $a2, $a3    # $s1 = 4 - 2 = 2
	
	sllv $s2, $a1, $a3   # $s2 = 4 << 2 = 16  (Shift a sinistra)
	srlv $s0, $s0, $s1   # $s0 = 11 >> 2 = 2  (Shift a destra)
	
	add $v0, $s2, $s0    # $v0 = 16 + 2 = 18  (Valore di ritorno)
	
	# Ripristina i valori originali dei registri dal chiamante
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $s3, 12($sp)
	
	# Dealloca lo spazio dello Stack (Corretto da 12 a 16)
	addi $sp, $sp, 16
	jr $ra               # Ritorna al main
