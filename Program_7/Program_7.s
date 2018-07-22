#Program to multiply matrices using functions. 
#NOTE: The number of columns of first matrix should equal the number of rows in the second matrix.
#By Amal Byju
#Roll number: 16CO205
#Date: 28/08/17
#------------------------------------------------------------------------------------------------------------------------------------------------------
.data
arr1: .space 100
arr2: .space 100
arr3: .space 100
msg1: .asciiz "Enter rows in matrix 1 "
msg2: .asciiz "Enter columns in matrix 1 "
msg3: .asciiz "Enter rows in matrix 2 "
msg4: .asciiz "Enter columns in matrix 2 "
msg5: .asciiz "Enter elements in matrix 1 "
msg6: .asciiz "Enter elements in matrix 2 "
msg7: .asciiz "The end result is "
msg8: .asciiz " "


.text

.globl main
main:
 
 la $s0,arr1        #$s0 = Base address of arr1
 la $s1,arr2        #$s1 = Base address of arr2
 la $s2,arr3        #$s2 = Base address of arr3
 
 li $v0,4
 la $a0,msg1
 syscall
 
 li $v0,5
 syscall
 move $s3,$v0      # $s3 = Rows of matrix 1
 
 li $v0,4
 la $a0,msg2
 syscall

 li $v0,5
 syscall
 move $s4,$v0      #$s4 = Columns of matrix 1

 li $v0,4
 la $a0,msg3
 syscall
 
 li $v0,5
 syscall
 move $s5,$v0     #$s5 = Rows of matrix 2

 li $v0,4 
 la $a0,msg4
 syscall
 
 li $v0,5
 syscall
 move $s6,$v0     #$s6 = Columns of matrix 2

 li $v0,4
 la $a0,msg5
 syscall
 
 add $a1,$0,$s3   #To read elements in first matrix
 add $a2,$0,$s4
 la $a3,arr1
 li $t9,0
 li $t8,0
 jal read

 li $v0,4
 la $a0,msg6
 syscall

 add $a1,$0,$s5  #To read elements in second matrix
 add $a2,$0,$s6
 la $a3,arr2
 li $t9,0
 li $t8,0
 jal read

 li $t9,0        #Matrix multiplication
 li $t8,0
 li $t7,0
 li $t6,0
 la $t4,arr3
 jal calculate
 
 li $v0,4
 la $a0,msg7
 syscall

 add $a1,$0,$s3   #To print elements of the resulting matrix
 add $a2,$0,$s6
 la $a3,arr3
 li $t9,0
 li $t8,0
 jal print

 li $v0,10
 syscall


read:            #To read elements of a matrix    

 #$a1 = rows
 #$a2 = columns
 #$a3 = base address
 #Requires $t9 and $t8 to be 0

 mult $a1,$a2
 mflo $a1 
 
 read1:
 beq $a1,$t9,endread
  
  li $t8,4
  mult $t9,$t8
  mflo $t8
  add $t8,$a3,$t8
  
  li $v0,5
  syscall
  sw $v0,0($t8)
  
  addi $t9,$t9,1
  j read1

endread:
 jr $ra

print:                     #To print elements of a matrix

 #$a1 = rows
 #$a2 = columns
 #$a3 = base address
 #Requires $t9 and $t8 to be 0

printr:
 
 beq $t9,$a1,eprintr
   li $a0,10
   li $v0,11
   syscall
   
  printc:
   beq $t8,$a2,eprintc    
   mult $t9,$a2
   mflo $t4             #$t4 = i*c
   add $t5,$t4,$t8      #$t5 = i*c + j 
   li $t6,4
   mult $t5,$t6
   mflo $t5
   add $t6,$t5,$a3
   lw $t5,0($t6)                  
   
   li $v0,1
   add $a0,$0,$t5
   syscall
   
   li $v0,4
   la $a0,msg8
   syscall

   addi $t8,$t8,1
   j printc 
    
  eprintc:
   li $t8,0
   addi $t9,$t9,1
   j printr
 eprintr:
jr $ra
  
calculate:                   #To calculate elements of resulting matrix

 #s3 = Rows in matrix 1
 #s4 = Columns in matrix 1
 #s5 = Rows in matrix 2
 #s6 = Columns in matrix 2
 #Requires $t9 and $t8 to be 0
 #Requires $t7 and $t6 to be 0
 #$t4 is pointing to starting address of arr3
 li $t3,0
row:
  beq $t9,$s3,endrow
  
 
 remain:
  beq $t3,$s6,endremain
  
     
  col:
   beq $t8,$s4,endcol
   mult $t9,$s4 
   mflo $t7
   add $t7,$t7,$t8
   li $t5,4
   mult $t7,$t5
   mflo $t7    #$t7 - pointing to current element address in matrix 1
   mult $s6,$t8
   mflo $t6
   mult $t6,$t5
   mflo $t6
   mult $t3,$t5
   mflo $t2
   add $t6,$t6,$t2
   add $t7,$t7,$s0
   add $t6,$t6,$s1
   lw $t7,0($t7)
   lw $t6,0($t6)
   mult $t6,$t7
   mflo $t6
   add $s7,$t6,$s7      
   addi $t8,$t8,1
   j col
  endcol:
   sw $s7,0($t4)
   addi $t4,$t4,4
   li $s7,0
   li $t8,0
   addi $t3,$t3,1
  j remain
 
 endremain:
  
   li $t3,0
   addi $t9,$t9,1
   j row   

 endrow:

 jr $ra
 
 

 
