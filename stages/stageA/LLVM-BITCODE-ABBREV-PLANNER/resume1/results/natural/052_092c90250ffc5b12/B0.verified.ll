; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\052_092c90250ffc5b12\B0.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\strcmp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = dso_local global i32 7, align 4
@.str = private unnamed_addr constant [9 x i8] c"hi world\00", align 1
@bar = dso_local global ptr @.str, align 8
@.str.1 = private unnamed_addr constant [12 x i8] c"hello world\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"hello\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"llo\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"hello world \00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"dx\00", align 1
@.str.6 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: noinline nounwind optnone
define dso_local void @main_test() #0 !dbg !9 {
entry:
  %foo = alloca ptr, align 8
  store ptr @.str.1, ptr %foo, align 8, !dbg !13
  %call = call i32 @strcmp(ptr noundef @.str.1, ptr noundef @.str.2) #2, !dbg !14
  %cmp = icmp sle i32 %call, 0, !dbg !15
  br i1 %cmp, label %if.then, label %if.end, !dbg !15

if.then:                                          ; preds = %entry
  call void @abort() #2, !dbg !16
  br label %if.end, !dbg !16

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @strcmp(ptr noundef getelementptr inbounds (i8, ptr @.str.1, i64 2), ptr noundef @.str.3) #2, !dbg !17
  %cmp2 = icmp sle i32 %call1, 0, !dbg !18
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !18

if.then3:                                         ; preds = %if.end
  call void @abort() #2, !dbg !19
  br label %if.end4, !dbg !19

if.end4:                                          ; preds = %if.then3, %if.end
  %call5 = call i32 @strcmp(ptr noundef @.str.1, ptr noundef @.str.1) #2, !dbg !20
  %cmp6 = icmp ne i32 %call5, 0, !dbg !21
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !21

if.then7:                                         ; preds = %if.end4
  call void @abort() #2, !dbg !22
  br label %if.end8, !dbg !22

if.end8:                                          ; preds = %if.then7, %if.end4
  %call9 = call i32 @strcmp(ptr noundef @.str.1, ptr noundef @.str.4) #2, !dbg !23
  %cmp10 = icmp sge i32 %call9, 0, !dbg !24
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !24

if.then11:                                        ; preds = %if.end8
  call void @abort() #2, !dbg !25
  br label %if.end12, !dbg !25

if.end12:                                         ; preds = %if.then11, %if.end8
  %call13 = call i32 @strcmp(ptr noundef getelementptr inbounds (i8, ptr @.str.1, i64 10), ptr noundef @.str.5) #2, !dbg !26
  %cmp14 = icmp sge i32 %call13, 0, !dbg !27
  br i1 %cmp14, label %if.then15, label %if.end16, !dbg !27

if.then15:                                        ; preds = %if.end12
  call void @abort() #2, !dbg !28
  br label %if.end16, !dbg !28

if.end16:                                         ; preds = %if.then15, %if.end12
  %call17 = call i32 @strcmp(ptr noundef getelementptr inbounds (i8, ptr @.str.1, i64 10), ptr noundef @.str.5) #2, !dbg !29
  %cmp18 = icmp sge i32 %call17, 0, !dbg !30
  br i1 %cmp18, label %if.then19, label %if.end20, !dbg !30

if.then19:                                        ; preds = %if.end16
  call void @abort() #2, !dbg !31
  br label %if.end20, !dbg !31

if.end20:                                         ; preds = %if.then19, %if.end16
  %0 = load ptr, ptr @bar, align 8, !dbg !32
  %call21 = call i32 @strcmp(ptr noundef %0, ptr noundef @.str.6) #2, !dbg !33
  %cmp22 = icmp sle i32 %call21, 0, !dbg !34
  br i1 %cmp22, label %if.then23, label %if.end24, !dbg !34

if.then23:                                        ; preds = %if.end20
  call void @abort() #2, !dbg !35
  br label %if.end24, !dbg !35

if.end24:                                         ; preds = %if.then23, %if.end20
  %1 = load ptr, ptr @bar, align 8, !dbg !36
  %call25 = call i32 @strcmp(ptr noundef @.str.6, ptr noundef %1) #2, !dbg !37
  %cmp26 = icmp sge i32 %call25, 0, !dbg !38
  br i1 %cmp26, label %if.then27, label %if.end28, !dbg !38

