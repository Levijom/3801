# Write a MIPS-32 function “myABS” that accepts an integer in 
# register $a0 and returns its absolute value in $v0. 
# Also write a complete program that calls the function “myABS” twice, 
# to test its operation. Run your program using MARS. 
# Consider -129 and 56 to test your function.  

.data
	prompt:		.asciiz		"\n Enter a value: \n"
	end_prompt:	.asciiz		"\n The absolute value for N is: "
	
.text

.globl main

main:
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	addu	$t0, $v0, $zero	
	
	bge	$t0, $zero, exit
	sub	$t0, $zero, $t0
	
	exit:
		li	$v0, 4
		la	$a0, end_prompt
		syscall
		
		li	$v0, 1
		move	$a0, $t0
		syscall
		
		li	$v0, 10			# Exit
		syscall
	
	