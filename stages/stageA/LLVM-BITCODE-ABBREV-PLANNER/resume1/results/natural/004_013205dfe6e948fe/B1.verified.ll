; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\004_013205dfe6e948fe\B1.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20100209-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @bar(i32 noundef %foo) #0 !dbg !9 {
entry:
  %foo.addr = alloca i32, align 4
  store i32 %foo, ptr %foo.addr, align 4
  %0 = load i32, ptr %foo.addr, align 4, !dbg !13
  %conv = sext i32 %0 to i64, !dbg !14
  %div = udiv i64 %conv, 8, !dbg !15
  %conv1 = trunc i64 %div to i32, !dbg !16
  ret i32 %conv1, !dbg !17
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !18 {
entry:
  %call = call i32 @bar(i32 noundef -1) #2, !dbg !19
  %cmp = icmp ne i32 %call, -1, !dbg !20
  br i1 %cmp, label %if.then, label %if.end, !dbg !21

if.then:                                          ; preds = %entry
  call void @abort() #2, !dbg !22
  br label %if.end, !dbg !22

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !23
}

declare void @abort() #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20100209-1.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "27aeeeb89a91b17af98d81bf871d2aac")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "bar", scope: !10, file: !10, line: 1, type: !11, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20100209-1.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "27aeeeb89a91b17af98d81bf871d2aac")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 3, column: 48, scope: !9)
!14 = !DILocation(line: 3, column: 37, scope: !9)
!15 = !DILocation(line: 3, column: 53, scope: !9)
!16 = !DILocation(line: 3, column: 10, scope: !9)
!17 = !DILocation(line: 3, column: 3, scope: !9)
!18 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 6, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0)
!19 = !DILocation(line: 9, column: 10, scope: !18)
!20 = !DILocation(line: 9, column: 18, scope: !18)
!21 = !DILocation(line: 9, column: 7, scope: !18)
!22 = !DILocation(line: 10, column: 5, scope: !18)
!23 = !DILocation(line: 11, column: 3, scope: !18)
