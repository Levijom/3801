# Write a complete MIPS-32 assembly language program including 
# data declarations that uses a function “Eval_Z” which evaluates 
# the following expression Z = X - 3 (Y / 8 + 125). 
# Assume that caller program passes the values of X and Y to 
# the function using registers $a0 and $a1 respectively while the result 
# of executing the function is returned to the caller in register $v0. 
# The caller program should display the result on the console 
# preceded by an appropriate message. Run your program using MARS. 
# Consider the following integer values 
# (X1, Y1) = (100, 24) and  (X1, Y1) = (100, 21) 
# Z = X - 3 (Y / 8 + 125). 

.data
	prompt_x:	.asciiz		"\nEnter a value X: \n"
	prompt_y:	.asciiz		"\nEnter a value Y: \n"
	end_prompt:	.asciiz		"\nThe value of Z is: "
	
.text

.globl main

main:
	li	$v0, 4
	la	$a0, prompt_x
	syscall
	
	li	$v0, 5
	syscall
	addu	$t1, $v0, $zero	
	
	li	$v0, 4
	la	$a0, prompt_y
	syscall
	
	li	$v0, 5
	syscall
	addu	$t2, $v0, $zero	
	
	# Z = X - 3 (Y / 8 + 125). 
	# t1 = x
	# t2 = y
	
	subi	$t1, $t1, 3
	div	$t2, $t2, 8
	addi	$t2, $t2, 125
	mul	$t1, $t1, $t2
	
	li	$v0, 4
	la	$a0, end_prompt
	syscall
	
	li	$v0, 1
	move	$a0, $t1
	syscall
	
	li	$v0, 10			# Exit
	syscall
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
