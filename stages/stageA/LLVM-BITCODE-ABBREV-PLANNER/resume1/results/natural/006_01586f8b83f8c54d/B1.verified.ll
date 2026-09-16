; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\006_01586f8b83f8c54d\B1.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20010114-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.array1 = private unnamed_addr constant [1 x i32] [i32 1], align 4
@__const.main.array2 = private unnamed_addr constant [2 x [1 x i32]] [[1 x i32] [i32 1], [1 x i32] zeroinitializer], align 4

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %array1 = alloca [1 x i32], align 4
  %array2 = alloca [2 x [1 x i32]], align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %array1, ptr align 4 @__const.main.array1, i64 4, i1 false), !dbg !13
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %array2, ptr align 4 @__const.main.array2, i64 8, i1 false), !dbg !14
  %arrayidx = getelementptr inbounds [1 x i32], ptr %array1, i64 0, i64 0, !dbg !15
  %0 = load i32, ptr %arrayidx, align 4, !dbg !15
  %cmp = icmp ne i32 %0, 1, !dbg !16
  br i1 %cmp, label %if.then, label %if.end, !dbg !16

if.then:                                          ; preds = %entry
  call void @abort() #3, !dbg !17
  br label %if.end, !dbg !17

if.end:                                           ; preds = %if.then, %entry
  call void @exit(i32 noundef 0) #3, !dbg !18
  %1 = load i32, ptr %retval, align 4, !dbg !19
  ret i32 %1, !dbg !19
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #1

declare void @abort() #2

declare void @exit(i32 noundef) #2

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20010114-1.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "02b368face603565d55c626a28a3ec05")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20010114-1.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "02b368face603565d55c626a28a3ec05")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 10, column: 7, scope: !9)
!14 = !DILocation(line: 11, column: 7, scope: !9)
!15 = !DILocation(line: 12, column: 7, scope: !9)
!16 = !DILocation(line: 12, column: 17, scope: !9)
!17 = !DILocation(line: 13, column: 5, scope: !9)
!18 = !DILocation(line: 14, column: 3, scope: !9)
!19 = !DILocation(line: 15, column: 1, scope: !9)
