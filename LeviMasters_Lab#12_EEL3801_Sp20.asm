## Levi Masters
## fp_mean.asm-- takes two numbers A and B 

.data	
A:	.float		0.11 0.34 1.23 5.34 0.76 0.65 0.34 0.12 0.87 0.56
B:	.float		7.89 6.87 9.89 7.12 6.23 8.76 8.21 7.32 7.32 8.22
N:	.float		10 
meanA:	.asciiz 	"\nThe Mean of A =" 
meanB:	.asciiz 	"\nThe Mean of B =" 
.text 
la 	$a0,N			# Load address of input vector size into $a0 
l.s	$f2, 0($a0)		# Load the input vector size into $f2 
la	$a0, A     		# Load the address of vector A into $a0 
jal	mean        		# Call mean function, result in $f1 
li	$v0,4        		# Load 4=print_string into $v0 
la	$a0, meanA   		# Load address of first string into $a0 
syscall				# Output the string via syscall
 
li	$v0,2        		# Load 2 into $v0=print single precision float 
mov.s	$f12,$f1  		# Copy from $f1 to $f12 
syscall         		# output meanA 

mov.s	$f1,$f3  		# reset $f1 
la	$a0, B      		# Load the address of vector B into $a0 
jal	mean       		# Call mean function, result in $f1 
li	$v0,4        		# Load 4=print_string into $v0 
la	$a0, meanB   		# Load address of second string into $a0 
syscall         		# Output the string via syscall 

li	$v0,2        		# Load 2 into $v0=print single precision float 
mov.s	$f12,$f1  		# Copy from $f1 to $f12 
syscall         		# output meanB 

# Exit 
li $v0,10 
syscall 

#mean function 
mean: 
|------------------| 
|Put your code here| 
|------------------| 
return: 
|------------------| 
|Put your code here| 
|------------------| 