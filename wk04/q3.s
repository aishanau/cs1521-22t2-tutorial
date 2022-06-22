# Recursive maximum of array function

# Register usage:
#   - `a' is in $a0
#   - `length' is in $a1
#   - `first_element' is in $s0
#   - `max_so_far' is in $t1
max:
max_prologue:
	begin 
	push	$ra
	push 	$s0

max_body:
	lw 	$s0, ($a0)		# first_element in s0

	bne 	$a1, 1, max_length_greater_than_one

	move 	$v0, $s0
	b 	max_epilogue

max_length_greater_than_one:

	addi 	$a0, $a0, 4		# max(&a[1], length - 1);
	sub 	$a1, $a1, 1
	jal 	max
	move 	$t1, $v0		# max_so_far in t1

	ble	$s0, $t1, max_return_max_so_far
	
	move 	$t1, $s0		# max_so_far = first_element;

max_return_max_so_far:
	move 	$v0, $t1		# return max_so_far;
	b 	max_epilogue

max_epilogue:
	pop	$s0
	pop	$ra
	end
	jr 	$ra



# some test code which calls max
main:
	begin  			# create stack frame
	push   	$ra		# save return address

	la	$a0, array
	li	$a1, 10
	jal	max    		# function call to function 

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
	.word 1, 2, 10, 4, 5, 6, 4, 3, 2, 1