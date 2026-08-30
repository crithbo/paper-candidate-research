; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\083_0f3f42c62404d113\B0.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\scal-to-vec2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i64 @vlng() local_unnamed_addr #0 !dbg !12 {
entry:
  ret i64 42, !dbg !16
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @vint() local_unnamed_addr #0 !dbg !17 {
entry:
  ret i32 43, !dbg !18
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none)
define dso_local noundef signext i16 @vsrt() local_unnamed_addr #0 !dbg !19 {
entry:
  ret i16 42, !dbg !20
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none)
define dso_local noundef signext i8 @vchr() local_unnamed_addr #0 !dbg !21 {
entry:
  ret i8 42, !dbg !22
}

; Function Attrs: nounwind
define dso_local noundef i32 @main(i32 noundef %argc, ptr noundef readnone captures(none) %argv) local_unnamed_addr #1 !dbg !23 {
entry:
  %.scalar = shl i32 %argc, 24, !dbg !24
  %sext428 = add i32 %.scalar, 704643072, !dbg !24
  %conv34 = ashr exact i32 %sext428, 24, !dbg !24
  %sext = shl i32 %argc, 24, !dbg !24
  %conv39 = ashr exact i32 %sext, 24, !dbg !24
  %add40 = add nsw i32 %conv39, 42, !dbg !25
  %cmp41.not = icmp eq i32 %add40, %conv34, !dbg !26
  br i1 %cmp41.not, label %for.cond.15, label %if.then, !dbg !27

for.cond.15:                                      ; preds = %entry
  %s1.0.vec.extract = shl i32 %argc, 16, !dbg !28
  %sext427 = add i32 %s1.0.vec.extract, 2752512, !dbg !28
  %conv55 = ashr exact i32 %sext427, 16, !dbg !28
  %sext426 = shl i32 %argc, 16, !dbg !28
  %conv60 = ashr exact i32 %sext426, 16, !dbg !28
  %add61 = add nsw i32 %conv60, 42, !dbg !29
  %cmp62.not = icmp eq i32 %add61, %conv55, !dbg !30
  br i1 %cmp62.not, label %for.cond264.1, label %if.then64, !dbg !31

if.then:                                          ; preds = %entry
  tail call void @abort() #3, !dbg !24
  unreachable, !dbg !24

if.then64:                                        ; preds = %for.cond.15
  tail call void @abort() #3, !dbg !28
  unreachable, !dbg !28

for.cond264.1:                                    ; preds = %for.cond.15
  ret i32 0, !dbg !32
}

; Function Attrs: noreturn nounwind
declare void @abort() local_unnamed_addr #2

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin noreturn nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\scal-to-vec2.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "a3cf345de527b1e31dcd8fefaf12e4b4")
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
!12 = distinct !DISubprogram(name: "vlng", scope: !13, file: !13, line: 28, type: !14, scopeLine: 28, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\scal-to-vec2.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "a3cf345de527b1e31dcd8fefaf12e4b4")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 28, column: 45, scope: !12, atomGroup: 1, atomRank: 1)
!17 = distinct !DISubprogram(name: "vint", scope: !13, file: !13, line: 29, type: !14, scopeLine: 29, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!18 = !DILocation(line: 29, column: 45, scope: !17, atomGroup: 1, atomRank: 1)
!19 = distinct !DISubprogram(name: "vsrt", scope: !13, file: !13, line: 30, type: !14, scopeLine: 30, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!20 = !DILocation(line: 30, column: 46, scope: !19, atomGroup: 1, atomRank: 1)
!21 = distinct !DISubprogram(name: "vchr", scope: !13, file: !13, line: 31, type: !14, scopeLine: 31, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!22 = !DILocation(line: 31, column: 46, scope: !21, atomGroup: 1, atomRank: 1)
!23 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 34, type: !14, scopeLine: 34, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!24 = !DILocation(line: 47, column: 23, scope: !23)
!25 = !DILocation(line: 47, column: 56, scope: !23)
!26 = !DILocation(line: 47, column: 23, scope: !23, atomGroup: 9, atomRank: 2)
!27 = !DILocation(line: 47, column: 23, scope: !23, atomGroup: 9, atomRank: 1)
!28 = !DILocation(line: 49, column: 23, scope: !23)
!29 = !DILocation(line: 49, column: 56, scope: !23)
!30 = !DILocation(line: 49, column: 23, scope: !23, atomGroup: 16, atomRank: 2)
!31 = !DILocation(line: 49, column: 23, scope: !23, atomGroup: 16, atomRank: 1)
!32 = !DILocation(line: 61, column: 5, scope: !23, atomGroup: 76, atomRank: 1)
