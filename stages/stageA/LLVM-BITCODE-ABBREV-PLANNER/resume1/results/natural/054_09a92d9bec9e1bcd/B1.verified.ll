; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\054_09a92d9bec9e1bcd\B1.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr78622.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%hhd\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"\22%hhd\22 => %i\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @foo(i32 noundef %x) #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %buf = alloca [5 x i8], align 1
  %n = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4, !dbg !13
  %cmp = icmp slt i32 %0, 4104, !dbg !14
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !15

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, ptr %x.addr, align 4, !dbg !16
  %cmp1 = icmp sge i32 %1, 4360, !dbg !17
  br i1 %cmp1, label %if.then, label %if.end, !dbg !15

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 -1, ptr %retval, align 4, !dbg !18
  br label %return, !dbg !18

if.end:                                           ; preds = %lor.lhs.false
  %arraydecay = getelementptr inbounds [5 x i8], ptr %buf, i64 0, i64 0, !dbg !19
  %2 = load i32, ptr %x.addr, align 4, !dbg !20
  %add = add nsw i32 %2, 1, !dbg !21
  %call = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %arraydecay, i64 noundef 5, ptr noundef @.str, i32 noundef %add) #3, !dbg !22
  store i32 %call, ptr %n, align 4, !dbg !23
  %3 = load i32, ptr %x.addr, align 4, !dbg !24
  %add2 = add nsw i32 %3, 1, !dbg !25
  %4 = load i32, ptr %n, align 4, !dbg !26
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %add2, i32 noundef %4) #3, !dbg !27
  %5 = load i32, ptr %n, align 4, !dbg !28
  store i32 %5, ptr %retval, align 4, !dbg !29
  br label %return, !dbg !29

return:                                           ; preds = %if.end, %if.then
  %6 = load i32, ptr %retval, align 4, !dbg !30
  ret i32 %6, !dbg !30
}

