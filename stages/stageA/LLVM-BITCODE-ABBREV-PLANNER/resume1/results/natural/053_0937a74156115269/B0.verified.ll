; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\053_0937a74156115269\B0.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\postmod-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@counter0 = dso_local global float 0.000000e+00, align 4
@counter1 = dso_local global float 0.000000e+00, align 4
@counter2 = dso_local global float 0.000000e+00, align 4
@counter3 = dso_local global float 0.000000e+00, align 4
@counter4 = dso_local global float 0.000000e+00, align 4
@counter5 = dso_local global float 0.000000e+00, align 4
@stop = dso_local global i32 1, align 4
@array0 = dso_local global [16 x float] zeroinitializer, align 16
@array1 = dso_local global [16 x float] zeroinitializer, align 16
@array2 = dso_local global [16 x float] zeroinitializer, align 16
@array3 = dso_local global [16 x float] zeroinitializer, align 16
@array4 = dso_local global [16 x float] zeroinitializer, align 16
@array5 = dso_local global [16 x float] zeroinitializer, align 16
@vol = dso_local global i32 0, align 4

; Function Attrs: noinline nounwind optnone
define dso_local void @foo(i32 noundef %x) #0 !dbg !9 {
entry:
  %x.addr = alloca i32, align 4
  %pointer0 = alloca ptr, align 8
  %pointer1 = alloca ptr, align 8
  %pointer2 = alloca ptr, align 8
  %pointer3 = alloca ptr, align 8
  %pointer4 = alloca ptr, align 8
  %pointer5 = alloca ptr, align 8
  %i = alloca i32, align 4
  %addend0 = alloca i32, align 4
  %addend1 = alloca i32, align 4
  %addend2 = alloca i32, align 4
  %addend3 = alloca i32, align 4
  %addend4 = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4, !dbg !13
  %idx.ext = sext i32 %0 to i64, !dbg !13
  %add.ptr = getelementptr inbounds float, ptr @array0, i64 %idx.ext, !dbg !13
  store ptr %add.ptr, ptr %pointer0, align 8, !dbg !13
  %1 = load i32, ptr %x.addr, align 4, !dbg !13
  %idx.ext1 = sext i32 %1 to i64, !dbg !13
  %add.ptr2 = getelementptr inbounds float, ptr @array1, i64 %idx.ext1, !dbg !13
  store ptr %add.ptr2, ptr %pointer1, align 8, !dbg !13
  %2 = load i32, ptr %x.addr, align 4, !dbg !13
  %idx.ext3 = sext i32 %2 to i64, !dbg !13
  %add.ptr4 = getelementptr inbounds float, ptr @array2, i64 %idx.ext3, !dbg !13
  store ptr %add.ptr4, ptr %pointer2, align 8, !dbg !13
  %3 = load i32, ptr %x.addr, align 4, !dbg !13
  %idx.ext5 = sext i32 %3 to i64, !dbg !13
  %add.ptr6 = getelementptr inbounds float, ptr @array3, i64 %idx.ext5, !dbg !13
  store ptr %add.ptr6, ptr %pointer3, align 8, !dbg !13
  %4 = load i32, ptr %x.addr, align 4, !dbg !13
  %idx.ext7 = sext i32 %4 to i64, !dbg !13
  %add.ptr8 = getelementptr inbounds float, ptr @array4, i64 %idx.ext7, !dbg !13
  store ptr %add.ptr8, ptr %pointer4, align 8, !dbg !13
  %5 = load i32, ptr %x.addr, align 4, !dbg !13
  %idx.ext9 = sext i32 %5 to i64, !dbg !13
  %add.ptr10 = getelementptr inbounds float, ptr @array5, i64 %idx.ext9, !dbg !13
  store ptr %add.ptr10, ptr %pointer5, align 8, !dbg !13
  br label %do.body, !dbg !14

