; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\061_0aab372fadf7ee4b\WL.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\strncat-lib.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@inside_main = external local_unnamed_addr global i32, align 4

; Function Attrs: noinline nounwind
define dso_local noundef ptr @strncat(ptr noundef returned captures(ret: address, provenance) %s1, ptr noundef readonly captures(none) %s2, i64 noundef %n) local_unnamed_addr #0 {
entry:
  %0 = load i32, ptr @inside_main, align 4, !tbaa !4
  %tobool.not = icmp eq i32 %0, 0
  br i1 %tobool.not, label %while.cond.preheader, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() #2
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %if.then, %entry
  br label %while.cond

while.cond:                                       ; preds = %while.cond.preheader, %while.cond
  %s1.addr.0 = phi ptr [ %incdec.ptr, %while.cond ], [ %s1, %while.cond.preheader ]
  %1 = load i8, ptr %s1.addr.0, align 1, !tbaa !8
  %tobool1.not = icmp eq i8 %1, 0
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %s1.addr.0, i64 1
  br i1 %tobool1.not, label %while.cond2.preheader, label %while.cond, !llvm.loop !9

while.cond2.preheader:                            ; preds = %while.cond
  %cmp.not27 = icmp eq i64 %n, 0
  br i1 %cmp.not27, label %cleanup, label %while.body3

while.body3:                                      ; preds = %while.cond2.preheader, %if.end9
  %n.addr.030 = phi i64 [ %dec, %if.end9 ], [ %n, %while.cond2.preheader ]
  %s2.addr.029 = phi ptr [ %incdec.ptr4, %if.end9 ], [ %s2, %while.cond2.preheader ]
  %s1.addr.128 = phi ptr [ %incdec.ptr5, %if.end9 ], [ %s1.addr.0, %while.cond2.preheader ]
  %2 = load i8, ptr %s2.addr.029, align 1, !tbaa !8
  store i8 %2, ptr %s1.addr.128, align 1, !tbaa !8
  %cmp6 = icmp eq i8 %2, 0
  br i1 %cmp6, label %cleanup, label %if.end9

if.end9:                                          ; preds = %while.body3
  %incdec.ptr5 = getelementptr inbounds nuw i8, ptr %s1.addr.128, i64 1
  %incdec.ptr4 = getelementptr inbounds nuw i8, ptr %s2.addr.029, i64 1
  %dec = add i64 %n.addr.030, -1
  %cmp.not = icmp eq i64 %dec, 0
  br i1 %cmp.not, label %if.then14, label %while.body3, !llvm.loop !11

if.then14:                                        ; preds = %if.end9
  store i8 0, ptr %incdec.ptr5, align 1, !tbaa !8
  br label %cleanup

cleanup:                                          ; preds = %while.body3, %while.cond2.preheader, %if.then14
  ret ptr %s1
}

declare void @abort() local_unnamed_addr #1

attributes #0 = { noinline nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind "no-builtins" }

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
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
