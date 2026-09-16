; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\064_0b5dc46d38482b74\B1.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20000819-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = dso_local local_unnamed_addr global [2 x i32] [i32 2, i32 0], align 4

; Function Attrs: nounwind
define dso_local void @foo(ptr noundef readonly captures(address) %sp, i32 noundef %cnt) local_unnamed_addr #0 !dbg !12 {
entry:
  %cmp.not6 = icmp slt i32 %cnt, 0, !dbg !16
  br i1 %cmp.not6, label %for.end, label %for.body.preheader, !dbg !17

for.body.preheader:                               ; preds = %entry
  %idx.ext = zext nneg i32 %cnt to i64, !dbg !18
  %.neg = mul nsw i64 %idx.ext, -4, !dbg !19
  %add.ptr = getelementptr inbounds i8, ptr %sp, i64 %.neg, !dbg !19
  br label %for.body, !dbg !20

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %p.07 = phi ptr [ %incdec.ptr, %for.inc ], [ %add.ptr, %for.body.preheader ]
  %0 = load i32, ptr %p.07, align 4, !dbg !21, !tbaa !8
  %cmp1 = icmp slt i32 %0, 2, !dbg !22
  br i1 %cmp1, label %if.then, label %for.inc, !dbg !23

if.then:                                          ; preds = %for.body
  %call = tail call i32 (i32, ...) @exit(i32 noundef 0) #2, !dbg !24
  br label %for.inc, !dbg !24

for.inc:                                          ; preds = %for.body, %if.then
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %p.07, i64 4, !dbg !25
  %cmp.not = icmp ugt ptr %incdec.ptr, %sp, !dbg !26
  br i1 %cmp.not, label %for.end, label %for.body, !dbg !27, !llvm.loop !28

for.end:                                          ; preds = %for.inc, %entry
  ret void, !dbg !31
}

declare !dbg !32 i32 @exit(...) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @main() local_unnamed_addr #0 !dbg !33 {
entry:
  %0 = load i32, ptr @a, align 4, !dbg !34, !tbaa !8
  %cmp1.i = icmp slt i32 %0, 2, !dbg !36
  br i1 %cmp1.i, label %if.then.i, label %for.inc.i, !dbg !37

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 (i32, ...) @exit(i32 noundef 0) #2, !dbg !38
  br label %for.inc.i, !dbg !38

for.inc.i:                                        ; preds = %if.then.i, %entry
  %1 = load i32, ptr getelementptr inbounds nuw (i8, ptr @a, i64 4), align 4, !dbg !34, !tbaa !8
  %cmp1.i.1 = icmp slt i32 %1, 2, !dbg !39
  br i1 %cmp1.i.1, label %if.then.i.1, label %for.inc.i.1, !dbg !40

if.then.i.1:                                      ; preds = %for.inc.i
  %call.i.1 = tail call i32 (i32, ...) @exit(i32 noundef 0) #2, !dbg !38
  br label %for.inc.i.1, !dbg !38

for.inc.i.1:                                      ; preds = %if.then.i.1, %for.inc.i
  %call = tail call i32 (...) @abort() #2, !dbg !41
  ret i32 undef, !dbg !42
}

declare !dbg !43 i32 @abort(...) local_unnamed_addr #1

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20000819-1.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "01ea9c9c802e733916ab9e2d3e4e1d9c")
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
!12 = distinct !DISubprogram(name: "foo", scope: !13, file: !13, line: 3, type: !14, scopeLine: 4, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20000819-1.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "01ea9c9c802e733916ab9e2d3e4e1d9c")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 9, column: 17, scope: !12, atomGroup: 10, atomRank: 1)
!17 = !DILocation(line: 9, column: 3, scope: !12, atomGroup: 11, atomRank: 1)
!18 = !DILocation(line: 7, column: 16, scope: !12)
!19 = !DILocation(line: 7, column: 16, scope: !12, atomGroup: 2, atomRank: 2)
!20 = !DILocation(line: 9, column: 3, scope: !12)
!21 = !DILocation(line: 10, column: 9, scope: !12)
!22 = !DILocation(line: 10, column: 12, scope: !12, atomGroup: 6, atomRank: 2)
!23 = !DILocation(line: 10, column: 12, scope: !12, atomGroup: 6, atomRank: 1)
!24 = !DILocation(line: 10, column: 17, scope: !12)
!25 = !DILocation(line: 9, column: 26, scope: !12, atomGroup: 7, atomRank: 2)
!26 = !DILocation(line: 9, column: 17, scope: !12, atomGroup: 4, atomRank: 1)
!27 = !DILocation(line: 9, column: 3, scope: !12, atomGroup: 5, atomRank: 1)
!28 = distinct !{!28, !20, !29, !30}
!29 = !DILocation(line: 10, column: 23, scope: !12)
!30 = !{!"llvm.loop.mustprogress"}
!31 = !DILocation(line: 11, column: 1, scope: !12, atomGroup: 9, atomRank: 1)
!32 = !DISubprogram(name: "exit", scope: !13, file: !13, line: 10, type: !14, flags: DIFlagArtificial, spFlags: DISPFlagOptimized)
!33 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 13, type: !14, scopeLine: 14, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!34 = !DILocation(line: 10, column: 9, scope: !12, inlinedAt: !35)
!35 = distinct !DILocation(line: 15, column: 3, scope: !33)
!36 = !DILocation(line: 10, column: 12, scope: !12, inlinedAt: !35, atomGroup: 6, atomRank: 2)
!37 = !DILocation(line: 10, column: 12, scope: !12, inlinedAt: !35, atomGroup: 6, atomRank: 1)
!38 = !DILocation(line: 10, column: 17, scope: !12, inlinedAt: !35)
!39 = !DILocation(line: 10, column: 12, scope: !12, inlinedAt: !35, atomGroup: 12, atomRank: 2)
!40 = !DILocation(line: 10, column: 12, scope: !12, inlinedAt: !35, atomGroup: 12, atomRank: 1)
!41 = !DILocation(line: 16, column: 3, scope: !33)
!42 = !DILocation(line: 17, column: 1, scope: !33, atomGroup: 1, atomRank: 1)
!43 = !DISubprogram(name: "abort", scope: !13, file: !13, line: 16, type: !14, flags: DIFlagArtificial, spFlags: DISPFlagOptimized)
