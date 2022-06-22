# Recursive maximum of array function

# Register usage:
#   - `a' is in $a0
#   - `length' is in $a1
#   - `first_element' is in $
#   - `max_so_far' is in $
max:
max_prologue:


max_body:


max_epilogue:




# some test code which calls max
main:
	begin  			# create stack frame
	push   			# save return address

	la	$a0, array
	li	$a1, 10
	jal	max    

	move 	$a0, $v0     	# printf ("%d")
	li   	$v0, 1
	syscall

	li   	$a0, '\n'     	# printf("%c", '\n');
	li   	$v0, 11
	syscall

				# clean up stack frame
	pop	$ra   		# restore $ra
	end			# 

	li  	$v0, 0         	# return 0
	jr  	$ra


.data
array:
	.word 1, 2, 3, 4, 5, 6, 4, 3, 2, 1