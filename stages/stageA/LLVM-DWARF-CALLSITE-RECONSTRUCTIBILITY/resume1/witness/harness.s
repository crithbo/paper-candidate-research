        .bss
        .p2align 2
result:
        .long   0

        .text
        .globl  foo
        .type   foo,@function
foo:
        cmpl    $42, %edi
        sete    %al
        movzbl  %al, %eax
        movl    %eax, result(%rip)
        ret
        .size   foo, .-foo

        .globl  _start
        .type   _start,@function
_start:
        movl    $19, %edi
        movl    $23, %esi
        xorl    %edx, %edx
        call    baa
        movl    result(%rip), %edi
        xorl    $1, %edi
        movl    $231, %eax
        syscall
        ud2
        .size   _start, .-_start
