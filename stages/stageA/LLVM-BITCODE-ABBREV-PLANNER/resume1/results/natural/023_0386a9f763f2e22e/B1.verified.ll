; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\023_0386a9f763f2e22e\B1.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr82192.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i16, [2 x i8] }

@a = dso_local local_unnamed_addr global i64 -7647888931715538206, align 8
@b = dso_local local_unnamed_addr global %struct.S zeroinitializer, align 4

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @foo() local_unnamed_addr #0 !dbg !12 {
entry:
  %0 = load i64, ptr @a, align 8, !dbg !16, !tbaa !17
  %conv = trunc i64 %0 to i32, !dbg !19
  %1 = and i32 %conv, 885760, !dbg !20
  %sh_prom = add nsw i32 %1, -262113, !dbg !20
  %shr = lshr i32 %conv, %sh_prom, !dbg !20
  %2 = trunc nuw nsw i32 %shr to i16, !dbg !21
  %bf.load = load i16, ptr @b, align 4, !dbg !21
  %bf.clear = and i16 %bf.load, -8192, !dbg !21
  %bf.set = or disjoint i16 %bf.clear, %2, !dbg !22
  store i16 %bf.set, ptr @b, align 4, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #1 !dbg !25 {
entry:
  tail call void @foo() #3, !dbg !26
  %bf.load = load i16, ptr @b, align 4, !dbg !27
  %bf.clear = and i16 %bf.load, 8191, !dbg !27
  %cmp.not = icmp eq i16 %bf.clear, 0, !dbg !28
  br i1 %cmp.not, label %if.end, label %if.then, !dbg !29

if.then:                                          ; preds = %entry
  tail call void @abort() #4, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  ret i32 0, !dbg !31
}

; Function Attrs: noreturn nounwind
declare void @abort() local_unnamed_addr #2

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin "no-builtins" }
attributes #4 = { nobuiltin noreturn nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr82192.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "82ecaeaef4478746e0f34cb881ad4e74")
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
!12 = distinct !DISubprogram(name: "foo", scope: !13, file: !13, line: 7, type: !14, scopeLine: 8, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr82192.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "82ecaeaef4478746e0f34cb881ad4e74")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 9, column: 21, scope: !12)
!17 = !{!18, !18, i64 0}
!18 = !{!"long long", !10, i64 0}
!19 = !DILocation(line: 9, column: 10, scope: !12)
!20 = !DILocation(line: 9, column: 24, scope: !12)
!21 = !DILocation(line: 9, column: 7, scope: !12)
!22 = !DILocation(line: 9, column: 7, scope: !12, atomGroup: 1, atomRank: 2)
!23 = !DILocation(line: 9, column: 7, scope: !12, atomGroup: 1, atomRank: 1)
!24 = !DILocation(line: 11, column: 1, scope: !12, atomGroup: 2, atomRank: 1)
!25 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 14, type: !14, scopeLine: 15, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!26 = !DILocation(line: 18, column: 3, scope: !25)
!27 = !DILocation(line: 19, column: 9, scope: !25)
!28 = !DILocation(line: 19, column: 11, scope: !25, atomGroup: 1, atomRank: 2)
!29 = !DILocation(line: 19, column: 11, scope: !25, atomGroup: 1, atomRank: 1)
!30 = !DILocation(line: 20, column: 5, scope: !25)
!31 = !DILocation(line: 21, column: 3, scope: !25, atomGroup: 2, atomRank: 1)
