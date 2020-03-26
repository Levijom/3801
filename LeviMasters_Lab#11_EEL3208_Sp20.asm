## Levi Masters
## min_btw_2num.asm-- takes two numbers A and B 
## Compare A and B 
## Print out the smaller one 
## Registers used: 
## $a0 = A
## $a1 = B
## $s0 = A (copy)
## $s1 = B (copy)

.data 
p1: .asciiz "Please enter the 1st integer: " 
p2: .asciiz "Please enter the 2nd integer: " 

.text 
main: # Get numbers from user 
	li	$v0, 4			# Load 4=print_string into $v0 
	la	$a0, p1			# Load address of first prompt into $a0 
	syscall				# Output the prompt via syscall
	 
	li	$v0, 5          	# Load 5=read_int into $v0 
	syscall				# Read an integer via syscall 
	
	add	$s0, $v0, $zero		# Copy from $v0 to $s0 
	li	$v0, 4			# Load 4=print_string into $v0 
	la	$a0, p2			# Load address of second prompt into $a0
	syscall				# Output the prompt via syscall 
	
	li	$v0, 5			# Load 5=read_int into $v0 
	syscall				# Read an integer via syscall 
	
	add	$s1, $v0, $zero		# Copy from $v0 to $s1 
	
	# Compute minimum 
	add	$a0,$s0,$0		# Put argument ($s0) in $a0 
	add	$a1,$s1,$0		# Put argument ($s1) in $a1
	jal 	minimum			# Call minimum function, result in $v0 
	
	# Output results 
	add	$a0, $v0, $zero		# Load sum of inupt numbers into $a0 
	li	$v0, 1			# Load 1=print_int into $v0 
	syscall				# Output the prompt via syscall 
	
	# Exit 
	li	$v0, 10
	syscall 
	
	minimum:
		blt	$a0, $a1, B1
		move	$v0, $a1
		j	return
		B1:
			move	$v0, $a0
	return: 
		jr $ra			# Return to caller 