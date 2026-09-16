; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\019_02d5e112807ae38e\B1.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr28778.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind
define dso_local void @find(ptr noundef readonly captures(address_is_null) %alistp) local_unnamed_addr #0 {
entry:
  %tobool.not = icmp eq ptr %alistp, null
  br i1 %tobool.not, label %aglChoosePixelFormat.exit, label %if.end

if.end:                                           ; preds = %entry
  %blist.0.sroa.gep2 = getelementptr inbounds nuw i8, ptr %alistp, i64 12
  %.pr = load i32, ptr %blist.0.sroa.gep2, align 4, !tbaa !4
  %cmp.not.i = icmp eq i32 %.pr, 42
  br i1 %cmp.not.i, label %aglChoosePixelFormat.exit, label %if.then.i

if.then.i:                                        ; preds = %if.end
  tail call void @abort() #3
  br label %aglChoosePixelFormat.exit

aglChoosePixelFormat.exit:                        ; preds = %entry, %if.end, %if.then.i
  ret void
}

; Function Attrs: nounwind
define dso_local void @aglChoosePixelFormat(ptr noundef readonly captures(none) %a) local_unnamed_addr #0 {
entry:
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i64 12
  %0 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %cmp.not = icmp eq i32 %0, 42
  br i1 %cmp.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() #3
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare void @abort() local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @main() local_unnamed_addr #2 {
entry:
  ret i32 0
}

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
