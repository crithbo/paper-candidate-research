; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\026_044d5fb8de245116\WL.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr56051.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.x2 = private unnamed_addr constant [1 x i64] [i64 8589934592], align 8
@__const.main.x3 = private unnamed_addr constant [1 x i64] [i64 8589934592], align 8

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %x1 = alloca [1 x i8], align 1
  %s1 = alloca i32, align 4
  %a1 = alloca i32, align 4
  %y1 = alloca i8, align 1
  %b1 = alloca i32, align 4
  %x2 = alloca [1 x i64], align 8
  %s2 = alloca i32, align 4
  %a2 = alloca i32, align 4
  %y2 = alloca i64, align 8
  %b2 = alloca i32, align 4
  %x3 = alloca [1 x i64], align 8
  %s3 = alloca i32, align 4
  %a3 = alloca i32, align 4
  %y3 = alloca i64, align 8
  %b3 = alloca i32, align 4
  call void @llvm.memset.p0.i64(ptr align 1 %x1, i8 0, i64 1, i1 false)
  store i32 8, ptr %s1, align 4
  %arrayidx = getelementptr inbounds [1 x i8], ptr %x1, i64 0, i64 0
  %0 = load i8, ptr %arrayidx, align 1
  %conv = zext i8 %0 to i32
  %1 = load i32, ptr %s1, align 4
  %shl = shl i32 1, %1
  %conv1 = trunc i32 %shl to i8
  %conv2 = zext i8 %conv1 to i32
  %cmp = icmp slt i32 %conv, %conv2
  %conv3 = zext i1 %cmp to i32
  store i32 %conv3, ptr %a1, align 4
  %2 = load i32, ptr %s1, align 4
  %shl4 = shl i32 1, %2
  %conv5 = trunc i32 %shl4 to i8
  store i8 %conv5, ptr %y1, align 1
  %arrayidx6 = getelementptr inbounds [1 x i8], ptr %x1, i64 0, i64 0
  %3 = load i8, ptr %arrayidx6, align 1
  %conv7 = zext i8 %3 to i32
  %4 = load i8, ptr %y1, align 1
  %conv8 = zext i8 %4 to i32
  %cmp9 = icmp slt i32 %conv7, %conv8
  %conv10 = zext i1 %cmp9 to i32
  store i32 %conv10, ptr %b1, align 4
  %5 = load i32, ptr %a1, align 4
  %6 = load i32, ptr %b1, align 4
  %cmp11 = icmp ne i32 %5, %6
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() #4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %x2, ptr align 8 @__const.main.x2, i64 8, i1 false)
  store i32 31, ptr %s2, align 4
  %arrayidx13 = getelementptr inbounds [1 x i64], ptr %x2, i64 0, i64 0
  %7 = load i64, ptr %arrayidx13, align 8
  %8 = load i32, ptr %s2, align 4
  %shl14 = shl i32 1, %8
  %conv15 = sext i32 %shl14 to i64
  %cmp16 = icmp uge i64 %7, %conv15
  %conv17 = zext i1 %cmp16 to i32
  store i32 %conv17, ptr %a2, align 4
  %9 = load i32, ptr %s2, align 4
  %shl18 = shl i32 1, %9
  %conv19 = sext i32 %shl18 to i64
  store i64 %conv19, ptr %y2, align 8
  %arrayidx20 = getelementptr inbounds [1 x i64], ptr %x2, i64 0, i64 0
  %10 = load i64, ptr %arrayidx20, align 8
  %11 = load i64, ptr %y2, align 8
  %cmp21 = icmp uge i64 %10, %11
  %conv22 = zext i1 %cmp21 to i32
  store i32 %conv22, ptr %b2, align 4
  %12 = load i32, ptr %a2, align 4
  %13 = load i32, ptr %b2, align 4
  %cmp23 = icmp ne i32 %12, %13
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end
  call void @abort() #4
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.end
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %x3, ptr align 8 @__const.main.x3, i64 8, i1 false)
  store i32 31, ptr %s3, align 4
  %arrayidx27 = getelementptr inbounds [1 x i64], ptr %x3, i64 0, i64 0
  %14 = load i64, ptr %arrayidx27, align 8
  %15 = load i32, ptr %s3, align 4
  %shl28 = shl i32 1, %15
  %conv29 = zext i32 %shl28 to i64
  %cmp30 = icmp uge i64 %14, %conv29
  %conv31 = zext i1 %cmp30 to i32
  store i32 %conv31, ptr %a3, align 4
  %16 = load i32, ptr %s3, align 4
  %shl32 = shl i32 1, %16
  %conv33 = zext i32 %shl32 to i64
  store i64 %conv33, ptr %y3, align 8
  %arrayidx34 = getelementptr inbounds [1 x i64], ptr %x3, i64 0, i64 0
  %17 = load i64, ptr %arrayidx34, align 8
  %18 = load i64, ptr %y3, align 8
  %cmp35 = icmp uge i64 %17, %18
  %conv36 = zext i1 %cmp35 to i32
  store i32 %conv36, ptr %b3, align 4
  %19 = load i32, ptr %a3, align 4
  %20 = load i32, ptr %b3, align 4
  %cmp37 = icmp ne i32 %19, %20
  br i1 %cmp37, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end26
  call void @abort() #4
  br label %if.end40

if.end40:                                         ; preds = %if.then39, %if.end26
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #1

declare void @abort() #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #3

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nobuiltin "no-builtins" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
