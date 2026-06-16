.text

addi $a0, $zero, 42 # x=42
addi $v0, $zero, 1 # stampa 42
syscall

# exit
addi $v0, $zero, 10
syscall

