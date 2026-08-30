; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\043_07b6a28a479f230b\B1.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20120919-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@vd = dso_local global [2 x double] [double 1.000000e+00, double 0.000000e+00], align 16
@vi = dso_local global [2 x i32] [i32 1234567890, i32 0], align 4
@pd = dso_local local_unnamed_addr global ptr @vd, align 8
@pi = dso_local local_unnamed_addr global ptr @vi, align 8

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local void @init(ptr noundef readnone captures(address_is_null) %n, ptr noundef writeonly captures(none) %dummy) local_unnamed_addr #0 !dbg !12 {
entry:
  %cmp = icmp eq ptr %n, null, !dbg !16
  br i1 %cmp, label %if.then, label %if.end, !dbg !17

if.then:                                          ; preds = %entry
  store i32 0, ptr %dummy, align 4, !dbg !18, !tbaa !8
  br label %if.end, !dbg !19

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !20
}

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #1 !dbg !21 {
if.then.1:
  %0 = load ptr, ptr @pd, align 8
  %1 = load ptr, ptr @pi, align 8
  %2 = load double, ptr %0, align 8, !dbg !22, !tbaa !23
  %cmp2.1 = fcmp ogt double %2, 0.000000e+00, !dbg !25
  %.pre = load i32, ptr %1, align 4, !dbg !26, !tbaa !8
  br i1 %cmp2.1, label %if.end15.1, label %if.end15.1.thread, !dbg !27

if.end15.1.thread:                                ; preds = %if.then.1
  %conv.131 = sitofp i32 %.pre to double, !dbg !28
  store double %conv.131, ptr %0, align 8, !dbg !29, !tbaa !23
  br label %if.then18, !dbg !30

if.end15.1:                                       ; preds = %if.then.1
  %3 = icmp eq i32 %.pre, 1234567890, !dbg !31
  %conv.1 = sitofp i32 %.pre to double, !dbg !32
  store double %conv.1, ptr %0, align 8, !dbg !33, !tbaa !23
  br i1 %3, label %if.end19, label %if.then18, !dbg !30

if.then18:                                        ; preds = %if.end15.1.thread, %if.end15.1
  tail call void @abort() #3, !dbg !34
  br label %if.end19, !dbg !34

if.end19:                                         ; preds = %if.then18, %if.end15.1
  ret i32 0, !dbg !35
}

declare !dbg !36 void @abort() local_unnamed_addr #2

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: write) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20120919-1.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "7039d7de5e791324720551a2709ab831")
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
!12 = distinct !DISubprogram(name: "init", scope: !13, file: !13, line: 14, type: !14, scopeLine: 15, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20120919-1.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "7039d7de5e791324720551a2709ab831")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 16, column: 8, scope: !12, atomGroup: 1, atomRank: 2)
!17 = !DILocation(line: 16, column: 8, scope: !12, atomGroup: 1, atomRank: 1)
!18 = !DILocation(line: 16, column: 23, scope: !12, atomGroup: 2, atomRank: 1)
!19 = !DILocation(line: 16, column: 14, scope: !12)
!20 = !DILocation(line: 17, column: 1, scope: !12, atomGroup: 3, atomRank: 1)
!21 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 19, type: !14, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!22 = !DILocation(line: 26, column: 11, scope: !21)
!23 = !{!24, !24, i64 0}
!24 = !{!"double", !10, i64 0}
!25 = !DILocation(line: 26, column: 17, scope: !21, atomGroup: 18, atomRank: 2)
!26 = !DILocation(line: 31, column: 15, scope: !21, atomGroup: 20, atomRank: 3)
!27 = !DILocation(line: 26, column: 17, scope: !21, atomGroup: 18, atomRank: 1)
!28 = !DILocation(line: 31, column: 15, scope: !21, atomGroup: 24, atomRank: 2)
!29 = !DILocation(line: 31, column: 13, scope: !21, atomGroup: 24, atomRank: 1)
!30 = !DILocation(line: 35, column: 9, scope: !21, atomGroup: 12, atomRank: 1)
!31 = !DILocation(line: 35, column: 9, scope: !21, atomGroup: 12, atomRank: 2)
!32 = !DILocation(line: 31, column: 15, scope: !21, atomGroup: 20, atomRank: 2)
!33 = !DILocation(line: 31, column: 13, scope: !21, atomGroup: 20, atomRank: 1)
!34 = !DILocation(line: 36, column: 5, scope: !21)
!35 = !DILocation(line: 37, column: 3, scope: !21, atomGroup: 14, atomRank: 1)
!36 = !DISubprogram(name: "abort", scope: !13, file: !13, line: 10, type: !14, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
