#Program to load a 32b constant in the memory location pointed to by the global pointer. Another 32b constant is in
#the first memory location of the data segment. The constants are added and the sum is saved in the 100th word of the data
#segment.
#By Amal Byju
#Roll Number 16CO205
#Date: 27/08/17
#------------------------------------------------------------------------------------------------------------------------------------------------------
.data

.text
.globl main
main:
 li $t0,0x12345678           #A 32 bit constant is written to $t0
 sw $t0,0($gp)               #The value in $t0 is written in memory location pointed to by $gp 
 li $t0,0x10000000
 li $t1,0x87654321
 sw $t1,0($t0)               #Another 32 bit constant is saved in the first location of data segment  
 
 #adding
 
 lw $t4,0($gp)
 lw $t5,0($t0)
 add $t3,$t4,$t5
 sw $t3,400($t0)             #Sum is stored in $t3

 #printing
 
 li $v0,1
 addi $a0,$t3,0              #Printing value stored in $t3
 syscall

 #exit

 li $v0,10
 syscall
 
