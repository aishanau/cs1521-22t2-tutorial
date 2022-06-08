main:
    li  $v0, 4          #    load the value 4 into v0 register printf("Enter a number: ");
    la  $a0, prompt
    syscall 
    
    li  $v0, 5          #    scanf("%d", &x);
    syscall
    move $t0, $v0

    ble $t0, 100, small_big
    bge $t0, 1000, small_big
    
    li  $v0, 4         
    la  $a0, medium_string
    syscall 
    
    b   return
    
small_big:
    li  $v0, 4         
    la  $a0, small_big_string
    syscall 

return:
    li $v0, 0                   # return 0
    jr $ra
    
    
    
.data 

prompt: 
    .asciiz "Enter a number: "
    
medium_string:
    .asciiz "Medium\n"

small_big_string:
    .asciiz "Small/Big\n"
