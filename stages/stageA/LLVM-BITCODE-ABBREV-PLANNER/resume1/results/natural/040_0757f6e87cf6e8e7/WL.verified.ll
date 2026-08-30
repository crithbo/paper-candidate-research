; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\040_0757f6e87cf6e8e7\WL.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr34099-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @test1(i32 noundef %b, i32 noundef %c) local_unnamed_addr #0 !dbg !12 {
entry:
  %tobool.not = icmp eq i32 %b, 0, !dbg !16
  %. = zext i1 %tobool.not to i32, !dbg !17
  ret i32 %., !dbg !18
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @test2(i32 noundef %b, i32 noundef %c) local_unnamed_addr #0 !dbg !19 {
entry:
  %tobool.not = icmp eq i32 %b, 0, !dbg !20
  %. = zext i1 %tobool.not to i32, !dbg !21
  ret i32 %., !dbg !22
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @test3(i32 noundef %b, i32 noundef %c) local_unnamed_addr #0 !dbg !23 {
entry:
  %tobool.not = icmp eq i32 %b, 0, !dbg !24
  %. = zext i1 %tobool.not to i32, !dbg !25
  ret i32 %., !dbg !26
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @test4(i32 noundef %b, i32 noundef %c) local_unnamed_addr #0 !dbg !27 {
entry:
  %tobool.not = icmp eq i32 %b, 0, !dbg !28
  %cmp = icmp eq i32 %c, 0, !dbg !29
  %narrow = or i1 %tobool.not, %cmp, !dbg !29
  %retval.0 = zext i1 %narrow to i32, !dbg !29
  ret i32 %retval.0, !dbg !30
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @main() local_unnamed_addr #0 !dbg !31 {
if.end12:
  ret i32 0, !dbg !32
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr34099-2.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "44e31cbaa103bc17bbe72208de35ae78")
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
!12 = distinct !DISubprogram(name: "test1", scope: !13, file: !13, line: 1, type: !14, scopeLine: 2, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr34099-2.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "44e31cbaa103bc17bbe72208de35ae78")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 4, column: 7, scope: !12, atomGroup: 1, atomRank: 2)
!17 = !DILocation(line: 0, scope: !12)
!18 = !DILocation(line: 8, column: 1, scope: !12, atomGroup: 4, atomRank: 1)
!19 = distinct !DISubprogram(name: "test2", scope: !13, file: !13, line: 9, type: !14, scopeLine: 10, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!20 = !DILocation(line: 12, column: 7, scope: !19, atomGroup: 1, atomRank: 2)
!21 = !DILocation(line: 0, scope: !19)
!22 = !DILocation(line: 16, column: 1, scope: !19, atomGroup: 4, atomRank: 1)
!23 = distinct !DISubprogram(name: "test3", scope: !13, file: !13, line: 17, type: !14, scopeLine: 18, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!24 = !DILocation(line: 20, column: 7, scope: !23, atomGroup: 1, atomRank: 2)
!25 = !DILocation(line: 0, scope: !23)
!26 = !DILocation(line: 24, column: 1, scope: !23, atomGroup: 4, atomRank: 1)
!27 = distinct !DISubprogram(name: "test4", scope: !13, file: !13, line: 25, type: !14, scopeLine: 26, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!28 = !DILocation(line: 28, column: 7, scope: !27, atomGroup: 1, atomRank: 2)
!29 = !DILocation(line: 28, column: 7, scope: !27, atomGroup: 1, atomRank: 1)
!30 = !DILocation(line: 32, column: 1, scope: !27, atomGroup: 4, atomRank: 1)
!31 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 35, type: !14, scopeLine: 36, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!32 = !DILocation(line: 45, column: 3, scope: !31, atomGroup: 5, atomRank: 1)
