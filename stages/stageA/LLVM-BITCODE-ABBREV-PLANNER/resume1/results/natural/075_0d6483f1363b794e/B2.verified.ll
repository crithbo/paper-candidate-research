; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\075_0d6483f1363b794e\B2.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr65053-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = dso_local global i32 0, align 4
@i = dso_local global i32 0, align 4

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %n = alloca i32, align 4
  %u = alloca i32, align 4
  %0 = load i32, ptr @x, align 4, !dbg !13
  call void asm sideeffect "", "=*imr,0,~{dirflag},~{fpsr},~{flags}"(ptr elementtype(i32) @x, i32 %0) #2, !dbg !13, !srcloc !14
  %1 = load i32, ptr @x, align 4, !dbg !15
  store i32 %1, ptr %n, align 4, !dbg !16
  store i32 32, ptr %u, align 4, !dbg !17
  %2 = load i32, ptr %n, align 4, !dbg !18
  %cmp = icmp uge i32 %2, 32, !dbg !19
  br i1 %cmp, label %if.then, label %if.end, !dbg !19

if.then:                                          ; preds = %entry
  call void @abort() #3, !dbg !20
  unreachable, !dbg !20

if.end:                                           ; preds = %entry
  %3 = load i32, ptr %n, align 4, !dbg !21
  %cmp1 = icmp ne i32 %3, 0, !dbg !22
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !22

if.then2:                                         ; preds = %if.end
  %4 = load i32, ptr %n, align 4, !dbg !23
  %add = add i32 %4, 32, !dbg !24
  store i32 %add, ptr %u, align 4, !dbg !25
  br label %if.end3, !dbg !26

if.end3:                                          ; preds = %if.then2, %if.end
  br label %while.cond, !dbg !27

while.cond:                                       ; preds = %while.body, %if.end3
  %5 = load i32, ptr %u, align 4, !dbg !28
  %cmp4 = icmp ne i32 %5, 32, !dbg !29
  br i1 %cmp4, label %while.body, label %while.end, !dbg !27

while.body:                                       ; preds = %while.cond
  %6 = load i32, ptr %u, align 4, !dbg !30
  call void asm sideeffect "", "imr,~{dirflag},~{fpsr},~{flags}"(i32 %6) #2, !dbg !31, !srcloc !32
  store i32 32, ptr %u, align 4, !dbg !33
  store i32 1, ptr @i, align 4, !dbg !34
  br label %while.cond, !dbg !27, !llvm.loop !35

while.end:                                        ; preds = %while.cond
  %7 = load i32, ptr @i, align 4, !dbg !38
  %tobool = icmp ne i32 %7, 0, !dbg !38
  br i1 %tobool, label %if.then5, label %if.end6, !dbg !38

if.then5:                                         ; preds = %while.end
  call void @abort() #3, !dbg !39
  unreachable, !dbg !39

if.end6:                                          ; preds = %while.end
  ret i32 0, !dbg !40
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noreturn nounwind "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }
attributes #3 = { nobuiltin noreturn nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr65053-2.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "91c7652f9c9c874f6266092953349857")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr65053-2.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "91c7652f9c9c874f6266092953349857")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 9, column: 3, scope: !9)
!14 = !{i64 90}
!15 = !DILocation(line: 10, column: 20, scope: !9)
!16 = !DILocation(line: 10, column: 16, scope: !9)
!17 = !DILocation(line: 11, column: 16, scope: !9)
!18 = !DILocation(line: 12, column: 7, scope: !9)
!19 = !DILocation(line: 12, column: 9, scope: !9)
!20 = !DILocation(line: 13, column: 5, scope: !9)
!21 = !DILocation(line: 14, column: 7, scope: !9)
!22 = !DILocation(line: 14, column: 9, scope: !9)
!23 = !DILocation(line: 15, column: 9, scope: !9)
!24 = !DILocation(line: 15, column: 11, scope: !9)
!25 = !DILocation(line: 15, column: 7, scope: !9)
!26 = !DILocation(line: 15, column: 5, scope: !9)
!27 = !DILocation(line: 17, column: 3, scope: !9)
!28 = !DILocation(line: 17, column: 10, scope: !9)
!29 = !DILocation(line: 17, column: 12, scope: !9)
!30 = !DILocation(line: 19, column: 24, scope: !9)
!31 = !DILocation(line: 19, column: 7, scope: !9)
!32 = !{i64 256}
!33 = !DILocation(line: 20, column: 9, scope: !9)
!34 = !DILocation(line: 21, column: 9, scope: !9)
!35 = distinct !{!35, !27, !36, !37}
!36 = !DILocation(line: 22, column: 5, scope: !9)
!37 = !{!"llvm.loop.mustprogress"}
!38 = !DILocation(line: 24, column: 7, scope: !9)
!39 = !DILocation(line: 25, column: 5, scope: !9)
!40 = !DILocation(line: 26, column: 3, scope: !9)
