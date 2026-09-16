; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\096_10f901ed36e0de3e\WL.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20101013-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %ret = alloca ptr, align 8
  %call = call ptr @build_ref_for_offset(ptr noundef null, i64 noundef 32) #2
  store ptr %call, ptr %ret, align 8
  %0 = load ptr, ptr %ret, align 8
  %cmp = icmp ne ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() #2
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

; Function Attrs: noinline nounwind optnone
define internal ptr @build_ref_for_offset(ptr noundef %base, i64 noundef %offset) #0 {
entry:
  %base.addr = alloca ptr, align 8
  %offset.addr = alloca i64, align 8
  %base_offset = alloca i64, align 8
  store ptr %base, ptr %base.addr, align 8
  store i64 %offset, ptr %offset.addr, align 8
  %0 = load ptr, ptr %base.addr, align 8
  %call = call ptr @get_addr_base_and_unit_offset(ptr noundef %0, ptr noundef %base_offset) #2
  store ptr %call, ptr %base.addr, align 8
  %1 = load ptr, ptr %base.addr, align 8
  %2 = load i64, ptr %base_offset, align 8
  %3 = load i64, ptr %offset.addr, align 8
  %div = sdiv i64 %3, 8
  %add = add nsw i64 %2, %div
  %call1 = call ptr @build_int_cst(ptr noundef %1, i64 noundef %add) #2
  ret ptr %call1
}

declare void @abort() #1

; Function Attrs: noinline nounwind optnone
define internal ptr @get_addr_base_and_unit_offset(ptr noundef %base, ptr noundef %i) #0 {
entry:
  %base.addr = alloca ptr, align 8
  %i.addr = alloca ptr, align 8
  store ptr %base, ptr %base.addr, align 8
  store ptr %i, ptr %i.addr, align 8
  %0 = load ptr, ptr %i.addr, align 8
  store i64 0, ptr %0, align 8
  %1 = load ptr, ptr %base.addr, align 8
  ret ptr %1
}

; Function Attrs: noinline nounwind optnone
define internal ptr @build_int_cst(ptr noundef %base, i64 noundef %offset) #0 {
entry:
  %base.addr = alloca ptr, align 8
  %offset.addr = alloca i64, align 8
  store ptr %base, ptr %base.addr, align 8
  store i64 %offset, ptr %offset.addr, align 8
  %0 = load i64, ptr %offset.addr, align 8
  %cmp = icmp ne i64 %0, 4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() #2
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load ptr, ptr %base.addr, align 8
  ret ptr %1
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
