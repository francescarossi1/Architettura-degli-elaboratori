.data

	a: .word 10
.text
lw $v0, a #load word indirizzo del valore 10
syscall
