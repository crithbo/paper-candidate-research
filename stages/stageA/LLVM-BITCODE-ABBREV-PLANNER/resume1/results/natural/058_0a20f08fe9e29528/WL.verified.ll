; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\058_0a20f08fe9e29528\WL.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr62151.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b = dso_local local_unnamed_addr global i16 0, align 2
@f = dso_local local_unnamed_addr global i32 0, align 4
@h = dso_local local_unnamed_addr global i32 0, align 4
@d = dso_local local_unnamed_addr global i32 0, align 4
@a = dso_local local_unnamed_addr global i32 0, align 4
@i = dso_local local_unnamed_addr global i32 0, align 4
@g = dso_local local_unnamed_addr global i32 0, align 4
@e = dso_local local_unnamed_addr global i32 0, align 4
@c = dso_local local_unnamed_addr global i32 0, align 4

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef i32 @fn1() local_unnamed_addr #0 {
entry:
  %j = alloca [2 x i32], align 4
  store i16 0, ptr @b, align 2, !tbaa !8
  %0 = load i32, ptr @h, align 4, !tbaa !4
  %tobool.not = icmp eq i32 %0, 0
  %f.promoted = load i32, ptr @f, align 4, !tbaa !4
  %1 = load i32, ptr @c, align 4
  %tobool12.not = icmp eq i32 %1, 0
  br label %for.cond

for.cond:                                         ; preds = %cleanup, %entry
  %inc.lcssa24 = phi i32 [ %inc.lcssa22, %cleanup ], [ %f.promoted, %entry ]
  call void @llvm.lifetime.start.p0(ptr nonnull %j) #2
  %idxprom = sext i32 %inc.lcssa24 to i64
  %arrayidx = getelementptr inbounds i32, ptr %j, i64 %idxprom
  store i32 0, ptr %arrayidx, align 4, !tbaa !4
  br i1 %tobool.not, label %for.cond1thread-pre-split, label %if.then

if.then:                                          ; preds = %for.cond
  store i32 0, ptr @d, align 4, !tbaa !4
  br label %cleanup

for.cond1thread-pre-split:                        ; preds = %for.cond
  %tobool2.not20 = icmp eq i32 %inc.lcssa24, 0
  br i1 %tobool2.not20, label %for.cond3.preheader, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.cond1thread-pre-split
  store i32 0, ptr @f, align 4, !tbaa !4
  br label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.inc.preheader, %for.cond1thread-pre-split
  br i1 %tobool12.not, label %return, label %cleanup.loopexit, !llvm.loop !10

cleanup.loopexit:                                 ; preds = %for.cond3.preheader
  store i32 1, ptr @a, align 4, !tbaa !4
  br label %cleanup

cleanup:                                          ; preds = %cleanup.loopexit, %if.then
  %inc.lcssa22 = phi i32 [ 0, %cleanup.loopexit ], [ %inc.lcssa24, %if.then ]
  call void @llvm.lifetime.end.p0(ptr nonnull %j) #2
  br label %for.cond

return:                                           ; preds = %for.cond3.preheader
  %2 = load i32, ptr %j, align 4, !tbaa !4
  store i32 -1, ptr @i, align 4
  store i32 -1, ptr @g, align 4
  store i32 %2, ptr @e, align 4
  store i32 0, ptr @a, align 4, !tbaa !4
  call void @llvm.lifetime.end.p0(ptr nonnull %j) #2
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef i32 @main() local_unnamed_addr #0 {
entry:
  %j.i = alloca [2 x i32], align 4
  store i16 0, ptr @b, align 2, !tbaa !8
  %0 = load i32, ptr @h, align 4, !tbaa !4
  %tobool.not.i = icmp eq i32 %0, 0
  %f.promoted.i = load i32, ptr @f, align 4, !tbaa !4
  %1 = load i32, ptr @c, align 4
  %tobool12.not.i = icmp eq i32 %1, 0
  br label %for.cond.i

for.cond.i:                                       ; preds = %cleanup.i, %entry
  %inc.lcssa24.i = phi i32 [ %inc.lcssa22.i, %cleanup.i ], [ %f.promoted.i, %entry ]
  call void @llvm.lifetime.start.p0(ptr nonnull %j.i) #2
  %idxprom.i = sext i32 %inc.lcssa24.i to i64
  %arrayidx.i = getelementptr inbounds i32, ptr %j.i, i64 %idxprom.i
  store i32 0, ptr %arrayidx.i, align 4, !tbaa !4
  br i1 %tobool.not.i, label %for.cond1thread-pre-split.i, label %if.then.i

if.then.i:                                        ; preds = %for.cond.i
  store i32 0, ptr @d, align 4, !tbaa !4
  br label %cleanup.i

for.cond1thread-pre-split.i:                      ; preds = %for.cond.i
  %tobool2.not20.i = icmp eq i32 %inc.lcssa24.i, 0
  br i1 %tobool2.not20.i, label %for.cond3.preheader.i, label %for.inc.preheader.i

for.inc.preheader.i:                              ; preds = %for.cond1thread-pre-split.i
  store i32 0, ptr @f, align 4, !tbaa !4
  br label %for.cond3.preheader.i

for.cond3.preheader.i:                            ; preds = %for.inc.preheader.i, %for.cond1thread-pre-split.i
  br i1 %tobool12.not.i, label %if.end, label %cleanup.loopexit.i, !llvm.loop !10

cleanup.loopexit.i:                               ; preds = %for.cond3.preheader.i
  store i32 1, ptr @a, align 4, !tbaa !4
  br label %cleanup.i

cleanup.i:                                        ; preds = %cleanup.loopexit.i, %if.then.i
  %inc.lcssa22.i = phi i32 [ 0, %cleanup.loopexit.i ], [ %inc.lcssa24.i, %if.then.i ]
  call void @llvm.lifetime.end.p0(ptr nonnull %j.i) #2
  br label %for.cond.i

if.end:                                           ; preds = %for.cond3.preheader.i
  %2 = load i32, ptr %j.i, align 4, !tbaa !4
  store i32 -1, ptr @i, align 4
  store i32 -1, ptr @g, align 4
  store i32 %2, ptr @e, align 4
  store i32 0, ptr @a, align 4, !tbaa !4
  call void @llvm.lifetime.end.p0(ptr nonnull %j.i) #2
  ret i32 0
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind }

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
!9 = !{!"short", !6, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
