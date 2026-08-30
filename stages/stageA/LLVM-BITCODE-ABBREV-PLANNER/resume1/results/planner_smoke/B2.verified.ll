; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\planner_smoke\B2.bc'
source_filename = "native_minimal.c"
target triple = "x86_64-pc-windows-msvc"

define i32 @sum_to_n(i32 %n) {
entry:
  br label %loop

loop:                                             ; preds = %loop, %entry
  %i = phi i32 [ 0, %entry ], [ %next, %loop ]
  %acc = phi i32 [ 0, %entry ], [ %sum, %loop ]
  %sum = add i32 %acc, %i
  %next = add i32 %i, 1
  %done = icmp eq i32 %next, %n
  br i1 %done, label %exit, label %loop

exit:                                             ; preds = %loop
  ret i32 %sum
}
