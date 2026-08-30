        .text
        .globl  _start
        .type   _start,@function
_start:
        .cfi_startproc
        xor     %ebp, %ebp
        call    main
        mov     %eax, %edi
        mov     $231, %eax
        syscall
        ud2
        .cfi_endproc
        .size   _start, .-_start
