; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\050_0909cec6a99180b9\B0.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\bitfld-6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.U = type { i32 }

@u = internal global %union.U { i32 305419896 }, align 4

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %bf.load = load i32, ptr @u, align 4, !dbg !13
  %bf.clear = and i32 %bf.load, 1048575, !dbg !13
  %sub = sub nsw i32 %bf.clear, 284280, !dbg !14
  ret i32 %sub, !dbg !15
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\bitfld-6.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "324af2dbd52880ad41720b9cbad63fd7")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 14, type: !11, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\bitfld-6.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "324af2dbd52880ad41720b9cbad63fd7")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 18, column: 12, scope: !9)
!14 = !DILocation(line: 18, column: 14, scope: !9)
!15 = !DILocation(line: 18, column: 3, scope: !9)
