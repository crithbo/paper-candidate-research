; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\032_059f8eccdd8e5a2c\B1.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr83298.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@c = dso_local global i32 1, align 4
@b = dso_local global i32 0, align 4
@a = dso_local global i32 0, align 4

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !9 {
entry:
  br label %for.cond, !dbg !13

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr @b, align 4, !dbg !14
  %cmp = icmp slt i32 %0, 1, !dbg !15
  br i1 %cmp, label %for.body, label %for.end, !dbg !13

for.body:                                         ; preds = %for.cond
  br label %for.inc, !dbg !13

for.inc:                                          ; preds = %for.body
  %1 = load i32, ptr @b, align 4, !dbg !16
  %inc = add nsw i32 %1, 1, !dbg !16
  store i32 %inc, ptr @b, align 4, !dbg !16
  br label %for.cond, !dbg !13, !llvm.loop !17

for.end:                                          ; preds = %for.cond
  %2 = load i32, ptr @c, align 4, !dbg !20
  %3 = load i32, ptr @a, align 4, !dbg !21
  %cmp1 = icmp slt i32 %3, 1, !dbg !22
  %conv = zext i1 %cmp1 to i32, !dbg !22
  %mul = mul nsw i32 %2, %conv, !dbg !23
  %tobool = icmp ne i32 %mul, 0, !dbg !23
  br i1 %tobool, label %if.end, label %if.then, !dbg !24

if.then:                                          ; preds = %for.end
  call void @abort() #2, !dbg !25
  unreachable, !dbg !25

if.end:                                           ; preds = %for.end
  ret i32 0, !dbg !26
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noreturn nounwind "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin noreturn nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr83298.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "f1433b457814fb3bbf683219ef78f328")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 4, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr83298.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "f1433b457814fb3bbf683219ef78f328")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 6, column: 3, scope: !9)
!14 = !DILocation(line: 6, column: 10, scope: !9)
!15 = !DILocation(line: 6, column: 12, scope: !9)
!16 = !DILocation(line: 6, column: 18, scope: !9)
!17 = distinct !{!17, !13, !18, !19}
!18 = !DILocation(line: 7, column: 5, scope: !9)
!19 = !{!"llvm.loop.mustprogress"}
!20 = !DILocation(line: 8, column: 9, scope: !9)
!21 = !DILocation(line: 8, column: 14, scope: !9)
!22 = !DILocation(line: 8, column: 16, scope: !9)
!23 = !DILocation(line: 8, column: 11, scope: !9)
!24 = !DILocation(line: 8, column: 7, scope: !9)
!25 = !DILocation(line: 9, column: 5, scope: !9)
!26 = !DILocation(line: 10, column: 3, scope: !9)
