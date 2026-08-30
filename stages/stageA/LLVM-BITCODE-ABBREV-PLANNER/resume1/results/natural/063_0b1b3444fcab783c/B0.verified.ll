; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\063_0b1b3444fcab783c\B0.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr70127.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i8 }

@c = dso_local local_unnamed_addr global { i32, i8, [3 x i8] } { i32 5, i8 1, [3 x i8] zeroinitializer }, align 8
@b = dso_local local_unnamed_addr global i16 0, align 2
@d = dso_local local_unnamed_addr global %struct.S zeroinitializer, align 8
@a = dso_local local_unnamed_addr global [1 x %struct.S] zeroinitializer, align 8

; Function Attrs: noinline nounwind
define dso_local void @foo(i32 noundef %x) local_unnamed_addr #0 !dbg !12 {
entry:
  %cmp.not = icmp eq i32 %x, 1, !dbg !16
  br i1 %cmp.not, label %if.end, label %if.then, !dbg !17

if.then:                                          ; preds = %entry
  tail call void @abort() #3, !dbg !18
  unreachable, !dbg !18

if.end:                                           ; preds = %entry
  ret void, !dbg !19
}

; Function Attrs: noreturn nounwind
declare void @abort() local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #2 !dbg !20 {
entry:
  %b.promoted = load i16, ptr @b, align 2, !tbaa !21
  %cmp4 = icmp slt i16 %b.promoted, 1, !dbg !23
  br i1 %cmp4, label %while.body.lr.ph, label %entry.while.end_crit_edge, !dbg !24

entry.while.end_crit_edge:                        ; preds = %entry
  %inc3 = add nuw i16 %b.promoted, 1, !dbg !25
  %bf.load.pre = load i8, ptr getelementptr inbounds nuw (i8, ptr @a, i64 4), align 4, !dbg !26
  br label %while.end, !dbg !24

while.body.lr.ph:                                 ; preds = %entry
  %0 = load i64, ptr @c, align 8
  store i64 %0, ptr @a, align 8
  store i64 %0, ptr @d, align 8
  %1 = lshr i64 %0, 32, !dbg !27
  %2 = trunc i64 %1 to i8, !dbg !27
  br label %while.end, !dbg !27

while.end:                                        ; preds = %entry.while.end_crit_edge, %while.body.lr.ph
  %bf.load = phi i8 [ %bf.load.pre, %entry.while.end_crit_edge ], [ %2, %while.body.lr.ph ], !dbg !26
  %inc.lcssa = phi i16 [ %inc3, %entry.while.end_crit_edge ], [ 2, %while.body.lr.ph ]
  store i16 %inc.lcssa, ptr @b, align 2, !dbg !27, !tbaa !21
  %bf.shl = shl i8 %bf.load, 6, !dbg !26
  %bf.ashr = ashr exact i8 %bf.shl, 6, !dbg !26
  %bf.cast = sext i8 %bf.ashr to i32, !dbg !26
  tail call void @foo(i32 noundef %bf.cast) #4, !dbg !28
  ret i32 0, !dbg !29
}

attributes #0 = { noinline nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noreturn nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin noreturn nounwind "no-builtins" }
attributes #4 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr70127.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "4b486a3bb31f746e8c81c974fdf67fe4")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = distinct !DISubprogram(name: "foo", scope: !13, file: !13, line: 7, type: !14, scopeLine: 8, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr70127.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "4b486a3bb31f746e8c81c974fdf67fe4")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 9, column: 9, scope: !12, atomGroup: 1, atomRank: 2)
!17 = !DILocation(line: 9, column: 9, scope: !12, atomGroup: 1, atomRank: 1)
!18 = !DILocation(line: 10, column: 5, scope: !12)
!19 = !DILocation(line: 11, column: 1, scope: !12, atomGroup: 2, atomRank: 1)
!20 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 14, type: !14, scopeLine: 15, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!21 = !{!22, !22, i64 0}
!22 = !{!"short", !10, i64 0}
!23 = !DILocation(line: 16, column: 14, scope: !20, atomGroup: 10, atomRank: 1)
!24 = !DILocation(line: 16, column: 3, scope: !20, atomGroup: 11, atomRank: 1)
!25 = !DILocation(line: 16, column: 11, scope: !20, atomGroup: 9, atomRank: 2)
!26 = !DILocation(line: 21, column: 13, scope: !20)
!27 = !DILocation(line: 16, column: 11, scope: !20, atomGroup: 1, atomRank: 1)
!28 = !DILocation(line: 21, column: 3, scope: !20)
!29 = !DILocation(line: 22, column: 3, scope: !20, atomGroup: 8, atomRank: 1)
