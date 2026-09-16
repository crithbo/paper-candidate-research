; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\021_035927ab76856d46\B2.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr83477.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@yf = dso_local local_unnamed_addr global i32 0, align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @pl(i32 noundef %q5, i32 noundef %nd) local_unnamed_addr #0 !dbg !12 {
entry:
  %cmp = icmp eq i32 %q5, 0, !dbg !16
  %cmp1 = icmp sgt i32 %nd, 1, !dbg !17
  %cmp2.not = or i1 %cmp, %cmp1, !dbg !18
  %cond7 = select i1 %cmp2.not, i32 0, i32 %nd, !dbg !19
  store i32 %cond7, ptr @yf, align 4, !dbg !20, !tbaa !8
  ret void, !dbg !21
}

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #1 !dbg !22 {
entry:
  %0 = load i32, ptr @yf, align 4, !dbg !23, !tbaa !8
  %tobool.not = icmp eq i32 %0, 0, !dbg !24
  %lnot.ext = zext i1 %tobool.not to i32, !dbg !24
  store i32 %lnot.ext, ptr @yf, align 4, !dbg !25, !tbaa !8
  br i1 %tobool.not, label %if.end, label %if.then, !dbg !27

if.then:                                          ; preds = %entry
  tail call void @abort() #3, !dbg !28
  unreachable, !dbg !28

if.end:                                           ; preds = %entry
  ret i32 0, !dbg !29
}

; Function Attrs: noreturn nounwind
declare void @abort() local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin noreturn nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr83477.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "bc2487d28a58faef4ca0e12cccdc08fc")
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
!12 = distinct !DISubprogram(name: "pl", scope: !13, file: !13, line: 4, type: !14, scopeLine: 5, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr83477.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "bc2487d28a58faef4ca0e12cccdc08fc")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 7, column: 16, scope: !12, atomGroup: 3, atomRank: 2)
!17 = !DILocation(line: 9, column: 13, scope: !12)
!18 = !DILocation(line: 9, column: 23, scope: !12, atomGroup: 5, atomRank: 2)
!19 = !DILocation(line: 9, column: 8, scope: !12, atomGroup: 5, atomRank: 1)
!20 = !DILocation(line: 9, column: 6, scope: !12, atomGroup: 4, atomRank: 1)
!21 = !DILocation(line: 10, column: 1, scope: !12, atomGroup: 6, atomRank: 1)
!22 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 13, type: !14, scopeLine: 14, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!23 = !DILocation(line: 15, column: 11, scope: !22)
!24 = !DILocation(line: 15, column: 10, scope: !22)
!25 = !DILocation(line: 9, column: 6, scope: !12, inlinedAt: !26, atomGroup: 4, atomRank: 1)
!26 = distinct !DILocation(line: 15, column: 3, scope: !22)
!27 = !DILocation(line: 16, column: 10, scope: !22, atomGroup: 1, atomRank: 1)
!28 = !DILocation(line: 17, column: 5, scope: !22)
!29 = !DILocation(line: 19, column: 3, scope: !22, atomGroup: 2, atomRank: 1)
