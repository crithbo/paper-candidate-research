; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\091_104df37f7b699ccb\WL.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr54985.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.st = type { i32 }

@__const.main._1 = private unnamed_addr constant [2 x %struct.st] [%struct.st { i32 2 }, %struct.st { i32 1 }], align 4

; Function Attrs: noinline nounwind optnone
define dso_local i32 @foo(ptr noundef %s, i32 noundef %c) #0 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca ptr, align 8
  %c.addr = alloca i32, align 4
  %first = alloca i32, align 4
  %count = alloca i32, align 4
  %item = alloca ptr, align 8
  %a = alloca i32, align 4
  %x = alloca i32, align 4
  store ptr %s, ptr %s.addr, align 8
  store i32 %c, ptr %c.addr, align 4
  store i32 1, ptr %first, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %count, align 4
  %1 = load ptr, ptr %s.addr, align 8
  store ptr %1, ptr %item, align 8
  %2 = load ptr, ptr %s.addr, align 8
  %a1 = getelementptr inbounds nuw %struct.st, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %a1, align 4
  store i32 %3, ptr %a, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end5, %entry
  %4 = load i32, ptr %count, align 4
  %dec = add nsw i32 %4, -1
  store i32 %dec, ptr %count, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %5 = load ptr, ptr %item, align 8
  %a2 = getelementptr inbounds nuw %struct.st, ptr %5, i32 0, i32 0
  %6 = load i32, ptr %a2, align 4
  store i32 %6, ptr %x, align 4
  %7 = load i32, ptr %first, align 4
  %tobool3 = icmp ne i32 %7, 0
  br i1 %tobool3, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  store i32 0, ptr %first, align 4
  br label %if.end5

if.else:                                          ; preds = %while.body
  %8 = load i32, ptr %x, align 4
  %9 = load i32, ptr %a, align 4
  %cmp = icmp sge i32 %8, %9
  br i1 %cmp, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.else
  store i32 1, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then
  %10 = load i32, ptr %x, align 4
  store i32 %10, ptr %a, align 4
  %11 = load ptr, ptr %item, align 8
  %incdec.ptr = getelementptr inbounds nuw %struct.st, ptr %11, i32 1
  store ptr %incdec.ptr, ptr %item, align 8
  br label %while.cond, !llvm.loop !5

while.end:                                        ; preds = %while.cond
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then4
  %12 = load i32, ptr %retval, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %_1 = alloca [2 x %struct.st], align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %_1, ptr align 4 @__const.main._1, i64 8, i1 false)
  %arraydecay = getelementptr inbounds [2 x %struct.st], ptr %_1, i64 0, i64 0
  %call = call i32 @foo(ptr noundef %arraydecay, i32 noundef 2) #3
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() #3
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #1

declare void @abort() #2

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin "no-builtins" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
