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
###################################################################################################
#
# This program extend the program detailed above:
# Using the outputs for F and G from the previous program
# Provide the outputs of: 
# H = F / G
# I = (F + G) MOD (H_quotient)
#
# Output shold show as follows:
# f_ten = 49026 
# g_ten = 13122 
# h_quotient = 3 
# h_remainder = 9660 
# i_mod = 0 
#
#
###################################################################################################
.data
prompt:		.asciiz		"\n Enter 4 integers for A,B,C,D respectively: \n"
f_ten:		.asciiz		"\n f_ten = "
g_ten:		.asciiz		"\n g_ten = "
h_quot:		.asciiz		"\n h_quotient = "
h_rem:		.asciiz		"\n h_remainder = "
i_mod:		.asciiz		"\n i_mod = "

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
	
	# A ^ 4		=	A ^ 2 * A ^ 2
	
	li	$t4, 0				# Set counter
	
	# A ^ 2
	A_Square:
		bge	$t4, $t0, mid		# s1 - > A^2
		add	$s1, $s1, $t0		# s1 += A
		addi	$t4, $t4, 1		# counter++;
		j	A_Square		# Re-loop
		
	mid:
		li	$t4, 0			# Reset counter
	
	A_Square_2:
		bge	$t4, $s1, end_A		# s2 -> A^4
		add	$s2, $s2, $s1		# s2 += A^2
		addi	$t4, $t4, 1		# counter++;
		j	A_Square_2		# Re-loop
		
	end_A:
		li	$t4, 0			# Reset counter
		
	# 4 * (B ^ 3)
	B_X_4:
		bge	$t4, 4, end_B_Mul	# S3 -> 4B
		add	$s3, $s3, $t1		# s3 += B
		addi	$t4, $t4, 1		# counter++
		j	B_X_4			# Re-loop
		
	end_B_Mul:
		li	$t4, 0			# Reset counter
		
	B_X_B:
		bge	$t4, $t1, end_BxB	# s3 -> 4B^2
		add	$s6, $s6, $t1		# s3 += B
		addi	$t4, $t4, 1		# counter++
		j	B_X_B			# Re-loop
		
	end_BxB:
		li	$t4, 0			# Reset counter
		
	B_fin:
		bge	$t4, $s3, end_B		# t5 -> 4(B^3)
		add	$t5, $t5, $s6		# t5 += (4B^2)
		addi	$t4, $t4, 1		# counter++
		j	B_fin			# Re-loop
		
	end_B:
		li	$t4, 0			# Reset counter
		li	$s6, 0
		
	C_X_C:
		bge	$t4, $t2, end_CxC	# s4 -> (C^2)
		add	$s4, $s4, $t2		# s4 += C
		addi	$t4, $t4, 1		# counter ++
		j	C_X_C
		
	end_CxC:
		li	$t4, 0			# Reset counter
		
	CxC_X_3:
		bge	$t4, 3, end_C		# s5 -> (3(C^2))
		add	$s5, $s5, $s4		# s5 += (C^2)
		addi	$t4, $t4, 1		# counter ++
		j	CxC_X_3			# Re-loop
		
	end_C:
		li	$t4, 0			# Reset counter
		
	D_X_2:
		add	$s6, $s6, $t3		# s6 = D
		add	$s6, $s6, $t3		# s6 = 2D
		
	# Useful things already calculated;
	# A^4 	= $s2	F
	# 4B^3	= $s3	F
	# C^2	= $s4	G
	# 3C^2	= $s5	F
	# 2D	= $s6	F
	# Next time, calculate B^2 before 4B
	
	end_D:
		li	$t4, 0			# Reset counter
		li	$s0, 0			# Reset reg
		li	$s1, 0			# Reset reg
		
	B_Square:
		bge	$t4, $t1, B_Sq_end	# s0 -> B^2
		add	$s0, $s0, $t1		# s0 += B
		addi	$t4, $t4, 1		# counter++
		j	B_Square
		
	B_Sq_end:
		li	$t4, 0			# Reset counter
		
	A_X_Bsq:
		bge	$t4, $t0, AxB_end	# s1 -> A(B^2)
		add	$s1, $s1, $s0		# s1 += (B^2)
		addi	$t4, $t4, 1
		j	A_X_Bsq
		
	AxB_end:
		li	$t4, 0			# Reset counter
		li	$s0, 0			# Reset reg
		
	D_X_D:
		bge	$t4, $t3, DxD_end	# s0 -> D^2
		add	$s0, $s0, $t3		# s0 += D
		addi	$t4, $t4, 1		# counter++
		j	D_X_D
		
	DxD_end:
		li	$t4, 0
		
	D_X_DxD:
		bge	$t4, $t3, D3_end	# s7 -> D^3
		add	$s7, $s7, $s0		# s7 += (D^2)
		addi	$t4, $t4, 1
		j	D_X_DxD
		
	D3_end:
		li	$t4, 0			# Reset counter
		li	$s0, 0			# Reset reg
		
	# $s4	= C^2
	# $s7	= D^3
	CxD:
		bge	$t4, $s4, CxD_end	# s0 -> (C^2)(D^3)
		add	$s0, $s0, $s7		# s0 += D^3
		addi	$t4, $t4, 1
		j	CxD
		
	CxD_end:
		li	$t4, 0
		li	$s7, 0
		
		# Components:		
		# $s0	= (C^2)(D^3)	G
		# $s1	= A(B^2)	G
		# $s2	= A^4		F
		# $t5	= 4B^3		F
		# $s4	= C^2		G
		# $s5	= 3C^2		F
		# $s6	= 2D		F
		#
		# F = s2 - s3 + s5 - s6
		# G = s1 + s0
		
		sub	$s7, $s2, $t5		# s7 = s2 - t5
		add	$s7, $s7, $s5		# s7 = s2 - s3 + s5
		sub	$s7, $s7, $s6		# s7 = s2 - s3 + s5 - s6 = F
		
		li	$s2, 0
		li	$s3, 0
		li	$s5, 0
		li	$s6, 0
		
		add	$s2, $s0, $s1		# s2 = s0 + s1 = G

