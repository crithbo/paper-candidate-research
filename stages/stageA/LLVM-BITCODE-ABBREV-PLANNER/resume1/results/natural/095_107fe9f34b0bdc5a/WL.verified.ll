; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\095_107fe9f34b0bdc5a\WL.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20000419-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type { i32, i32, i32 }

@__const.main.f = private unnamed_addr constant %struct.foo { i32 7, i32 8, i32 9 }, align 4

; Function Attrs: noinline nounwind optnone
define dso_local void @brother(i32 noundef %a, i32 noundef %b, i32 noundef %c) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %a, ptr %a.addr, align 4
  store i32 %b, ptr %b.addr, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %a.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (...) @abort() #3
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare i32 @abort(...) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @sister(i64 %f.coerce0, i32 %f.coerce1, i32 noundef %b, i32 noundef %c) #0 {
entry:
  %f = alloca %struct.foo, align 4
  %coerce = alloca { i64, i32 }, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %0 = getelementptr inbounds nuw { i64, i32 }, ptr %coerce, i32 0, i32 0
  store i64 %f.coerce0, ptr %0, align 4
  %1 = getelementptr inbounds nuw { i64, i32 }, ptr %coerce, i32 0, i32 1
  store i32 %f.coerce1, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %f, ptr align 4 %coerce, i64 12, i1 false)
  store i32 %b, ptr %b.addr, align 4
  store i32 %c, ptr %c.addr, align 4
  %b1 = getelementptr inbounds nuw %struct.foo, ptr %f, i32 0, i32 1
  %2 = load i32, ptr %b1, align 4
  %3 = load i32, ptr %b.addr, align 4
  %cmp = icmp eq i32 %2, %3
  %conv = zext i1 %cmp to i32
  %4 = load i32, ptr %b.addr, align 4
  %5 = load i32, ptr %c.addr, align 4
  call void @brother(i32 noundef %conv, i32 noundef %4, i32 noundef %5) #3
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %f = alloca %struct.foo, align 4
  %f.coerce = alloca { i64, i32 }, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %f, ptr align 4 @__const.main.f, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %f.coerce, ptr align 4 %f, i64 12, i1 false)
  %0 = getelementptr inbounds nuw { i64, i32 }, ptr %f.coerce, i32 0, i32 0
  %1 = load i64, ptr %0, align 4
  %2 = getelementptr inbounds nuw { i64, i32 }, ptr %f.coerce, i32 0, i32 1
  %3 = load i32, ptr %2, align 4
  call void @sister(i64 %1, i32 %3, i32 noundef 1, i32 noundef 2) #3
  %call = call i32 (i32, ...) @exit(i32 noundef 0) #3
  %4 = load i32, ptr %retval, align 4
  ret i32 %4
}

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
