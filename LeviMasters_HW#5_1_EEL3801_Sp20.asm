# Levi Masters
# EEL 3801
# Homework 5
# Question 1
#
# Write a complete MIPS-32 assembly language program that computes the side area of a cylinder of 
# radius R and height H. Assume that the R and H are stored in memory at locations labeled RADIUS 
# and HEIGHT respectively as double precision floating point numbers (IEEE 754 format). Your 
# program should display the side area of the cylinder preceded by the following message “Side area of 
# the cylinder = “. Test your program using MARS for R = 0.5 m and H = 3.275 m. 
#
# Area = 2*PI*R*H
.data
RADIUS:	.double	0.5
HEIGHT:	.double	3.275
TWO:	.double	2.0
PI:	.double	3.14159265359
msg:	.asciiz	"Side area of the cylinder = "

	.text
main:
	l.d	$f0, RADIUS
	l.d	$f2, HEIGHT
	l.d	$f4, TWO
	l.d	$f6, PI
	
	mul.d	$f12, $f4, $f6
	mul.d	$f12, $f12, $f2
	mul.d	$f12, $f12, $f0
	
	li	$v0, 4
	la	$a0, msg
	syscall
	
	li	$v0, 2
	syscall
	
	li	$v0, 10
	syscall
	
	
	
	
	
	
	
	
	
