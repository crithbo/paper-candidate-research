; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\051_090dffeafffddbda\WL.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr48717.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@v = dso_local global i32 1, align 4
@w = dso_local global i32 0, align 4

; Function Attrs: noinline nounwind optnone
define dso_local zeroext i16 @foo(i16 noundef zeroext %x, i16 noundef zeroext %y) #0 !dbg !9 {
entry:
  %x.addr = alloca i16, align 2
  %y.addr = alloca i16, align 2
  store i16 %x, ptr %x.addr, align 2
  store i16 %y, ptr %y.addr, align 2
  %0 = load i16, ptr %x.addr, align 2, !dbg !13
  %conv = zext i16 %0 to i32, !dbg !13
  %1 = load i16, ptr %y.addr, align 2, !dbg !14
  %conv1 = zext i16 %1 to i32, !dbg !14
  %add = add nsw i32 %conv, %conv1, !dbg !15
  %conv2 = trunc i32 %add to i16, !dbg !13
  ret i16 %conv2, !dbg !16
}

; Function Attrs: noinline nounwind optnone
define dso_local void @bar() #0 !dbg !17 {
entry:
  %0 = load i32, ptr @w, align 4, !dbg !18
  %not = xor i32 %0, -1, !dbg !19
  %conv = trunc i32 %not to i16, !dbg !19
  %1 = load i32, ptr @w, align 4, !dbg !20
  %conv1 = trunc i32 %1 to i16, !dbg !20
  %call = call zeroext i16 @foo(i16 noundef zeroext %conv, i16 noundef zeroext %conv1) #2, !dbg !21
  %conv2 = zext i16 %call to i32, !dbg !21
  store i32 %conv2, ptr @v, align 4, !dbg !22
  ret void, !dbg !23
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !24 {
entry:
  call void @bar() #2, !dbg !25
  %0 = load i32, ptr @v, align 4, !dbg !26
  %cmp = icmp ne i32 %0, 65535, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @abort() #2, !dbg !28
  br label %if.end, !dbg !28

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !29
}

declare void @abort() #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr48717.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "51f4d484f3e05d491796eee69441c46b")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 8, type: !11, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr48717.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "51f4d484f3e05d491796eee69441c46b")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 10, column: 10, scope: !9)
!14 = !DILocation(line: 10, column: 14, scope: !9)
!15 = !DILocation(line: 10, column: 12, scope: !9)
!16 = !DILocation(line: 10, column: 3, scope: !9)
!17 = distinct !DISubprogram(name: "bar", scope: !10, file: !10, line: 14, type: !11, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!18 = !DILocation(line: 16, column: 13, scope: !17)
!19 = !DILocation(line: 16, column: 12, scope: !17)
!20 = !DILocation(line: 16, column: 16, scope: !17)
!21 = !DILocation(line: 16, column: 7, scope: !17)
!22 = !DILocation(line: 16, column: 5, scope: !17)
!23 = !DILocation(line: 17, column: 1, scope: !17)
!24 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 20, type: !11, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0)
!25 = !DILocation(line: 22, column: 3, scope: !24)
!26 = !DILocation(line: 23, column: 7, scope: !24)
!27 = !DILocation(line: 23, column: 9, scope: !24)
!28 = !DILocation(line: 24, column: 5, scope: !24)
!29 = !DILocation(line: 25, column: 3, scope: !24)
