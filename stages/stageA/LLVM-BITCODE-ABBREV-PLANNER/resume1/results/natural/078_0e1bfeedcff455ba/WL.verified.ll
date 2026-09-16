; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\078_0e1bfeedcff455ba\WL.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20140212-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@d = dso_local local_unnamed_addr global i32 1, align 4
@f = dso_local local_unnamed_addr global i32 1, align 4
@e = dso_local local_unnamed_addr global i32 0, align 4
@c = dso_local local_unnamed_addr global i32 0, align 4
@a = dso_local local_unnamed_addr global i32 0, align 4
@b = dso_local local_unnamed_addr global i32 0, align 4
@k = dso_local local_unnamed_addr global i32 0, align 4
@j = dso_local local_unnamed_addr global i8 0, align 1
@g = dso_local local_unnamed_addr global i8 0, align 1
@i = dso_local local_unnamed_addr global i32 0, align 4
@h = dso_local local_unnamed_addr global i32 0, align 4

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @fn1() local_unnamed_addr #0 {
entry:
  store i32 0, ptr @e, align 4, !tbaa !4
  store i32 0, ptr @c, align 4, !tbaa !4
  %0 = load i32, ptr @a, align 4, !tbaa !4
  %tobool = icmp ne i32 %0, 0
  %1 = load i32, ptr @b, align 4
  %tobool1 = icmp ne i32 %1, 0
  %2 = select i1 %tobool, i1 %tobool1, i1 false
  %land.ext = zext i1 %2 to i32
  store i32 %land.ext, ptr @k, align 4, !tbaa !4
  %conv = select i1 %2, i8 54, i8 0
  store i8 %conv, ptr @j, align 1, !tbaa !8
  %mul3 = mul i8 %conv, -109
  store i8 %mul3, ptr @g, align 1, !tbaa !8
  %3 = load i32, ptr @d, align 4, !tbaa !4
  %tobool12.not = icmp eq i32 %3, 0
  %4 = load i32, ptr @f, align 4, !tbaa !4
  %tobool16.not = icmp eq i32 %4, 0
  br label %for.cond

for.cond:                                         ; preds = %if.end, %entry
  br i1 %tobool12.not, label %if.else, label %if.then

if.then:                                          ; preds = %for.cond
  store i32 1, ptr @c, align 4, !tbaa !4
  br label %if.end

if.else:                                          ; preds = %for.cond
  store i32 9, ptr @i, align 4, !tbaa !4
  store i32 9, ptr @h, align 4, !tbaa !4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br i1 %tobool16.not, label %for.cond, label %if.then17

if.then17:                                        ; preds = %if.end
  ret void
}

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #1 {
entry:
  store i32 0, ptr @e, align 4, !tbaa !4
  store i32 0, ptr @c, align 4, !tbaa !4
  %0 = load i32, ptr @a, align 4, !tbaa !4
  %tobool.i = icmp ne i32 %0, 0
  %1 = load i32, ptr @b, align 4
  %tobool1.i = icmp ne i32 %1, 0
  %2 = select i1 %tobool.i, i1 %tobool1.i, i1 false
  %land.ext.i = zext i1 %2 to i32
  store i32 %land.ext.i, ptr @k, align 4, !tbaa !4
  %conv.i = select i1 %2, i8 54, i8 0
  store i8 %conv.i, ptr @j, align 1, !tbaa !8
  %mul3.i = mul i8 %conv.i, -109
  store i8 %mul3.i, ptr @g, align 1, !tbaa !8
  %3 = load i32, ptr @d, align 4, !tbaa !4
  %tobool12.not.i = icmp eq i32 %3, 0
  %4 = load i32, ptr @f, align 4, !tbaa !4
  %tobool16.not.i = icmp eq i32 %4, 0
  br label %for.cond.i.outer

for.cond.i.outer:                                 ; preds = %if.end.i.thread, %entry
  %cmp.not.not = phi i1 [ false, %if.end.i.thread ], [ true, %entry ]
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.i.outer, %if.end.i
  br i1 %tobool12.not.i, label %if.end.i, label %if.end.i.thread

if.end.i:                                         ; preds = %for.cond.i
  store i32 9, ptr @i, align 4, !tbaa !4
  store i32 9, ptr @h, align 4, !tbaa !4
  br i1 %tobool16.not.i, label %for.cond.i, label %fn1.exit

if.end.i.thread:                                  ; preds = %for.cond.i
  store i32 1, ptr @c, align 4, !tbaa !4
  br i1 %tobool16.not.i, label %for.cond.i.outer, label %if.end

fn1.exit:                                         ; preds = %if.end.i
  br i1 %cmp.not.not, label %if.then, label %if.end

if.then:                                          ; preds = %fn1.exit
  tail call void @abort() #3
  br label %if.end

if.end:                                           ; preds = %if.end.i.thread, %if.then, %fn1.exit
  ret i32 0
}

declare void @abort() local_unnamed_addr #2

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind "no-builtins" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}
!llvm.errno.tbaa = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
