; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\090_0ff8084db560f478\WL.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\mempcpy-2-lib.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@inside_main = external local_unnamed_addr global i32, align 4

; Function Attrs: noinline nounwind
define dso_local ptr @mempcpy(ptr noundef writeonly captures(ret: address, provenance) %dst, ptr noundef readonly captures(none) %src, i64 noundef %n) local_unnamed_addr #0 !dbg !12 {
entry:
  %src8 = ptrtoint ptr %src to i64, !dbg !16
  %dst7 = ptrtoint ptr %dst to i64, !dbg !16
  %0 = load i32, ptr @inside_main, align 4, !dbg !16, !tbaa !8
  %tobool.not = icmp eq i32 %0, 0, !dbg !17
  br i1 %tobool.not, label %if.end, label %if.then, !dbg !18

if.then:                                          ; preds = %entry
  tail call void @abort() #2, !dbg !19
  br label %if.end, !dbg !19

if.end:                                           ; preds = %if.then, %entry
  %cmp.not3 = icmp eq i64 %n, 0, !dbg !20
  br i1 %cmp.not3, label %while.end, label %while.body.preheader, !dbg !21

while.body.preheader:                             ; preds = %if.end
  %min.iters.check = icmp ult i64 %n, 32, !dbg !22
  %1 = sub i64 %dst7, %src8, !dbg !22
  %diff.check = icmp ult i64 %1, 32, !dbg !22
  %or.cond = or i1 %min.iters.check, %diff.check, !dbg !22
  br i1 %or.cond, label %while.body.preheader13, label %vector.ph, !dbg !22

vector.ph:                                        ; preds = %while.body.preheader
  %n.vec = and i64 %n, -32
  %2 = getelementptr i8, ptr %dst, i64 %n.vec
  %3 = getelementptr i8, ptr %src, i64 %n.vec
  %4 = and i64 %n, 31
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %next.gep = getelementptr i8, ptr %dst, i64 %index
  %next.gep9 = getelementptr i8, ptr %src, i64 %index
  %5 = getelementptr i8, ptr %next.gep9, i64 16, !dbg !23
  %wide.load = load <16 x i8>, ptr %next.gep9, align 1, !dbg !23, !tbaa !24
  %wide.load10 = load <16 x i8>, ptr %5, align 1, !dbg !23, !tbaa !24
  %6 = getelementptr i8, ptr %next.gep, i64 16, !dbg !25
  store <16 x i8> %wide.load, ptr %next.gep, align 1, !dbg !25, !tbaa !24
  store <16 x i8> %wide.load10, ptr %6, align 1, !dbg !25, !tbaa !24
  %index.next = add nuw i64 %index, 32
  %7 = icmp eq i64 %index.next, %n.vec, !dbg !26
  br i1 %7, label %middle.block, label %vector.body, !dbg !26, !llvm.loop !27

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n, %n.vec, !dbg !26
  br i1 %cmp.n, label %while.end, label %while.body.preheader13, !dbg !26

while.body.preheader13:                           ; preds = %while.body.preheader, %middle.block
  %dstp.06.ph = phi ptr [ %dst, %while.body.preheader ], [ %2, %middle.block ]
  %srcp.05.ph = phi ptr [ %src, %while.body.preheader ], [ %3, %middle.block ]
  %n.addr.04.ph = phi i64 [ %n, %while.body.preheader ], [ %4, %middle.block ]
  %8 = add i64 %n.addr.04.ph, -1, !dbg !22
  %xtraiter = and i64 %n.addr.04.ph, 7, !dbg !22
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !22
  br i1 %lcmp.mod.not, label %while.body.prol.loopexit, label %while.body.prol, !dbg !22

