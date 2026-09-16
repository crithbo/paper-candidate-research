; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\007_018efcb63bca0fca\WL.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr39240.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@l1 = dso_local global i64 4294967292, align 8
@l2 = dso_local global i64 65532, align 8
@l3 = dso_local global i64 252, align 8
@l4 = dso_local global i64 -4, align 8
@l5 = dso_local global i64 -4, align 8
@l6 = dso_local global i64 -4, align 8

; Function Attrs: noinline nounwind optnone
define dso_local i32 @bar1(i32 noundef %x) #0 !dbg !9 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4, !dbg !13
  %add = add nsw i32 %0, 6, !dbg !14
  %call = call i32 @foo1(i32 noundef %add) #2, !dbg !15
  ret i32 %call, !dbg !16
}

; Function Attrs: noinline nounwind optnone
define internal i32 @foo1(i32 noundef %x) #0 !dbg !17 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4, !dbg !18
  ret i32 %0, !dbg !19
}

; Function Attrs: noinline nounwind optnone
define dso_local zeroext i16 @bar2(i32 noundef %x) #0 !dbg !20 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4, !dbg !21
  %add = add nsw i32 %0, 6, !dbg !22
  %call = call signext i16 @foo2(i32 noundef %add) #2, !dbg !23
  ret i16 %call, !dbg !24
}

; Function Attrs: noinline nounwind optnone
define internal signext i16 @foo2(i32 noundef %x) #0 !dbg !25 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4, !dbg !26
  %conv = trunc i32 %0 to i16, !dbg !26
  ret i16 %conv, !dbg !27
}

; Function Attrs: noinline nounwind optnone
define dso_local zeroext i8 @bar3(i32 noundef %x) #0 !dbg !28 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4, !dbg !29
  %add = add nsw i32 %0, 6, !dbg !30
  %call = call signext i8 @foo3(i32 noundef %add) #2, !dbg !31
  ret i8 %call, !dbg !32
}

; Function Attrs: noinline nounwind optnone
define internal signext i8 @foo3(i32 noundef %x) #0 !dbg !33 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4, !dbg !34
  %conv = trunc i32 %0 to i8, !dbg !34
  ret i8 %conv, !dbg !35
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @bar4(i32 noundef %x) #0 !dbg !36 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4, !dbg !37
  %add = add nsw i32 %0, 6, !dbg !38
  %call = call i32 @foo4(i32 noundef %add) #2, !dbg !39
  ret i32 %call, !dbg !40
}

; Function Attrs: noinline nounwind optnone
define internal i32 @foo4(i32 noundef %x) #0 !dbg !41 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4, !dbg !42
  ret i32 %0, !dbg !43
}

; Function Attrs: noinline nounwind optnone
define dso_local signext i16 @bar5(i32 noundef %x) #0 !dbg !44 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4, !dbg !45
  %add = add nsw i32 %0, 6, !dbg !46
  %call = call zeroext i16 @foo5(i32 noundef %add) #2, !dbg !47
  ret i16 %call, !dbg !48
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @foo5(i32 noundef %x) #0 !dbg !49 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4, !dbg !50
  %conv = trunc i32 %0 to i16, !dbg !50
  ret i16 %conv, !dbg !51
}