if.then27:                                        ; preds = %if.end24
  call void @abort() #2, !dbg !39
  br label %if.end28, !dbg !39

if.end28:                                         ; preds = %if.then27, %if.end24
  %2 = load ptr, ptr @bar, align 8, !dbg !40
  %add.ptr = getelementptr inbounds i8, ptr %2, i64 8, !dbg !41
  %call29 = call i32 @strcmp(ptr noundef %add.ptr, ptr noundef @.str.6) #2, !dbg !42
  %cmp30 = icmp ne i32 %call29, 0, !dbg !43
  br i1 %cmp30, label %if.then31, label %if.end32, !dbg !43

if.then31:                                        ; preds = %if.end28
  call void @abort() #2, !dbg !44
  br label %if.end32, !dbg !44

if.end32:                                         ; preds = %if.then31, %if.end28
  %3 = load ptr, ptr @bar, align 8, !dbg !45
  %add.ptr33 = getelementptr inbounds i8, ptr %3, i64 8, !dbg !46
  %call34 = call i32 @strcmp(ptr noundef @.str.6, ptr noundef %add.ptr33) #2, !dbg !47
  %cmp35 = icmp ne i32 %call34, 0, !dbg !48
  br i1 %cmp35, label %if.then36, label %if.end37, !dbg !48

if.then36:                                        ; preds = %if.end32
  call void @abort() #2, !dbg !49
  br label %if.end37, !dbg !49

if.end37:                                         ; preds = %if.then36, %if.end32
  %4 = load ptr, ptr @bar, align 8, !dbg !50
  %5 = load i32, ptr @x, align 4, !dbg !51
  %dec = add nsw i32 %5, -1, !dbg !51
  store i32 %dec, ptr @x, align 4, !dbg !51
  %idx.ext = sext i32 %dec to i64, !dbg !52
  %add.ptr38 = getelementptr inbounds i8, ptr %4, i64 %idx.ext, !dbg !52
  %call39 = call i32 @strcmp(ptr noundef %add.ptr38, ptr noundef @.str.6) #2, !dbg !53
  %cmp40 = icmp sle i32 %call39, 0, !dbg !54
  br i1 %cmp40, label %if.then42, label %lor.lhs.false, !dbg !55

lor.lhs.false:                                    ; preds = %if.end37
  %6 = load i32, ptr @x, align 4, !dbg !56
  %cmp41 = icmp ne i32 %6, 6, !dbg !57
  br i1 %cmp41, label %if.then42, label %if.end43, !dbg !55

if.then42:                                        ; preds = %lor.lhs.false, %if.end37
  call void @abort() #2, !dbg !58
  br label %if.end43, !dbg !58

if.end43:                                         ; preds = %if.then42, %lor.lhs.false
  %7 = load ptr, ptr @bar, align 8, !dbg !59
  %8 = load i32, ptr @x, align 4, !dbg !60
  %inc = add nsw i32 %8, 1, !dbg !60
  store i32 %inc, ptr @x, align 4, !dbg !60
  %idx.ext44 = sext i32 %inc to i64, !dbg !61
  %add.ptr45 = getelementptr inbounds i8, ptr %7, i64 %idx.ext44, !dbg !61
  %call46 = call i32 @strcmp(ptr noundef @.str.6, ptr noundef %add.ptr45) #2, !dbg !62
  %cmp47 = icmp sge i32 %call46, 0, !dbg !63
  br i1 %cmp47, label %if.then50, label %lor.lhs.false48, !dbg !64

lor.lhs.false48:                                  ; preds = %if.end43
  %9 = load i32, ptr @x, align 4, !dbg !65
  %cmp49 = icmp ne i32 %9, 7, !dbg !66
  br i1 %cmp49, label %if.then50, label %if.end51, !dbg !64

if.then50:                                        ; preds = %lor.lhs.false48, %if.end43
  call void @abort() #2, !dbg !67
  br label %if.end51, !dbg !67

if.end51:                                         ; preds = %if.then50, %lor.lhs.false48
  ret void, !dbg !68
}

