; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\031_059bbd5437ad4c68\WL.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\strpcpy-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@buf1 = dso_local global [64 x i64] zeroinitializer, align 16
@buf2 = dso_local global ptr getelementptr (i8, ptr @buf1, i64 256), align 8
@.str = private unnamed_addr constant [17 x i8] c"abcdefghijklmnop\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"ABCDEFG\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"ABCDEFG\00ijklmnop\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"ABCDx\00G\00ijklmnop\00", align 1
@inside_main = external global i32, align 4
@buf5 = dso_local global [20 x i64] zeroinitializer, align 16
@.str.5 = private unnamed_addr constant [20 x i8] c"RSTUVWXYZ0123456789\00", align 1
@buf7 = dso_local global [20 x i8] zeroinitializer, align 16
@.str.6 = private unnamed_addr constant [10 x i8] c"rstuvwxyz\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local void @test(ptr noundef %buf3, ptr noundef %buf4, ptr noundef %buf6, i32 noundef %n) #0 !dbg !9 {
entry:
  %buf3.addr = alloca ptr, align 8
  %buf4.addr = alloca ptr, align 8
  %buf6.addr = alloca ptr, align 8
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %buf3, ptr %buf3.addr, align 8
  store ptr %buf4, ptr %buf4.addr, align 8
  store ptr %buf6, ptr %buf6.addr, align 8
  store i32 %n, ptr %n.addr, align 4
  store i32 4, ptr %i, align 4, !dbg !13
  %0 = load ptr, ptr %buf3.addr, align 8, !dbg !14
  %call = call ptr @stpcpy(ptr noundef %0, ptr noundef @.str) #3, !dbg !15
  %cmp = icmp ne ptr %call, getelementptr inbounds (i8, ptr @buf1, i64 16), !dbg !16
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !17

lor.lhs.false:                                    ; preds = %entry
  %call1 = call i32 @memcmp(ptr noundef @buf1, ptr noundef @.str, i64 noundef 17) #3, !dbg !18
  %tobool = icmp ne i32 %call1, 0, !dbg !18
  br i1 %tobool, label %if.then, label %if.end, !dbg !17

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() #3, !dbg !19
  br label %if.end, !dbg !19

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %1 = load ptr, ptr %buf3.addr, align 8, !dbg !20
  %call2 = call ptr @stpcpy(ptr noundef %1, ptr noundef @.str.1) #4, !dbg !21
  %cmp3 = icmp ne ptr %call2, getelementptr inbounds (i8, ptr @buf1, i64 7), !dbg !22
  br i1 %cmp3, label %if.then7, label %lor.lhs.false4, !dbg !23

lor.lhs.false4:                                   ; preds = %if.end
  %call5 = call i32 @memcmp(ptr noundef @buf1, ptr noundef @.str.2, i64 noundef 17) #3, !dbg !24
  %tobool6 = icmp ne i32 %call5, 0, !dbg !24
  br i1 %tobool6, label %if.then7, label %if.end8, !dbg !23

if.then7:                                         ; preds = %lor.lhs.false4, %if.end
  call void @abort() #3, !dbg !25
  br label %if.end8, !dbg !25

if.end8:                                          ; preds = %if.then7, %lor.lhs.false4
  %2 = load ptr, ptr %buf3.addr, align 8, !dbg !26
  %3 = load i32, ptr %i, align 4, !dbg !27
  %inc = add nsw i32 %3, 1, !dbg !27
  store i32 %inc, ptr %i, align 4, !dbg !27
  %idx.ext = sext i32 %3 to i64, !dbg !28
  %add.ptr = getelementptr inbounds i8, ptr %2, i64 %idx.ext, !dbg !28
  %call9 = call ptr @stpcpy(ptr noundef %add.ptr, ptr noundef @.str.3) #3, !dbg !29
  %cmp10 = icmp ne ptr %call9, getelementptr inbounds (i8, ptr @buf1, i64 5), !dbg !30
  br i1 %cmp10, label %if.then14, label %lor.lhs.false11, !dbg !31

lor.lhs.false11:                                  ; preds = %if.end8
  %call12 = call i32 @memcmp(ptr noundef @buf1, ptr noundef @.str.4, i64 noundef 17) #3, !dbg !32
  %tobool13 = icmp ne i32 %call12, 0, !dbg !32
  br i1 %tobool13, label %if.then14, label %if.end15, !dbg !31

if.then14:                                        ; preds = %lor.lhs.false11, %if.end8
  call void @abort() #3, !dbg !33
  br label %if.end15, !dbg !33

if.end15:                                         ; preds = %if.then14, %lor.lhs.false11
  ret void, !dbg !34
}

declare ptr @stpcpy(ptr noundef, ptr noundef) #1

declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef) #1

declare void @abort() #1

; Function Attrs: noinline nounwind optnone
define dso_local void @main_test() #0 !dbg !35 {
entry:
  store i32 0, ptr @inside_main, align 4, !dbg !36
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 @buf5, ptr align 1 @.str.5, i64 20, i1 false), !dbg !37
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 @buf7, ptr align 1 @.str.5, i64 20, i1 false), !dbg !38
  %0 = load ptr, ptr @buf2, align 8, !dbg !39
  call void @test(ptr noundef @buf1, ptr noundef %0, ptr noundef @.str.6, i32 noundef 0) #3, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nobuiltin "no-builtins" }
attributes #4 = { nobuiltin nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\strpcpy-2.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "e944267d000f7c657b52900387a59138")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "test", scope: !10, file: !10, line: 20, type: !11, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\strpcpy-2.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "e944267d000f7c657b52900387a59138")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 22, column: 7, scope: !9)
!14 = !DILocation(line: 24, column: 24, scope: !9)
!15 = !DILocation(line: 24, column: 7, scope: !9)
!16 = !DILocation(line: 24, column: 50, scope: !9)
!17 = !DILocation(line: 25, column: 7, scope: !9)
!18 = !DILocation(line: 25, column: 10, scope: !9)
!19 = !DILocation(line: 26, column: 5, scope: !9)
!20 = !DILocation(line: 28, column: 34, scope: !9)
!21 = !DILocation(line: 28, column: 7, scope: !9)
!22 = !DILocation(line: 28, column: 51, scope: !9)
!23 = !DILocation(line: 29, column: 7, scope: !9)
!24 = !DILocation(line: 29, column: 10, scope: !9)
!25 = !DILocation(line: 30, column: 5, scope: !9)
!26 = !DILocation(line: 32, column: 24, scope: !9)
!27 = !DILocation(line: 32, column: 32, scope: !9)
!28 = !DILocation(line: 32, column: 29, scope: !9)
!29 = !DILocation(line: 32, column: 7, scope: !9)
!30 = !DILocation(line: 32, column: 41, scope: !9)
!31 = !DILocation(line: 33, column: 7, scope: !9)
!32 = !DILocation(line: 33, column: 10, scope: !9)
!33 = !DILocation(line: 34, column: 5, scope: !9)
!34 = !DILocation(line: 35, column: 1, scope: !9)
!35 = distinct !DISubprogram(name: "main_test", scope: !10, file: !10, line: 38, type: !11, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!36 = !DILocation(line: 41, column: 15, scope: !35)
!37 = !DILocation(line: 42, column: 3, scope: !35)
!38 = !DILocation(line: 43, column: 3, scope: !35)
!39 = !DILocation(line: 44, column: 15, scope: !35)
!40 = !DILocation(line: 44, column: 3, scope: !35)
!41 = !DILocation(line: 45, column: 1, scope: !35)
