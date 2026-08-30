; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\005_0133f3c9b426f610\WL.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\UnitTests\\2003-05-31-LongShifts.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i64, i32 }

@.str = private unnamed_addr constant [15 x i8] c"0x%llx op %d:\0A\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c"  ashr: 0x%llx\0A  lshr: 0x%llx\0A  shl: 0x%llx\0A\00", align 1
@Vals = dso_local global [8 x { i64, i32, [4 x i8] }] [{ i64, i32, [4 x i8] } { i64 123, i32 4, [4 x i8] zeroinitializer }, { i64, i32, [4 x i8] } { i64 123, i32 34, [4 x i8] zeroinitializer }, { i64, i32, [4 x i8] } { i64 -4, i32 4, [4 x i8] zeroinitializer }, { i64, i32, [4 x i8] } { i64 -5, i32 34, [4 x i8] zeroinitializer }, { i64, i32, [4 x i8] } { i64 -6000000000, i32 4, [4 x i8] zeroinitializer }, { i64, i32, [4 x i8] } { i64 -6000000000, i32 34, [4 x i8] zeroinitializer }, { i64, i32, [4 x i8] } { i64 6000000000, i32 4, [4 x i8] zeroinitializer }, { i64, i32, [4 x i8] } { i64 6000000000, i32 34, [4 x i8] zeroinitializer }], align 16

; Function Attrs: noinline nounwind optnone
define dso_local void @Test(i64 noundef %Val, i32 noundef %Amt) #0 !dbg !9 {
entry:
  %Val.addr = alloca i64, align 8
  %Amt.addr = alloca i32, align 4
  store i64 %Val, ptr %Val.addr, align 8
  store i32 %Amt, ptr %Amt.addr, align 4
  %0 = load i64, ptr %Val.addr, align 8, !dbg !13
  %1 = load i32, ptr %Amt.addr, align 4, !dbg !14
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str, i64 noundef %0, i32 noundef %1) #2, !dbg !15
  %2 = load i64, ptr %Val.addr, align 8, !dbg !16
  %3 = load i32, ptr %Amt.addr, align 4, !dbg !17
  %sh_prom = zext i32 %3 to i64, !dbg !18
  %shr = ashr i64 %2, %sh_prom, !dbg !18
  %4 = load i64, ptr %Val.addr, align 8, !dbg !19
  %5 = load i32, ptr %Amt.addr, align 4, !dbg !20
  %sh_prom1 = zext i32 %5 to i64, !dbg !21
  %shr2 = lshr i64 %4, %sh_prom1, !dbg !21
  %6 = load i64, ptr %Val.addr, align 8, !dbg !22
  %7 = load i32, ptr %Amt.addr, align 4, !dbg !23
  %sh_prom3 = zext i32 %7 to i64, !dbg !24
  %shl = shl i64 %6, %sh_prom3, !dbg !24
  %call4 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i64 noundef %shr, i64 noundef %shr2, i64 noundef %shl) #2, !dbg !25
  ret void, !dbg !26
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 !dbg !27 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  store i32 %argc, ptr %argc.addr, align 4
  store ptr %argv, ptr %argv.addr, align 8
  %0 = load i32, ptr %argc.addr, align 4, !dbg !28
  %dec = add nsw i32 %0, -1, !dbg !28
  store i32 %dec, ptr %argc.addr, align 4, !dbg !28
  br label %for.cond, !dbg !29

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, ptr %argc.addr, align 4, !dbg !30
  %conv = sext i32 %1 to i64, !dbg !30
  %cmp = icmp ult i64 %conv, 8, !dbg !31
  br i1 %cmp, label %for.body, label %for.end, !dbg !32

for.body:                                         ; preds = %for.cond
  %2 = load i32, ptr %argc.addr, align 4, !dbg !33
  %idxprom = sext i32 %2 to i64, !dbg !34
  %arrayidx = getelementptr inbounds [8 x %struct.anon], ptr @Vals, i64 0, i64 %idxprom, !dbg !34
  %A = getelementptr inbounds nuw %struct.anon, ptr %arrayidx, i32 0, i32 0, !dbg !35
  %3 = load volatile i64, ptr %A, align 16, !dbg !35
  %4 = load i32, ptr %argc.addr, align 4, !dbg !36
  %idxprom2 = sext i32 %4 to i64, !dbg !37
  %arrayidx3 = getelementptr inbounds [8 x %struct.anon], ptr @Vals, i64 0, i64 %idxprom2, !dbg !37
  %V = getelementptr inbounds nuw %struct.anon, ptr %arrayidx3, i32 0, i32 1, !dbg !38
  %5 = load volatile i32, ptr %V, align 8, !dbg !38
  call void @Test(i64 noundef %3, i32 noundef %5) #2, !dbg !39
  br label %for.inc, !dbg !39

for.inc:                                          ; preds = %for.body
  %6 = load i32, ptr %argc.addr, align 4, !dbg !40
  %inc = add nsw i32 %6, 1, !dbg !40
  store i32 %inc, ptr %argc.addr, align 4, !dbg !40
  br label %for.cond, !dbg !32, !llvm.loop !41

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !44
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\UnitTests\\2003-05-31-LongShifts.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "e1a8f3afe1f60018f4ef0f5c4c3b3305")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "Test", scope: !10, file: !10, line: 3, type: !11, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\UnitTests\\2003-05-31-LongShifts.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "e1a8f3afe1f60018f4ef0f5c4c3b3305")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 4, column: 29, scope: !9)
!14 = !DILocation(line: 4, column: 34, scope: !9)
!15 = !DILocation(line: 4, column: 3, scope: !9)
!16 = !DILocation(line: 5, column: 61, scope: !9)
!17 = !DILocation(line: 5, column: 68, scope: !9)
!18 = !DILocation(line: 5, column: 65, scope: !9)
!19 = !DILocation(line: 6, column: 30, scope: !9)
!20 = !DILocation(line: 6, column: 37, scope: !9)
!21 = !DILocation(line: 6, column: 34, scope: !9)
!22 = !DILocation(line: 6, column: 42, scope: !9)
!23 = !DILocation(line: 6, column: 49, scope: !9)
!24 = !DILocation(line: 6, column: 46, scope: !9)
!25 = !DILocation(line: 5, column: 3, scope: !9)
!26 = !DILocation(line: 7, column: 1, scope: !9)
!27 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 22, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!28 = !DILocation(line: 23, column: 12, scope: !27)
!29 = !DILocation(line: 23, column: 8, scope: !27)
!30 = !DILocation(line: 23, column: 16, scope: !27)
!31 = !DILocation(line: 23, column: 21, scope: !27)
!32 = !DILocation(line: 23, column: 3, scope: !27)
!33 = !DILocation(line: 24, column: 15, scope: !27)
!34 = !DILocation(line: 24, column: 10, scope: !27)
!35 = !DILocation(line: 24, column: 21, scope: !27)
!36 = !DILocation(line: 24, column: 29, scope: !27)
!37 = !DILocation(line: 24, column: 24, scope: !27)
!38 = !DILocation(line: 24, column: 35, scope: !27)
!39 = !DILocation(line: 24, column: 5, scope: !27)
!40 = !DILocation(line: 23, column: 53, scope: !27)
!41 = distinct !{!41, !32, !42, !43}
!42 = !DILocation(line: 24, column: 36, scope: !27)
!43 = !{!"llvm.loop.mustprogress"}
!44 = !DILocation(line: 25, column: 3, scope: !27)
