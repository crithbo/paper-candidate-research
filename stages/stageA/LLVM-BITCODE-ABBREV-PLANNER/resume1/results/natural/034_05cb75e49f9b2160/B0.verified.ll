; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\034_05cb75e49f9b2160\B0.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\strchr-lib.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone
define dso_local ptr @strchr(ptr noundef %s, i32 noundef %c) #0 !dbg !9 {
entry:
  %retval = alloca ptr, align 8
  %s.addr = alloca ptr, align 8
  %c.addr = alloca i32, align 4
  store ptr %s, ptr %s.addr, align 8
  store i32 %c, ptr %c.addr, align 4
  br label %for.cond, !dbg !13

for.cond:                                         ; preds = %if.end6, %entry
  %0 = load ptr, ptr %s.addr, align 8, !dbg !14
  %1 = load i8, ptr %0, align 1, !dbg !15
  %conv = sext i8 %1 to i32, !dbg !15
  %2 = load i32, ptr %c.addr, align 4, !dbg !16
  %cmp = icmp eq i32 %conv, %2, !dbg !17
  br i1 %cmp, label %if.then, label %if.end, !dbg !17

if.then:                                          ; preds = %for.cond
  %3 = load ptr, ptr %s.addr, align 8, !dbg !18
  store ptr %3, ptr %retval, align 8, !dbg !19
  br label %return, !dbg !19

if.end:                                           ; preds = %for.cond
  %4 = load ptr, ptr %s.addr, align 8, !dbg !20
  %5 = load i8, ptr %4, align 1, !dbg !21
  %conv2 = sext i8 %5 to i32, !dbg !21
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !22
  br i1 %cmp3, label %if.then5, label %if.end6, !dbg !22

if.then5:                                         ; preds = %if.end
  store ptr null, ptr %retval, align 8, !dbg !23
  br label %return, !dbg !23

if.end6:                                          ; preds = %if.end
  %6 = load ptr, ptr %s.addr, align 8, !dbg !24
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %6, i32 1, !dbg !24
  store ptr %incdec.ptr, ptr %s.addr, align 8, !dbg !24
  br label %for.cond, !dbg !13, !llvm.loop !25

return:                                           ; preds = %if.then5, %if.then
  %7 = load ptr, ptr %retval, align 8, !dbg !27
  ret ptr %7, !dbg !27
}

; Function Attrs: noinline nounwind optnone
define dso_local ptr @index(ptr noundef %s, i32 noundef %c) #0 !dbg !28 {
entry:
  %s.addr = alloca ptr, align 8
  %c.addr = alloca i32, align 4
  store ptr %s, ptr %s.addr, align 8
  store i32 %c, ptr %c.addr, align 4
  %0 = load ptr, ptr %s.addr, align 8, !dbg !29
  %1 = load i32, ptr %c.addr, align 4, !dbg !30
  %call = call ptr @strchr(ptr noundef %0, i32 noundef %1) #1, !dbg !31
  ret ptr %call, !dbg !32
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\strchr-lib.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "27aaee9bc0f2fe01e856ee18bca1a8af")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "strchr", scope: !10, file: !10, line: 6, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\lib\\strchr.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "1979e4b17709dd194ce3560585965849")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 13, column: 3, scope: !9)
!14 = !DILocation(line: 15, column: 12, scope: !9)
!15 = !DILocation(line: 15, column: 11, scope: !9)
!16 = !DILocation(line: 15, column: 17, scope: !9)
!17 = !DILocation(line: 15, column: 14, scope: !9)
!18 = !DILocation(line: 16, column: 18, scope: !9)
!19 = !DILocation(line: 16, column: 2, scope: !9)
!20 = !DILocation(line: 17, column: 12, scope: !9)
!21 = !DILocation(line: 17, column: 11, scope: !9)
!22 = !DILocation(line: 17, column: 14, scope: !9)
!23 = !DILocation(line: 18, column: 2, scope: !9)
!24 = !DILocation(line: 19, column: 8, scope: !9)
!25 = distinct !{!25, !13, !26}
!26 = !DILocation(line: 20, column: 5, scope: !9)
!27 = !DILocation(line: 21, column: 1, scope: !9)
!28 = distinct !DISubprogram(name: "index", scope: !10, file: !10, line: 25, type: !11, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!29 = !DILocation(line: 27, column: 18, scope: !28)
!30 = !DILocation(line: 27, column: 21, scope: !28)
!31 = !DILocation(line: 27, column: 10, scope: !28)
!32 = !DILocation(line: 27, column: 3, scope: !28)
