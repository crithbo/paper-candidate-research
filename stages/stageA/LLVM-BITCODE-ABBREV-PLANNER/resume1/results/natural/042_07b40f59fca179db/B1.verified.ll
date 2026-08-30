; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\042_07b40f59fca179db\B1.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr57130.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32, i32, i32 }

@s = dso_local global [2 x %struct.S] [%struct.S { i32 6, i32 8, i32 -8, i32 -5 }, %struct.S { i32 0, i32 2, i32 -1, i32 2 }], align 16
@foo.cnt = internal unnamed_addr global i32 0, align 4

; Function Attrs: noinline nounwind
define dso_local void @foo(i64 %r.coerce0, i64 %r.coerce1) local_unnamed_addr #0 !dbg !12 {
entry:
  %r = alloca %struct.S, align 8
  store i64 %r.coerce0, ptr %r, align 8
  %0 = getelementptr inbounds nuw i8, ptr %r, i64 8
  store i64 %r.coerce1, ptr %0, align 8
  %1 = load i32, ptr @foo.cnt, align 4, !dbg !16, !tbaa !8
  %inc = add nsw i32 %1, 1, !dbg !17
  store i32 %inc, ptr @foo.cnt, align 4, !dbg !18, !tbaa !8
  %idxprom = sext i32 %1 to i64, !dbg !19
  %arrayidx = getelementptr inbounds %struct.S, ptr @s, i64 %idxprom, !dbg !19
  %call = call i32 @memcmp(ptr noundef nonnull %r, ptr noundef nonnull %arrayidx, i64 noundef 16) #4, !dbg !20
  %cmp.not = icmp eq i32 %call, 0, !dbg !21
  br i1 %cmp.not, label %if.end, label %if.then, !dbg !22

if.then:                                          ; preds = %entry
  call void @abort() #5, !dbg !23
  unreachable, !dbg !23

if.end:                                           ; preds = %entry
  ret void, !dbg !24
}

; Function Attrs: nounwind
declare !dbg !25 i32 @memcmp(ptr noundef, ptr noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: noreturn nounwind
declare void @abort() local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #3 !dbg !26 {
entry:
  tail call void @foo(i64 34359738374, i64 -17179869192) #6, !dbg !27
  tail call void @foo(i64 8589934592, i64 12884901887) #6, !dbg !28
  ret i32 0, !dbg !29
}

attributes #0 = { noinline nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin nounwind "no-builtins" }
attributes #5 = { nobuiltin noreturn nounwind "no-builtins" }
attributes #6 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr57130.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "387798b7c85293422c596319b4de6ced")
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
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr57130.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "387798b7c85293422c596319b4de6ced")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 9, column: 35, scope: !12)
!17 = !DILocation(line: 9, column: 35, scope: !12, atomGroup: 1, atomRank: 2)
!18 = !DILocation(line: 9, column: 35, scope: !12, atomGroup: 1, atomRank: 1)
!19 = !DILocation(line: 9, column: 30, scope: !12)
!20 = !DILocation(line: 9, column: 7, scope: !12)
!21 = !DILocation(line: 9, column: 50, scope: !12, atomGroup: 2, atomRank: 2)
!22 = !DILocation(line: 9, column: 50, scope: !12, atomGroup: 2, atomRank: 1)
!23 = !DILocation(line: 10, column: 5, scope: !12)
!24 = !DILocation(line: 11, column: 1, scope: !12, atomGroup: 3, atomRank: 1)
!25 = !DISubprogram(name: "__builtin_memcmp", scope: !13, file: !13, line: 9, type: !14, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!26 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 14, type: !14, scopeLine: 15, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!27 = !DILocation(line: 17, column: 3, scope: !26)
!28 = !DILocation(line: 19, column: 3, scope: !26)
!29 = !DILocation(line: 20, column: 3, scope: !26, atomGroup: 4, atomRank: 1)
