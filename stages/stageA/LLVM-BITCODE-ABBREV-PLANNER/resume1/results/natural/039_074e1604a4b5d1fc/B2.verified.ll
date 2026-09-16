; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\039_074e1604a4b5d1fc\B2.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr58943.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = dso_local local_unnamed_addr global [1 x i32] [i32 2], align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef i32 @foo() local_unnamed_addr #0 !dbg !12 {
entry:
  %0 = load i32, ptr @x, align 4, !dbg !16, !tbaa !8
  %or = or i32 %0, 128, !dbg !17
  store i32 %or, ptr @x, align 4, !dbg !18, !tbaa !8
  ret i32 1, !dbg !19
}

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #1 !dbg !20 {
entry:
  %0 = load i32, ptr @x, align 4, !dbg !21, !tbaa !8
  %or = or i32 %0, 129, !dbg !23
  store i32 %or, ptr @x, align 4, !dbg !24, !tbaa !8
  %cmp.not = icmp eq i32 %or, 131, !dbg !25
  br i1 %cmp.not, label %if.end, label %if.then, !dbg !26

if.then:                                          ; preds = %entry
  tail call void @abort() #3, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  ret i32 0, !dbg !28
}

; Function Attrs: noreturn nounwind
declare void @abort() local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin noreturn nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr58943.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "710396de97a981aa1f838e11a7298995")
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
!12 = distinct !DISubprogram(name: "foo", scope: !13, file: !13, line: 6, type: !14, scopeLine: 7, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr58943.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "710396de97a981aa1f838e11a7298995")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 8, column: 8, scope: !12)
!17 = !DILocation(line: 8, column: 8, scope: !12, atomGroup: 1, atomRank: 2)
!18 = !DILocation(line: 8, column: 8, scope: !12, atomGroup: 1, atomRank: 1)
!19 = !DILocation(line: 9, column: 3, scope: !12, atomGroup: 2, atomRank: 1)
!20 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 13, type: !14, scopeLine: 14, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!21 = !DILocation(line: 8, column: 8, scope: !12, inlinedAt: !22)
!22 = distinct !DILocation(line: 15, column: 11, scope: !20)
!23 = !DILocation(line: 15, column: 8, scope: !20, atomGroup: 1, atomRank: 2)
!24 = !DILocation(line: 15, column: 8, scope: !20, atomGroup: 1, atomRank: 1)
!25 = !DILocation(line: 16, column: 12, scope: !20, atomGroup: 2, atomRank: 2)
!26 = !DILocation(line: 16, column: 12, scope: !20, atomGroup: 2, atomRank: 1)
!27 = !DILocation(line: 17, column: 5, scope: !20)
!28 = !DILocation(line: 18, column: 3, scope: !20, atomGroup: 3, atomRank: 1)
