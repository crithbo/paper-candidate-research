; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\066_0bcbdf0076abd2a1\B2.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20030914-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { [16 x i32] }

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define dso_local x86_fp80 @f(i32 noundef %pa, ptr noundef readonly byval(%struct.s) align 8 captures(none) %pb, x86_fp80 noundef %pc) local_unnamed_addr #0 !dbg !12 {
entry:
  %0 = load i32, ptr %pb, align 8, !dbg !16, !tbaa !8
  %conv = sitofp i32 %0 to x86_fp80, !dbg !16
  %add = fadd x86_fp80 %pc, %conv, !dbg !17
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %pb, i64 4, !dbg !16
  %1 = load i32, ptr %arrayidx.1, align 4, !dbg !16, !tbaa !8
  %conv.1 = sitofp i32 %1 to x86_fp80, !dbg !16
  %add.1 = fadd x86_fp80 %add, %conv.1, !dbg !18
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %pb, i64 8, !dbg !16
  %2 = load i32, ptr %arrayidx.2, align 8, !dbg !16, !tbaa !8
  %conv.2 = sitofp i32 %2 to x86_fp80, !dbg !16
  %add.2 = fadd x86_fp80 %add.1, %conv.2, !dbg !19
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %pb, i64 12, !dbg !16
  %3 = load i32, ptr %arrayidx.3, align 4, !dbg !16, !tbaa !8
  %conv.3 = sitofp i32 %3 to x86_fp80, !dbg !16
  %add.3 = fadd x86_fp80 %add.2, %conv.3, !dbg !20
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %pb, i64 16, !dbg !16
  %4 = load i32, ptr %arrayidx.4, align 8, !dbg !16, !tbaa !8
  %conv.4 = sitofp i32 %4 to x86_fp80, !dbg !16
  %add.4 = fadd x86_fp80 %add.3, %conv.4, !dbg !21
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %pb, i64 20, !dbg !16
  %5 = load i32, ptr %arrayidx.5, align 4, !dbg !16, !tbaa !8
  %conv.5 = sitofp i32 %5 to x86_fp80, !dbg !16
  %add.5 = fadd x86_fp80 %add.4, %conv.5, !dbg !22
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %pb, i64 24, !dbg !16
  %6 = load i32, ptr %arrayidx.6, align 8, !dbg !16, !tbaa !8
  %conv.6 = sitofp i32 %6 to x86_fp80, !dbg !16
  %add.6 = fadd x86_fp80 %add.5, %conv.6, !dbg !23
  %arrayidx.7 = getelementptr inbounds nuw i8, ptr %pb, i64 28, !dbg !16
  %7 = load i32, ptr %arrayidx.7, align 4, !dbg !16, !tbaa !8
  %conv.7 = sitofp i32 %7 to x86_fp80, !dbg !16
  %add.7 = fadd x86_fp80 %add.6, %conv.7, !dbg !24
  %arrayidx.8 = getelementptr inbounds nuw i8, ptr %pb, i64 32, !dbg !16
  %8 = load i32, ptr %arrayidx.8, align 8, !dbg !16, !tbaa !8
  %conv.8 = sitofp i32 %8 to x86_fp80, !dbg !16
  %add.8 = fadd x86_fp80 %add.7, %conv.8, !dbg !25
  %arrayidx.9 = getelementptr inbounds nuw i8, ptr %pb, i64 36, !dbg !16
  %9 = load i32, ptr %arrayidx.9, align 4, !dbg !16, !tbaa !8
  %conv.9 = sitofp i32 %9 to x86_fp80, !dbg !16
  %add.9 = fadd x86_fp80 %add.8, %conv.9, !dbg !26
  %arrayidx.10 = getelementptr inbounds nuw i8, ptr %pb, i64 40, !dbg !16
  %10 = load i32, ptr %arrayidx.10, align 8, !dbg !16, !tbaa !8
  %conv.10 = sitofp i32 %10 to x86_fp80, !dbg !16
  %add.10 = fadd x86_fp80 %add.9, %conv.10, !dbg !27
  %arrayidx.11 = getelementptr inbounds nuw i8, ptr %pb, i64 44, !dbg !16
  %11 = load i32, ptr %arrayidx.11, align 4, !dbg !16, !tbaa !8
  %conv.11 = sitofp i32 %11 to x86_fp80, !dbg !16
  %add.11 = fadd x86_fp80 %add.10, %conv.11, !dbg !28
  %arrayidx.12 = getelementptr inbounds nuw i8, ptr %pb, i64 48, !dbg !16
  %12 = load i32, ptr %arrayidx.12, align 8, !dbg !16, !tbaa !8
  %conv.12 = sitofp i32 %12 to x86_fp80, !dbg !16
  %add.12 = fadd x86_fp80 %add.11, %conv.12, !dbg !29
  %arrayidx.13 = getelementptr inbounds nuw i8, ptr %pb, i64 52, !dbg !16
  %13 = load i32, ptr %arrayidx.13, align 4, !dbg !16, !tbaa !8
  %conv.13 = sitofp i32 %13 to x86_fp80, !dbg !16
  %add.13 = fadd x86_fp80 %add.12, %conv.13, !dbg !30
  %arrayidx.14 = getelementptr inbounds nuw i8, ptr %pb, i64 56, !dbg !16
  %14 = load i32, ptr %arrayidx.14, align 8, !dbg !16, !tbaa !8
  %conv.14 = sitofp i32 %14 to x86_fp80, !dbg !16
  %add.14 = fadd x86_fp80 %add.13, %conv.14, !dbg !31
  %arrayidx.15 = getelementptr inbounds nuw i8, ptr %pb, i64 60, !dbg !16
  %15 = load i32, ptr %arrayidx.15, align 4, !dbg !16, !tbaa !8
  %conv.15 = sitofp i32 %15 to x86_fp80, !dbg !16
  %add.15 = fadd x86_fp80 %add.14, %conv.15, !dbg !32
  ret x86_fp80 %add.15, !dbg !33
}

