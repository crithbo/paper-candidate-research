; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\041_076435909bab0298\B2.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20021015-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_list = dso_local global [1 x i8] c"1", align 1

; Function Attrs: nounwind
define dso_local void @g(ptr noundef readnone captures(none) %p, ptr noundef readnone captures(none) %list, i32 noundef %length, ptr noundef readnone captures(none) %elementPtr, ptr noundef readonly captures(none) %nextPtr) local_unnamed_addr #0 !dbg !12 {
entry:
  %0 = load ptr, ptr %nextPtr, align 8, !dbg !16, !tbaa !17
  %cmp.not = icmp eq ptr %0, @g_list, !dbg !20
  br i1 %cmp.not, label %if.end, label %if.then, !dbg !21

if.then:                                          ; preds = %entry
  tail call void @abort() #3, !dbg !22
  %.pre = load ptr, ptr %nextPtr, align 8, !dbg !23, !tbaa !17
  br label %if.end, !dbg !22

if.end:                                           ; preds = %if.then, %entry
  %1 = phi ptr [ %.pre, %if.then ], [ @g_list, %entry ], !dbg !23
  store i8 0, ptr %1, align 1, !dbg !24, !tbaa !25
  ret void, !dbg !26
}

declare !dbg !27 void @abort() local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef i32 @main() local_unnamed_addr #2 !dbg !28 {
entry:
  %.pr = load i8, ptr @g_list, align 1, !dbg !29, !tbaa !25
  %0 = icmp eq i8 %.pr, 0, !dbg !30
  br i1 %0, label %for.end, label %g.exit.lr.ph, !dbg !31

g.exit.lr.ph:                                     ; preds = %entry
  store i8 0, ptr @g_list, align 1, !tbaa !25
  br label %for.end, !dbg !32

for.end:                                          ; preds = %g.exit.lr.ph, %entry
  ret i32 0, !dbg !33
}

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20021015-1.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "4d674c5e8d10e871cff67a005878ed61")
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
!12 = distinct !DISubprogram(name: "g", scope: !13, file: !13, line: 7, type: !14, scopeLine: 8, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20021015-1.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "4d674c5e8d10e871cff67a005878ed61")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 9, column: 7, scope: !12)
!17 = !{!18, !18, i64 0}
!18 = !{!"p1 omnipotent char", !19, i64 0}
!19 = !{!"any pointer", !10, i64 0}
!20 = !DILocation(line: 9, column: 16, scope: !12, atomGroup: 1, atomRank: 2)
!21 = !DILocation(line: 9, column: 16, scope: !12, atomGroup: 1, atomRank: 1)
!22 = !DILocation(line: 10, column: 5, scope: !12)
!23 = !DILocation(line: 12, column: 4, scope: !12)
!24 = !DILocation(line: 12, column: 13, scope: !12, atomGroup: 2, atomRank: 1)
!25 = !{!10, !10, i64 0}
!26 = !DILocation(line: 13, column: 1, scope: !12, atomGroup: 3, atomRank: 1)
!27 = !DISubprogram(name: "abort", scope: !13, file: !13, line: 3, type: !14, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!28 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 15, type: !14, scopeLine: 16, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!29 = !DILocation(line: 21, column: 15, scope: !28)
!30 = !DILocation(line: 21, column: 21, scope: !28, atomGroup: 4, atomRank: 1)
!31 = !DILocation(line: 21, column: 3, scope: !28, atomGroup: 12, atomRank: 1)
!32 = !DILocation(line: 21, column: 3, scope: !28, atomGroup: 5, atomRank: 1)
!33 = !DILocation(line: 28, column: 3, scope: !28, atomGroup: 11, atomRank: 1)
