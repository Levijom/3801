#You are tasked to calculate a specific algebraic expansion, i.e. compute the value of f and g for the expression: 
# f = (0.1×A^4) - (0.2×B^3) + (0.3×C^2) - (0.4×D) 
# g = (0.1×AB^2) + (0.2×C^2D^3) 
# Write MIPS assembly code that accepts four positive integers 
# A, B, C, and D as input parameters. The code shall  execute  
# in  MARS  to  prompt  the  user  to  enter  four  positive  integers  
# represented  in  decimal,  each separated by the Enter key. 
# The program shall calculate f and g using your own self-written 
# multiplication routine.  The  program  will  then  output  f  and  g
# as  floating  point  numbers,  using  syscall  routines  for  each output.
#
# Sample output
# Enter 4 integers for A, B, C, D respectively:
# 15
# 9
# 21
# 3
#
# f = 5047.8
# g = 2502.9

.data
prompt:		.asciiz		"\n Enter 4 integers for A,B,C,D respectively: \n"
f:		.asciiz		"\n f = "
g:		.asciiz		"\n g = "
pointOne:	.float		0.1
pointTwo:	.float		0.2
pointThree:	.float		0.3
pointFour:	.float		0.4

.text

.globl main
main:
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	mtc1	$v0, $f0		# $f0 = A
	
	li	$v0, 5
	syscall
	mtc1	$v0, $f1		# $f1 = B
	
	li	$v0, 5
	syscall
	mtc1	$v0, $f2		# $f2 = C
	
	li	$v0, 5
	syscall
	mtc1	$v0, $f3		# $f3 = D
	
# f = (0.1×A^4) - (0.2×B^3) + (0.3×C^2) - (0.4×D) 
#
# A^= 4
# A *= .1
#
# A2 = $f4
# B2 = $f5
# C2 = $f6
# D2 = $F7
	mul.s	$f4, $f0, $f0		# A2 = A^2
	mul.s	$f4, $f4, $f4		# A2 = A^4
	l.s	$f8, pointOne
	mul.s	$f4, $f4, $f8		# A2 = .1(A^4)
	
	mul.s	$f5, $f1, $f1		# B2 = B^2
	mul.s	$f5, $f5, $f1		# B2 = B^3
	l.s	$f8, pointTwo
	mul.s	$f5, $f5, $f8		# B2 = .2(B^3)
	
	mul.s	$f6, $f2, $f2		# C2 = C^2
	l.s	$f8, pointThree
	mul.s	$f6, $f6, $f8		# C2 = .3(C^2)
	
	l.s	$f8, pointFour
	mul.s	$f7, $f3, $f8		# D2 = .4D
	
	sub.s	$f4, $f4, $f5
	add.s	$f6, $f6, $f7
	add.s	$f4, $f4, $f6		# A2 = f
#
# End compute f
#
# g = (0.1×AB^2) + (0.2×C^2D^3) 
	mul.s	$f5, $f1, $f1		# f5 = b^2
	mul.s	$f5, $f5, $f0
	l.s	$f8, pointOne
	mul.s	$f5, $f5, $f8		# f5 = .1(A(B^2))
	
	mul.s	$f6, $f3, $f3		# f6 = D^2
	mul.s	$f6, $f6, $f3		# f6 = D^3
	mul.s	$f6, $f6, $f2		# f6 = CD^3
	mul.s	$f6, $f6, $f2		# f6 = (C^2)(D^3)
	l.s	$f8, pointTwo
	mul.s	$f6, $f6, $f8		# f6 = .2(C^2)(D^3)
	
	add.s	$f5, $f5, $f6		# f5 = g
	
	
	
	# print F
	li	$v0, 4			# string
	la	$a0, f
	syscall
	
	li	$v0, 2
	mov.s	$f12, $f4
	syscall
	
	addi 	$a0, $zero, 0xA
	addi 	$v0, $zero, 0xB
	syscall				# Print a new line
	
	# print G
	li	$v0, 4			# string
	la	$a0, g
	syscall
	
	li	$v0, 2
	mov.s	$f12, $f5
	syscall
	
	addi 	$a0, $zero, 0xA
	addi 	$v0, $zero, 0xB
	syscall				# Print a new line
	
	li	$v0, 10			# Exit
	syscall