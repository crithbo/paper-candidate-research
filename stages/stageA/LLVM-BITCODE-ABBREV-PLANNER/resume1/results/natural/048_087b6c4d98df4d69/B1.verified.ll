; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\048_087b6c4d98df4d69\B1.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\ieee\\20010114-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@rintf.TWO23 = internal constant float 0x4160000000000000, align 4

; Function Attrs: noinline nounwind optnone
define dso_local float @rintf(float noundef %x) #0 {
entry:
  %x.addr = alloca float, align 4
  store float %x, ptr %x.addr, align 4
  %0 = load float, ptr %x.addr, align 4
  %conv = fpext float %0 to double
  %1 = call double @llvm.fabs.f64(double %conv)
  %cmp = fcmp olt double %1, 0x4160000000000000
  br i1 %cmp, label %if.then, label %if.end13

if.then:                                          ; preds = %entry
  %2 = load float, ptr %x.addr, align 4
  %conv2 = fpext float %2 to double
  %cmp3 = fcmp ogt double %conv2, 0.000000e+00
  br i1 %cmp3, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.then
  %3 = load float, ptr %x.addr, align 4
  %add = fadd float %3, 0x4160000000000000
  store float %add, ptr %x.addr, align 4
  %4 = load float, ptr %x.addr, align 4
  %sub = fsub float %4, 0x4160000000000000
  store float %sub, ptr %x.addr, align 4
  br label %if.end12

if.else:                                          ; preds = %if.then
  %5 = load float, ptr %x.addr, align 4
  %conv6 = fpext float %5 to double
  %cmp7 = fcmp olt double %conv6, 0.000000e+00
  br i1 %cmp7, label %if.then9, label %if.end

if.then9:                                         ; preds = %if.else
  %6 = load float, ptr %x.addr, align 4
  %sub10 = fsub float 0x4160000000000000, %6
  store float %sub10, ptr %x.addr, align 4
  %7 = load float, ptr %x.addr, align 4
  %sub11 = fsub float %7, 0x4160000000000000
  %fneg = fneg float %sub11
  store float %fneg, ptr %x.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then9, %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end, %if.then5
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %entry
  %8 = load float, ptr %x.addr, align 4
  ret float %8
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %call = call float @rintf(float noundef -1.500000e+00) #3
  %conv = fpext float %call to double
  %cmp = fcmp une double %conv, -2.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() #3
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @exit(i32 noundef 0) #3
  %0 = load i32, ptr %retval, align 4
  ret i32 %0
}

declare void @abort() #2

declare void @exit(i32 noundef) #2

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin "no-builtins" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
