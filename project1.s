# Alexander Blauth
# CDA 3101
# Programing Assignment 1

.data
array:  .word -89, 19, 91, -23, -31, -96, 3, 67, 17, 13, -43, -74
size:   .word 12
message: .asciiz "Average of positive array elements: "

.text
.globl main
main:
  lw $t3, size     #Set size of array
  li $t1, 0        #Set index for array
  li $t2, 0        #Set loop counter
  li $t4, 0        #Set sum value
  li $t5, 0        #Set average value
loop:
  beq $t2, $t3, end         # if t2 == 12 end loop
  lb $a2, array($t1)        # load a byte from the array into $a2

  slt $s0, $a2, $zero       # if array[$t1] < 0, $s0 is true/1
  beq $s0, 0, addPos        # if array[$t1] is positive, branch to addPos

  addi $t2, $t2, 1          # increments loop counter by 1
  addi $t1, $t1, 4          # increments array index by 4
  j loop                    # jump back to start of loop
end:
  div $t5, $t4, 6           # calculates average

  li $v0, 4                 # print string
  la $a0, message
  syscall

  li $v0, 1                 # print int
  add $a0, $zero, $t5
  syscall

  li $v0,10                 # end program
  syscall

addPos:
  add $t4, $t4, $a2         # adds positive numbers to sum

  addi $t2, $t2, 1          # increments loop counter by 1
  addi $t1, $t1, 4          # increments array index by 4
  j loop                    # jump back to start of loop

  li $v0,10                 # end program
  syscall
