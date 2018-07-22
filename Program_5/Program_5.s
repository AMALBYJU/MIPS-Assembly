#This program accepts any string entered by the user which has a maximum length of 50 characters. The program then displays the string in reverse.
#By Amal Byju
#Roll Number 16CO205
#Date 28/08/17 
#------------------------------------------------------------------------------------------------------------------------------------------------------
.data
buffer: .space 50
msg2: .asciiz "Enter string (max 50 characters) "
msg3: .asciiz "String in reverse is "
.text
.globl main
main:
 li $v0,4               #Printing msg2
 la $a0,msg2
 syscall
 
 la $a0,buffer
 li $a1,50              #Accepting string
 li $v0,8
 syscall

 li $t0,0
 la $t1,buffer
 lw $t2,0($t1)          #Address of first element is stored in $t2

 count:
 beq $t2,$0,donecount
 addi $t0,$t0,1
 addi $t1,$t1,1
 lb $t2,0($t1)
 j count
 
donecount:
 
 addi $a1,$t0,1         #Address of last element calculated
                      
 
 add $t4,$a0,$0         #$t4 - starting address                  
 add $t3,$t4,$a1        #$t3 = end value
 add $t3,$t3,-2

reverse:
 ble $t3,$t4,exit       #Reversing string      
 lb $t5,0($t3)
 lb $t6,0($t4)
 sb $t6,0($t3)
 sb $t5,0($t4)
 addi $t3,$t3,-1
 addi $t4,$t4,1     
 j reverse

exit:
 
 li $v0,4
 la $a0,msg3
 syscall

 li $v0,4              #Printing reversed string
 la $a0,buffer
 syscall

 li $v0,10
 syscall

 
