target triple = "riscv32-unknown-elf"

declare void @clobber()

define i32 @witness(i32 %x, i32 %y) nounwind uwtable {
entry:
  call void @clobber()
  %sum = add i32 %x, %y
  ret i32 %sum
}