; Function Attrs: noinline nounwind optnone
define dso_local signext i8 @bar6(i32 noundef %x) #0 !dbg !52 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4, !dbg !53
  %add = add nsw i32 %0, 6, !dbg !54
  %call = call zeroext i8 @foo6(i32 noundef %add) #2, !dbg !55
  ret i8 %call, !dbg !56
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i8 @foo6(i32 noundef %x) #0 !dbg !57 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4, !dbg !58
  %conv = trunc i32 %0 to i8, !dbg !58
  ret i8 %conv, !dbg !59
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !60 {
entry:
  %call = call i32 @bar1(i32 noundef -10) #2, !dbg !61
  %conv = zext i32 %call to i64, !dbg !61
  %0 = load volatile i64, ptr @l1, align 8, !dbg !62
  %cmp = icmp ne i64 %conv, %0, !dbg !63
  br i1 %cmp, label %if.then, label %if.end, !dbg !63

if.then:                                          ; preds = %entry
  call void @abort() #2, !dbg !64
  br label %if.end, !dbg !64

if.end:                                           ; preds = %if.then, %entry
  %call2 = call zeroext i16 @bar2(i32 noundef -10) #2, !dbg !65
  %conv3 = zext i16 %call2 to i64, !dbg !65
  %1 = load volatile i64, ptr @l2, align 8, !dbg !66
  %cmp4 = icmp ne i64 %conv3, %1, !dbg !67
  br i1 %cmp4, label %if.then6, label %if.end7, !dbg !67

if.then6:                                         ; preds = %if.end
  call void @abort() #2, !dbg !68
  br label %if.end7, !dbg !68

if.end7:                                          ; preds = %if.then6, %if.end
  %call8 = call zeroext i8 @bar3(i32 noundef -10) #2, !dbg !69
  %conv9 = zext i8 %call8 to i64, !dbg !69
  %2 = load volatile i64, ptr @l3, align 8, !dbg !70
  %cmp10 = icmp ne i64 %conv9, %2, !dbg !71
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !71

if.then12:                                        ; preds = %if.end7
  call void @abort() #2, !dbg !72
  br label %if.end13, !dbg !72

if.end13:                                         ; preds = %if.then12, %if.end7
  %call14 = call i32 @bar4(i32 noundef -10) #2, !dbg !73
  %conv15 = sext i32 %call14 to i64, !dbg !73
  %3 = load volatile i64, ptr @l4, align 8, !dbg !74
  %cmp16 = icmp ne i64 %conv15, %3, !dbg !75
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !75

if.then18:                                        ; preds = %if.end13
  call void @abort() #2, !dbg !76
  br label %if.end19, !dbg !76

if.end19:                                         ; preds = %if.then18, %if.end13
  %call20 = call signext i16 @bar5(i32 noundef -10) #2, !dbg !77
  %conv21 = sext i16 %call20 to i64, !dbg !77
  %4 = load volatile i64, ptr @l5, align 8, !dbg !78
  %cmp22 = icmp ne i64 %conv21, %4, !dbg !79
  br i1 %cmp22, label %if.then24, label %if.end25, !dbg !79

if.then24:                                        ; preds = %if.end19
  call void @abort() #2, !dbg !80
  br label %if.end25, !dbg !80

if.end25:                                         ; preds = %if.then24, %if.end19
  %call26 = call signext i8 @bar6(i32 noundef -10) #2, !dbg !81
  %conv27 = sext i8 %call26 to i64, !dbg !81
  %5 = load volatile i64, ptr @l6, align 8, !dbg !82
  %cmp28 = icmp ne i64 %conv27, %5, !dbg !83
  br i1 %cmp28, label %if.then30, label %if.end31, !dbg !83

if.then30:                                        ; preds = %if.end25
  call void @abort() #2, !dbg !84
  br label %if.end31, !dbg !84

if.end31:                                         ; preds = %if.then30, %if.end25
  ret i32 0, !dbg !85
}

