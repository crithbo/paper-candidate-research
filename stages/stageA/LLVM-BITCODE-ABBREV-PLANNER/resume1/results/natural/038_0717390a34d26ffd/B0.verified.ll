; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\038_0717390a34d26ffd\B0.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\loop-8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = dso_local local_unnamed_addr global [3 x double] [double 0.000000e+00, double 1.000000e+00, double 2.000000e+00], align 16

; Function Attrs: nounwind
define dso_local void @bar(i32 noundef %x, ptr noundef readonly captures(none) %y) local_unnamed_addr #0 !dbg !12 {
entry:
  %tobool.not = icmp eq i32 %x, 0, !dbg !16
  br i1 %tobool.not, label %lor.lhs.false, label %if.then, !dbg !17

lor.lhs.false:                                    ; preds = %entry
  %0 = load double, ptr %y, align 8, !dbg !18, !tbaa !19
  %cmp = fcmp une double %0, 1.000000e+00, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %lor.lhs.false, %entry
  %call = tail call i32 (...) @abort() #2, !dbg !23
  br label %if.end, !dbg !23

if.end:                                           ; preds = %if.then, %lor.lhs.false
  ret void, !dbg !24
}

declare !dbg !25 i32 @abort(...) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @main() local_unnamed_addr #0 !dbg !26 {
entry:
  %0 = load double, ptr @a, align 16, !dbg !27, !tbaa !19
  %cmp1 = fcmp ogt double %0, 0.000000e+00, !dbg !28
  br i1 %cmp1, label %e, label %for.cond, !dbg !29

for.cond:                                         ; preds = %entry
  %1 = load double, ptr getelementptr inbounds nuw (i8, ptr @a, i64 8), align 8, !dbg !30, !tbaa !19
  %cmp1.1 = fcmp ogt double %1, 0.000000e+00, !dbg !31
  br i1 %cmp1.1, label %e, label %for.cond.1, !dbg !32

for.cond.1:                                       ; preds = %for.cond
  %2 = load double, ptr getelementptr inbounds nuw (i8, ptr @a, i64 16), align 16, !dbg !33, !tbaa !19
  %cmp1.2 = fcmp ogt double %2, 0.000000e+00, !dbg !34
  br i1 %cmp1.2, label %e, label %for.cond.2, !dbg !35

for.cond.2:                                       ; preds = %for.cond.1
  %call.i = tail call i32 (...) @abort() #2, !dbg !36
  %call = tail call i32 (i32, ...) @exit(i32 noundef 1) #2, !dbg !38
  br label %e, !dbg !38

e:                                                ; preds = %entry, %for.cond, %for.cond.1, %for.cond.2
  %3 = phi double [ %2, %for.cond.2 ], [ %0, %entry ], [ %1, %for.cond ], [ %2, %for.cond.1 ]
  %cmp.i = fcmp une double %3, 1.000000e+00, !dbg !39
  br i1 %cmp.i, label %if.then.i, label %bar.exit, !dbg !41

if.then.i:                                        ; preds = %e
  %call.i5 = tail call i32 (...) @abort() #2, !dbg !42
  br label %bar.exit, !dbg !42

bar.exit:                                         ; preds = %e, %if.then.i
  %call2 = tail call i32 (i32, ...) @exit(i32 noundef 0) #2, !dbg !43
  ret i32 undef, !dbg !44
}

declare !dbg !45 i32 @exit(...) local_unnamed_addr #1

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\loop-8.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "40b29791fe4791dae26621d18ee4ed6c")
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
!12 = distinct !DISubprogram(name: "bar", scope: !13, file: !13, line: 3, type: !14, scopeLine: 4, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\loop-8.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "40b29791fe4791dae26621d18ee4ed6c")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 5, column: 7, scope: !12, atomGroup: 1, atomRank: 2)
!17 = !DILocation(line: 5, column: 9, scope: !12, atomGroup: 1, atomRank: 1)
!18 = !DILocation(line: 5, column: 12, scope: !12)
!19 = !{!20, !20, i64 0}
!20 = !{!"double", !10, i64 0}
!21 = !DILocation(line: 5, column: 15, scope: !12, atomGroup: 2, atomRank: 2)
!22 = !DILocation(line: 5, column: 9, scope: !12, atomGroup: 2, atomRank: 1)
!23 = !DILocation(line: 6, column: 5, scope: !12)
!24 = !DILocation(line: 7, column: 1, scope: !12, atomGroup: 3, atomRank: 1)
!25 = !DISubprogram(name: "abort", scope: !13, file: !13, line: 6, type: !14, flags: DIFlagArtificial, spFlags: DISPFlagOptimized)
!26 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 9, type: !14, scopeLine: 10, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!27 = !DILocation(line: 15, column: 9, scope: !26, atomGroup: 4, atomRank: 2)
!28 = !DILocation(line: 16, column: 11, scope: !26, atomGroup: 5, atomRank: 2)
!29 = !DILocation(line: 16, column: 11, scope: !26, atomGroup: 5, atomRank: 1)
!30 = !DILocation(line: 15, column: 9, scope: !26, atomGroup: 12, atomRank: 2)
!31 = !DILocation(line: 16, column: 11, scope: !26, atomGroup: 13, atomRank: 2)
!32 = !DILocation(line: 16, column: 11, scope: !26, atomGroup: 13, atomRank: 1)
!33 = !DILocation(line: 15, column: 9, scope: !26, atomGroup: 17, atomRank: 2)
!34 = !DILocation(line: 16, column: 11, scope: !26, atomGroup: 18, atomRank: 2)
!35 = !DILocation(line: 16, column: 11, scope: !26, atomGroup: 18, atomRank: 1)
!36 = !DILocation(line: 6, column: 5, scope: !12, inlinedAt: !37)
!37 = distinct !DILocation(line: 18, column: 3, scope: !26)
!38 = !DILocation(line: 19, column: 3, scope: !26)
!39 = !DILocation(line: 5, column: 15, scope: !12, inlinedAt: !40, atomGroup: 2, atomRank: 2)
!40 = distinct !DILocation(line: 21, column: 3, scope: !26)
!41 = !DILocation(line: 5, column: 9, scope: !12, inlinedAt: !40, atomGroup: 2, atomRank: 1)
!42 = !DILocation(line: 6, column: 5, scope: !12, inlinedAt: !40)
!43 = !DILocation(line: 22, column: 3, scope: !26)
!44 = !DILocation(line: 23, column: 1, scope: !26, atomGroup: 9, atomRank: 1)
!45 = !DISubprogram(name: "exit", scope: !13, file: !13, line: 19, type: !14, flags: DIFlagArtificial, spFlags: DISPFlagOptimized)
