; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\049_088317ca9297b68e\B1.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr36339.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @try_a(i64 noundef %x) #0 {
entry:
  %x.addr = alloca i64, align 8
  %heap = alloca [2 x i64], align 16
  %hp = alloca ptr, align 8
  store i64 %x, ptr %x.addr, align 8
  %arraydecay = getelementptr inbounds [2 x i64], ptr %heap, i64 0, i64 0
  store ptr %arraydecay, ptr %hp, align 8
  %0 = load i64, ptr %x.addr, align 8
  %1 = load ptr, ptr %hp, align 8
  %arrayidx = getelementptr inbounds i64, ptr %1, i64 0
  store i64 %0, ptr %arrayidx, align 8
  %2 = load ptr, ptr %hp, align 8
  %arrayidx1 = getelementptr inbounds i64, ptr %2, i64 1
  store i64 0, ptr %arrayidx1, align 8
  %3 = load ptr, ptr %hp, align 8
  %add.ptr = getelementptr inbounds i8, ptr %3, i64 1
  %4 = ptrtoint ptr %add.ptr to i64
  %call = call i32 @check_a(i64 noundef %4) #2
  ret i32 %call
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @check_a(i64 noundef %tagged_ptr) #0 {
entry:
  %retval = alloca i32, align 4
  %tagged_ptr.addr = alloca i64, align 8
  %hp = alloca ptr, align 8
  store i64 %tagged_ptr, ptr %tagged_ptr.addr, align 8
  %0 = load i64, ptr %tagged_ptr.addr, align 8
  %1 = inttoptr i64 %0 to ptr
  %add.ptr = getelementptr inbounds i8, ptr %1, i64 -1
  store ptr %add.ptr, ptr %hp, align 8
  %2 = load ptr, ptr %hp, align 8
  %arrayidx = getelementptr inbounds i64, ptr %2, i64 0
  %3 = load i64, ptr %arrayidx, align 8
  %cmp = icmp eq i64 %3, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %4 = load ptr, ptr %hp, align 8
  %arrayidx1 = getelementptr inbounds i64, ptr %4, i64 1
  %5 = load i64, ptr %arrayidx1, align 8
  %cmp2 = icmp eq i64 %5, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  store i32 -1, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %6 = load i32, ptr %retval, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @try_a(i64 noundef 42) #2
  %cmp = icmp slt i32 %call, 0
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
