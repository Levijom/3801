# Levi Masters -- 01/30/2020 
# This program prints in a loop
# the numbers 0 - 15 in base 10

main:

move	$t0, $zero		# Set output register to zero
addi	$t1, $zero, 15		# Set t1 to 15

loop:
	bgt	$t0, $t1, end_loop
	move	$a0, $t0
	li	$v0, 1		# Print the value
	syscall
	addiu	$t0, $t0, 1	# Increment by 1
	j	loop		# Iterate the loop

end_loop:
	li	$v0, 10		# Exit the program
	syscall