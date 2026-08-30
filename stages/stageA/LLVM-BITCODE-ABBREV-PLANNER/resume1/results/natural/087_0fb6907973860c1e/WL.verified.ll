; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\087_0fb6907973860c1e\WL.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\strnlen-lib.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@inside_main = external local_unnamed_addr global i32, align 4

; Function Attrs: noinline nounwind
define dso_local i64 @strnlen(ptr noundef readonly captures(none) %s, i64 noundef %n) local_unnamed_addr #0 !dbg !12 {
entry:
  %0 = load i32, ptr @inside_main, align 4, !dbg !16, !tbaa !8
  %tobool.not = icmp eq i32 %0, 0, !dbg !17
  br i1 %tobool.not, label %if.end, label %if.then, !dbg !18

if.then:                                          ; preds = %entry
  tail call void @abort() #2, !dbg !19
  br label %if.end, !dbg !19

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8, ptr %s, align 1, !dbg !20, !tbaa !21
  %cmp.not5 = icmp eq i8 %1, 0, !dbg !22
  %tobool2.not6 = icmp eq i64 %n, 0, !dbg !23
  %or.cond7 = or i1 %cmp.not5, %tobool2.not6, !dbg !24
  br i1 %or.cond7, label %while.end, label %while.body, !dbg !24

while.body:                                       ; preds = %if.end, %while.body
  %i.09 = phi i64 [ %inc, %while.body ], [ 0, %if.end ]
  %n.addr.08 = phi i64 [ %dec, %while.body ], [ %n, %if.end ]
  %dec = add i64 %n.addr.08, -1, !dbg !25
  %inc = add nuw i64 %i.09, 1, !dbg !26
  %arrayidx = getelementptr inbounds nuw i8, ptr %s, i64 %inc, !dbg !20
  %2 = load i8, ptr %arrayidx, align 1, !dbg !20, !tbaa !21
  %cmp.not = icmp eq i8 %2, 0, !dbg !27
  %tobool2.not = icmp eq i64 %dec, 0, !dbg !23
  %or.cond = select i1 %cmp.not, i1 true, i1 %tobool2.not, !dbg !28
  br i1 %or.cond, label %while.end, label %while.body, !dbg !28, !llvm.loop !29

while.end:                                        ; preds = %while.body, %if.end
  %i.0.lcssa = phi i64 [ 0, %if.end ], [ %inc, %while.body ], !dbg !33
  ret i64 %i.0.lcssa, !dbg !34
}

declare !dbg !35 void @abort() local_unnamed_addr #1

attributes #0 = { noinline nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\strnlen-lib.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "6ce05bc532eebd52f44afc0f28a32abf")
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
!12 = distinct !DISubprogram(name: "strnlen", scope: !13, file: !13, line: 8, type: !14, scopeLine: 9, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\lib\\strnlen.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "1619eaef179eb7769821867507a00cf2")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 13, column: 7, scope: !12)
!17 = !DILocation(line: 13, column: 7, scope: !12, atomGroup: 1, atomRank: 2)
!18 = !DILocation(line: 13, column: 7, scope: !12, atomGroup: 1, atomRank: 1)
!19 = !DILocation(line: 14, column: 5, scope: !12)
!20 = !DILocation(line: 18, column: 10, scope: !12)
!21 = !{!10, !10, i64 0}
!22 = !DILocation(line: 18, column: 15, scope: !12, atomGroup: 9, atomRank: 2)
!23 = !DILocation(line: 18, column: 20, scope: !12)
!24 = !DILocation(line: 18, column: 20, scope: !12, atomGroup: 9, atomRank: 1)
!25 = !DILocation(line: 18, column: 24, scope: !12, atomGroup: 4, atomRank: 2)
!26 = !DILocation(line: 19, column: 6, scope: !12, atomGroup: 6, atomRank: 2)
!27 = !DILocation(line: 18, column: 15, scope: !12, atomGroup: 3, atomRank: 2)
!28 = !DILocation(line: 18, column: 20, scope: !12, atomGroup: 3, atomRank: 1)
!29 = distinct !{!29, !30, !31, !32}
!30 = !DILocation(line: 18, column: 3, scope: !12)
!31 = !DILocation(line: 19, column: 6, scope: !12)
!32 = !{!"llvm.loop.mustprogress"}
!33 = !DILocation(line: 0, scope: !12)
!34 = !DILocation(line: 21, column: 3, scope: !12, atomGroup: 8, atomRank: 1)
!35 = !DISubprogram(name: "abort", scope: !13, file: !13, line: 3, type: !14, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
