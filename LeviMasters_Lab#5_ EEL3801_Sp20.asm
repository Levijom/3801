# This program takes 4 user inputs, A, B, C, D
# and computes the following outputs:
# F = ( ( A ^ 4) -  4( B ^ 3 ) + 3( B ^ 2 ) - 2( D ) )
# G = ( A( B ^ 2 ) + ( ( C ^ 2 )( D ^ 3 ) )
#
# The program may not use any multiplication functions
#
#
# Sample input / output:
#
# Enter 4 integers for A,B,C,D respectively: 
# 15 
# 9 
# 21 
# 3 
# f_ten = 49026 
# f_two = 00000000000000001011111110000010 
# g_ten = 13122 
# g_two = 00000000000000000011001101000010
#
.data
prompt:		.asciiz		"\n Enter 4 integers for A,B,C,D respectively: \n"
f_ten:		.asciiz		"\n f_ten = "
f_two:		.asciiz		"\n f_two = "
g_ten:		.asciiz		"\n g_ten = "
g_two:		.asciiz		"\n g_two = "

.text

.globl main
main:
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	addu	$t0, $v0, $zero		# $t0 = A
	
	li	$v0, 5
	syscall
	addu	$t1, $v0, $zero		# $t1 = B
	
	li	$v0, 5
	syscall
	addu	$t2, $v0, $zero		# $t2 = C
	
	li	$v0, 5
	syscall
	addu	$t3, $v0, $zero		# $t3 = D
	
	# F = ( ( A ^ 4) -  4( B ^ 3 ) + 3( C ^ 2 ) - 2( D ) )
	# F = ( ( A * A * A * A ) - (4( B * B * B ) + 3( C * C ) - ( 2 * D )
	# 
	
	addu	$t4, $t0, $zero		# $t4 is n
	addu	$t5, $zero, $zero	# Counter
	addu	$t7, $t0 $zero		#Running total for n
	addu	$t8, $zero, $zero
	addi	$t9, $zero, 3		# number times to run add_n
	
	
	f_aPOWa:
		addu	$t4, $t7, $zero	# This is not doing anything???
		bgt	$t8, $t9, bPOW
		addi	$t8, $t8, 1	# Increment counter
		j	add_n
		
	add_n:
		bgt	$t5, $t4, f_aPOWa
		addi	$t5, $t5, 1
		addu	$t7, $t7, $t4
		
		
		
		
	
	bPOW:
		li	$v0, 1
		move	$a0, $t4
		syscall
		j	exit
	
	
	
	
	exit:
		li	$v0, 10			# Exit
		syscall
	


















