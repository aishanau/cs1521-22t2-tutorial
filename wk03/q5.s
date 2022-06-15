main:

	li	$t0, 0
loop:
	bge	$t0, 10, end

	li	$v0, 5
	syscall
	move	$t1, $v0		# $t1 holds scanf value

	la	$t2, numbers		# offset of the array
	mul	$t3, $t0, 4		# i * 4 (which is the size of each element in the array)
	add	$t3, $t3, $t2		# offset + i * 4

	sw	$t1, ($t3)		# store value of t1 into address thats held in t3

	add	$t0, $t0, 1
	j	loop
end:

	# print out array 

	li	$t0, 0
loop_print:	
	bge	$t0, 10, end_loop_print

	la	$t2, numbers
	mul	$t3, $t0, 4
	add	$t3, $t3, $t2

	lw	$a0, ($t3)

	# print out syscall
	li	$v0, 1
	syscall

	add	$t0, $t0, 1
	j	loop_print

end_loop_print:

	li $v0, 0					# return 0
	jr $ra

.data

numbers:
	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
