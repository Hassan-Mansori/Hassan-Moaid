.data
value: .byte 42
results: .word 8
.text 

main: 
la t0, value 
lw t1, 0(t0)
not t2, t1
la t3, results
sw t2, 0(t3)
