main:
main_prologue:
    begin
    push    $ra

main_body:
    li   $a0, 11         # sum4(11, 13, 17, 19)
    li   $a1, 13
    li   $a2, 17
    li   $a3, 19
    jal  sum4

    move $a0, $v0       # printf("%d", z);
    li   $v0, 1
    syscall

    li   $a0, '\n'      # printf("%c", '\n');
    li   $v0, 11
    syscall

main_epilogue:
    pop  $ra
    end

    li   $v0, 0         # return 0 from function main
    jr   $ra            # return from function main


# int a is in $a0
# int b is in $a1
# int c is in $a2
# int d is in $a3
sum4:
sum4_prologue:
    begin 
    push    $ra
sum4_body:
    jal     sum2
    move    $s0, $v0

    move    $a0, $a2
    move    $a1, $a3
    jal     sum2
    move    $s1, $v0

    move    $a0, $s0
    move    $a1, $s1
    jal     sum2

sum4_epilogue:
    pop     $ra
    end
    jr      $ra            #      


# int x is in $a0
# int y is in $a1
sum2:                   # sum2 doesn't call other functions
sum2_prologue:
    begin 
    push    $ra
sum2_body:
    add     $v0, $a0, $a1   #     return x + y;
sum2_epilogue:
    pop     $ra
    end
    jr   $ra            #