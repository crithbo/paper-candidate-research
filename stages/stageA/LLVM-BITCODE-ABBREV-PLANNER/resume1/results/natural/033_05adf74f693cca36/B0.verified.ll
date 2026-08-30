; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\033_05adf74f693cca36\B0.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr60017.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i16, i16 }
%struct.S1 = type { i8, [2 x [2 x i8]], [2 x %struct.S0], [2 x i8] }

@x = dso_local global { i8, [2 x [2 x i8]], i8, [2 x %struct.S0], [2 x i8] } { i8 1, [2 x [2 x i8]] [[2 x i8] c"\02\03", [2 x i8] c"\04\05"], i8 0, [2 x %struct.S0] [%struct.S0 { i16 6, i16 7 }, %struct.S0 { i16 8, i16 9 }], [2 x i8] zeroinitializer }, align 4

; Function Attrs: noinline nounwind optnone
define dso_local { i64, i64 } @func() #0 !dbg !9 {
entry:
  %retval = alloca %struct.S1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %retval, ptr align 4 @x, i64 16, i1 false), !dbg !13
  %0 = load { i64, i64 }, ptr %retval, align 4, !dbg !14
  ret { i64, i64 } %0, !dbg !14
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !15 {
entry:
  %ret = alloca %struct.S1, align 4
  %call = call { i64, i64 } @func() #3, !dbg !16
  %0 = getelementptr inbounds nuw { i64, i64 }, ptr %ret, i32 0, i32 0, !dbg !16
  %1 = extractvalue { i64, i64 } %call, 0, !dbg !16
  store i64 %1, ptr %0, align 4, !dbg !16
  %2 = getelementptr inbounds nuw { i64, i64 }, ptr %ret, i32 0, i32 1, !dbg !16
  %3 = extractvalue { i64, i64 } %call, 1, !dbg !16
  store i64 %3, ptr %2, align 4, !dbg !16
  %m2 = getelementptr inbounds nuw %struct.S1, ptr %ret, i32 0, i32 2, !dbg !17
  %arrayidx = getelementptr inbounds [2 x %struct.S0], ptr %m2, i64 0, i64 1, !dbg !18
  %m1 = getelementptr inbounds nuw %struct.S0, ptr %arrayidx, i32 0, i32 1, !dbg !19
  %4 = load i16, ptr %m1, align 2, !dbg !19
  %conv = sext i16 %4 to i32, !dbg !18
  %cmp = icmp ne i32 %conv, 9, !dbg !20
  br i1 %cmp, label %if.then, label %if.end, !dbg !20

if.then:                                          ; preds = %entry
  call void @abort() #3, !dbg !21
  br label %if.end, !dbg !21

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !22
}

declare void @abort() #2

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr60017.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "00f4289039c3911c4b904297745cdc30")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "func", scope: !10, file: !10, line: 20, type: !11, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr60017.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "00f4289039c3911c4b904297745cdc30")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 22, column: 10, scope: !9)
!14 = !DILocation(line: 22, column: 3, scope: !9)
!15 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 25, type: !11, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!16 = !DILocation(line: 27, column: 19, scope: !15)
!17 = !DILocation(line: 29, column: 11, scope: !15)
!18 = !DILocation(line: 29, column: 7, scope: !15)
!19 = !DILocation(line: 29, column: 17, scope: !15)
!20 = !DILocation(line: 29, column: 20, scope: !15)
!21 = !DILocation(line: 30, column: 5, scope: !15)
!22 = !DILocation(line: 32, column: 3, scope: !15)
