; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\056_09fdfc248e8a7197\B0.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20001108-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone
define dso_local i64 @signed_poly(i64 noundef %sum, i64 noundef %x) #0 !dbg !9 {
entry:
  %sum.addr = alloca i64, align 8
  %x.addr = alloca i64, align 8
  store i64 %sum, ptr %sum.addr, align 8
  store i64 %x, ptr %x.addr, align 8
  %0 = load i64, ptr %sum.addr, align 8, !dbg !13
  %1 = load i64, ptr %x.addr, align 8, !dbg !14
  %mul = mul nsw i64 %0, %1, !dbg !15
  %2 = load i64, ptr %sum.addr, align 8, !dbg !16
  %add = add nsw i64 %2, %mul, !dbg !16
  store i64 %add, ptr %sum.addr, align 8, !dbg !16
  %3 = load i64, ptr %sum.addr, align 8, !dbg !17
  ret i64 %3, !dbg !18
}

; Function Attrs: noinline nounwind optnone
define dso_local i64 @unsigned_poly(i64 noundef %sum, i64 noundef %x) #0 !dbg !19 {
entry:
  %sum.addr = alloca i64, align 8
  %x.addr = alloca i64, align 8
  store i64 %sum, ptr %sum.addr, align 8
  store i64 %x, ptr %x.addr, align 8
  %0 = load i64, ptr %sum.addr, align 8, !dbg !20
  %1 = load i64, ptr %x.addr, align 8, !dbg !21
  %mul = mul i64 %0, %1, !dbg !22
  %2 = load i64, ptr %sum.addr, align 8, !dbg !23
  %add = add i64 %2, %mul, !dbg !23
  store i64 %add, ptr %sum.addr, align 8, !dbg !23
  %3 = load i64, ptr %sum.addr, align 8, !dbg !24
  ret i64 %3, !dbg !25
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !26 {
entry:
  %retval = alloca i32, align 4
  %call = call i64 @signed_poly(i64 noundef 2, i64 noundef -3) #2, !dbg !27
  %cmp = icmp ne i64 %call, -4, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %call1 = call i32 (...) @abort() #2, !dbg !29
  br label %if.end, !dbg !29

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i64 @unsigned_poly(i64 noundef 2, i64 noundef 3) #2, !dbg !30
  %cmp3 = icmp ne i64 %call2, 8, !dbg !31
  br i1 %cmp3, label %if.then4, label %if.end6, !dbg !31

if.then4:                                         ; preds = %if.end
  %call5 = call i32 (...) @abort() #2, !dbg !32
  br label %if.end6, !dbg !32

if.end6:                                          ; preds = %if.then4, %if.end
  %call7 = call i32 (i32, ...) @exit(i32 noundef 0) #2, !dbg !33
  %0 = load i32, ptr %retval, align 4, !dbg !34
  ret i32 %0, !dbg !34
}

declare i32 @abort(...) #1

declare i32 @exit(...) #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20001108-1.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "ec6039fd668fa0f49e887ce420c82b4e")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "signed_poly", scope: !10, file: !10, line: 2, type: !11, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20001108-1.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "ec6039fd668fa0f49e887ce420c82b4e")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 4, column: 29, scope: !9)
!14 = !DILocation(line: 4, column: 47, scope: !9)
!15 = !DILocation(line: 4, column: 33, scope: !9)
!16 = !DILocation(line: 4, column: 7, scope: !9)
!17 = !DILocation(line: 5, column: 10, scope: !9)
!18 = !DILocation(line: 5, column: 3, scope: !9)
!19 = distinct !DISubprogram(name: "unsigned_poly", scope: !10, file: !10, line: 9, type: !11, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!20 = !DILocation(line: 11, column: 47, scope: !19)
!21 = !DILocation(line: 11, column: 74, scope: !19)
!22 = !DILocation(line: 11, column: 51, scope: !19)
!23 = !DILocation(line: 11, column: 7, scope: !19)
!24 = !DILocation(line: 12, column: 10, scope: !19)
!25 = !DILocation(line: 12, column: 3, scope: !19)
!26 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 16, type: !11, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!27 = !DILocation(line: 18, column: 7, scope: !26)
!28 = !DILocation(line: 18, column: 29, scope: !26)
!29 = !DILocation(line: 19, column: 5, scope: !26)
!30 = !DILocation(line: 21, column: 7, scope: !26)
!31 = !DILocation(line: 21, column: 31, scope: !26)
!32 = !DILocation(line: 22, column: 5, scope: !26)
!33 = !DILocation(line: 24, column: 3, scope: !26)
!34 = !DILocation(line: 25, column: 1, scope: !26)
