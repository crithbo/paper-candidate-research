; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\008_01cca450d017ee9f\WL.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20051110-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@bytes = dso_local global [5 x i8] zeroinitializer, align 1
@flag = dso_local global i32 0, align 4

; Function Attrs: noinline nounwind optnone
define dso_local void @add_unwind_adjustsp(i64 noundef %offset) #0 !dbg !9 {
entry:
  %offset.addr = alloca i64, align 8
  %n = alloca i32, align 4
  %o = alloca i64, align 8
  store i64 %offset, ptr %offset.addr, align 8
  %0 = load i64, ptr %offset.addr, align 8, !dbg !13
  %sub = sub nsw i64 %0, 516, !dbg !14
  %shr = ashr i64 %sub, 2, !dbg !15
  store i64 %shr, ptr %o, align 8, !dbg !16
  store i32 0, ptr %n, align 4, !dbg !17
  br label %do.body, !dbg !18

do.body:                                          ; preds = %do.cond, %entry
  br label %a, !dbg !19

a:                                                ; preds = %if.then7, %do.body
  %1 = load i64, ptr %o, align 8, !dbg !20
  %and = and i64 %1, 127, !dbg !21
  %conv = trunc i64 %and to i8, !dbg !20
  %2 = load i32, ptr %n, align 4, !dbg !22
  %idxprom = sext i32 %2 to i64, !dbg !23
  %arrayidx = getelementptr inbounds [5 x i8], ptr @bytes, i64 0, i64 %idxprom, !dbg !23
  store i8 %conv, ptr %arrayidx, align 1, !dbg !24
  %3 = load i64, ptr %o, align 8, !dbg !25
  %shr1 = lshr i64 %3, 7, !dbg !25
  store i64 %shr1, ptr %o, align 8, !dbg !25
  %4 = load i64, ptr %o, align 8, !dbg !26
  %tobool = icmp ne i64 %4, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end8, !dbg !26

if.then:                                          ; preds = %a
  %5 = load i32, ptr %n, align 4, !dbg !27
  %idxprom2 = sext i32 %5 to i64, !dbg !28
  %arrayidx3 = getelementptr inbounds [5 x i8], ptr @bytes, i64 0, i64 %idxprom2, !dbg !28
  %6 = load i8, ptr %arrayidx3, align 1, !dbg !29
  %conv4 = zext i8 %6 to i32, !dbg !29
  %or = or i32 %conv4, 128, !dbg !29
  %conv5 = trunc i32 %or to i8, !dbg !29
  store i8 %conv5, ptr %arrayidx3, align 1, !dbg !29
  %7 = load i32, ptr @flag, align 4, !dbg !30
  %tobool6 = icmp ne i32 %7, 0, !dbg !30
  br i1 %tobool6, label %if.then7, label %if.end, !dbg !30

if.then7:                                         ; preds = %if.then
  br label %a, !dbg !31

if.end:                                           ; preds = %if.then
  br label %if.end8, !dbg !32

if.end8:                                          ; preds = %if.end, %a
  %8 = load i32, ptr %n, align 4, !dbg !33
  %inc = add nsw i32 %8, 1, !dbg !33
  store i32 %inc, ptr %n, align 4, !dbg !33
  br label %do.cond, !dbg !34

do.cond:                                          ; preds = %if.end8
  %9 = load i64, ptr %o, align 8, !dbg !35
  %tobool9 = icmp ne i64 %9, 0, !dbg !34
  br i1 %tobool9, label %do.body, label %do.end, !dbg !34, !llvm.loop !36

do.end:                                           ; preds = %do.cond
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !40 {
entry:
  call void @add_unwind_adjustsp(i64 noundef 4132) #2, !dbg !41
  %0 = load i8, ptr @bytes, align 1, !dbg !42
  %conv = zext i8 %0 to i32, !dbg !42
  %cmp = icmp ne i32 %conv, 136, !dbg !43
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !44

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8, ptr getelementptr inbounds ([5 x i8], ptr @bytes, i64 0, i64 1), align 1, !dbg !45
  %conv2 = zext i8 %1 to i32, !dbg !45
  %cmp3 = icmp ne i32 %conv2, 7, !dbg !46
  br i1 %cmp3, label %if.then, label %if.end, !dbg !44

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() #2, !dbg !47
  br label %if.end, !dbg !47

if.end:                                           ; preds = %if.then, %lor.lhs.false
  ret i32 0, !dbg !48
}

declare void @abort() #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20051110-2.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "673cfebaff1bb2a84a28f228999d7029")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "add_unwind_adjustsp", scope: !10, file: !10, line: 9, type: !11, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20051110-2.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "673cfebaff1bb2a84a28f228999d7029")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 14, column: 16, scope: !9)
!14 = !DILocation(line: 14, column: 23, scope: !9)
!15 = !DILocation(line: 14, column: 32, scope: !9)
!16 = !DILocation(line: 14, column: 5, scope: !9)
!17 = !DILocation(line: 16, column: 5, scope: !9)
!18 = !DILocation(line: 17, column: 3, scope: !9)
!19 = !DILocation(line: 18, column: 5, scope: !9)
!20 = !DILocation(line: 20, column: 18, scope: !9)
!21 = !DILocation(line: 20, column: 20, scope: !9)
!22 = !DILocation(line: 20, column: 13, scope: !9)
!23 = !DILocation(line: 20, column: 7, scope: !9)
!24 = !DILocation(line: 20, column: 16, scope: !9)
!25 = !DILocation(line: 21, column: 9, scope: !9)
!26 = !DILocation(line: 22, column: 11, scope: !9)
!27 = !DILocation(line: 24, column: 10, scope: !9)
!28 = !DILocation(line: 24, column: 4, scope: !9)
!29 = !DILocation(line: 24, column: 13, scope: !9)
!30 = !DILocation(line: 25, column: 8, scope: !9)
!31 = !DILocation(line: 26, column: 6, scope: !9)
!32 = !DILocation(line: 27, column: 2, scope: !9)
!33 = !DILocation(line: 28, column: 8, scope: !9)
!34 = !DILocation(line: 29, column: 5, scope: !9)
!35 = !DILocation(line: 30, column: 10, scope: !9)
!36 = distinct !{!36, !18, !37, !38}
!37 = !DILocation(line: 30, column: 11, scope: !9)
!38 = !{!"llvm.loop.mustprogress"}
!39 = !DILocation(line: 31, column: 1, scope: !9)
!40 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 33, type: !11, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!41 = !DILocation(line: 35, column: 3, scope: !40)
!42 = !DILocation(line: 36, column: 7, scope: !40)
!43 = !DILocation(line: 36, column: 16, scope: !40)
!44 = !DILocation(line: 36, column: 24, scope: !40)
!45 = !DILocation(line: 36, column: 27, scope: !40)
!46 = !DILocation(line: 36, column: 36, scope: !40)
!47 = !DILocation(line: 37, column: 5, scope: !40)
!48 = !DILocation(line: 38, column: 3, scope: !40)
