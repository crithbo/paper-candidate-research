; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\009_01e89ecae79d62eb\WL.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr58209.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@buf = dso_local global [1024 x i64] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone
define dso_local ptr @foo(i64 noundef %n) #0 !dbg !9 {
entry:
  %retval = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %s = alloca i64, align 8
  store i64 %n, ptr %n.addr, align 8
  %0 = load i64, ptr %n.addr, align 8, !dbg !13
  %cmp = icmp eq i64 %0, 0, !dbg !14
  br i1 %cmp, label %if.then, label %if.end, !dbg !14

if.then:                                          ; preds = %entry
  store ptr @buf, ptr %retval, align 8, !dbg !15
  br label %return, !dbg !15

if.end:                                           ; preds = %entry
  %1 = load i64, ptr %n.addr, align 8, !dbg !16
  %sub = sub nsw i64 %1, 1, !dbg !17
  %call = call ptr @foo(i64 noundef %sub) #2, !dbg !18
  %2 = ptrtoint ptr %call to i64, !dbg !19
  store i64 %2, ptr %s, align 8, !dbg !20
  %3 = load i64, ptr %s, align 8, !dbg !21
  %add = add i64 %3, 8, !dbg !22
  %4 = inttoptr i64 %add to ptr, !dbg !23
  store ptr %4, ptr %retval, align 8, !dbg !24
  br label %return, !dbg !24

return:                                           ; preds = %if.end, %if.then
  %5 = load ptr, ptr %retval, align 8, !dbg !25
  ret ptr %5, !dbg !25
}

; Function Attrs: noinline nounwind optnone
define dso_local ptr @bar(i64 noundef %n) #0 !dbg !26 {
entry:
  %retval = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  store i64 %n, ptr %n.addr, align 8
  %0 = load i64, ptr %n.addr, align 8, !dbg !27
  %cmp = icmp eq i64 %0, 0, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  store ptr @buf, ptr %retval, align 8, !dbg !29
  br label %return, !dbg !29

if.end:                                           ; preds = %entry
  %1 = load i64, ptr %n.addr, align 8, !dbg !30
  %sub = sub nsw i64 %1, 1, !dbg !31
  %call = call ptr @foo(i64 noundef %sub) #2, !dbg !32
  %add.ptr = getelementptr inbounds i64, ptr %call, i64 1, !dbg !33
  store ptr %add.ptr, ptr %retval, align 8, !dbg !34
  br label %return, !dbg !34

return:                                           ; preds = %if.end, %if.then
  %2 = load ptr, ptr %retval, align 8, !dbg !35
  ret ptr %2, !dbg !35
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !36 {
entry:
  %i = alloca i32, align 4
  store i32 0, ptr %i, align 4, !dbg !37
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !39
  %cmp = icmp slt i32 %0, 27, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %i, align 4, !dbg !42
  %conv = sext i32 %1 to i64, !dbg !42
  %call = call ptr @foo(i64 noundef %conv) #2, !dbg !43
  %2 = load i32, ptr %i, align 4, !dbg !44
  %idx.ext = sext i32 %2 to i64, !dbg !45
  %add.ptr = getelementptr inbounds i64, ptr @buf, i64 %idx.ext, !dbg !45
  %cmp1 = icmp ne ptr %call, %add.ptr, !dbg !46
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !47

lor.lhs.false:                                    ; preds = %for.body
  %3 = load i32, ptr %i, align 4, !dbg !48
  %conv3 = sext i32 %3 to i64, !dbg !48
  %call4 = call ptr @bar(i64 noundef %conv3) #2, !dbg !49
  %4 = load i32, ptr %i, align 4, !dbg !50
  %idx.ext5 = sext i32 %4 to i64, !dbg !51
  %add.ptr6 = getelementptr inbounds i64, ptr @buf, i64 %idx.ext5, !dbg !51
  %cmp7 = icmp ne ptr %call4, %add.ptr6, !dbg !52
  br i1 %cmp7, label %if.then, label %if.end, !dbg !47

if.then:                                          ; preds = %lor.lhs.false, %for.body
  call void @abort() #2, !dbg !53
  br label %if.end, !dbg !53

if.end:                                           ; preds = %if.then, %lor.lhs.false
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %if.end
  %5 = load i32, ptr %i, align 4, !dbg !54
  %inc = add nsw i32 %5, 1, !dbg !54
  store i32 %inc, ptr %i, align 4, !dbg !54
  br label %for.cond, !dbg !41, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !58
}

declare void @abort() #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr58209.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "7b314b618bd13790f4474067f69058e8")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 8, type: !11, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr58209.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "7b314b618bd13790f4474067f69058e8")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 10, column: 7, scope: !9)
!14 = !DILocation(line: 10, column: 9, scope: !9)
!15 = !DILocation(line: 11, column: 5, scope: !9)
!16 = !DILocation(line: 12, column: 18, scope: !9)
!17 = !DILocation(line: 12, column: 20, scope: !9)
!18 = !DILocation(line: 12, column: 13, scope: !9)
!19 = !DILocation(line: 12, column: 9, scope: !9)
!20 = !DILocation(line: 12, column: 5, scope: !9)
!21 = !DILocation(line: 13, column: 17, scope: !9)
!22 = !DILocation(line: 13, column: 19, scope: !9)
!23 = !DILocation(line: 13, column: 10, scope: !9)
!24 = !DILocation(line: 13, column: 3, scope: !9)
!25 = !DILocation(line: 14, column: 1, scope: !9)
!26 = distinct !DISubprogram(name: "bar", scope: !10, file: !10, line: 17, type: !11, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!27 = !DILocation(line: 19, column: 7, scope: !26)
!28 = !DILocation(line: 19, column: 9, scope: !26)
!29 = !DILocation(line: 20, column: 5, scope: !26)
!30 = !DILocation(line: 21, column: 15, scope: !26)
!31 = !DILocation(line: 21, column: 17, scope: !26)
!32 = !DILocation(line: 21, column: 10, scope: !26)
!33 = !DILocation(line: 21, column: 22, scope: !26)
!34 = !DILocation(line: 21, column: 3, scope: !26)
!35 = !DILocation(line: 22, column: 1, scope: !26)
!36 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 25, type: !11, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0)
!37 = !DILocation(line: 28, column: 10, scope: !36)
!38 = !DILocation(line: 28, column: 8, scope: !36)
!39 = !DILocation(line: 28, column: 15, scope: !36)
!40 = !DILocation(line: 28, column: 17, scope: !36)
!41 = !DILocation(line: 28, column: 3, scope: !36)
!42 = !DILocation(line: 29, column: 14, scope: !36)
!43 = !DILocation(line: 29, column: 9, scope: !36)
!44 = !DILocation(line: 29, column: 26, scope: !36)
!45 = !DILocation(line: 29, column: 24, scope: !36)
!46 = !DILocation(line: 29, column: 17, scope: !36)
!47 = !DILocation(line: 29, column: 28, scope: !36)
!48 = !DILocation(line: 29, column: 36, scope: !36)
!49 = !DILocation(line: 29, column: 31, scope: !36)
!50 = !DILocation(line: 29, column: 48, scope: !36)
!51 = !DILocation(line: 29, column: 46, scope: !36)
!52 = !DILocation(line: 29, column: 39, scope: !36)
!53 = !DILocation(line: 30, column: 7, scope: !36)
!54 = !DILocation(line: 28, column: 24, scope: !36)
!55 = distinct !{!55, !41, !56, !57}
!56 = !DILocation(line: 30, column: 14, scope: !36)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 31, column: 3, scope: !36)
