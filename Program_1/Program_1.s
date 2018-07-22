#Two 32 bit constants are loaded on to $t0 and $t1. The constants are added and the result is stored in $t2.
#By Amal Byju
#Roll Number 16CO205
#Date: 27/08/17
#------------------------------------------------------------------------------------------------------------------------------------------------------
.data 
.text

.globl main

main:          
	lui $t0,0x4567
	addi $t0,$t0,0x1234         #A 32 bit number is inserted into $t0
	lui $t1,0x3456
	addi $t1,$t1,0x5678         #A 32 bit number is inserted into $t1
 	add $t3,$t0,$t1             # Sum of values in $t0 and $t1 is stored in $t3
 	add $a0,$0,$t3		
 	addi $v0,$0,0x0001
 	syscall

	addi $v0,$0,10
	syscall
