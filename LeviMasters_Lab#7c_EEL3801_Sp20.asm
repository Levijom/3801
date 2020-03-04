# Levi Masters
# To_lowercase.asm-- A program that convert uppercase to lowercase
# Registers used:
# $t0	to hold address of string
# $t2	to hold value of char being looked at
.data
	string: 	.asciiz	"HeLlo WoRld" # We want to lower this string
	newline: 	.asciiz	"\n"
.text
main:
	la 	$t0, string 		# Load here the string
	toLowerCase: 
		lb 	$t2, 0($t0) 	# We do as always, get the first byte pointed by the address
		beqz 	$t2, end 	# if is equal to zero, the string is terminated
		#if (character >= 'A'
#################################### End Given Code ###############################################
####################################### My Code ###################################################
		bge	$t2, 65 upperCaseTest2
		j 	continue
##################################### End My Code #################################################
##################################### Given Code ##################################################
	upperCaseTest2:
		# && character <= 'Z')
#################################### End Given Code ###############################################
####################################### My Code ###################################################
		ble	$t2, 90, isUpperCase
		j	continue
##################################### End My Code #################################################
##################################### Given Code ##################################################
	continue:
		# Continue the iteration
		addi	$t0, $t0, 1	# Increment the address
		j	toLowerCase
	isUpperCase:
		# add 32, so it goes lower case
#################################### End Given Code ###############################################
####################################### My Code ###################################################
		addiu	$t2, $t2, 32
##################################### End My Code #################################################
##################################### Given Code ##################################################
		sb	$t2, 0($t0) 	# store it in the string
		j 	continue 	# continue iteration as always
	end:
		li 	$v0, 4 		# Print the string
		la 	$a0, string
		syscall
		li 	$v0, 4 		# A nice newline
		la 	$a0, newline
		syscall
		# We have done, exit the program	
		li 	$v0, 10
		syscall