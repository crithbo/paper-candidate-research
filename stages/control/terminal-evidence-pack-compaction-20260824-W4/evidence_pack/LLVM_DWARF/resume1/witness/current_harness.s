        .data
        .p2align 2
observed:
        .long   -1

        .text
        .globl  sink_i32
        .type   sink_i32,@function
sink_i32:
        movl    %edi, observed(%rip)
        ret
        .size   sink_i32, .-sink_i32

        .globl  _start
        .type   _start,@function
_start:
        movl    $19, %edi
        movl    $23, %esi
        call    call_cut_i32
        cmpl    $42, observed(%rip)
        jne     .Lfail
        movl    $-1, observed(%rip)
        xorl    %edi, %edi
        movl    $23, %esi
        call    call_cut_i32
        cmpl    $-1, observed(%rip)
        jne     .Lfail
        xorl    %edi, %edi
        jmp     .Lexit
.Lfail:
        movl    $1, %edi
.Lexit:
        movl    $231, %eax
        syscall
        ud2
        .size   _start, .-_start
