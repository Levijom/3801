# Levi Masters
# strlength.asm-- A program that determine the length of a null terminated string
#
# Registers used:
# $t0 - used to hold the loop counter
# $a0 - used to hold the address of string
# $v0 - syscall parameter and return value
###################################################################################################
##################################### Given Code ##################################################
.data 
17
str:	.asciiz		"abcde"
.text
# Load address of string into a0
#################################### End Given Code ###############################################
####################################### My Code ###################################################
.globl main
main:
la	$a0, str
##################################### End My Code #################################################
##################################### Given Code ##################################################
strlen:
	li 	$t0, 0 		# initialize the count to zero
loop:
	lb 	$t1, 0($a0) 	# load the next character into t1
	beqz 	$t1, exit 	# check for the null character
#################################### End Given Code ###############################################
####################################### My Code ###################################################
	addiu	$t0, $t0, 1	# Increment counter
	addiu	$a0, $a0, 1	# Increment pointer
	j	loop
##################################### End My Code #################################################
##################################### Given Code ##################################################
exit:
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 10
	syscall 