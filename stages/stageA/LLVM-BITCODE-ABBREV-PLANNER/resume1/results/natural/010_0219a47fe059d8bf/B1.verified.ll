; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\010_0219a47fe059d8bf\B1.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr57877.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b = dso_local global i32 0, align 4
@c = dso_local local_unnamed_addr global ptr @b, align 8
@f = dso_local local_unnamed_addr global i32 6, align 4
@a = dso_local local_unnamed_addr global i32 0, align 4
@e = dso_local local_unnamed_addr global i32 0, align 4
@g = dso_local local_unnamed_addr global i32 0, align 4
@h = dso_local local_unnamed_addr global i32 0, align 4
@d = dso_local local_unnamed_addr global i16 0, align 2

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
entry:
  %0 = load i32, ptr @f, align 4, !tbaa !4
  %conv = sext i32 %0 to i64
  %.pr.i = load i32, ptr @g, align 4, !tbaa !4
  %cmp8.i = icmp slt i32 %.pr.i, 1
  br i1 %cmp8.i, label %for.body.lr.ph.i, label %entry.foo.exit_crit_edge

entry.foo.exit_crit_edge:                         ; preds = %entry
  %.pre = load i32, ptr @e, align 4, !tbaa !4
  %1 = icmp eq i32 %.pre, 1
  br i1 %1, label %if.end, label %if.then

for.body.lr.ph.i:                                 ; preds = %entry
  %2 = load ptr, ptr @c, align 8, !tbaa !8
  %3 = load i32, ptr @a, align 4, !tbaa !4
  %4 = sub i32 1, %.pr.i
  %min.iters.check = icmp ult i32 %4, 24
  br i1 %min.iters.check, label %for.body.i.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.lr.ph.i
  %scevgep = getelementptr i8, ptr %2, i64 4
  %bound0 = icmp ult ptr @h, getelementptr inbounds nuw (i8, ptr @e, i64 4)
  %bound1 = icmp ult ptr @e, getelementptr inbounds nuw (i8, ptr @h, i64 4)
  %found.conflict = and i1 %bound0, %bound1
  %bound02 = icmp ult ptr @h, getelementptr inbounds nuw (i8, ptr @g, i64 4)
  %bound13 = icmp ult ptr @g, getelementptr inbounds nuw (i8, ptr @h, i64 4)
  %found.conflict4 = and i1 %bound02, %bound13
  %conflict.rdx = or i1 %found.conflict, %found.conflict4
  %bound05 = icmp ugt ptr %scevgep, @h
  %bound16 = icmp ult ptr %2, getelementptr inbounds nuw (i8, ptr @h, i64 4)
  %found.conflict7 = and i1 %bound05, %bound16
  %conflict.rdx8 = or i1 %conflict.rdx, %found.conflict7
  %bound09 = icmp ult ptr @e, getelementptr inbounds nuw (i8, ptr @g, i64 4)
  %bound110 = icmp ult ptr @g, getelementptr inbounds nuw (i8, ptr @e, i64 4)
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx12 = or i1 %conflict.rdx8, %found.conflict11
  %bound013 = icmp ugt ptr %scevgep, @e
  %bound114 = icmp ult ptr %2, getelementptr inbounds nuw (i8, ptr @e, i64 4)
  %found.conflict15 = and i1 %bound013, %bound114
  %conflict.rdx16 = or i1 %conflict.rdx12, %found.conflict15
  %bound017 = icmp ugt ptr %scevgep, @g
  %bound118 = icmp ult ptr %2, getelementptr inbounds nuw (i8, ptr @g, i64 4)
  %found.conflict19 = and i1 %bound017, %bound118
  %conflict.rdx20 = or i1 %conflict.rdx16, %found.conflict19
  br i1 %conflict.rdx20, label %for.body.i.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i32 %4, -8
  %broadcast.splatinsert = insertelement <4 x i64> poison, i64 %conv, i64 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> poison, <4 x i32> zeroinitializer
  %5 = load i32, ptr %2, align 4, !tbaa !4, !alias.scope !11
  %6 = add i32 %.pr.i, %n.vec
  %7 = shl i32 %5, 16
  %8 = ashr exact i32 %7, 16
  %9 = icmp eq i32 %8, %3
  %broadcast.splatinsert21 = insertelement <4 x i1> poison, i1 %9, i64 0
  %broadcast.splat22 = shufflevector <4 x i1> %broadcast.splatinsert21, <4 x i1> poison, <4 x i32> zeroinitializer
  %10 = zext <4 x i1> %broadcast.splat22 to <4 x i64>
  %11 = icmp ugt <4 x i64> %broadcast.splat, %10
  %12 = extractelement <4 x i1> %11, i64 3
  %13 = zext i1 %12 to i32
  %14 = add i32 %.pr.i, 3
  store i32 %5, ptr @h, align 4, !tbaa !4, !alias.scope !14, !noalias !16
  store i32 %13, ptr @e, align 4, !tbaa !4, !alias.scope !19, !noalias !20
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i32 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %15 = phi i32 [ %14, %vector.ph ], [ %17, %vector.body ]
  %16 = add i32 %15, 5
  %index.next = add nuw i32 %index, 8
  %17 = add i32 %15, 8
  %18 = icmp eq i32 %index.next, %n.vec
  br i1 %18, label %middle.block, label %vector.body, !llvm.loop !21

middle.block:                                     ; preds = %vector.body
  store i32 %16, ptr @g, align 4, !tbaa !4, !alias.scope !25, !noalias !11
  %19 = extractelement <4 x i1> %11, i64 3
  %cmp.n = icmp eq i32 %4, %n.vec
  br i1 %cmp.n, label %foo.exit, label %for.body.i.preheader

