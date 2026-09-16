; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\030_05391227259f6052\B0.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr28289.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@one = dso_local global i32 1, align 4

; Function Attrs: noinline nounwind optnone
define dso_local void @ix86_split_ashr(i32 noundef %mode) #0 !dbg !9 {
entry:
  %mode.addr = alloca i32, align 4
  store i32 %mode, ptr %mode.addr, align 4
  %0 = load i32, ptr %mode.addr, align 4, !dbg !13
  %cmp = icmp ne i32 %0, 0, !dbg !14
  %1 = zext i1 %cmp to i64, !dbg !13
  %cond = select i1 %cmp, ptr @ok, ptr @gen_x86_64_shrd, !dbg !13
  %call = call i32 %cond(i32 noundef 0) #2, !dbg !15
  ret void, !dbg !16
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @ok(i32 noundef %i) #0 !dbg !17 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  %0 = load i32, ptr %i.addr, align 4, !dbg !18
  call void (i32, ...) @exit(i32 noundef %0) #2, !dbg !19
  %1 = load i32, ptr %retval, align 4, !dbg !20
  ret i32 %1, !dbg !20
}

; Function Attrs: noinline nounwind optnone
define internal i32 @gen_x86_64_shrd(i32 noundef %a) #0 !dbg !21 {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, ptr %a.addr, align 4
  ret i32 0, !dbg !22
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !23 {
entry:
  %0 = load volatile i32, ptr @one, align 4, !dbg !24
  call void @ix86_split_ashr(i32 noundef %0) #2, !dbg !25
  ret i32 1, !dbg !26
}

declare void @exit(...) #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr28289.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "f41d8caa66b63ff232795983f577cb63")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "ix86_split_ashr", scope: !10, file: !10, line: 14, type: !11, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr28289.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "f41d8caa66b63ff232795983f577cb63")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 16, column: 12, scope: !9)
!14 = !DILocation(line: 16, column: 17, scope: !9)
!15 = !DILocation(line: 16, column: 11, scope: !9)
!16 = !DILocation(line: 19, column: 1, scope: !9)
!17 = distinct !DISubprogram(name: "ok", scope: !10, file: !10, line: 30, type: !11, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!18 = !DILocation(line: 32, column: 9, scope: !17)
!19 = !DILocation(line: 32, column: 3, scope: !17)
!20 = !DILocation(line: 33, column: 1, scope: !17)
!21 = distinct !DISubprogram(name: "gen_x86_64_shrd", scope: !10, file: !10, line: 5, type: !11, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!22 = !DILocation(line: 7, column: 3, scope: !21)
!23 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!24 = !DILocation(line: 25, column: 20, scope: !23)
!25 = !DILocation(line: 25, column: 3, scope: !23)
!26 = !DILocation(line: 26, column: 3, scope: !23)
