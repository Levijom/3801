# Levi Masters -- 01/23/2020 
# add2.asm-- A program that computes and prints the sum 
# of two numbers specified at runtime by the user. 
# Registers used: 
# $t0 - used to hold the first number. 
# $t1 - used to hold the second number. 
# $t2 - used to hold the sum of the $t0 and $t1. 
# $v0 - syscall parameter and return value. 
# $a0 - syscall parameter.

main:
li	$v0, 5		# Get first number
syscall
move	$t0, $v0	# Move number to t0
li	$v0, 5		# Get second number
syscall
move	$t1, $v0	# Move number to t1
addu	$t2, $t0, $t1	# Add t1 + t0 to t2
move	$a0, $t2	# Move sum to printable position
li	$v0, 1		# Print the sum
syscall
li	$v0, 10		# Exit the program
syscall
