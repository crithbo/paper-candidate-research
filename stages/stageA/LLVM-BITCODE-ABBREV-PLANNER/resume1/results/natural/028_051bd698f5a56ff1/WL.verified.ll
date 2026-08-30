; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\028_051bd698f5a56ff1\WL.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\lib\\strnlen.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone
define dso_local i64 @strnlen(ptr noundef %s, i64 noundef %n) #0 !dbg !9 {
entry:
  %s.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %i = alloca i64, align 8
  store ptr %s, ptr %s.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  store i64 0, ptr %i, align 8, !dbg !13
  br label %while.cond, !dbg !14

while.cond:                                       ; preds = %while.body, %entry
  %0 = load ptr, ptr %s.addr, align 8, !dbg !15
  %1 = load i64, ptr %i, align 8, !dbg !16
  %arrayidx = getelementptr inbounds nuw i8, ptr %0, i64 %1, !dbg !15
  %2 = load i8, ptr %arrayidx, align 1, !dbg !15
  %conv = sext i8 %2 to i32, !dbg !15
  %cmp = icmp ne i32 %conv, 0, !dbg !17
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !18

land.rhs:                                         ; preds = %while.cond
  %3 = load i64, ptr %n.addr, align 8, !dbg !19
  %dec = add i64 %3, -1, !dbg !19
  store i64 %dec, ptr %n.addr, align 8, !dbg !19
  %tobool = icmp ne i64 %3, 0, !dbg !18
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %4 = phi i1 [ false, %while.cond ], [ %tobool, %land.rhs ], !dbg !20
  br i1 %4, label %while.body, label %while.end, !dbg !14

while.body:                                       ; preds = %land.end
  %5 = load i64, ptr %i, align 8, !dbg !21
  %inc = add i64 %5, 1, !dbg !21
  store i64 %inc, ptr %i, align 8, !dbg !21
  br label %while.cond, !dbg !14, !llvm.loop !22

while.end:                                        ; preds = %land.end
  %6 = load i64, ptr %i, align 8, !dbg !24
  ret i64 %6, !dbg !25
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\lib\\strnlen.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "1619eaef179eb7769821867507a00cf2")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "strnlen", scope: !10, file: !10, line: 8, type: !11, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\lib\\strnlen.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "1619eaef179eb7769821867507a00cf2")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 17, column: 5, scope: !9)
!14 = !DILocation(line: 18, column: 3, scope: !9)
!15 = !DILocation(line: 18, column: 10, scope: !9)
!16 = !DILocation(line: 18, column: 12, scope: !9)
!17 = !DILocation(line: 18, column: 15, scope: !9)
!18 = !DILocation(line: 18, column: 20, scope: !9)
!19 = !DILocation(line: 18, column: 24, scope: !9)
!20 = !DILocation(line: 0, scope: !9)
!21 = !DILocation(line: 19, column: 6, scope: !9)
!22 = distinct !{!22, !14, !21, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = !DILocation(line: 21, column: 10, scope: !9)
!25 = !DILocation(line: 21, column: 3, scope: !9)
