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



sum4:
sum4_prologue:

sum4_body:

sum4_epilogue:
    jr   $ra            


sum2:                   # sum2 doesn't call other functions
sum2_prologue:

sum2_body:

sum2_epilogue:
    jr   $ra            #