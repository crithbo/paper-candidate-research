; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\003_00d9c5061f2bf566\B1.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20070212-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.f = type { i32 }

; Function Attrs: noinline nounwind optnone
define dso_local i32 @g(i32 noundef %i, i32 noundef %c, ptr noundef %ff, ptr noundef %p) #0 {
entry:
  %i.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %ff.addr = alloca ptr, align 8
  %p.addr = alloca ptr, align 8
  %t = alloca ptr, align 8
  store i32 %i, ptr %i.addr, align 4
  store i32 %c, ptr %c.addr, align 4
  store ptr %ff, ptr %ff.addr, align 8
  store ptr %p, ptr %p.addr, align 8
  %0 = load i32, ptr %c.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store ptr %i.addr, ptr %t, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %1 = load ptr, ptr %ff.addr, align 8
  %i1 = getelementptr inbounds nuw %struct.f, ptr %1, i32 0, i32 0
  store ptr %i1, ptr %t, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load ptr, ptr %p.addr, align 8
  store i32 0, ptr %2, align 4
  %3 = load ptr, ptr %t, align 8
  %4 = load i32, ptr %3, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %f = alloca %struct.f, align 4
  %i = getelementptr inbounds nuw %struct.f, ptr %f, i32 0, i32 0
  store i32 1, ptr %i, align 4
  %i1 = getelementptr inbounds nuw %struct.f, ptr %f, i32 0, i32 0
  %call = call i32 @g(i32 noundef 5, i32 noundef 0, ptr noundef %f, ptr noundef %i1) #2
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() #2
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
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