while.body.prol:                                  ; preds = %while.body.preheader13, %while.body.prol
  %dstp.06.prol = phi ptr [ %incdec.ptr1.prol, %while.body.prol ], [ %dstp.06.ph, %while.body.preheader13 ]
  %srcp.05.prol = phi ptr [ %incdec.ptr.prol, %while.body.prol ], [ %srcp.05.ph, %while.body.preheader13 ]
  %n.addr.04.prol = phi i64 [ %dec.prol, %while.body.prol ], [ %n.addr.04.ph, %while.body.preheader13 ]
  %prol.iter = phi i64 [ %prol.iter.next, %while.body.prol ], [ 0, %while.body.preheader13 ]
  %dec.prol = add i64 %n.addr.04.prol, -1, !dbg !31
  %incdec.ptr.prol = getelementptr inbounds nuw i8, ptr %srcp.05.prol, i64 1, !dbg !32
  %9 = load i8, ptr %srcp.05.prol, align 1, !dbg !33, !tbaa !24
  %incdec.ptr1.prol = getelementptr inbounds nuw i8, ptr %dstp.06.prol, i64 1, !dbg !34
  store i8 %9, ptr %dstp.06.prol, align 1, !dbg !35, !tbaa !24
  %prol.iter.next = add i64 %prol.iter, 1, !dbg !36
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter, !dbg !36
  br i1 %prol.iter.cmp.not, label %while.body.prol.loopexit, label %while.body.prol, !dbg !36, !llvm.loop !37

while.body.prol.loopexit:                         ; preds = %while.body.prol, %while.body.preheader13
  %incdec.ptr1.lcssa.unr = phi ptr [ poison, %while.body.preheader13 ], [ %incdec.ptr1.prol, %while.body.prol ]
  %dstp.06.unr = phi ptr [ %dstp.06.ph, %while.body.preheader13 ], [ %incdec.ptr1.prol, %while.body.prol ]
  %srcp.05.unr = phi ptr [ %srcp.05.ph, %while.body.preheader13 ], [ %incdec.ptr.prol, %while.body.prol ]
  %n.addr.04.unr = phi i64 [ %n.addr.04.ph, %while.body.preheader13 ], [ %dec.prol, %while.body.prol ]
  %10 = icmp ult i64 %8, 7, !dbg !22
  br i1 %10, label %while.end, label %while.body, !dbg !22

while.body:                                       ; preds = %while.body.prol.loopexit, %while.body
  %dstp.06 = phi ptr [ %incdec.ptr1.7, %while.body ], [ %dstp.06.unr, %while.body.prol.loopexit ]
  %srcp.05 = phi ptr [ %incdec.ptr.7, %while.body ], [ %srcp.05.unr, %while.body.prol.loopexit ]
  %n.addr.04 = phi i64 [ %dec.7, %while.body ], [ %n.addr.04.unr, %while.body.prol.loopexit ]
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %srcp.05, i64 1, !dbg !39
  %11 = load i8, ptr %srcp.05, align 1, !dbg !23, !tbaa !24
  %incdec.ptr1 = getelementptr inbounds nuw i8, ptr %dstp.06, i64 1, !dbg !40
  store i8 %11, ptr %dstp.06, align 1, !dbg !25, !tbaa !24
  %incdec.ptr.1 = getelementptr inbounds nuw i8, ptr %srcp.05, i64 2, !dbg !41
  %12 = load i8, ptr %incdec.ptr, align 1, !dbg !42, !tbaa !24
  %incdec.ptr1.1 = getelementptr inbounds nuw i8, ptr %dstp.06, i64 2, !dbg !43
  store i8 %12, ptr %incdec.ptr1, align 1, !dbg !44, !tbaa !24
  %incdec.ptr.2 = getelementptr inbounds nuw i8, ptr %srcp.05, i64 3, !dbg !45
  %13 = load i8, ptr %incdec.ptr.1, align 1, !dbg !46, !tbaa !24
  %incdec.ptr1.2 = getelementptr inbounds nuw i8, ptr %dstp.06, i64 3, !dbg !47
  store i8 %13, ptr %incdec.ptr1.1, align 1, !dbg !48, !tbaa !24
  %incdec.ptr.3 = getelementptr inbounds nuw i8, ptr %srcp.05, i64 4, !dbg !49
  %14 = load i8, ptr %incdec.ptr.2, align 1, !dbg !50, !tbaa !24
  %incdec.ptr1.3 = getelementptr inbounds nuw i8, ptr %dstp.06, i64 4, !dbg !51
  store i8 %14, ptr %incdec.ptr1.2, align 1, !dbg !52, !tbaa !24
  %incdec.ptr.4 = getelementptr inbounds nuw i8, ptr %srcp.05, i64 5, !dbg !53
  %15 = load i8, ptr %incdec.ptr.3, align 1, !dbg !54, !tbaa !24
  %incdec.ptr1.4 = getelementptr inbounds nuw i8, ptr %dstp.06, i64 5, !dbg !55
  store i8 %15, ptr %incdec.ptr1.3, align 1, !dbg !56, !tbaa !24
  %incdec.ptr.5 = getelementptr inbounds nuw i8, ptr %srcp.05, i64 6, !dbg !57
  %16 = load i8, ptr %incdec.ptr.4, align 1, !dbg !58, !tbaa !24
  %incdec.ptr1.5 = getelementptr inbounds nuw i8, ptr %dstp.06, i64 6, !dbg !59
  store i8 %16, ptr %incdec.ptr1.4, align 1, !dbg !60, !tbaa !24
  %incdec.ptr.6 = getelementptr inbounds nuw i8, ptr %srcp.05, i64 7, !dbg !61
  %17 = load i8, ptr %incdec.ptr.5, align 1, !dbg !62, !tbaa !24
  %incdec.ptr1.6 = getelementptr inbounds nuw i8, ptr %dstp.06, i64 7, !dbg !63
  store i8 %17, ptr %incdec.ptr1.5, align 1, !dbg !64, !tbaa !24
  %dec.7 = add i64 %n.addr.04, -8, !dbg !65
  %incdec.ptr.7 = getelementptr inbounds nuw i8, ptr %srcp.05, i64 8, !dbg !66
  %18 = load i8, ptr %incdec.ptr.6, align 1, !dbg !67, !tbaa !24
  %incdec.ptr1.7 = getelementptr inbounds nuw i8, ptr %dstp.06, i64 8, !dbg !68
  store i8 %18, ptr %incdec.ptr1.6, align 1, !dbg !69, !tbaa !24
  %cmp.not.7 = icmp eq i64 %dec.7, 0, !dbg !70
  br i1 %cmp.not.7, label %while.end, label %while.body, !dbg !71, !llvm.loop !72

