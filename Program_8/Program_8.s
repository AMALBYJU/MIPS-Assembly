#Factorial Program. Load a random number in $t0. Calculate its factorial using (a) loops, (b) recursion.
#By Amal Byju
#Roll number: 16CO205
#Date: 28/08/17
#-----------------------------------------------------------------------------------------------------------------------------------------------------
.data
msg1: .asciiz "MENU "
msg2: .asciiz "Factorial is "
msg3: .asciiz "Calculate factorial by"
msg4: .asciiz "1. Recursion"
msg5: .asciiz "2. Loop"
msg6: .asciiz "Enter number "
msg7: .asciiz "Enter choice "

.text
.globl main

main:

la $a0,msg1
li $v0,4
syscall

la $a0,10            #To print newline
la $v0,11
syscall

la $a0,msg3
li $v0,4
syscall

la $a0,10
la $v0,11
syscall

la $a0,msg4
li $v0,4
syscall

la $a0,10
la $v0,11
syscall

la $a0,msg5
li $v0,4
syscall

la $a0,10
la $v0,11
syscall

la $a0,10
la $v0,11
syscall

la $a0,msg7
li $v0,4
syscall

li $v0,5            #to enter choice
syscall

move $t4,$v0

la $a0,msg6
li $v0,4
syscall

li $v0,5             #To enter number
syscall

beq $v0,$0,end

add $a0,$0,$v0            #$a0 stores value of number

li $v0,1
add $t2,$0,$a0
beq $v0,$t4,link          #jumping to recursive function

add $t1,$0,$v0

factloop:               #Calculation by iteration

beq $t2,$0,endloop
mult $t2,$v0
mflo $v0                #$v0 contains sum
addi $t2,$t2,-1
j factloop
endloop:

move $t2,$v0            #$t2 contains value in $v0

la $a0,msg2
li $v0,4
syscall

li $v0,1
add $a0,$0,$t2
syscall
end:

li $v0,10
syscall

done:
move $t2,$v0
la $a0,msg2
li $v0,4
syscall

li $v0,1
add $a0,$0,$t2
syscall
j end

link:
 jal recfact
 j done

recfact:            #Calculation by recursion

 beq $0,$t2,endfact
 addi $sp,$sp,-8
 sw $ra,4($sp)
 sw $t2,0($sp)
 addi $t2,$t2,-1
 jal recfact

 endfact:
 lw $ra,4($sp)
 lw $t4,0($sp)
 mult $t4,$v0
 mflo $v0          
 addi $sp,$sp,8
 jr $ra
