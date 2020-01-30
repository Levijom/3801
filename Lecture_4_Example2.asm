# Copy string to a target string
# Address of source in $s0, target in $21
# String terminated with null character

main:

move	$t0, $s0		# t0 = pointer to source
move	$t0, $s1		# t0 = pointer to target

L1:
	lb	$t2, 0($t0)	# load byte to t2
	sb	$t2, 0($t1)	# store byte into target
	addiu	$t0, $t0, 1	# Increment source pointer
	addiu	$t1, $t1, 1	# Increment target pointer
	bne	$t2, $zero, L1	#loop untill null character