declare void @abort() #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr39240.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "e91032a7cb0ee1b0a9b14d418efe6fb0")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "bar1", scope: !10, file: !10, line: 12, type: !11, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr39240.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "e91032a7cb0ee1b0a9b14d418efe6fb0")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 14, column: 16, scope: !9)
!14 = !DILocation(line: 14, column: 18, scope: !9)
!15 = !DILocation(line: 14, column: 10, scope: !9)
!16 = !DILocation(line: 14, column: 3, scope: !9)
!17 = distinct !DISubprogram(name: "foo1", scope: !10, file: !10, line: 6, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!18 = !DILocation(line: 8, column: 10, scope: !17)
!19 = !DILocation(line: 8, column: 3, scope: !17)
!20 = distinct !DISubprogram(name: "bar2", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!21 = !DILocation(line: 28, column: 16, scope: !20)
!22 = !DILocation(line: 28, column: 18, scope: !20)
!23 = !DILocation(line: 28, column: 10, scope: !20)
!24 = !DILocation(line: 28, column: 3, scope: !20)
!25 = distinct !DISubprogram(name: "foo2", scope: !10, file: !10, line: 20, type: !11, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!26 = !DILocation(line: 22, column: 10, scope: !25)
!27 = !DILocation(line: 22, column: 3, scope: !25)
!28 = distinct !DISubprogram(name: "bar3", scope: !10, file: !10, line: 40, type: !11, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!29 = !DILocation(line: 42, column: 16, scope: !28)
!30 = !DILocation(line: 42, column: 18, scope: !28)
!31 = !DILocation(line: 42, column: 10, scope: !28)
!32 = !DILocation(line: 42, column: 3, scope: !28)
!33 = distinct !DISubprogram(name: "foo3", scope: !10, file: !10, line: 34, type: !11, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!34 = !DILocation(line: 36, column: 10, scope: !33)
!35 = !DILocation(line: 36, column: 3, scope: !33)
!36 = distinct !DISubprogram(name: "bar4", scope: !10, file: !10, line: 54, type: !11, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!37 = !DILocation(line: 56, column: 16, scope: !36)
!38 = !DILocation(line: 56, column: 18, scope: !36)
!39 = !DILocation(line: 56, column: 10, scope: !36)
!40 = !DILocation(line: 56, column: 3, scope: !36)
!41 = distinct !DISubprogram(name: "foo4", scope: !10, file: !10, line: 48, type: !11, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!42 = !DILocation(line: 50, column: 10, scope: !41)
!43 = !DILocation(line: 50, column: 3, scope: !41)
!44 = distinct !DISubprogram(name: "bar5", scope: !10, file: !10, line: 68, type: !11, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!45 = !DILocation(line: 70, column: 16, scope: !44)
!46 = !DILocation(line: 70, column: 18, scope: !44)
!47 = !DILocation(line: 70, column: 10, scope: !44)
!48 = !DILocation(line: 70, column: 3, scope: !44)
!49 = distinct !DISubprogram(name: "foo5", scope: !10, file: !10, line: 62, type: !11, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!50 = !DILocation(line: 64, column: 10, scope: !49)
!51 = !DILocation(line: 64, column: 3, scope: !49)
!52 = distinct !DISubprogram(name: "bar6", scope: !10, file: !10, line: 82, type: !11, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!53 = !DILocation(line: 84, column: 16, scope: !52)
!54 = !DILocation(line: 84, column: 18, scope: !52)
!55 = !DILocation(line: 84, column: 10, scope: !52)
!56 = !DILocation(line: 84, column: 3, scope: !52)
!57 = distinct !DISubprogram(name: "foo6", scope: !10, file: !10, line: 76, type: !11, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0)
!58 = !DILocation(line: 78, column: 10, scope: !57)
!59 = !DILocation(line: 78, column: 3, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 90, type: !11, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!61 = !DILocation(line: 92, column: 7, scope: !60)
!62 = !DILocation(line: 92, column: 21, scope: !60)
!63 = !DILocation(line: 92, column: 18, scope: !60)
!64 = !DILocation(line: 93, column: 5, scope: !60)
!65 = !DILocation(line: 94, column: 7, scope: !60)
!66 = !DILocation(line: 94, column: 21, scope: !60)
!67 = !DILocation(line: 94, column: 18, scope: !60)
!68 = !DILocation(line: 95, column: 5, scope: !60)
!69 = !DILocation(line: 96, column: 7, scope: !60)
!70 = !DILocation(line: 96, column: 21, scope: !60)
!71 = !DILocation(line: 96, column: 18, scope: !60)
!72 = !DILocation(line: 97, column: 5, scope: !60)
!73 = !DILocation(line: 98, column: 7, scope: !60)
!74 = !DILocation(line: 98, column: 21, scope: !60)
!75 = !DILocation(line: 98, column: 18, scope: !60)
!76 = !DILocation(line: 99, column: 5, scope: !60)
!77 = !DILocation(line: 100, column: 7, scope: !60)
!78 = !DILocation(line: 100, column: 21, scope: !60)
!79 = !DILocation(line: 100, column: 18, scope: !60)
!80 = !DILocation(line: 101, column: 5, scope: !60)
!81 = !DILocation(line: 102, column: 7, scope: !60)
!82 = !DILocation(line: 102, column: 21, scope: !60)
!83 = !DILocation(line: 102, column: 18, scope: !60)
!84 = !DILocation(line: 103, column: 5, scope: !60)
!85 = !DILocation(line: 104, column: 3, scope: !60)
