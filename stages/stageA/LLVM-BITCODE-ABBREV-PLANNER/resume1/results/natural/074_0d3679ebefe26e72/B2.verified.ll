; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\074_0d3679ebefe26e72\B2.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20021011-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@buf = dso_local global [64 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [9 x i8] c"mystring\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %i = alloca i32, align 4
  %call = call ptr @strcpy(ptr noundef @buf, ptr noundef @.str) #3, !dbg !13
  %call1 = call i32 @strcmp(ptr noundef @buf, ptr noundef @.str) #3, !dbg !14
  %cmp = icmp ne i32 %call1, 0, !dbg !15
  br i1 %cmp, label %if.then, label %if.end, !dbg !15

if.then:                                          ; preds = %entry
  call void @abort() #4, !dbg !16
  br label %if.end, !dbg !16

if.end:                                           ; preds = %if.then, %entry
  store i32 0, ptr %i, align 4, !dbg !17
  br label %for.cond, !dbg !18

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i32, ptr %i, align 4, !dbg !19
  %cmp2 = icmp slt i32 %0, 16, !dbg !20
  br i1 %cmp2, label %for.body, label %for.end, !dbg !21

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %i, align 4, !dbg !22
  %idx.ext = sext i32 %1 to i64, !dbg !23
  %add.ptr = getelementptr inbounds i8, ptr @buf, i64 %idx.ext, !dbg !23
  %call3 = call ptr @strcpy(ptr noundef %add.ptr, ptr noundef @.str) #3, !dbg !24
  %2 = load i32, ptr %i, align 4, !dbg !25
  %idx.ext4 = sext i32 %2 to i64, !dbg !26
  %add.ptr5 = getelementptr inbounds i8, ptr @buf, i64 %idx.ext4, !dbg !26
  %call6 = call i32 @strcmp(ptr noundef %add.ptr5, ptr noundef @.str) #3, !dbg !27
  %cmp7 = icmp ne i32 %call6, 0, !dbg !28
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !28

if.then8:                                         ; preds = %for.body
  call void @abort() #4, !dbg !29
  br label %if.end9, !dbg !29

if.end9:                                          ; preds = %if.then8, %for.body
  br label %for.inc, !dbg !30

for.inc:                                          ; preds = %if.end9
  %3 = load i32, ptr %i, align 4, !dbg !31
  %inc = add nsw i32 %3, 1, !dbg !31
  store i32 %inc, ptr %i, align 4, !dbg !31
  br label %for.cond, !dbg !21, !llvm.loop !32

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !34
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare i32 @strcmp(ptr noundef, ptr noundef) #1

declare void @abort() #2

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind "no-builtins" }
attributes #4 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20021011-1.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "261d43fcca6d53c738fe34bdf1595eb9")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20021011-1.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "261d43fcca6d53c738fe34bdf1595eb9")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 12, column: 3, scope: !9)
!14 = !DILocation(line: 13, column: 7, scope: !9)
!15 = !DILocation(line: 13, column: 42, scope: !9)
!16 = !DILocation(line: 14, column: 5, scope: !9)
!17 = !DILocation(line: 16, column: 10, scope: !9)
!18 = !DILocation(line: 16, column: 8, scope: !9)
!19 = !DILocation(line: 16, column: 15, scope: !9)
!20 = !DILocation(line: 16, column: 17, scope: !9)
!21 = !DILocation(line: 16, column: 3, scope: !9)
!22 = !DILocation(line: 18, column: 31, scope: !9)
!23 = !DILocation(line: 18, column: 29, scope: !9)
!24 = !DILocation(line: 18, column: 7, scope: !9)
!25 = !DILocation(line: 19, column: 35, scope: !9)
!26 = !DILocation(line: 19, column: 33, scope: !9)
!27 = !DILocation(line: 19, column: 11, scope: !9)
!28 = !DILocation(line: 19, column: 50, scope: !9)
!29 = !DILocation(line: 20, column: 2, scope: !9)
!30 = !DILocation(line: 21, column: 5, scope: !9)
!31 = !DILocation(line: 16, column: 23, scope: !9)
!32 = distinct !{!32, !21, !30, !33}
!33 = !{!"llvm.loop.mustprogress"}
!34 = !DILocation(line: 23, column: 3, scope: !9)
