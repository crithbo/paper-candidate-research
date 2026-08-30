; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\081_0ee32169757b64e3\B1.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20021024-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@cp = dso_local local_unnamed_addr global ptr null, align 8
@m = dso_local local_unnamed_addr global i64 0, align 8

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local void @foo() local_unnamed_addr #0 {
entry:
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @bar(i32 noundef %rop, ptr noundef captures(none) %r) local_unnamed_addr #1 {
entry:
  %shr = lshr i32 %rop, 23
  %shr1 = lshr i32 %rop, 9
  %and2 = and i32 %shr1, 511
  %and3 = and i32 %rop, 511
  %0 = load ptr, ptr @cp, align 8, !tbaa !8
  %idxprom = zext nneg i32 %and2 to i64
  %arrayidx = getelementptr inbounds nuw i64, ptr %r, i64 %idxprom
  %idxprom4 = zext nneg i32 %shr to i64
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %r, i64 %idxprom4
  %tobool.not = icmp eq i32 %and3, 0
  br label %top

top:                                              ; preds = %top, %entry
  store i64 1, ptr %0, align 8, !tbaa !11
  %1 = load i64, ptr %arrayidx, align 8, !tbaa !11
  %2 = load i64, ptr %arrayidx5, align 8, !tbaa !11
  %add = add i64 %2, %1
  store i64 %add, ptr @m, align 8, !tbaa !11
  store i64 2, ptr %0, align 8, !tbaa !11
  br i1 %tobool.not, label %top, label %if.end

if.end:                                           ; preds = %top
  %idxprom6 = zext nneg i32 %and3 to i64
  %arrayidx7 = getelementptr inbounds nuw i64, ptr %r, i64 %idxprom6
  store i64 1, ptr %arrayidx7, align 8, !tbaa !11
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: nounwind
define dso_local i32 @main() local_unnamed_addr #3 {
if.end:
  %cr = alloca i64, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %cr) #5
  store ptr %cr, ptr @cp, align 8, !tbaa !8
  store i64 58, ptr @m, align 8, !tbaa !11
  store i64 2, ptr %cr, align 8, !tbaa !11
  call void @exit(i32 noundef 0) #6
  call void @llvm.lifetime.end.p0(ptr nonnull %cr) #5
  ret i32 undef
}

declare void @exit(i32 noundef) local_unnamed_addr #4

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nobuiltin nounwind "no-builtins" }

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
!8 = !{!9, !9, i64 0}
!9 = !{!"p1 long long", !10, i64 0}
!10 = !{!"any pointer", !6, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"long long", !6, i64 0}