do.body:                                          ; preds = %do.cond, %entry
  %6 = load ptr, ptr %pointer0, align 8, !dbg !15
  %7 = load float, ptr %6, align 4, !dbg !15
  %8 = load float, ptr @counter0, align 4, !dbg !15
  %add = fadd float %8, %7, !dbg !15
  store float %add, ptr @counter0, align 4, !dbg !15
  %9 = load ptr, ptr %pointer0, align 8, !dbg !15
  %add.ptr11 = getelementptr inbounds float, ptr %9, i64 3, !dbg !15
  store ptr %add.ptr11, ptr %pointer0, align 8, !dbg !15
  %10 = load ptr, ptr %pointer1, align 8, !dbg !15
  %11 = load float, ptr %10, align 4, !dbg !15
  %12 = load float, ptr @counter1, align 4, !dbg !15
  %add12 = fadd float %12, %11, !dbg !15
  store float %add12, ptr @counter1, align 4, !dbg !15
  %13 = load ptr, ptr %pointer1, align 8, !dbg !15
  %add.ptr13 = getelementptr inbounds float, ptr %13, i64 3, !dbg !15
  store ptr %add.ptr13, ptr %pointer1, align 8, !dbg !15
  %14 = load ptr, ptr %pointer2, align 8, !dbg !15
  %15 = load float, ptr %14, align 4, !dbg !15
  %16 = load float, ptr @counter2, align 4, !dbg !15
  %add14 = fadd float %16, %15, !dbg !15
  store float %add14, ptr @counter2, align 4, !dbg !15
  %17 = load ptr, ptr %pointer2, align 8, !dbg !15
  %add.ptr15 = getelementptr inbounds float, ptr %17, i64 3, !dbg !15
  store ptr %add.ptr15, ptr %pointer2, align 8, !dbg !15
  %18 = load ptr, ptr %pointer3, align 8, !dbg !15
  %19 = load float, ptr %18, align 4, !dbg !15
  %20 = load float, ptr @counter3, align 4, !dbg !15
  %add16 = fadd float %20, %19, !dbg !15
  store float %add16, ptr @counter3, align 4, !dbg !15
  %21 = load ptr, ptr %pointer3, align 8, !dbg !15
  %add.ptr17 = getelementptr inbounds float, ptr %21, i64 3, !dbg !15
  store ptr %add.ptr17, ptr %pointer3, align 8, !dbg !15
  %22 = load ptr, ptr %pointer4, align 8, !dbg !15
  %23 = load float, ptr %22, align 4, !dbg !15
  %24 = load float, ptr @counter4, align 4, !dbg !15
  %add18 = fadd float %24, %23, !dbg !15
  store float %add18, ptr @counter4, align 4, !dbg !15
  %25 = load ptr, ptr %pointer4, align 8, !dbg !15
  %add.ptr19 = getelementptr inbounds float, ptr %25, i64 3, !dbg !15
  store ptr %add.ptr19, ptr %pointer4, align 8, !dbg !15
  %26 = load ptr, ptr %pointer5, align 8, !dbg !15
  %27 = load float, ptr %26, align 4, !dbg !15
  %28 = load float, ptr @counter5, align 4, !dbg !15
  %add20 = fadd float %28, %27, !dbg !15
  store float %add20, ptr @counter5, align 4, !dbg !15
  %29 = load ptr, ptr %pointer5, align 8, !dbg !15
  %add.ptr21 = getelementptr inbounds float, ptr %29, i64 3, !dbg !15
  store ptr %add.ptr21, ptr %pointer5, align 8, !dbg !15
  %30 = load ptr, ptr %pointer0, align 8, !dbg !16
  %31 = load i32, ptr %x.addr, align 4, !dbg !16
  %idxprom = sext i32 %31 to i64, !dbg !16
  %arrayidx = getelementptr inbounds float, ptr %30, i64 %idxprom, !dbg !16
  %32 = load float, ptr %arrayidx, align 4, !dbg !16
  %33 = load float, ptr @counter0, align 4, !dbg !16
  %add22 = fadd float %33, %32, !dbg !16
  store float %add22, ptr @counter0, align 4, !dbg !16
  %34 = load ptr, ptr %pointer1, align 8, !dbg !16
  %35 = load i32, ptr %x.addr, align 4, !dbg !16
  %idxprom23 = sext i32 %35 to i64, !dbg !16
  %arrayidx24 = getelementptr inbounds float, ptr %34, i64 %idxprom23, !dbg !16
  %36 = load float, ptr %arrayidx24, align 4, !dbg !16
  %37 = load float, ptr @counter1, align 4, !dbg !16
  %add25 = fadd float %37, %36, !dbg !16
  store float %add25, ptr @counter1, align 4, !dbg !16
  %38 = load ptr, ptr %pointer2, align 8, !dbg !16
  %39 = load i32, ptr %x.addr, align 4, !dbg !16
  %idxprom26 = sext i32 %39 to i64, !dbg !16
  %arrayidx27 = getelementptr inbounds float, ptr %38, i64 %idxprom26, !dbg !16
  %40 = load float, ptr %arrayidx27, align 4, !dbg !16
  %41 = load float, ptr @counter2, align 4, !dbg !16
  %add28 = fadd float %41, %40, !dbg !16
  store float %add28, ptr @counter2, align 4, !dbg !16
  %42 = load ptr, ptr %pointer3, align 8, !dbg !16
  %43 = load i32, ptr %x.addr, align 4, !dbg !16
  %idxprom29 = sext i32 %43 to i64, !dbg !16
  %arrayidx30 = getelementptr inbounds float, ptr %42, i64 %idxprom29, !dbg !16
  %44 = load float, ptr %arrayidx30, align 4, !dbg !16
  %45 = load float, ptr @counter3, align 4, !dbg !16
  %add31 = fadd float %45, %44, !dbg !16
  store float %add31, ptr @counter3, align 4, !dbg !16
  %46 = load ptr, ptr %pointer4, align 8, !dbg !16
  %47 = load i32, ptr %x.addr, align 4, !dbg !16
  %idxprom32 = sext i32 %47 to i64, !dbg !16
  %arrayidx33 = getelementptr inbounds float, ptr %46, i64 %idxprom32, !dbg !16
  %48 = load float, ptr %arrayidx33, align 4, !dbg !16
  %49 = load float, ptr @counter4, align 4, !dbg !16
  %add34 = fadd float %49, %48, !dbg !16
  store float %add34, ptr @counter4, align 4, !dbg !16
  %50 = load ptr, ptr %pointer5, align 8, !dbg !16
  %51 = load i32, ptr %x.addr, align 4, !dbg !16
  %idxprom35 = sext i32 %51 to i64, !dbg !16
  %arrayidx36 = getelementptr inbounds float, ptr %50, i64 %idxprom35, !dbg !16
  %52 = load float, ptr %arrayidx36, align 4, !dbg !16
  %53 = load float, ptr @counter5, align 4, !dbg !16
  %add37 = fadd float %53, %52, !dbg !16
  store float %add37, ptr @counter5, align 4, !dbg !16
  %54 = load volatile i32, ptr @vol, align 4, !dbg !17
  store i32 %54, ptr %addend0, align 4, !dbg !17
  %55 = load volatile i32, ptr @vol, align 4, !dbg !17
  store i32 %55, ptr %addend1, align 4, !dbg !17
  %56 = load volatile i32, ptr @vol, align 4, !dbg !17
  store i32 %56, ptr %addend2, align 4, !dbg !17
  %57 = load volatile i32, ptr @vol, align 4, !dbg !17
  store i32 %57, ptr %addend3, align 4, !dbg !17
  %58 = load volatile i32, ptr @vol, align 4, !dbg !17
  store i32 %58, ptr %addend4, align 4, !dbg !17
  store i32 0, ptr %i, align 4, !dbg !18
  br label %for.cond, !dbg !19

