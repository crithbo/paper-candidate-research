; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\029_051ec3de2275d347\B2.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr36691.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = dso_local global i8 0, align 1

; Function Attrs: noinline nounwind optnone
define dso_local void @func_1() #0 !dbg !9 {
entry:
  store i8 9, ptr @g_5, align 1, !dbg !13
  br label %for.cond, !dbg !14

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8, ptr @g_5, align 1, !dbg !15
  %conv = zext i8 %0 to i32, !dbg !15
  %cmp = icmp sge i32 %conv, 4, !dbg !16
  br i1 %cmp, label %for.body, label %for.end, !dbg !17

for.body:                                         ; preds = %for.cond
  br label %for.inc, !dbg !17

for.inc:                                          ; preds = %for.body
  %1 = load i8, ptr @g_5, align 1, !dbg !18
  %conv2 = zext i8 %1 to i32, !dbg !18
  %sub = sub nsw i32 %conv2, 5, !dbg !18
  %conv3 = trunc i32 %sub to i8, !dbg !18
  store i8 %conv3, ptr @g_5, align 1, !dbg !18
  br label %for.cond, !dbg !17, !llvm.loop !19

for.end:                                          ; preds = %for.cond
  ret void, !dbg !22
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !23 {
entry:
  call void @func_1() #2, !dbg !24
  %0 = load i8, ptr @g_5, align 1, !dbg !25
  %conv = zext i8 %0 to i32, !dbg !25
  %cmp = icmp ne i32 %conv, 0, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @abort() #2, !dbg !27
  br label %if.end, !dbg !27

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !28
}

declare void @abort() #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr36691.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "a438604109889aabfc809f39ba77601a")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "func_1", scope: !10, file: !10, line: 3, type: !11, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr36691.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "a438604109889aabfc809f39ba77601a")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 5, column: 12, scope: !9)
!14 = !DILocation(line: 5, column: 8, scope: !9)
!15 = !DILocation(line: 5, column: 17, scope: !9)
!16 = !DILocation(line: 5, column: 21, scope: !9)
!17 = !DILocation(line: 5, column: 3, scope: !9)
!18 = !DILocation(line: 5, column: 31, scope: !9)
!19 = distinct !{!19, !17, !20, !21}
!20 = !DILocation(line: 6, column: 5, scope: !9)
!21 = !{!"llvm.loop.mustprogress"}
!22 = !DILocation(line: 7, column: 1, scope: !9)
!23 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 10, type: !11, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!24 = !DILocation(line: 12, column: 3, scope: !23)
!25 = !DILocation(line: 13, column: 7, scope: !23)
!26 = !DILocation(line: 13, column: 11, scope: !23)
!27 = !DILocation(line: 14, column: 5, scope: !23)
!28 = !DILocation(line: 15, column: 3, scope: !23)
