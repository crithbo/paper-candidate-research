; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\092_10570c4332a571af\B1.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr78436.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, [4 x i8] }

@s = dso_local global %struct.S zeroinitializer, align 8

; Function Attrs: noinline nounwind optnone
define dso_local void @foo() #0 {
entry:
  %bf.load = load i32, ptr @s, align 8
  %bf.clear = and i32 %bf.load, 16777215
  %bf.set = or i32 %bf.clear, 0
  store i32 %bf.set, ptr @s, align 8
  %bf.load1 = load i32, ptr @s, align 8
  %bf.clear2 = and i32 %bf.load1, -16777216
  %bf.set3 = or i32 %bf.clear2, 15584051
  store i32 %bf.set3, ptr @s, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  call void @foo() #2
  %bf.load = load i32, ptr @s, align 8
  %bf.ashr = ashr i32 %bf.load, 24
  %bf.cast = trunc i32 %bf.ashr to i8
  %conv = sext i8 %bf.cast to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() #3
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noreturn nounwind "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin "no-builtins" }
attributes #3 = { nobuiltin noreturn nounwind "no-builtins" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
