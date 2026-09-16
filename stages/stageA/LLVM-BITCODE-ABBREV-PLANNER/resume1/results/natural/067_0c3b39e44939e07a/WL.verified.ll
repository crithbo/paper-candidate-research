; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\067_0c3b39e44939e07a\WL.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20021118-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.f = private unnamed_addr constant [3 x float] [float 2.000000e+00, float 3.000000e+00, float 4.000000e+00], align 4

; Function Attrs: noinline nounwind optnone
define dso_local i32 @t1(ptr noundef %f, i32 noundef %i, ptr noundef %f1, ptr noundef %f2) #0 {
entry:
  %retval = alloca i32, align 4
  %f.addr = alloca ptr, align 8
  %i.addr = alloca i32, align 4
  %f1.addr = alloca ptr, align 8
  %f2.addr = alloca ptr, align 8
  store ptr %f, ptr %f.addr, align 8
  store i32 %i, ptr %i.addr, align 4
  store ptr %f1, ptr %f1.addr, align 8
  store ptr %f2, ptr %f2.addr, align 8
  %0 = load ptr, ptr %f1.addr, align 8
  call void %0(double noundef 3.000000e+00) #3
  %1 = load ptr, ptr %f.addr, align 8
  %2 = load i32, ptr %i.addr, align 4
  %add = add nsw i32 %2, 1
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds float, ptr %1, i64 %idxprom
  %3 = load float, ptr %arrayidx, align 4
  %4 = load ptr, ptr %f.addr, align 8
  %5 = load i32, ptr %i.addr, align 4
  %idxprom1 = sext i32 %5 to i64
  %arrayidx2 = getelementptr inbounds float, ptr %4, i64 %idxprom1
  store float %3, ptr %arrayidx2, align 4
  %6 = load ptr, ptr %f2.addr, align 8
  call void %6(float noundef 2.500000e+00, float noundef 3.500000e+00) #3
  %7 = load i32, ptr %retval, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @t2(ptr noundef %f, i32 noundef %i, ptr noundef %f1, ptr noundef %f2, ptr noundef %f3) #0 {
entry:
  %retval = alloca i32, align 4
  %f.addr = alloca ptr, align 8
  %i.addr = alloca i32, align 4
  %f1.addr = alloca ptr, align 8
  %f2.addr = alloca ptr, align 8
  %f3.addr = alloca ptr, align 8
  store ptr %f, ptr %f.addr, align 8
  store i32 %i, ptr %i.addr, align 4
  store ptr %f1, ptr %f1.addr, align 8
  store ptr %f2, ptr %f2.addr, align 8
  store ptr %f3, ptr %f3.addr, align 8
  %0 = load ptr, ptr %f3.addr, align 8
  call void %0(float noundef 6.000000e+00) #3
  %1 = load ptr, ptr %f1.addr, align 8
  call void %1(double noundef 3.000000e+00) #3
  %2 = load ptr, ptr %f.addr, align 8
  %3 = load i32, ptr %i.addr, align 4
  %add = add nsw i32 %3, 1
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds float, ptr %2, i64 %idxprom
  %4 = load float, ptr %arrayidx, align 4
  %5 = load ptr, ptr %f.addr, align 8
  %6 = load i32, ptr %i.addr, align 4
  %idxprom1 = sext i32 %6 to i64
  %arrayidx2 = getelementptr inbounds float, ptr %5, i64 %idxprom1
  store float %4, ptr %arrayidx2, align 4
  %7 = load ptr, ptr %f2.addr, align 8
  call void %7(float noundef 2.500000e+00, float noundef 3.500000e+00) #3
  %8 = load i32, ptr %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind optnone
define dso_local void @f1(double noundef %d) #0 {
entry:
  %d.addr = alloca double, align 8
  store double %d, ptr %d.addr, align 8
  %0 = load double, ptr %d.addr, align 8
  %cmp = fcmp une double %0, 3.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (...) @abort() #3
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare i32 @abort(...) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @f2(float noundef %f1, float noundef %f2) #0 {
entry:
  %f1.addr = alloca float, align 4
  %f2.addr = alloca float, align 4
  store float %f1, ptr %f1.addr, align 4
  store float %f2, ptr %f2.addr, align 4
  %0 = load float, ptr %f1.addr, align 4
  %cmp = fcmp une float %0, 2.500000e+00
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load float, ptr %f2.addr, align 4
  %cmp1 = fcmp une float %1, 3.500000e+00
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %call = call i32 (...) @abort() #3
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @f3(float noundef %f) #0 {
entry:
  %f.addr = alloca float, align 4
  store float %f, ptr %f.addr, align 4
  %0 = load float, ptr %f.addr, align 4
  %cmp = fcmp une float %0, 6.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (...) @abort() #3
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %f = alloca [3 x float], align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %f, ptr align 4 @__const.main.f, i64 12, i1 false)
  %arraydecay = getelementptr inbounds [3 x float], ptr %f, i64 0, i64 0
  %call = call i32 @t1(ptr noundef %arraydecay, i32 noundef 0, ptr noundef @f1, ptr noundef @f2) #3
  %arraydecay1 = getelementptr inbounds [3 x float], ptr %f, i64 0, i64 0
  %call2 = call i32 @t2(ptr noundef %arraydecay1, i32 noundef 1, ptr noundef @f1, ptr noundef @f2, ptr noundef @f3) #3
  %arrayidx = getelementptr inbounds [3 x float], ptr %f, i64 0, i64 0
  %0 = load float, ptr %arrayidx, align 4
  %cmp = fcmp une float %0, 3.000000e+00
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %arrayidx3 = getelementptr inbounds [3 x float], ptr %f, i64 0, i64 1
  %1 = load float, ptr %arrayidx3, align 4
  %cmp4 = fcmp une float %1, 4.000000e+00
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %call5 = call i32 (...) @abort() #3
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %call6 = call i32 (i32, ...) @exit(i32 noundef 0) #3
  %2 = load i32, ptr %retval, align 4
  ret i32 %2
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #2

declare i32 @exit(...) #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nobuiltin "no-builtins" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