for.body.i.preheader:                             ; preds = %vector.memcheck, %for.body.lr.ph.i, %middle.block
  %.ph = phi i32 [ %.pr.i, %vector.memcheck ], [ %.pr.i, %for.body.lr.ph.i ], [ %6, %middle.block ]
  %20 = and i32 %.ph, 1
  %lcmp.mod.not.not = icmp eq i32 %20, 0
  br i1 %lcmp.mod.not.not, label %for.body.i.prol, label %for.body.i.prol.loopexit

for.body.i.prol:                                  ; preds = %for.body.i.preheader
  %21 = load i32, ptr %2, align 4, !tbaa !4
  store i32 %21, ptr @h, align 4, !tbaa !4
  %sext.i.prol = shl i32 %21, 16
  %conv1.i.prol = ashr exact i32 %sext.i.prol, 16
  %cmp2.i.prol = icmp eq i32 %conv1.i.prol, %3
  %conv4.i.prol = zext i1 %cmp2.i.prol to i64
  %cmp5.i.prol = icmp ugt i64 %conv, %conv4.i.prol
  %conv6.i.prol = zext i1 %cmp5.i.prol to i32
  store i32 %conv6.i.prol, ptr @e, align 4, !tbaa !4
  %inc.i.prol = or disjoint i32 %.ph, 1
  store i32 %inc.i.prol, ptr @g, align 4, !tbaa !4
  br label %for.body.i.prol.loopexit

for.body.i.prol.loopexit:                         ; preds = %for.body.i.prol, %for.body.i.preheader
  %.lcssa26.unr = phi i32 [ poison, %for.body.i.preheader ], [ %21, %for.body.i.prol ]
  %cmp5.i.lcssa25.unr = phi i1 [ poison, %for.body.i.preheader ], [ %cmp5.i.prol, %for.body.i.prol ]
  %.unr = phi i32 [ %.ph, %for.body.i.preheader ], [ %inc.i.prol, %for.body.i.prol ]
  %22 = icmp eq i32 %.ph, 0
  br i1 %22, label %foo.exit, label %for.body.i

for.body.i:                                       ; preds = %for.body.i.prol.loopexit, %for.body.i
  %23 = phi i32 [ %inc.i.1, %for.body.i ], [ %.unr, %for.body.i.prol.loopexit ]
  %24 = load i32, ptr %2, align 4, !tbaa !4
  store i32 %24, ptr @h, align 4, !tbaa !4
  %sext.i = shl i32 %24, 16
  %conv1.i = ashr exact i32 %sext.i, 16
  %cmp2.i = icmp eq i32 %conv1.i, %3
  %conv4.i = zext i1 %cmp2.i to i64
  %cmp5.i = icmp ugt i64 %conv, %conv4.i
  %conv6.i = zext i1 %cmp5.i to i32
  store i32 %conv6.i, ptr @e, align 4, !tbaa !4
  %inc.i = add i32 %23, 1
  store i32 %inc.i, ptr @g, align 4, !tbaa !4
  %25 = load i32, ptr %2, align 4, !tbaa !4
  store i32 %25, ptr @h, align 4, !tbaa !4
  %sext.i.1 = shl i32 %25, 16
  %conv1.i.1 = ashr exact i32 %sext.i.1, 16
  %cmp2.i.1 = icmp eq i32 %conv1.i.1, %3
  %conv4.i.1 = zext i1 %cmp2.i.1 to i64
  %cmp5.i.1 = icmp ugt i64 %conv, %conv4.i.1
  %conv6.i.1 = zext i1 %cmp5.i.1 to i32
  store i32 %conv6.i.1, ptr @e, align 4, !tbaa !4
  %inc.i.1 = add i32 %23, 2
  store i32 %inc.i.1, ptr @g, align 4, !tbaa !4
  %exitcond.not.i.1 = icmp eq i32 %inc.i, 0
  br i1 %exitcond.not.i.1, label %foo.exit, label %for.body.i, !llvm.loop !26

foo.exit:                                         ; preds = %for.body.i.prol.loopexit, %for.body.i, %middle.block
  %.lcssa = phi i32 [ %5, %middle.block ], [ %.lcssa26.unr, %for.body.i.prol.loopexit ], [ %25, %for.body.i ]
  %cmp5.i.lcssa = phi i1 [ %19, %middle.block ], [ %cmp5.i.lcssa25.unr, %for.body.i.prol.loopexit ], [ %cmp5.i.1, %for.body.i ]
  %conv.i = trunc i32 %.lcssa to i16
  store i16 %conv.i, ptr @d, align 2, !tbaa !27
  br i1 %cmp5.i.lcssa, label %if.end, label %if.then

if.then:                                          ; preds = %entry.foo.exit_crit_edge, %foo.exit
  tail call void @abort() #2
  br label %if.end

if.end:                                           ; preds = %entry.foo.exit_crit_edge, %if.then, %foo.exit
  ret i32 0
}

declare void @abort() local_unnamed_addr #1

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!8 = !{!9, !9, i64 0}
!9 = !{!"p1 int", !10, i64 0}
!10 = !{!"any pointer", !6, i64 0}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = !{!17, !18, !12}
!17 = distinct !{!17, !13}
!18 = distinct !{!18, !13}
!19 = !{!17}
!20 = !{!18, !12}
!21 = distinct !{!21, !22, !23, !24}
!22 = !{!"llvm.loop.mustprogress"}
!23 = !{!"llvm.loop.isvectorized", i32 1}
!24 = !{!"llvm.loop.unroll.runtime.disable"}
!25 = !{!18}
!26 = distinct !{!26, !22, !23}
!27 = !{!28, !28, i64 0}
!28 = !{!"short", !6, i64 0}