for.cond:                                         ; preds = %for.inc, %do.body
  %59 = load i32, ptr %i, align 4, !dbg !20
  %cmp = icmp slt i32 %59, 10, !dbg !21
  br i1 %cmp, label %for.body, label %for.end, !dbg !22

for.body:                                         ; preds = %for.cond
  %60 = load i32, ptr %addend0, align 4, !dbg !23
  %61 = load volatile i32, ptr @vol, align 4, !dbg !23
  %add38 = add nsw i32 %61, %60, !dbg !23
  store volatile i32 %add38, ptr @vol, align 4, !dbg !23
  %62 = load i32, ptr %addend1, align 4, !dbg !23
  %63 = load volatile i32, ptr @vol, align 4, !dbg !23
  %add39 = add nsw i32 %63, %62, !dbg !23
  store volatile i32 %add39, ptr @vol, align 4, !dbg !23
  %64 = load i32, ptr %addend2, align 4, !dbg !23
  %65 = load volatile i32, ptr @vol, align 4, !dbg !23
  %add40 = add nsw i32 %65, %64, !dbg !23
  store volatile i32 %add40, ptr @vol, align 4, !dbg !23
  %66 = load i32, ptr %addend3, align 4, !dbg !23
  %67 = load volatile i32, ptr @vol, align 4, !dbg !23
  %add41 = add nsw i32 %67, %66, !dbg !23
  store volatile i32 %add41, ptr @vol, align 4, !dbg !23
  %68 = load i32, ptr %addend4, align 4, !dbg !23
  %69 = load volatile i32, ptr @vol, align 4, !dbg !23
  %add42 = add nsw i32 %69, %68, !dbg !23
  store volatile i32 %add42, ptr @vol, align 4, !dbg !23
  br label %for.inc, !dbg !23

