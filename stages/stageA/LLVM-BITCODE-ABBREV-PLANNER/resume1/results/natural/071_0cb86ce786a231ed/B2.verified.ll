; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\071_0cb86ce786a231ed\B2.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr55750.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i8, [3 x i8] }

@arr = dso_local global [2 x %struct.S] zeroinitializer, align 4

; Function Attrs: noinline nounwind optnone
define dso_local void @foo(i32 noundef %i) #0 {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  %0 = load i32, ptr %i.addr, align 4
  %idxprom = zext i32 %0 to i64
  %arrayidx = getelementptr inbounds nuw [2 x %struct.S], ptr @arr, i64 0, i64 %idxprom
  %bf.load = load i8, ptr %arrayidx, align 4
  %bf.ashr = ashr i8 %bf.load, 1
  %bf.cast = sext i8 %bf.ashr to i32
  %inc = add nsw i32 %bf.cast, 1
  %1 = trunc i32 %inc to i8
  %bf.load1 = load i8, ptr %arrayidx, align 4
  %bf.value = and i8 %1, 127
  %bf.shl = shl i8 %bf.value, 1
  %bf.clear = and i8 %bf.load1, 1
  %bf.set = or i8 %bf.clear, %bf.shl
  store i8 %bf.set, ptr %arrayidx, align 4
  %bf.result.shl = shl i8 %bf.value, 1
  %bf.result.ashr = ashr i8 %bf.result.shl, 1
  %bf.result.cast = sext i8 %bf.result.ashr to i32
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %bf.load = load i8, ptr @arr, align 4
  %bf.clear = and i8 %bf.load, -2
  %bf.set = or i8 %bf.clear, 1
  store i8 %bf.set, ptr @arr, align 4
  %bf.load1 = load i8, ptr @arr, align 4
  %bf.clear2 = and i8 %bf.load1, 1
  %bf.set3 = or i8 %bf.clear2, 126
  store i8 %bf.set3, ptr @arr, align 4
  %bf.load4 = load i8, ptr getelementptr inbounds ([2 x %struct.S], ptr @arr, i64 0, i64 1), align 4
  %bf.clear5 = and i8 %bf.load4, -2
  %bf.set6 = or i8 %bf.clear5, 0
  store i8 %bf.set6, ptr getelementptr inbounds ([2 x %struct.S], ptr @arr, i64 0, i64 1), align 4
  %bf.load7 = load i8, ptr getelementptr inbounds ([2 x %struct.S], ptr @arr, i64 0, i64 1), align 4
  %bf.clear8 = and i8 %bf.load7, 1
  %bf.set9 = or i8 %bf.clear8, -2
  store i8 %bf.set9, ptr getelementptr inbounds ([2 x %struct.S], ptr @arr, i64 0, i64 1), align 4
  call void @foo(i32 noundef 0) #2
  call void @foo(i32 noundef 1) #2
  %bf.load10 = load i8, ptr @arr, align 4
  %bf.shl = shl i8 %bf.load10, 7
  %bf.ashr = ashr i8 %bf.shl, 7
  %bf.cast = sext i8 %bf.ashr to i32
  %cmp = icmp ne i32 %bf.cast, -1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %bf.load11 = load i8, ptr @arr, align 4
  %bf.ashr12 = ashr i8 %bf.load11, 1
  %bf.cast13 = sext i8 %bf.ashr12 to i32
  %cmp14 = icmp ne i32 %bf.cast13, -64
  br i1 %cmp14, label %if.then, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %lor.lhs.false
  %bf.load16 = load i8, ptr getelementptr inbounds ([2 x %struct.S], ptr @arr, i64 0, i64 1), align 4
  %bf.shl17 = shl i8 %bf.load16, 7
  %bf.ashr18 = ashr i8 %bf.shl17, 7
  %bf.cast19 = sext i8 %bf.ashr18 to i32
  %cmp20 = icmp ne i32 %bf.cast19, 0
  br i1 %cmp20, label %if.then, label %lor.lhs.false21

lor.lhs.false21:                                  ; preds = %lor.lhs.false15
  %bf.load22 = load i8, ptr getelementptr inbounds ([2 x %struct.S], ptr @arr, i64 0, i64 1), align 4
  %bf.ashr23 = ashr i8 %bf.load22, 1
  %bf.cast24 = sext i8 %bf.ashr23 to i32
  %cmp25 = icmp ne i32 %bf.cast24, 0
  br i1 %cmp25, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false21, %lor.lhs.false15, %lor.lhs.false, %entry
  call void @abort() #2
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false21
  ret i32 0
}

declare void @abort() #1

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