; Function Attrs: nounwind
define dso_local i32 @main() local_unnamed_addr #1 !dbg !34 {
if.end:
  %call3 = tail call i32 (i32, ...) @exit(i32 noundef 0) #3, !dbg !35
  ret i32 undef, !dbg !36
}

declare !dbg !37 i32 @exit(...) local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20030914-1.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "1c39eb1b275208926435be01b339f5aa")
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
!12 = distinct !DISubprogram(name: "f", scope: !13, file: !13, line: 7, type: !14, scopeLine: 8, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20030914-1.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "1c39eb1b275208926435be01b339f5aa")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 12, column: 11, scope: !12)
!17 = !DILocation(line: 12, column: 8, scope: !12, atomGroup: 4, atomRank: 2)
!18 = !DILocation(line: 12, column: 8, scope: !12, atomGroup: 11, atomRank: 2)
!19 = !DILocation(line: 12, column: 8, scope: !12, atomGroup: 15, atomRank: 2)
!20 = !DILocation(line: 12, column: 8, scope: !12, atomGroup: 19, atomRank: 2)
!21 = !DILocation(line: 12, column: 8, scope: !12, atomGroup: 23, atomRank: 2)
!22 = !DILocation(line: 12, column: 8, scope: !12, atomGroup: 27, atomRank: 2)
!23 = !DILocation(line: 12, column: 8, scope: !12, atomGroup: 31, atomRank: 2)
!24 = !DILocation(line: 12, column: 8, scope: !12, atomGroup: 35, atomRank: 2)
!25 = !DILocation(line: 12, column: 8, scope: !12, atomGroup: 39, atomRank: 2)
!26 = !DILocation(line: 12, column: 8, scope: !12, atomGroup: 43, atomRank: 2)
!27 = !DILocation(line: 12, column: 8, scope: !12, atomGroup: 47, atomRank: 2)
!28 = !DILocation(line: 12, column: 8, scope: !12, atomGroup: 51, atomRank: 2)
!29 = !DILocation(line: 12, column: 8, scope: !12, atomGroup: 55, atomRank: 2)
!30 = !DILocation(line: 12, column: 8, scope: !12, atomGroup: 59, atomRank: 2)
!31 = !DILocation(line: 12, column: 8, scope: !12, atomGroup: 63, atomRank: 2)
!32 = !DILocation(line: 12, column: 8, scope: !12, atomGroup: 67, atomRank: 2)
!33 = !DILocation(line: 13, column: 3, scope: !12, atomGroup: 8, atomRank: 1)
!34 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 16, type: !14, scopeLine: 17, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!35 = !DILocation(line: 25, column: 3, scope: !34)
!36 = !DILocation(line: 26, column: 1, scope: !34, atomGroup: 8, atomRank: 1)
!37 = !DISubprogram(name: "exit", scope: !13, file: !13, line: 25, type: !14, flags: DIFlagArtificial, spFlags: DISPFlagOptimized)
