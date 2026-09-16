; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\077_0de7dc508f214d0d\WL.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20060127-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = dso_local global i64 1311768464867721216, align 8

; Function Attrs: noinline nounwind optnone
define dso_local void @f(i64 noundef %a) #0 !dbg !9 {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, ptr %a.addr, align 8
  %0 = load i64, ptr %a.addr, align 8, !dbg !13
  %and = and i64 %0, 4294967295, !dbg !14
  %cmp = icmp ne i64 %and, 0, !dbg !15
  br i1 %cmp, label %if.then, label %if.end, !dbg !15

if.then:                                          ; preds = %entry
  call void (...) @abort() #2, !dbg !16
  br label %if.end, !dbg !16

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !17
}

declare void @abort(...) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !18 {
entry:
  %0 = load i64, ptr @a, align 8, !dbg !19
  call void @f(i64 noundef %0) #2, !dbg !20
  ret i32 0, !dbg !21
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20060127-1.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "b3fc4813daf4f2bac77f20c8a8184af5")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "f", scope: !10, file: !10, line: 4, type: !11, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20060127-1.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "b3fc4813daf4f2bac77f20c8a8184af5")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 6, column: 8, scope: !9)
!14 = !DILocation(line: 6, column: 10, scope: !9)
!15 = !DILocation(line: 6, column: 26, scope: !9)
!16 = !DILocation(line: 7, column: 5, scope: !9)
!17 = !DILocation(line: 8, column: 1, scope: !9)
!18 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 13, type: !11, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0)
!19 = !DILocation(line: 15, column: 6, scope: !18)
!20 = !DILocation(line: 15, column: 3, scope: !18)
!21 = !DILocation(line: 16, column: 3, scope: !18)
