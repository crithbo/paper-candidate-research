; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\022_0366da932b8ed1a1\B0.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\920711-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @f(i64 noundef %a) local_unnamed_addr #0 !dbg !12 {
entry:
  %cmp = icmp sgt i64 %a, 1, !dbg !16
  %conv = zext i1 %cmp to i32, !dbg !17
  ret i32 %conv, !dbg !18
}

; Function Attrs: nounwind
define dso_local i32 @main() local_unnamed_addr #1 !dbg !19 {
if.end:
  tail call void @exit(i32 noundef 0) #3, !dbg !20
  ret i32 undef, !dbg !21
}

declare !dbg !22 void @exit(i32 noundef) local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\920711-1.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "935f2ebde080a2ed34e886958029138f")
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
!12 = distinct !DISubprogram(name: "f", scope: !13, file: !13, line: 6, type: !14, scopeLine: 6, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\920711-1.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "935f2ebde080a2ed34e886958029138f")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 6, column: 27, scope: !12, atomGroup: 1, atomRank: 3)
!17 = !DILocation(line: 6, column: 27, scope: !12, atomGroup: 1, atomRank: 2)
!18 = !DILocation(line: 6, column: 15, scope: !12, atomGroup: 1, atomRank: 1)
!19 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 7, type: !14, scopeLine: 7, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!20 = !DILocation(line: 7, column: 41, scope: !19)
!21 = !DILocation(line: 7, column: 49, scope: !19, atomGroup: 2, atomRank: 1)
!22 = !DISubprogram(name: "exit", scope: !13, file: !13, line: 4, type: !14, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
