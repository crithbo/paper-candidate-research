; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\012_026eb8ad411e9ae6\B2.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr39100.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.C = type { ptr, i16, i16 }
%struct.E = type { i32, ptr }

; Function Attrs: nofree noinline norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef ptr @foo(ptr noundef returned captures(ret: address, provenance) %h, ptr noundef %x) local_unnamed_addr #0 {
entry:
  %pl = alloca ptr, align 8
  %nl = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %pl)
  store ptr null, ptr %pl, align 8, !tbaa !8
  call void @llvm.lifetime.start.p0(ptr nonnull %nl)
  store ptr null, ptr %nl, align 8, !tbaa !8
  %tobool.not17 = icmp eq ptr %x, null
  br i1 %tobool.not17, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %cp = getelementptr inbounds nuw i8, ptr %h, i64 10
  %cn = getelementptr inbounds nuw i8, ptr %h, i64 8
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %if.end
  %x.addr.020 = phi ptr [ %x, %while.body.lr.ph ], [ %0, %if.end ]
  %na.019 = phi ptr [ %nl, %while.body.lr.ph ], [ %na.1, %if.end ]
  %pa.018 = phi ptr [ %pl, %while.body.lr.ph ], [ %pa.1, %if.end ]
  %n1 = getelementptr inbounds nuw i8, ptr %x.addr.020, i64 8
  %0 = load ptr, ptr %n1, align 8, !tbaa !11
  %1 = load i32, ptr %x.addr.020, align 8, !tbaa !13
  %and = and i32 %1, 1
  %cmp.not = icmp eq i32 %and, 0
  br i1 %cmp.not, label %if.else, label %if.then

if.then:                                          ; preds = %while.body
  %2 = load i16, ptr %cp, align 2, !tbaa !14
  %inc = add i16 %2, 1
  store i16 %inc, ptr %cp, align 2, !tbaa !14
  br label %if.end

if.else:                                          ; preds = %while.body
  %3 = load i16, ptr %cn, align 8, !tbaa !17
  %inc3 = add i16 %3, 1
  store i16 %inc3, ptr %cn, align 8, !tbaa !17
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %na.019.sink = phi ptr [ %na.019, %if.else ], [ %pa.018, %if.then ]
  %pa.1 = phi ptr [ %pa.018, %if.else ], [ %n1, %if.then ]
  %na.1 = phi ptr [ %n1, %if.else ], [ %na.019, %if.then ]
  store ptr %x.addr.020, ptr %na.019.sink, align 8, !tbaa !8
  %tobool.not = icmp eq ptr %0, null
  br i1 %tobool.not, label %while.end.loopexit, label %while.body, !llvm.loop !18

while.end.loopexit:                               ; preds = %if.end
  %nl.0.nl.0.nl.0.nl.0..pre = load ptr, ptr %nl, align 8, !tbaa !8
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  %nl.0.nl.0.nl.0. = phi ptr [ null, %entry ], [ %nl.0.nl.0.nl.0.nl.0..pre, %while.end.loopexit ]
  %pa.0.lcssa = phi ptr [ %pl, %entry ], [ %pa.1, %while.end.loopexit ]
  %na.0.lcssa = phi ptr [ %nl, %entry ], [ %na.1, %while.end.loopexit ]
  store ptr %nl.0.nl.0.nl.0., ptr %pa.0.lcssa, align 8, !tbaa !8
  store ptr null, ptr %na.0.lcssa, align 8, !tbaa !8
  %pl.0.pl.0.pl.0.pl.0. = load ptr, ptr %pl, align 8, !tbaa !8
  store ptr %pl.0.pl.0.pl.0.pl.0., ptr %h, align 8, !tbaa !20
  call void @llvm.lifetime.end.p0(ptr nonnull %nl)
  call void @llvm.lifetime.end.p0(ptr nonnull %pl)
  ret ptr %h
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #2 {
entry:
  %c = alloca %struct.C, align 8
  %e = alloca [2 x %struct.E], align 16
  call void @llvm.lifetime.start.p0(ptr nonnull %c) #5
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %c, i8 0, i64 16, i1 false)
  call void @llvm.lifetime.start.p0(ptr nonnull %e) #5
  store i32 0, ptr %e, align 16, !tbaa !13
  %0 = getelementptr inbounds nuw i8, ptr %e, i64 4
  store i32 0, ptr %0, align 4
  %n = getelementptr inbounds nuw i8, ptr %e, i64 8
  %arrayidx = getelementptr inbounds nuw i8, ptr %e, i64 16
  store ptr %arrayidx, ptr %n, align 8, !tbaa !11
  store i32 1, ptr %arrayidx, align 16, !tbaa !13
  %1 = getelementptr inbounds nuw i8, ptr %e, i64 20
  store i32 0, ptr %1, align 4
  %n2 = getelementptr inbounds nuw i8, ptr %e, i64 24
  store ptr null, ptr %n2, align 8, !tbaa !11
  %call = call ptr @foo(ptr noundef nonnull %c, ptr noundef nonnull %e) #6
  %cn = getelementptr inbounds nuw i8, ptr %c, i64 8
  %2 = load i16, ptr %cn, align 8, !tbaa !17
  %cmp = icmp ne i16 %2, 1
  %cp = getelementptr inbounds nuw i8, ptr %c, i64 10
  %3 = load i16, ptr %cp, align 2
  %cmp7 = icmp ne i16 %3, 1
  %or.cond = select i1 %cmp, i1 true, i1 %cmp7
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() #7
  unreachable

if.end:                                           ; preds = %entry
  %4 = load ptr, ptr %c, align 8, !tbaa !20
  %cmp10.not = icmp eq ptr %4, %arrayidx
  br i1 %cmp10.not, label %if.end13, label %if.then12

if.then12:                                        ; preds = %if.end
  call void @abort() #7
  unreachable

if.end13:                                         ; preds = %if.end
  %5 = load ptr, ptr %n2, align 8, !tbaa !11
  %cmp17.not = icmp eq ptr %5, %e
  br i1 %cmp17.not, label %if.end20, label %if.then19

if.then19:                                        ; preds = %if.end13
  call void @abort() #7
  unreachable

if.end20:                                         ; preds = %if.end13
  %6 = load ptr, ptr %n, align 8, !tbaa !11
  %tobool.not = icmp eq ptr %6, null
  br i1 %tobool.not, label %if.end24, label %if.then23

if.then23:                                        ; preds = %if.end20
  call void @abort() #7
  unreachable

if.end24:                                         ; preds = %if.end20
  call void @llvm.lifetime.end.p0(ptr nonnull %e) #5
  call void @llvm.lifetime.end.p0(ptr nonnull %c) #5
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #3

; Function Attrs: noreturn nounwind
declare void @abort() local_unnamed_addr #4

attributes #0 = { nofree noinline norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { noreturn nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nobuiltin "no-builtins" }
attributes #7 = { nobuiltin noreturn nounwind "no-builtins" }

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
!9 = !{!"p1 _ZTS1E", !10, i64 0}
!10 = !{!"any pointer", !6, i64 0}
!11 = !{!12, !9, i64 8}
!12 = !{!"E", !5, i64 0, !9, i64 8}
!13 = !{!12, !5, i64 0}
!14 = !{!15, !16, i64 10}
!15 = !{!"C", !9, i64 0, !16, i64 8, !16, i64 10}
!16 = !{!"short", !6, i64 0}
!17 = !{!15, !16, i64 8}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.mustprogress"}
!20 = !{!15, !9, i64 0}
