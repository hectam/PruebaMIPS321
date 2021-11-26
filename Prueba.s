.data
WriteString: .asciiz     "Escriba texto: "
Result:    .asciiz     "Las vocales encontradas son: "
v:      .asciiz     "aeiou"
JLine:     .asciiz     "\n"
str:        .space      80

    .text
    .globl  main
main:
  
    li      $v0,4
    la      $a0,WriteString
    syscall

    li      $v0,8
    la      $a0,str
    li      $a1,80
    syscall

    li      $s2,0                   
    la      $s0,str                 


string_loop:
    lb      $t0,0($s0)          
    addiu   $s0,$s0,1               
    beqz    $t0,string_done        

    la      $s1,v                 

vowel_loop:
    lb      $t1,0($s1)             
    beqz    $t1,string_loop        
    addiu   $s1,$s1,1             
    bne     $t0,$t1,vowel_loop   
    addi    $s2,$s2,1               
    j       string_loop            

string_done:

    li      $v0,4
    la      $a0,Result
    syscall

 
    li      $v0,1
    move    $a0,$s2
    syscall

 
    li      $v0,4
    la      $a0,JLine
    syscall

 
    li      $v0,10
    syscall