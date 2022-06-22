# row in $t0, col in $t1
main:

	li	$t0, 0
loop_row:
	bge 	$t0, 6, end_loop_row		# for (int row = 0; row < 6; row++) {

	li	$t1, 0
loop_col:
	bge	$t1, 12, end_loop_col		# for (int col = 0; col < 12; col++)

	# access our flag array 
	# print out each element 
	# BaseOffset + (row_index * MAX_COL + col_index) * 1
	mul 	$t2, $t0, 12
	add	$t2, $t2, $t1
	# la 	$t3, flag
	# add 	$t3, $t3, $t2
	# lb 	$t4, $t3
	lb 	$a0, flag($t2)		# printf ("%c", flag[row][col]);
	li	$v0, 11
	syscall 

	addi	$t1, $t1, 1
	j 	loop_col
end_loop_col:

	li 	$a0, '\n'		# printf ("\n");
	li	$v0, 11
	syscall 

	addi 	$t0, $t0, 1
	j 	loop_row

end_loop_row:

	li	$v0, 5			# return 5 
	jr	$ra	

	.data
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'