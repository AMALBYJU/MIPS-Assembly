#Program to initialize a contiguous chunk of memory to contain 10 two digit decimal numbers. The program
#calculates the sum of these numbers and the result is inserted into $v0.
#By Amal Byju
#Roll Number 16CO205
#Date 27/08/17
#------------------------------------------------------------------------------------------------------------------------------------------------------
.data
arr: .space 40
msg: .asciiz "Enter ten 2 digit numbers "
msg2: .asciiz "Only 2 digit numbers are accepted "
msg3: .asciiz "Sum is "

.text
.globl main
main:
 la $t4,arr
 li $t1,0
 
 li $v0,4                  #Print msg
 la $a0,msg
 syscall

 li $t6,100
 li $t8,10

input:
 beq $t1,10,exit          #Taking 10 2 digit numbers
 li $v0,5
 syscall
 div $v0,$t6              #Checking whether number is greater than 100
 mflo $t7
 bne $t7,$0,exit2
 div $v0,$t8
 mflo $t7                 #Checking whether number is lesser than 10
 beq $t7,$0,exit2  
 sw $v0,0($t4)
 addi $t4,$t4,4
 addi $t1,$t1,1
 j input

exit:
 #calculate sum
 li $t1,0
 li $v0,0                  #sum register = $v0
 la $t4,arr                #$t4 stores beginning address of array
sum:
 beq $t1,10,exit1
 lw $t5,0($t4)
 add $v0,$v0,$t5
 addi $t4,$t4,4
 addi $t1,$t1,1            #Sum is calculated
 j sum

exit1:

 add $t5,$0,$v0            #Sum is stored in $t5             

 la $a0,msg3
 li $v0,4
 syscall

 li $v0,1                  #Printing sum
 addi $a0,$t5,0
 syscall
 
 li $v0,10
 syscall
 
exit2:

 la $a0,msg2              #For invalid cases
 li $v0,4
 syscall                  #Display msg2

 li $v0,10                #exit
 syscall
