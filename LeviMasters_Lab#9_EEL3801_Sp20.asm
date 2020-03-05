# Levi Masters
#
# Ascii Values
# k	=	107
# n	=	110
# i	=	105
# g	=	103
# h	=	104
# t	=	116
# s	=	115


.data
	string: 	.asciiz	"coming in winners of three in a row, including back-to-back triumphs on the road, the knights returned to orlando hungry to finish out the regular season home schedule on a high note. "
	K_res:		.asciiz	"K------------"
	N_res:		.asciiz	"N------------"
	I_res:		.asciiz	"I------------"
	G_res:		.asciiz	"G------------"
	H_res:		.asciiz	"H------------"
	T_res:		.asciiz	"T------------"
	S_res:		.asciiz	"S------------"
.text
main:
	la 	$t0, string 		# Load here the string
	addu	$s0, $zero, $zero	# K counter
	addu	$s1, $zero, $zero	# N counter
	addu	$s2, $zero, $zero	# I counter
	addu	$s3, $zero, $zero	# G counter
	addu	$s4, $zero, $zero	# H counter
	addu	$s5, $zero, $zero	# T counter
	addu	$s6, $zero, $zero	# S counter
	Loop: 
		lb 	$t2, 0($t0) 	# We do as always, get the first byte pointed by the address
		beqz 	$t2, end 	# If is equal to zero, the string is terminated
		beq	$t2, 107, K	# Deal with each case
		beq	$t2, 110, N
		beq	$t2, 105, I
		beq	$t2, 103, G
		beq	$t2, 104, H
		beq	$t2, 116, T
		beq	$t2, 115, S
		j 	continue
	continue:
		# Continue the iteration
		addi	$t0, $t0, 1	# Increment the address
		j	Loop
	K:
		addi	$s0, $s0, 1
		j 	continue
	N:
		addi	$s1, $s1, 1
		j 	continue
	I:
		addi	$s2, $s2, 1
		j 	continue
	G:
		addi	$s3, $s3, 1
		j 	continue
	H:
		addi	$s4, $s4, 1
		j 	continue
	T:
		addi	$s5, $s5, 1
		j 	continue
	S:
		addi	$s6, $s6, 1
		j 	continue
	end:		
		li 	$v0, 4 		# Print K string
		la 	$a0, K_res
		syscall	
		li	$v0, 1
		move	$a0, $s0
		syscall
		
		addi $a0, $0, 0xA	# set a0 to 10
		addi $v0, $0, 0xB	# set v0 to 11
		syscall			# syscalls to print a new line
		
		li 	$v0, 4 		# Print N string
		la 	$a0, N_res
		syscall	
		li	$v0, 1
		move	$a0, $s1
		syscall
		
		addi $a0, $0, 0xA	# set a0 to 10
		addi $v0, $0, 0xB	# set v0 to 11
		syscall			# syscalls to print a new line
		
		li 	$v0, 4 		# Print I string
		la 	$a0, I_res
		syscall	
		li	$v0, 1
		move	$a0, $s2
		syscall
		
		addi $a0, $0, 0xA	# set a0 to 10
		addi $v0, $0, 0xB	# set v0 to 11
		syscall			# syscalls to print a new line
		
		li 	$v0, 4 		# Print G string
		la 	$a0, G_res
		syscall	
		li	$v0, 1
		move	$a0, $s3
		syscall
		
		addi $a0, $0, 0xA	# set a0 to 10
		addi $v0, $0, 0xB	# set v0 to 11
		syscall			# syscalls to print a new line
		
		li 	$v0, 4 		# Print H string
		la 	$a0, H_res
		syscall	
		li	$v0, 1
		move	$a0, $s4
		syscall
		
		addi $a0, $0, 0xA	# set a0 to 10
		addi $v0, $0, 0xB	# set v0 to 11
		syscall			# syscalls to print a new line
		
		li 	$v0, 4 		# Print T string
		la 	$a0, T_res
		syscall	
		li	$v0, 1
		move	$a0, $s5
		syscall
		
		addi $a0, $0, 0xA	# set a0 to 10
		addi $v0, $0, 0xB	# set v0 to 11
		syscall			# syscalls to print a new line
		
		li 	$v0, 4 		# Print S string
		la 	$a0, S_res
		syscall	
		li	$v0, 1
		move	$a0, $s6
		syscall
		
		addi $a0, $0, 0xA	# set a0 to 10
		addi $v0, $0, 0xB	# set v0 to 11
		syscall			# syscalls to print a new line
		
		li 	$v0, 10
		syscall