declare i32 @strcmp(ptr noundef, ptr noundef) #1

declare void @abort() #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\strcmp.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "ff52ed0b06289edabcc2b0f6f8f448b1")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "main_test", scope: !10, file: !10, line: 15, type: !11, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\strcmp.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "ff52ed0b06289edabcc2b0f6f8f448b1")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 17, column: 21, scope: !9)
!14 = !DILocation(line: 19, column: 7, scope: !9)
!15 = !DILocation(line: 19, column: 29, scope: !9)
!16 = !DILocation(line: 20, column: 5, scope: !9)
!17 = !DILocation(line: 21, column: 7, scope: !9)
!18 = !DILocation(line: 21, column: 31, scope: !9)
!19 = !DILocation(line: 22, column: 5, scope: !9)
!20 = !DILocation(line: 23, column: 7, scope: !9)
!21 = !DILocation(line: 23, column: 25, scope: !9)
!22 = !DILocation(line: 24, column: 5, scope: !9)
!23 = !DILocation(line: 25, column: 7, scope: !9)
!24 = !DILocation(line: 25, column: 36, scope: !9)
!25 = !DILocation(line: 26, column: 5, scope: !9)
!26 = !DILocation(line: 27, column: 7, scope: !9)
!27 = !DILocation(line: 27, column: 31, scope: !9)
!28 = !DILocation(line: 28, column: 5, scope: !9)
!29 = !DILocation(line: 29, column: 7, scope: !9)
!30 = !DILocation(line: 29, column: 31, scope: !9)
!31 = !DILocation(line: 30, column: 5, scope: !9)
!32 = !DILocation(line: 31, column: 15, scope: !9)
!33 = !DILocation(line: 31, column: 7, scope: !9)
!34 = !DILocation(line: 31, column: 24, scope: !9)
!35 = !DILocation(line: 32, column: 5, scope: !9)
!36 = !DILocation(line: 33, column: 19, scope: !9)
!37 = !DILocation(line: 33, column: 7, scope: !9)
!38 = !DILocation(line: 33, column: 24, scope: !9)
!39 = !DILocation(line: 34, column: 5, scope: !9)
!40 = !DILocation(line: 35, column: 15, scope: !9)
!41 = !DILocation(line: 35, column: 18, scope: !9)
!42 = !DILocation(line: 35, column: 7, scope: !9)
!43 = !DILocation(line: 35, column: 26, scope: !9)
!44 = !DILocation(line: 36, column: 5, scope: !9)
!45 = !DILocation(line: 37, column: 19, scope: !9)
!46 = !DILocation(line: 37, column: 22, scope: !9)
!47 = !DILocation(line: 37, column: 7, scope: !9)
!48 = !DILocation(line: 37, column: 26, scope: !9)
!49 = !DILocation(line: 38, column: 5, scope: !9)
!50 = !DILocation(line: 39, column: 15, scope: !9)
!51 = !DILocation(line: 39, column: 20, scope: !9)
!52 = !DILocation(line: 39, column: 18, scope: !9)
!53 = !DILocation(line: 39, column: 7, scope: !9)
!54 = !DILocation(line: 39, column: 30, scope: !9)
!55 = !DILocation(line: 39, column: 35, scope: !9)
!56 = !DILocation(line: 39, column: 38, scope: !9)
!57 = !DILocation(line: 39, column: 40, scope: !9)
!58 = !DILocation(line: 40, column: 5, scope: !9)
!59 = !DILocation(line: 41, column: 19, scope: !9)
!60 = !DILocation(line: 41, column: 24, scope: !9)
!61 = !DILocation(line: 41, column: 22, scope: !9)
!62 = !DILocation(line: 41, column: 7, scope: !9)
!63 = !DILocation(line: 41, column: 30, scope: !9)
!64 = !DILocation(line: 41, column: 35, scope: !9)
!65 = !DILocation(line: 41, column: 38, scope: !9)
!66 = !DILocation(line: 41, column: 40, scope: !9)
!67 = !DILocation(line: 42, column: 5, scope: !9)
!68 = !DILocation(line: 48, column: 1, scope: !9)
