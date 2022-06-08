main:

    li  $t0, 24         # int x = 24;

loop:
    bge $t0, 42, end    # if (x >= 42) { goto end
    
    li  $v0, 1          #    printf("%d\n", x);
    move $a0, $t0
    syscall 
    
    li $v0, 11
    li $a0, '\n'
    syscall
        
    add $t0, $t0, 3     # x = x + 3
    
    b   loop

end:
    li $v0, 0                   # return 0
    jr $ra