; Function Attrs: nounwind
declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !31 {
entry:
  %call = call i32 @foo(i32 noundef 4104) #4, !dbg !32
  %cmp = icmp ne i32 %call, 1, !dbg !33
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !34

lor.lhs.false:                                    ; preds = %entry
  %call1 = call i32 @foo(i32 noundef 4127) #4, !dbg !35
  %cmp2 = icmp ne i32 %call1, 2, !dbg !36
  br i1 %cmp2, label %if.then, label %lor.lhs.false3, !dbg !37

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %call4 = call i32 @foo(i32 noundef 4222) #4, !dbg !38
  %cmp5 = icmp ne i32 %call4, 3, !dbg !39
  br i1 %cmp5, label %if.then, label %lor.lhs.false6, !dbg !40

lor.lhs.false6:                                   ; preds = %lor.lhs.false3
  %call7 = call i32 @foo(i32 noundef 4223) #4, !dbg !41
  %cmp8 = icmp ne i32 %call7, 4, !dbg !42
  br i1 %cmp8, label %if.then, label %lor.lhs.false9, !dbg !43

lor.lhs.false9:                                   ; preds = %lor.lhs.false6
  %call10 = call i32 @foo(i32 noundef 4335) #4, !dbg !44
  %cmp11 = icmp ne i32 %call10, 3, !dbg !45
  br i1 %cmp11, label %if.then, label %lor.lhs.false12, !dbg !46

lor.lhs.false12:                                  ; preds = %lor.lhs.false9
  %call13 = call i32 @foo(i32 noundef 4343) #4, !dbg !47
  %cmp14 = icmp ne i32 %call13, 2, !dbg !48
  br i1 %cmp14, label %if.then, label %lor.lhs.false15, !dbg !49

lor.lhs.false15:                                  ; preds = %lor.lhs.false12
  %call16 = call i32 @foo(i32 noundef 4350) #4, !dbg !50
  %cmp17 = icmp ne i32 %call16, 2, !dbg !51
  br i1 %cmp17, label %if.then, label %lor.lhs.false18, !dbg !52

lor.lhs.false18:                                  ; preds = %lor.lhs.false15
  %call19 = call i32 @foo(i32 noundef 4351) #4, !dbg !53
  %cmp20 = icmp ne i32 %call19, 1, !dbg !54
  br i1 %cmp20, label %if.then, label %if.end, !dbg !52

if.then:                                          ; preds = %lor.lhs.false18, %lor.lhs.false15, %lor.lhs.false12, %lor.lhs.false9, %lor.lhs.false6, %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() #5, !dbg !55
  unreachable, !dbg !55

if.end:                                           ; preds = %lor.lhs.false18
  ret i32 0, !dbg !56
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind "no-builtins" }
attributes #4 = { nobuiltin "no-builtins" }
attributes #5 = { nobuiltin noreturn nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr78622.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "2ec5e8beb07dc552adab94d95ecb9798")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 8, type: !11, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr78622.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "2ec5e8beb07dc552adab94d95ecb9798")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 10, column: 7, scope: !9)
!14 = !DILocation(line: 10, column: 9, scope: !9)
!15 = !DILocation(line: 10, column: 20, scope: !9)
!16 = !DILocation(line: 10, column: 23, scope: !9)
!17 = !DILocation(line: 10, column: 25, scope: !9)
!18 = !DILocation(line: 11, column: 5, scope: !9)
!19 = !DILocation(line: 14, column: 31, scope: !9)
!20 = !DILocation(line: 14, column: 56, scope: !9)
!21 = !DILocation(line: 14, column: 58, scope: !9)
!22 = !DILocation(line: 14, column: 11, scope: !9)
!23 = !DILocation(line: 14, column: 7, scope: !9)
!24 = !DILocation(line: 15, column: 41, scope: !9)
!25 = !DILocation(line: 15, column: 43, scope: !9)
!26 = !DILocation(line: 15, column: 48, scope: !9)
!27 = !DILocation(line: 15, column: 3, scope: !9)
!28 = !DILocation(line: 16, column: 10, scope: !9)
!29 = !DILocation(line: 16, column: 3, scope: !9)
!30 = !DILocation(line: 17, column: 1, scope: !9)
!31 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 20, type: !11, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!32 = !DILocation(line: 25, column: 7, scope: !31)
!33 = !DILocation(line: 25, column: 22, scope: !31)
!34 = !DILocation(line: 26, column: 7, scope: !31)
!35 = !DILocation(line: 26, column: 10, scope: !31)
!36 = !DILocation(line: 26, column: 26, scope: !31)
!37 = !DILocation(line: 27, column: 7, scope: !31)
!38 = !DILocation(line: 27, column: 10, scope: !31)
!39 = !DILocation(line: 27, column: 27, scope: !31)
!40 = !DILocation(line: 28, column: 7, scope: !31)
!41 = !DILocation(line: 28, column: 10, scope: !31)
!42 = !DILocation(line: 28, column: 27, scope: !31)
!43 = !DILocation(line: 29, column: 7, scope: !31)
!44 = !DILocation(line: 29, column: 10, scope: !31)
!45 = !DILocation(line: 29, column: 27, scope: !31)
!46 = !DILocation(line: 30, column: 7, scope: !31)
!47 = !DILocation(line: 30, column: 10, scope: !31)
!48 = !DILocation(line: 30, column: 27, scope: !31)
!49 = !DILocation(line: 31, column: 7, scope: !31)
!50 = !DILocation(line: 31, column: 10, scope: !31)
!51 = !DILocation(line: 31, column: 27, scope: !31)
!52 = !DILocation(line: 32, column: 7, scope: !31)
!53 = !DILocation(line: 32, column: 10, scope: !31)
!54 = !DILocation(line: 32, column: 27, scope: !31)
!55 = !DILocation(line: 33, column: 5, scope: !31)
!56 = !DILocation(line: 35, column: 3, scope: !31)
