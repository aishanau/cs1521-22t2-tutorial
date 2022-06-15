main:

	li	$t0, 0
loop:
	bge	$t0, 10, end

	la	$t2, numbers		# offset of the array
	mul	$t3, $t0, 4		# i * 4 (which is the size of each element in the array)
	add	$t3, $t3, $t2		# offset + i * 4

	lw	$t1, ($t3)		# get value of numbers[i] into t1
	
	bge	$t1, 0, loop_increment

	add	$t1, $t1, 42		# numbers[i] + 42
	sw	$t1, ($t3)		# numbers[i] = numbers[i] + 42

loop_increment:
	add	$t0, $t0, 1
	j	loop
end:


	li	$t0, 0
loop_print:
	bge	$t0, 10, end_print

	mul	$t3, $t0, 4    #   calculate &numbers[i]
	la	$t2, numbers   #
	add	$t3, $t3, $t2  #
	lw	$a0, ($t3)     #   load numbers[i] into $a0
	li	$v0, 1         #   printf("%d", numbers[i])
	syscall

	li	$a0, '\n'      #   printf("%c", '\n');
	li	$v0, 11
	syscall

	add	$t0, $t0, 1
	j	loop_print
end_print:
	li $v0, 0					# return 0
	jr $ra

.data

numbers:
	.word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9
