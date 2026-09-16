; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\044_07bf62a2189ff199\B2.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\vrp-3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @f(i32 noundef %a) local_unnamed_addr #0 !dbg !12 {
entry:
  %0 = add i32 %a, 14, !dbg !16
  %or.cond = icmp ult i32 %0, 26, !dbg !16
  br i1 %or.cond, label %if.then2, label %return, !dbg !16

if.then2:                                         ; preds = %entry
  %cond = tail call i32 @llvm.abs.i32(i32 %a, i1 true), !dbg !17
  %cmp4 = icmp ne i32 %cond, 2, !dbg !18
  %. = zext i1 %cmp4 to i32, !dbg !19
  br label %return, !dbg !19

return:                                           ; preds = %entry, %if.then2
  %retval.0 = phi i32 [ %., %if.then2 ], [ 1, %entry ], !dbg !19
  ret i32 %retval.0, !dbg !20
}

; Function Attrs: nounwind
define dso_local i32 @main(i32 noundef %argc, ptr noundef readnone captures(none) %argv) local_unnamed_addr #1 !dbg !21 {
if.end:
  tail call void @exit(i32 noundef 0) #4, !dbg !22
  ret i32 undef, !dbg !23
}

declare !dbg !24 void @exit(i32 noundef) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nobuiltin nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\vrp-3.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "e60047c8dbf5a9bb535fdac574051fe5")
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
!12 = distinct !DISubprogram(name: "f", scope: !13, file: !13, line: 4, type: !14, scopeLine: 4, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\vrp-3.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "e60047c8dbf5a9bb535fdac574051fe5")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 5, column: 8, scope: !12, atomGroup: 1, atomRank: 1)
!17 = !DILocation(line: 7, column: 7, scope: !12, atomGroup: 4, atomRank: 1)
!18 = !DILocation(line: 8, column: 9, scope: !12, atomGroup: 5, atomRank: 2)
!19 = !DILocation(line: 0, scope: !12)
!20 = !DILocation(line: 14, column: 1, scope: !12, atomGroup: 9, atomRank: 1)
!21 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 16, type: !14, scopeLine: 16, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!22 = !DILocation(line: 19, column: 2, scope: !21)
!23 = !DILocation(line: 20, column: 1, scope: !21, atomGroup: 2, atomRank: 1)
!24 = !DISubprogram(name: "exit", scope: !13, file: !13, line: 2, type: !14, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
