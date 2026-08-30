.text
.globl _start
.type _start,@function
_start:
  call __do_fini
  call __do_fini
  mov $231, %eax
  xor %edi, %edi
  syscall
.size _start, .-_start

.section .ctors,"aw",@progbits
.globl __CTOR_LIST_END__
__CTOR_LIST_END__:

.section .dtors,"aw",@progbits
.globl __DTOR_LIST_END__
__DTOR_LIST_END__:
