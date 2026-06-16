.data 

.text
li $s1, 4
li $s2, 5 
blt $s1, $s2, vero #4<5

li $v0, 10
syscall

#5>4
vero:
li $s3, 1


li $v0, 10
syscall


