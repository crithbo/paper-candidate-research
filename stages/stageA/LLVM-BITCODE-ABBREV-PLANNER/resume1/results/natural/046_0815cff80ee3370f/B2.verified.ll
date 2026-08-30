; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\046_0815cff80ee3370f\B2.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr85582-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@d = dso_local global i32 2, align 4
@c = dso_local global i64 1, align 8
@e = dso_local global i32 0, align 4
@a = dso_local global i32 0, align 4
@b = dso_local global i32 0, align 4

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %g = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 6, ptr %g, align 4
  br label %L1

L1:                                               ; preds = %if.then, %entry
  %0 = load i32, ptr @d, align 4
  store i32 %0, ptr @e, align 4
  %1 = load i32, ptr @a, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %L1
  br label %L1

if.end:                                           ; preds = %L1
  %2 = load i32, ptr %g, align 4
  %dec = add nsw i32 %2, -1
  store i32 %dec, ptr %g, align 4
  %3 = load i64, ptr @c, align 8
  %4 = load i32, ptr @e, align 4
  %not = xor i32 %4, -1
  %5 = load i32, ptr %g, align 4
  %not1 = xor i32 %5, -1
  %or = or i32 %not, %not1
  %not2 = xor i32 %or, -1
  %sh_prom = zext i32 %not2 to i64
  %shr = ashr i64 %3, %sh_prom
  %conv = trunc i64 %shr to i32
  store i32 %conv, ptr %i, align 4
  br label %L2

L2:                                               ; preds = %if.then6, %if.end
  %6 = load i32, ptr @b, align 4
  %conv3 = sext i32 %6 to i64
  %7 = load i64, ptr @c, align 8
  %rem = srem i64 %conv3, %7
  %8 = load i32, ptr %i, align 4
  %conv4 = sext i32 %8 to i64
  %mul = mul nsw i64 %rem, %conv4
  store i64 %mul, ptr @c, align 8
  %9 = load i32, ptr @e, align 4
  %tobool5 = icmp ne i32 %9, 0
  br i1 %tobool5, label %if.end7, label %if.then6

if.then6:                                         ; preds = %L2
  br label %L2

if.end7:                                          ; preds = %L2
  ret i32 0
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