while.end:                                        ; preds = %while.body.prol.loopexit, %while.body, %middle.block, %if.end
  %dstp.0.lcssa = phi ptr [ %dst, %if.end ], [ %2, %middle.block ], [ %incdec.ptr1.lcssa.unr, %while.body.prol.loopexit ], [ %incdec.ptr1.7, %while.body ], !dbg !74
  ret ptr %dstp.0.lcssa, !dbg !75
}

declare !dbg !76 void @abort() local_unnamed_addr #1

attributes #0 = { noinline nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\mempcpy-2-lib.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "1a3ea4e36df441704d8d1b28df3bd7ed")
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
!12 = distinct !DISubprogram(name: "mempcpy", scope: !13, file: !13, line: 6, type: !14, scopeLine: 7, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\lib\\mempcpy.c", directory: "<LEGACY_LOCAL_PROJECT_ROOT>", checksumkind: CSK_MD5, checksum: "79d24230050016890f5bde84312a817c")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 12, column: 7, scope: !12)
!17 = !DILocation(line: 12, column: 7, scope: !12, atomGroup: 1, atomRank: 2)
!18 = !DILocation(line: 12, column: 7, scope: !12, atomGroup: 1, atomRank: 1)
!19 = !DILocation(line: 13, column: 5, scope: !12)
!20 = !DILocation(line: 18, column: 14, scope: !12, atomGroup: 12, atomRank: 1)
!21 = !DILocation(line: 18, column: 3, scope: !12, atomGroup: 13, atomRank: 1)
!22 = !DILocation(line: 18, column: 3, scope: !12)
!23 = !DILocation(line: 19, column: 15, scope: !12, atomGroup: 7, atomRank: 2)
!24 = !{!10, !10, i64 0}
!25 = !DILocation(line: 19, column: 13, scope: !12, atomGroup: 7, atomRank: 1)
!26 = !DILocation(line: 18, column: 3, scope: !12, atomGroup: 6, atomRank: 1)
!27 = distinct !{!27, !28, !29, !30}
!28 = !{!"llvm.loop.mustprogress"}
!29 = !{!"llvm.loop.isvectorized", i32 1}
!30 = !{!"llvm.loop.unroll.runtime.disable"}
!31 = !DILocation(line: 18, column: 11, scope: !12, atomGroup: 14, atomRank: 2)
!32 = !DILocation(line: 19, column: 20, scope: !12, atomGroup: 15, atomRank: 2)
!33 = !DILocation(line: 19, column: 15, scope: !12, atomGroup: 16, atomRank: 2)
!34 = !DILocation(line: 19, column: 10, scope: !12, atomGroup: 17, atomRank: 2)
!35 = !DILocation(line: 19, column: 13, scope: !12, atomGroup: 16, atomRank: 1)
!36 = !DILocation(line: 18, column: 3, scope: !12, atomGroup: 19, atomRank: 1)
!37 = distinct !{!37, !38}
!38 = !{!"llvm.loop.unroll.disable"}
!39 = !DILocation(line: 19, column: 20, scope: !12, atomGroup: 8, atomRank: 2)
!40 = !DILocation(line: 19, column: 10, scope: !12, atomGroup: 9, atomRank: 2)
!41 = !DILocation(line: 19, column: 20, scope: !12, atomGroup: 21, atomRank: 2)
!42 = !DILocation(line: 19, column: 15, scope: !12, atomGroup: 22, atomRank: 2)
!43 = !DILocation(line: 19, column: 10, scope: !12, atomGroup: 23, atomRank: 2)
!44 = !DILocation(line: 19, column: 13, scope: !12, atomGroup: 22, atomRank: 1)
!45 = !DILocation(line: 19, column: 20, scope: !12, atomGroup: 27, atomRank: 2)
!46 = !DILocation(line: 19, column: 15, scope: !12, atomGroup: 28, atomRank: 2)
!47 = !DILocation(line: 19, column: 10, scope: !12, atomGroup: 29, atomRank: 2)
!48 = !DILocation(line: 19, column: 13, scope: !12, atomGroup: 28, atomRank: 1)
!49 = !DILocation(line: 19, column: 20, scope: !12, atomGroup: 33, atomRank: 2)
!50 = !DILocation(line: 19, column: 15, scope: !12, atomGroup: 34, atomRank: 2)
!51 = !DILocation(line: 19, column: 10, scope: !12, atomGroup: 35, atomRank: 2)
!52 = !DILocation(line: 19, column: 13, scope: !12, atomGroup: 34, atomRank: 1)
!53 = !DILocation(line: 19, column: 20, scope: !12, atomGroup: 39, atomRank: 2)
!54 = !DILocation(line: 19, column: 15, scope: !12, atomGroup: 40, atomRank: 2)
!55 = !DILocation(line: 19, column: 10, scope: !12, atomGroup: 41, atomRank: 2)
!56 = !DILocation(line: 19, column: 13, scope: !12, atomGroup: 40, atomRank: 1)
!57 = !DILocation(line: 19, column: 20, scope: !12, atomGroup: 45, atomRank: 2)
!58 = !DILocation(line: 19, column: 15, scope: !12, atomGroup: 46, atomRank: 2)
!59 = !DILocation(line: 19, column: 10, scope: !12, atomGroup: 47, atomRank: 2)
!60 = !DILocation(line: 19, column: 13, scope: !12, atomGroup: 46, atomRank: 1)
!61 = !DILocation(line: 19, column: 20, scope: !12, atomGroup: 51, atomRank: 2)
!62 = !DILocation(line: 19, column: 15, scope: !12, atomGroup: 52, atomRank: 2)
!63 = !DILocation(line: 19, column: 10, scope: !12, atomGroup: 53, atomRank: 2)
!64 = !DILocation(line: 19, column: 13, scope: !12, atomGroup: 52, atomRank: 1)
!65 = !DILocation(line: 18, column: 11, scope: !12, atomGroup: 56, atomRank: 2)
!66 = !DILocation(line: 19, column: 20, scope: !12, atomGroup: 57, atomRank: 2)
!67 = !DILocation(line: 19, column: 15, scope: !12, atomGroup: 58, atomRank: 2)
!68 = !DILocation(line: 19, column: 10, scope: !12, atomGroup: 59, atomRank: 2)
!69 = !DILocation(line: 19, column: 13, scope: !12, atomGroup: 58, atomRank: 1)
!70 = !DILocation(line: 18, column: 14, scope: !12, atomGroup: 60, atomRank: 1)
!71 = !DILocation(line: 18, column: 3, scope: !12, atomGroup: 61, atomRank: 1)
!72 = distinct !{!72, !22, !73, !28, !29}
!73 = !DILocation(line: 19, column: 20, scope: !12)
!74 = !DILocation(line: 0, scope: !12)
!75 = !DILocation(line: 21, column: 3, scope: !12, atomGroup: 11, atomRank: 1)
!76 = !DISubprogram(name: "abort", scope: !13, file: !13, line: 1, type: !14, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
