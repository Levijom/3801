# Write a function N_SUM to find the sum of the integers from 1 to N. 
# The value N will be passed to the procedure in $a0 and the result 
# will be returned in the $v0 register. Write a MIPS-32 assembly language 
# main program that will call the Sum function and print the result. 
# Run your program using MARS for the following values of N: 9, 32, and 777. 
#
# for (i = 0; i < n; i++)
#	sum += i;
# printf(sum);

.data
	prompt:		.asciiz		"\n Enter a value for N: \n"
	end_prompt:	.asciiz		"\n The sum from 1 to N is: "
	
.text

.globl main

main:
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	addu	$t0, $v0, $zero	
	
	li	$t1, 1			# counter = 0
	li	$s0, 0			# value starts at 0
	
	Loop:
		bgt	$t1, $t0, exit
		add	$s0, $s0, $t1	# total += n
		addi	$t1, $t1, 1
		j	Loop
		
	exit:
		li	$v0, 4
		la	$a0, end_prompt
		syscall
		
		li	$v0, 1
		move	$a0, $s0
		syscall
		
		li	$v0, 10			# Exit
		syscall
		
		
		
		
		
	