###################################################################################################
#
#		End of computation for F and G
#
###################################################################################################
		# F stored in s7
		# G stored in s2
		
		add	$t0, $zero, $zero
		add	$t1, $s7, $zero
		add	$t2, $s2, $zero
		# 
		# F in t1
		# G in t2
		
			
		# H = F / G
		F_div_G:
			blt	$t1, $t2, end_div
			addi	$t0, $t0, 1
			subu	$t1, $t1, $t2
			j	F_div_G
			
		end_div:
			addu	$t3, $s7, $s2	# t3 = F + G
		
		# t0 = H
		# t1 = remainder
		#
		# i = (F + G) MOD_H
		# i = (s7 + s2) mod t0
		Mod:
			blt	$t3, $t0, End
			subu	$t3, $t3, $t0
			j	Mod
			
		End:	
		# F base 10
		li	$v0, 4			# string
		la	$a0, f_ten
		syscall
		
		li	$v0, 1			# decimal
		move	$a0, $s7
		syscall
		
		addi $a0, $0, 0xA		# set a0 to 10
		addi $v0, $0, 0xB		# set v0 to 11
		syscall				# syscalls to print a new line
		
		# G base 10
		li	$v0, 4			# string
		la	$a0, g_ten
		syscall
		
		li	$v0, 1			# decimal
		move	$a0, $s2
		syscall
		
		addi $a0, $0, 0xA		# set a0 to 10
		addi $v0, $0, 0xB		# set v0 to 11
		syscall
		
		# H quotient
		li	$v0, 4			# string
		la	$a0, h_quot
		syscall
		
		li	$v0, 1			# decimal
		move	$a0, $t0
		syscall
		
		addi $a0, $0, 0xA		# set a0 to 10
		addi $v0, $0, 0xB		# set v0 to 11
		syscall				# syscalls to print a new line
		
		# H remainder
		li	$v0, 4			# string
		la	$a0, h_rem
		syscall
		
		li	$v0, 1			# decimal
		move	$a0, $t1
		syscall
		
		addi $a0, $0, 0xA		# set a0 to 10
		addi $v0, $0, 0xB		# set v0 to 11
		syscall				# syscalls to print a new line
		
		# I mod
		li	$v0, 4			# string
		la	$a0, i_mod
		syscall
		
		li	$v0, 1			# decimal
		move	$a0, $t3
		syscall
		
		addi $a0, $0, 0xA		# set a0 to 10
		addi $v0, $0, 0xB		# set v0 to 11
		syscall				# syscalls to print a new line
		
		li	$v0, 10			# Exit
		syscall
	
