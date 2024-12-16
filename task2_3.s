li t0, 6421
li t1, 0

andi t1, t0, 0x1


addi a1, t1,0
addi a0, x0, 1
ecall

li a0, 10
ecall