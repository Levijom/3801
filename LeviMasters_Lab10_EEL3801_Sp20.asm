# Levi Masters
#
# The purpose of this project is to increase your understanding of data, address, memory contents, and strings. 
# You  will  be  expected  to  apply  selected  MIPS  assembly  language  instructions,  
# assembler  directives,  and system calls sufficient  enough to  handle string  manipulation tasks. 
#
# You are tasked to develop a program that finds how many times a word is used in a given statement. 
# To test your program, you should hardcode the below sample statement in your code and ask the user 
# to input two different words, which are “UCF” and “KNIGHTS.” 
# Your program should not be case sensitive, it should correctly find the words regardless of 
# how the user inputs the words, and your code should work for any words with less than 10 characters. 
#
# Sample Statement: 
#	UCF, its athletic program, and the university's alumni and sports fans are sometimes jointly 
#	referred to as  the UCF Nation,  and are  represented  by the  mascot Knightro. 
#	The Knight was chosen  as  the university mascot in 1970 by student election. 
#`	The Knights of Pegasus was a submission put forth by students, staff, and faculty, 
#	who wished to replace UCF's original mascot, the Citronaut, which was a mix between 
#	an orange and an astronaut. The Knights were also chosen over Vincent the Vulture, 
#	which was a popular unofficial mascot among students at the time. 
#	In 1994, Knightro debuted as the Knights official athletic mascot. 
# Sample Output: 
#	Please input first word: Knight  
#	Please input second word:  UCF
#	KNIGHT: 6 
#	UCF: 3 
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
	prompt1:	.asciiz "Please inout first word: "
	prompt2:	.asciiz "Please input second word: "
	word1:		.space 10
	word2:		.space 10
	output1:	.asciiz "KNIGHT: "
	output2:	.asciiz "UCF: "
.text
main:
	addi 	$a0, $0, 0xA
	addi 	$v0, $0, 0xB
	syscall			# syscalls to print a new line
	
	la	$a0, prompt1
	li	$v0, 4
	syscall
	
	li	$v0, 8
	la	$a0, word1
	li	$a1, 9
	syscall
	
	la	$a0, prompt2
	li	$v0, 4
	syscall
	
	li	$v0, 8
	la	$a0, word2
	li	$a1, 9
	syscall
	
	la	$t0, string
	
####################################### From Previous Lab #########################################
	toLowerCase: 
		lb 	$t2, 0($t0) 	# We do as always, get the first byte pointed by the address
		beqz 	$t2, end1 	# if is equal to zero, the string is terminated
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
	
	end1:
		la	$t0, word1
		
####################################### From Previous Lab #########################################
	toLowerCase2: 
		lb 	$t2, 0($t0) 	# We do as always, get the first byte pointed by the address
		beqz 	$t2, end2 	# if is equal to zero, the string is terminated
		bge	$t2, 65 upperCaseTest22
		j 	continue2
	upperCaseTest22:
		ble	$t2, 90, isUpperCase2
		j	continue2
	continue2:
		# Continue the iteration
		addi	$t0, $t0, 1	# Increment the address
		j	toLowerCase2
	isUpperCase2:
		addiu	$t2, $t2, 32
		sb	$t2, 0($t0) 	# store it in the string
		j 	continue2 	# continue iteration as always
####################################### End Previous Lab ##########################################
	
	end2:
		la	$t0, word2
		
####################################### From Previous Lab #########################################
	toLowerCase3: 
		lb 	$t2, 0($t0) 	# We do as always, get the first byte pointed by the address
		beqz 	$t2, end3 	# if is equal to zero, the string is terminated
		bge	$t2, 65 upperCaseTest3
		j 	continue3
	upperCaseTest3:
		ble	$t2, 90, isUpperCase3
		j	continue3
	continue3:
		# Continue the iteration
		addi	$t0, $t0, 1	# Increment the address
		j	toLowerCase3
	isUpperCase3:
		addiu	$t2, $t2, 32
		sb	$t2, 0($t0) 	# store it in the string
		j 	continue3 	# continue iteration as always
####################################### End Previous Lab ##########################################
#
# The string input and user inputs are all converted to lower case.  Now all that needs to be done
# is loop through the string input and determine if a start letter is found, then loop through the word
# until we reach a mismatch, or complete the word

	end3:
		la	$t0, string
		la	$t1, word1
		addi	$t2, $t1, 6			# 6 is length of expected input
		lb	$t2, 0($t2)
		li	$t5, 0				# word1 match counter
		
		Loop1:					# loop to find word 1 matches
			lb	$t3, 0($t0)
			lb	$t4, 0($t1)
			beqz	$t3, endL1		# finished looping through input
			beq	$t4, $t2, w1Match		# found a match for w1 BROKEN
			beq	$t3, $t4, nextChar1	# found 1 matching char
							# If we get here, there is no match
			addi	$t0, $t0, 1		# increment phrase counter
			la	$t1, word1		# reset word1 counter
			j	Loop1
		
		nextChar1:
			addi	$t0, $t0, 1		# increment phrase counter
			addi	$t1, $t1, 1		# increment word1 counter
			j	Loop1
			
		w1Match:
			addi	$t5, $t5, 1		# increment word1 match counter
			addi	$t0, $t0, 1		# increment phrase counter
			la	$t1, word1		# reset word1 counter
			j	Loop1
	endL1:
		la	$t0, string
		la	$t1, word2
		addi	$t2, $t1, 3			# 3 is length of expected input
		lb	$t2, 0($t2)
		li	$t6, 0				# word2 match counter
		
		Loop2:					# loop to find word 1 matches
			lb	$t3, 0($t0)
			lb	$t4, 0($t1)
			beqz	$t3, end		# finished looping through input
			beq	$t4, $t2, w2Match		# found a match for w1 BROKEN
			beq	$t3, $t4, nextChar2	# found 1 matching char
							# If we get here, there is no match
			addi	$t0, $t0, 1		# increment phrase counter
			la	$t1, word2		# reset word1 counter
			j	Loop2
		
		nextChar2:
			addi	$t0, $t0, 1		# increment phrase counter
			addi	$t1, $t1, 1		# increment word1 counter
			j	Loop2
			
		w2Match:
			addi	$t6, $t6, 1		# increment word1 match counter
			addi	$t0, $t0, 1		# increment phrase counter
			la	$t1, word2		# reset word1 counter
			j	Loop2
		
	end:
		addi	$a0, $0, 0xA
		addi	$v0, $0, 0xB
		syscall			# syscalls to print a new line
		
		li 	$v0, 4 		# Print output1
		la 	$a0, output1
		syscall
		
		move	$a0, $t5
		li	$v0, 1
		syscall
		
		addi	$a0, $0, 0xA
		addi	$v0, $0, 0xB
		syscall			# syscalls to print a new line
		
		li 	$v0, 4 		# Print output1
		la 	$a0, output2
		syscall
		
		move	$a0, $t6
		li	$v0, 1
		syscall
		
		li 	$v0, 10
		syscall
