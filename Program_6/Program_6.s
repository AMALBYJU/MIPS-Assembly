#Program that contains a function that calculates the sum of the elements of the array. The function accepts the length of
#the array and the address of the first element of the array. The function returns the sum to the caller. The
#main procedure calculates the average of the elements of the array. The main procedure uses the mentioned
#the function.
#By Amal Byju
#Roll Number 16CO205
#Date: 27/08/2017
#------------------------------------------------------------------------------------------------------------------------------------------------------
.data
msg1: .asciiz "Enter the number of values to be entered "
msg2: .asciiz "Enter values " 
msg3: .asciiz "Sum is "
msg4: .asciiz "Average is "
arr: .space 50

.text
.globl main

main:
 li $v0,4
 la $a0,msg1
 syscall
 
 li $v0,5
 syscall
 
 add $a1,$v0,$0
 
 li $v0,4
 la $a0,msg2
 syscall

 li $t1,0
 la $t4,arr
 j read

read:                              #For reading elements and storing in array
 beq $t1,$a1,readend
 li $v0,5
 syscall
 sw $v0,0($t4)
 addi $t4,$t4,4
 addi $t1,$t1,1
 j read

readend:
 la $a0,arr
 add $s0,$a1,$0
 jal sum              
 
move $t0,$v0                      #The calculated sum is stored in $t0 

li $v0,4
la $a0,msg3
syscall

la $a0,arr
add $a1,$s0,$0
div $t0,$a1                       #$a1 stores the number of elements
 
li $v0,1
add $a0,$t0,$0
syscall

li $v0,11                         #For printing newline
li $a0,10
syscall

li $v0,4
la $a0,msg4
syscall

mflo $t3                          #Average is stored in $t3

li $v0,1
add $a0,$t3,$0
syscall

 li $v0,10
 syscall
 
sum:                                #For calculating sum

 #$a0 = address of first register
 #$a1 = length
 #$v0 = sum

 li $v0,0
 loop:
 beq $a1,0,loopend
 lw $t1,0($a0)
 add $v0,$v0,$t1
 addi $a0,$a0,4
 addi $a1,$a1,-1
 j loop
 
 loopend:
 jr $ra 
 
  
 
 
