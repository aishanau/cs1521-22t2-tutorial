main:

    li   $t0, 0     # n = 0

    la   $a0, string1
    li   $v0, 4
    syscall         # printf("n  = ")

    li   $v0, 5
    syscall         # scanf("%d", into $v0)

    move $t0, $v0

    li   $t2, 1         # fac = 1
    li   $t1, 1         # i = 1
loop:
    bgt  $t1, $t0, end   # i <= n  -->  if (i > n) break
    mul  $t2, $t2, $t1      # fac = fac * i
    addi $t1, $t1, 1        # i++
    j    loop

end:

    la   $a0, string2
    li   $v0, 4
    syscall         # printf("n! = ")

    move $a0, $t2       # assume $t2 holds n!
    li   $v0, 1
    syscall         # printf("%d", fac)

    li   $a0, '\n'
    li   $v0, 11
    syscall         # printf("\n")

    jr   $ra    # return 0

    .data
string1:   .asciiz "n  = "
string2:   .asciiz "n! = "
