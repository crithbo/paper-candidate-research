; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\098_11dcfe32baf147ac\B1.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr38422.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32 }

@s = dso_local global %struct.S zeroinitializer, align 4

; Function Attrs: noinline nounwind optnone
define dso_local void @foo() #0 !dbg !9 {
entry:
  %bf.load = load i32, ptr @s, align 4, !dbg !13
  %bf.shl = shl i32 %bf.load, 2, !dbg !13
  %bf.ashr = ashr i32 %bf.shl, 2, !dbg !13
  %mul = mul nsw i32 %bf.ashr, 2, !dbg !13
  %bf.load1 = load i32, ptr @s, align 4, !dbg !13
  %bf.value = and i32 %mul, 1073741823, !dbg !13
  %bf.clear = and i32 %bf.load1, -1073741824, !dbg !13
  %bf.set = or i32 %bf.clear, %bf.value, !dbg !13
  store i32 %bf.set, ptr @s, align 4, !dbg !13
  %bf.result.shl = shl i32 %bf.value, 2, !dbg !13
  %bf.result.ashr = ashr i32 %bf.result.shl, 2, !dbg !13
  ret void, !dbg !14
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !15 {
entry:
  %bf.load = load i32, ptr @s, align 4, !dbg !16
  %bf.clear = and i32 %bf.load, -1073741824, !dbg !16
  %bf.set = or i32 %bf.clear, 24, !dbg !16
  store i32 %bf.set, ptr @s, align 4, !dbg !16
  call void @foo() #2, !dbg !17
  %bf.load1 = load i32, ptr @s, align 4, !dbg !18
  %bf.shl = shl i32 %bf.load1, 2, !dbg !18
  %bf.ashr = ashr i32 %bf.shl, 2, !dbg !18
  %cmp = icmp ne i32 %bf.ashr, 48, !dbg !19
  br i1 %cmp, label %if.then, label %if.end, !dbg !19

if.then:                                          ; preds = %entry
  call void @abort() #2, !dbg !20
  br label %if.end, !dbg !20

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !21
}

declare void @abort() #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr38422.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "f7f3243f94a8f9a130ba68f40d2354a6")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 11, type: !11, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr38422.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "f7f3243f94a8f9a130ba68f40d2354a6")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 13, column: 7, scope: !9)
!14 = !DILocation(line: 14, column: 1, scope: !9)
!15 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 17, type: !11, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !0)
!16 = !DILocation(line: 19, column: 7, scope: !15)
!17 = !DILocation(line: 20, column: 3, scope: !15)
!18 = !DILocation(line: 21, column: 9, scope: !15)
!19 = !DILocation(line: 21, column: 11, scope: !15)
!20 = !DILocation(line: 22, column: 5, scope: !15)
!21 = !DILocation(line: 23, column: 3, scope: !15)
