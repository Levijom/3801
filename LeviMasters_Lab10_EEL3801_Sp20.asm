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
	string: 	.asciiz	"UCF, its athletic program, and the university's alumni and sports fans are sometimes jointly referred to as  the UCF Nation,  and are  represented  by the  mascot Knightro. The Knight was chosen  as  the university mascot in 1970 by student election. The Knights of Pegasus was a submission put forth by students, staff, and faculty, who wished to replace UCF's original mascot, the Citronaut, which was a mix between an orange and an astronaut. The Knights were also chosen over Vincent the Vulture, which was a popular unofficial mascot among students at the time. In 1994, Knightro debuted as the Knights official athletic mascot."
	
.text
main:
	la 	$t0, string 		# Load here the string
	addu	$s0, $zero, $zero	# K counter
	
	la 	$t0, string 		# string loaded to t0 will be converted to lowercase
	
####################################### From Previous Lab #########################################
	toLowerCase: 
		lb 	$t2, 0($t0) 	# We do as always, get the first byte pointed by the address
		beqz 	$t2, end 	# if is equal to zero, the string is terminated
		bge	$t2, 65 upperCaseTest2
		j 	continue
	upperCaseTest2:
		ble	$t2, 90, isUpperCase
		j	continue
	continue:
		# Continue the iteration
		addi	$t0, $t0, 1	# Increment the address
		j	toLowerCase
	isUpperCase:
		addiu	$t2, $t2, 32
		sb	$t2, 0($t0) 	# store it in the string
		j 	continue 	# continue iteration as always
####################################### End Previous Lab ##########################################
	
	
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
		
		li 	$v0, 10
		syscall