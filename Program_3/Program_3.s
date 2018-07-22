#Program to print "Hello World"
#By Amal Byju
#Roll Number 16CO205
#Date: 27/08/17
#------------------------------------------------------------------------------------------------------------------------------------------------------
.data
msg: .asciiz "Hello World"

.text
.globl main
main:
 la $a0,msg
 li $v0,4
 syscall           #Printing "Hello World"
 li $v0,10
 syscall
