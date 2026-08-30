; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\055_09cffa2a6e58f4dd\WL.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr58726.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.anon = type { i32 }

@a = dso_local global i32 0, align 4
@b = dso_local global %union.anon zeroinitializer, align 4
@c = dso_local global i32 0, align 4

; Function Attrs: noinline nounwind optnone
define dso_local signext i16 @foo(i16 noundef signext %p) #0 !dbg !9 {
entry:
  %p.addr = alloca i16, align 2
  store i16 %p, ptr %p.addr, align 2
  %0 = load i16, ptr %p.addr, align 2, !dbg !13
  %conv = sext i16 %0 to i32, !dbg !13
  %cmp = icmp slt i32 %conv, 0, !dbg !14
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !13

cond.true:                                        ; preds = %entry
  %1 = load i16, ptr %p.addr, align 2, !dbg !15
  %conv2 = sext i16 %1 to i32, !dbg !15
  br label %cond.end, !dbg !13

cond.false:                                       ; preds = %entry
  %2 = load i32, ptr @a, align 4, !dbg !16
  br label %cond.end, !dbg !13

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv2, %cond.true ], [ %2, %cond.false ], !dbg !13
  %conv3 = trunc i32 %cond to i16, !dbg !13
  ret i16 %conv3, !dbg !17
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !18 {
entry:
  %d = alloca i16, align 2
  %e = alloca i32, align 4
  store i32 56374, ptr @b, align 4, !dbg !19
  %bf.load = load i8, ptr @b, align 4, !dbg !20
  %bf.shl = shl i8 %bf.load, 7, !dbg !20
  %bf.ashr = ashr i8 %bf.shl, 7, !dbg !20
  %bf.cast = sext i8 %bf.ashr to i32, !dbg !20
  store i32 %bf.cast, ptr %e, align 4, !dbg !21
  %0 = load i32, ptr %e, align 4, !dbg !22
  %cmp = icmp eq i32 %0, 0, !dbg !23
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !22

cond.true:                                        ; preds = %entry
  %1 = load i32, ptr @b, align 4, !dbg !24
  br label %cond.end, !dbg !22

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !22

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ 0, %cond.false ], !dbg !22
  %conv = trunc i32 %cond to i16, !dbg !22
  store i16 %conv, ptr %d, align 2, !dbg !25
  %2 = load i16, ptr %d, align 2, !dbg !26
  %call = call signext i16 @foo(i16 noundef signext %2) #2, !dbg !27
  %conv1 = sext i16 %call to i32, !dbg !27
  store i32 %conv1, ptr @c, align 4, !dbg !28
  %3 = load i32, ptr @c, align 4, !dbg !29
  %cmp2 = icmp ne i32 %3, -9162, !dbg !30
  br i1 %cmp2, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %cond.end
  call void @abort() #3, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %cond.end
  ret i32 0, !dbg !32
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noreturn nounwind "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin "no-builtins" }
attributes #3 = { nobuiltin noreturn nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr58726.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "6c61be9faf45f2289bfe4e72534b3b67")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 7, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr58726.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "6c61be9faf45f2289bfe4e72534b3b67")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 9, column: 10, scope: !9)
!14 = !DILocation(line: 9, column: 12, scope: !9)
!15 = !DILocation(line: 9, column: 18, scope: !9)
!16 = !DILocation(line: 9, column: 22, scope: !9)
!17 = !DILocation(line: 9, column: 3, scope: !9)
!18 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 13, type: !11, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0)
!19 = !DILocation(line: 18, column: 8, scope: !18)
!20 = !DILocation(line: 20, column: 13, scope: !18)
!21 = !DILocation(line: 20, column: 7, scope: !18)
!22 = !DILocation(line: 21, column: 7, scope: !18)
!23 = !DILocation(line: 21, column: 9, scope: !18)
!24 = !DILocation(line: 21, column: 18, scope: !18)
!25 = !DILocation(line: 21, column: 5, scope: !18)
!26 = !DILocation(line: 22, column: 12, scope: !18)
!27 = !DILocation(line: 22, column: 7, scope: !18)
!28 = !DILocation(line: 22, column: 5, scope: !18)
!29 = !DILocation(line: 23, column: 7, scope: !18)
!30 = !DILocation(line: 23, column: 9, scope: !18)
!31 = !DILocation(line: 24, column: 5, scope: !18)
!32 = !DILocation(line: 25, column: 3, scope: !18)
