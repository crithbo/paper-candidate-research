; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\088_0fc8f01d9827aad9\B1.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr32244-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type { i64 }

@x = dso_local local_unnamed_addr global %struct.foo zeroinitializer, align 8

; Function Attrs: nounwind
define dso_local void @test1(i64 noundef %res) local_unnamed_addr #0 !dbg !12 {
entry:
  %bf.load = load i64, ptr @x, align 8, !dbg !16
  %shl = shl i64 %bf.load, 32, !dbg !17
  %cmp.not = icmp eq i64 %shl, %res, !dbg !18
  br i1 %cmp.not, label %if.end, label %if.then, !dbg !19

if.then:                                          ; preds = %entry
  tail call void @abort() #2, !dbg !20
  br label %if.end, !dbg !20

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !21
}

declare !dbg !22 void @abort() local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 !dbg !23 {
test1.exit:
  %bf.load = load i64, ptr @x, align 8, !dbg !24
  %bf.clear = and i64 %bf.load, -1099511627776, !dbg !24
  %bf.set = or disjoint i64 %bf.clear, 256, !dbg !25
  store i64 %bf.set, ptr @x, align 8, !dbg !26
  tail call void @abort() #2, !dbg !27
  ret i32 0, !dbg !29
}

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr32244-1.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "542fec010f8e486be9ae35b71e7c132d")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = distinct !DISubprogram(name: "test1", scope: !13, file: !13, line: 8, type: !14, scopeLine: 9, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr32244-1.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "542fec010f8e486be9ae35b71e7c132d")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 11, column: 9, scope: !12)
!17 = !DILocation(line: 11, column: 10, scope: !12)
!18 = !DILocation(line: 11, column: 15, scope: !12, atomGroup: 1, atomRank: 2)
!19 = !DILocation(line: 11, column: 15, scope: !12, atomGroup: 1, atomRank: 1)
!20 = !DILocation(line: 12, column: 5, scope: !12)
!21 = !DILocation(line: 13, column: 1, scope: !12, atomGroup: 2, atomRank: 1)
!22 = !DISubprogram(name: "abort", scope: !13, file: !13, line: 6, type: !14, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!23 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 15, type: !14, scopeLine: 16, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!24 = !DILocation(line: 17, column: 7, scope: !23)
!25 = !DILocation(line: 17, column: 7, scope: !23, atomGroup: 1, atomRank: 2)
!26 = !DILocation(line: 17, column: 7, scope: !23, atomGroup: 1, atomRank: 1)
!27 = !DILocation(line: 12, column: 5, scope: !12, inlinedAt: !28)
!28 = distinct !DILocation(line: 18, column: 3, scope: !23)
!29 = !DILocation(line: 19, column: 3, scope: !23, atomGroup: 2, atomRank: 1)
