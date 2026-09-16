; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\070_0cab9a0ebdb3bb16\WL.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\alloca-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone
define dso_local zeroext i1 @foo() #0 {
entry:
  %p = alloca ptr, align 8
  %0 = alloca i8, i64 32, align 16
  store ptr %0, ptr %p, align 8
  %1 = load ptr, ptr %p, align 8
  %2 = ptrtoint ptr %1 to i64
  %and = and i64 %2, 15
  %cmp = icmp eq i64 %and, 0
  ret i1 %cmp
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %call = call zeroext i1 @foo() #2
  br i1 %call, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call1 = call i32 (...) @abort() #2
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

declare i32 @abort(...) #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
