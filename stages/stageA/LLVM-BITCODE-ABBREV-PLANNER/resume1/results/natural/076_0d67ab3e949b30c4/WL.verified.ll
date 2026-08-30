; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\076_0d67ab3e949b30c4\WL.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr69403.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b = dso_local global i32 0, align 4
@a = dso_local global i32 0, align 4
@c = dso_local global i32 0, align 4

; Function Attrs: noinline nounwind optnone
define dso_local i32 @fn1() #0 !dbg !9 {
entry:
  %0 = load i32, ptr @b, align 4, !dbg !13
  %1 = load i32, ptr @a, align 4, !dbg !14
  %2 = load i32, ptr @a, align 4, !dbg !15
  %3 = load i32, ptr @c, align 4, !dbg !16
  %and = and i32 %2, %3, !dbg !17
  %cmp = icmp ne i32 %1, %and, !dbg !18
  %conv = zext i1 %cmp to i32, !dbg !18
  %or = or i32 %0, %conv, !dbg !19
  %cmp1 = icmp eq i32 %or, 1, !dbg !20
  br i1 %cmp1, label %if.then, label %if.end, !dbg !20

if.then:                                          ; preds = %entry
  call void @abort() #2, !dbg !21
  unreachable, !dbg !21

if.end:                                           ; preds = %entry
  ret i32 0, !dbg !22
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !23 {
entry:
  store i32 5, ptr @a, align 4, !dbg !24
  store i32 1, ptr @c, align 4, !dbg !25
  store i32 6, ptr @b, align 4, !dbg !26
  %call = call i32 @fn1() #3, !dbg !27
  ret i32 %call, !dbg !28
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noreturn nounwind "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin noreturn nounwind "no-builtins" }
attributes #3 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr69403.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "014d15d1eb4dd2bf07bd8b57292416e0")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "fn1", scope: !10, file: !10, line: 6, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr69403.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "014d15d1eb4dd2bf07bd8b57292416e0")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 8, column: 8, scope: !9)
!14 = !DILocation(line: 8, column: 13, scope: !9)
!15 = !DILocation(line: 8, column: 19, scope: !9)
!16 = !DILocation(line: 8, column: 23, scope: !9)
!17 = !DILocation(line: 8, column: 21, scope: !9)
!18 = !DILocation(line: 8, column: 15, scope: !9)
!19 = !DILocation(line: 8, column: 10, scope: !9)
!20 = !DILocation(line: 8, column: 28, scope: !9)
!21 = !DILocation(line: 9, column: 5, scope: !9)
!22 = !DILocation(line: 10, column: 3, scope: !9)
!23 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 14, type: !11, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!24 = !DILocation(line: 16, column: 5, scope: !23)
!25 = !DILocation(line: 17, column: 5, scope: !23)
!26 = !DILocation(line: 18, column: 5, scope: !23)
!27 = !DILocation(line: 19, column: 10, scope: !23)
!28 = !DILocation(line: 19, column: 3, scope: !23)
