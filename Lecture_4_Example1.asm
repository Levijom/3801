# Look for first element equal to "K" in index
# starting at "A"
# Array contains n integers (words)
# Terminate search after "K" is found

# C pseudo code:
#	i=0;
#	while (A[i] != k)
#		i++;

main:

addu	$s1, $zero, $zero	# i = 0
addu	$t0, $s0, $zero		# t0 = A[0]

loop:
	lw	$t1, 0($t0)	# $t1 = A[i]
	beq	$t1, $s2, exit	# Exit on element found
	addiu	$s1, $s1, 1	# i++
	sll	$t0, $s1, 2	# t0 = 4i (Shift left logic)
	addu	$t0, $s0, $t0	# t0 = A[0] + (4i = t0) = A[i]
	j	loop		# Iterate the loop
	
exit:
	li	$v0, 10		# Exit the program
	syscall