; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\011_0243cbd68bc2d3ab\B0.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr79121.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none)
define dso_local range(i64 -34359738368, 34359738353) i64 @f1(i32 noundef %x) local_unnamed_addr #0 {
entry:
  %conv = sext i32 %x to i64
  %shl = shl nsw i64 %conv, 4
  ret i64 %shl
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none)
define dso_local range(i64 0, 68719476721) i64 @f2(i32 noundef %x) local_unnamed_addr #0 {
entry:
  %conv = zext i32 %x to i64
  %shl = shl nuw nsw i64 %conv, 4
  ret i64 %shl
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none)
define dso_local range(i64 0, 68719476721) i64 @f3(i32 noundef %x) local_unnamed_addr #0 {
entry:
  %conv = zext i32 %x to i64
  %shl = shl nuw nsw i64 %conv, 4
  ret i64 %shl
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none)
define dso_local range(i64 -34359738368, 34359738353) i64 @f4(i32 noundef %x) local_unnamed_addr #0 {
entry:
  %conv = sext i32 %x to i64
  %shl = shl nsw i64 %conv, 4
  ret i64 %shl
}

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #1 {
entry:
  %call = tail call i64 @f1(i32 noundef -268435456) #3
  %cmp.not = icmp eq i64 %call, -4294967296
  br i1 %cmp.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() #4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call1 = tail call i64 @f2(i32 noundef -268435456) #3
  %cmp2.not = icmp eq i64 %call1, 64424509440
  br i1 %cmp2.not, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @abort() #4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %call5 = tail call i64 @f3(i32 noundef -268435456) #3
  %cmp6.not = icmp eq i64 %call5, 64424509440
  br i1 %cmp6.not, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end4
  tail call void @abort() #4
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end4
  %call9 = tail call i64 @f4(i32 noundef -268435456) #3
  %cmp10.not = icmp eq i64 %call9, -4294967296
  br i1 %cmp10.not, label %if.end12, label %if.then11

if.then11:                                        ; preds = %if.end8
  tail call void @abort() #4
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end8
  ret i32 0
}

declare void @abort() local_unnamed_addr #2

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin "no-builtins" }
attributes #4 = { nobuiltin nounwind "no-builtins" }

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
