; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\068_0c3dfcce5e821b57\B1.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20080424-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@bar.i = internal global i32 0, align 4
@g = dso_local global [48 x [3 x [3 x i32]]] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone
define dso_local void @bar(ptr noundef %x, ptr noundef %y) #0 {
entry:
  %x.addr = alloca ptr, align 8
  %y.addr = alloca ptr, align 8
  store ptr %x, ptr %x.addr, align 8
  store ptr %y, ptr %y.addr, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %1 = load i32, ptr @bar.i, align 4
  %add = add nsw i32 %1, 8
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [48 x [3 x [3 x i32]]], ptr @g, i64 0, i64 %idxprom
  %arraydecay = getelementptr inbounds [3 x [3 x i32]], ptr %arrayidx, i64 0, i64 0
  %cmp = icmp ne ptr %0, %arraydecay
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load ptr, ptr %y.addr, align 8
  %3 = load i32, ptr @bar.i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, ptr @bar.i, align 4
  %idxprom1 = sext i32 %3 to i64
  %arrayidx2 = getelementptr inbounds [48 x [3 x [3 x i32]]], ptr @g, i64 0, i64 %idxprom1
  %arraydecay3 = getelementptr inbounds [3 x [3 x i32]], ptr %arrayidx2, i64 0, i64 0
  %cmp4 = icmp ne ptr %2, %arraydecay3
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() #2
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  ret void
}

declare void @abort() #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %x.addr.i = alloca ptr, align 8
  %i.i = alloca i32, align 4
  %k.i = alloca i32, align 4
  store ptr @g, ptr %x.addr.i, align 8
  store i32 0, ptr %i.i, align 4
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.body.i, %entry
  %0 = load i32, ptr %i.i, align 4
  %cmp.i = icmp slt i32 %0, 8
  br i1 %cmp.i, label %for.body.i, label %foo.exit

for.body.i:                                       ; preds = %for.cond.i
  %1 = load i32, ptr %i.i, align 4
  %add.i = add nsw i32 %1, 8
  store i32 %add.i, ptr %k.i, align 4
  %2 = load ptr, ptr %x.addr.i, align 8
  %3 = load i32, ptr %k.i, align 4
  %idxprom.i = sext i32 %3 to i64
  %arrayidx.i = getelementptr inbounds [3 x [3 x i32]], ptr %2, i64 %idxprom.i
  %4 = load ptr, ptr %x.addr.i, align 8
  %5 = load i32, ptr %k.i, align 4
  %sub.i = sub nsw i32 %5, 8
  %idxprom1.i = sext i32 %sub.i to i64
  %arrayidx2.i = getelementptr inbounds [3 x [3 x i32]], ptr %4, i64 %idxprom1.i
  call void @bar(ptr noundef %arrayidx.i, ptr noundef %arrayidx2.i) #2
  %6 = load i32, ptr %i.i, align 4
  %inc.i = add nsw i32 %6, 1
  store i32 %inc.i, ptr %i.i, align 4
  br label %for.cond.i, !llvm.loop !5

foo.exit:                                         ; preds = %for.cond.i
  ret i32 0
}

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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