for.inc:                                          ; preds = %for.body
  %70 = load i32, ptr %i, align 4, !dbg !24
  %inc = add nsw i32 %70, 1, !dbg !24
  store i32 %inc, ptr %i, align 4, !dbg !24
  br label %for.cond, !dbg !22, !llvm.loop !25

for.end:                                          ; preds = %for.cond
  br label %do.cond, !dbg !27

do.cond:                                          ; preds = %for.end
  %71 = load volatile i32, ptr @stop, align 4, !dbg !28
  %tobool = icmp ne i32 %71, 0, !dbg !29
  %lnot = xor i1 %tobool, true, !dbg !29
  br i1 %lnot, label %do.body, label %do.end, !dbg !27, !llvm.loop !30

do.end:                                           ; preds = %do.cond
  ret void, !dbg !32
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !33 {
entry:
  %exit_code = alloca i32, align 4
  store i32 0, ptr %exit_code, align 4, !dbg !34
  store float 1.000000e+00, ptr getelementptr inbounds ([16 x float], ptr @array0, i64 0, i64 1), align 4, !dbg !35
  store float 2.000000e+00, ptr getelementptr inbounds ([16 x float], ptr @array0, i64 0, i64 5), align 4, !dbg !35
  store float 1.000000e+00, ptr getelementptr inbounds ([16 x float], ptr @array1, i64 0, i64 1), align 4, !dbg !35
  store float 2.000000e+00, ptr getelementptr inbounds ([16 x float], ptr @array1, i64 0, i64 5), align 4, !dbg !35
  store float 1.000000e+00, ptr getelementptr inbounds ([16 x float], ptr @array2, i64 0, i64 1), align 4, !dbg !35
  store float 2.000000e+00, ptr getelementptr inbounds ([16 x float], ptr @array2, i64 0, i64 5), align 4, !dbg !35
  store float 1.000000e+00, ptr getelementptr inbounds ([16 x float], ptr @array3, i64 0, i64 1), align 4, !dbg !35
  store float 2.000000e+00, ptr getelementptr inbounds ([16 x float], ptr @array3, i64 0, i64 5), align 4, !dbg !35
  store float 1.000000e+00, ptr getelementptr inbounds ([16 x float], ptr @array4, i64 0, i64 1), align 4, !dbg !35
  store float 2.000000e+00, ptr getelementptr inbounds ([16 x float], ptr @array4, i64 0, i64 5), align 4, !dbg !35
  store float 1.000000e+00, ptr getelementptr inbounds ([16 x float], ptr @array5, i64 0, i64 1), align 4, !dbg !35
  store float 2.000000e+00, ptr getelementptr inbounds ([16 x float], ptr @array5, i64 0, i64 5), align 4, !dbg !35
  call void @foo(i32 noundef 1) #1, !dbg !36
  %0 = load float, ptr @counter0, align 4, !dbg !37
  %cmp = fcmp une float %0, 3.000000e+00, !dbg !37
  %conv = zext i1 %cmp to i32, !dbg !37
  %1 = load i32, ptr %exit_code, align 4, !dbg !37
  %or = or i32 %1, %conv, !dbg !37
  store i32 %or, ptr %exit_code, align 4, !dbg !37
  %2 = load float, ptr @counter1, align 4, !dbg !37
  %cmp1 = fcmp une float %2, 3.000000e+00, !dbg !37
  %conv2 = zext i1 %cmp1 to i32, !dbg !37
  %3 = load i32, ptr %exit_code, align 4, !dbg !37
  %or3 = or i32 %3, %conv2, !dbg !37
  store i32 %or3, ptr %exit_code, align 4, !dbg !37
  %4 = load float, ptr @counter2, align 4, !dbg !37
  %cmp4 = fcmp une float %4, 3.000000e+00, !dbg !37
  %conv5 = zext i1 %cmp4 to i32, !dbg !37
  %5 = load i32, ptr %exit_code, align 4, !dbg !37
  %or6 = or i32 %5, %conv5, !dbg !37
  store i32 %or6, ptr %exit_code, align 4, !dbg !37
  %6 = load float, ptr @counter3, align 4, !dbg !37
  %cmp7 = fcmp une float %6, 3.000000e+00, !dbg !37
  %conv8 = zext i1 %cmp7 to i32, !dbg !37
  %7 = load i32, ptr %exit_code, align 4, !dbg !37
  %or9 = or i32 %7, %conv8, !dbg !37
  store i32 %or9, ptr %exit_code, align 4, !dbg !37
  %8 = load float, ptr @counter4, align 4, !dbg !37
  %cmp10 = fcmp une float %8, 3.000000e+00, !dbg !37
  %conv11 = zext i1 %cmp10 to i32, !dbg !37
  %9 = load i32, ptr %exit_code, align 4, !dbg !37
  %or12 = or i32 %9, %conv11, !dbg !37
  store i32 %or12, ptr %exit_code, align 4, !dbg !37
  %10 = load float, ptr @counter5, align 4, !dbg !37
  %cmp13 = fcmp une float %10, 3.000000e+00, !dbg !37
  %conv14 = zext i1 %cmp13 to i32, !dbg !37
  %11 = load i32, ptr %exit_code, align 4, !dbg !37
  %or15 = or i32 %11, %conv14, !dbg !37
  store i32 %or15, ptr %exit_code, align 4, !dbg !37
  %12 = load i32, ptr %exit_code, align 4, !dbg !38
  ret i32 %12, !dbg !39
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\postmod-1.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "5ad23d6cafc55e78896b90e3669a14b8")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 33, type: !11, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\postmod-1.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "5ad23d6cafc55e78896b90e3669a14b8")
!11 = !DISubroutineType(types: !12)
!12 = !{}
!13 = !DILocation(line: 35, column: 15, scope: !9)
!14 = !DILocation(line: 38, column: 3, scope: !9)
!15 = !DILocation(line: 40, column: 13, scope: !9)
!16 = !DILocation(line: 41, column: 13, scope: !9)
!17 = !DILocation(line: 45, column: 13, scope: !9)
!18 = !DILocation(line: 46, column: 9, scope: !9)
!19 = !DILocation(line: 46, column: 7, scope: !9)
!20 = !DILocation(line: 46, column: 14, scope: !9)
!21 = !DILocation(line: 46, column: 16, scope: !9)
!22 = !DILocation(line: 46, column: 2, scope: !9)
!23 = !DILocation(line: 47, column: 11, scope: !9)
!24 = !DILocation(line: 46, column: 23, scope: !9)
!25 = distinct !{!25, !22, !23, !26}
!26 = !{!"llvm.loop.mustprogress"}
!27 = !DILocation(line: 49, column: 5, scope: !9)
!28 = !DILocation(line: 50, column: 11, scope: !9)
!29 = !DILocation(line: 50, column: 10, scope: !9)
!30 = distinct !{!30, !14, !31, !26}
!31 = !DILocation(line: 50, column: 15, scope: !9)
!32 = !DILocation(line: 51, column: 1, scope: !9)
!33 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 54, type: !11, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0)
!34 = !DILocation(line: 56, column: 7, scope: !33)
!35 = !DILocation(line: 58, column: 9, scope: !33)
!36 = !DILocation(line: 59, column: 3, scope: !33)
!37 = !DILocation(line: 60, column: 9, scope: !33)
!38 = !DILocation(line: 61, column: 10, scope: !33)
!39 = !DILocation(line: 61, column: 3, scope: !33)
