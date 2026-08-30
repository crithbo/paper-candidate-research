; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\086_0fafa130e45773b4\B2.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\memmove-lib.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@inside_main = external local_unnamed_addr global i32, align 4

; Function Attrs: noinline nounwind
define dso_local noundef ptr @memmove(ptr noundef returned writeonly captures(address, ret: address, provenance) %dst, ptr noundef readonly captures(address) %src, i64 noundef %n) local_unnamed_addr #0 !dbg !12 {
entry:
  %dst47 = ptrtoint ptr %dst to i64, !dbg !16
  %src30 = ptrtoint ptr %src to i64, !dbg !16
  %dst29 = ptrtoint ptr %dst to i64, !dbg !16
  %0 = load i32, ptr @inside_main, align 4, !dbg !16, !tbaa !8
  %tobool.not = icmp eq i32 %0, 0, !dbg !17
  br i1 %tobool.not, label %if.end, label %if.then, !dbg !18

if.then:                                          ; preds = %entry
  tail call void @abort() #3, !dbg !19
  br label %if.end, !dbg !19

if.end:                                           ; preds = %if.then, %entry
  %cmp = icmp ult ptr %src, %dst, !dbg !20
  %cmp2.not24 = icmp eq i64 %n, 0, !dbg !21
  br i1 %cmp, label %while.cond.preheader, label %while.cond4.preheader, !dbg !22

while.cond4.preheader:                            ; preds = %if.end
  br i1 %cmp2.not24, label %if.end10, label %iter.check, !dbg !23

iter.check:                                       ; preds = %while.cond4.preheader
  %min.iters.check = icmp ult i64 %n, 4, !dbg !24
  %1 = sub i64 %dst29, %src30, !dbg !24
  %diff.check = icmp ult i64 %1, 32, !dbg !24
  %or.cond = or i1 %min.iters.check, %diff.check, !dbg !24
  br i1 %or.cond, label %while.body7.preheader, label %vector.main.loop.iter.check, !dbg !24

vector.main.loop.iter.check:                      ; preds = %iter.check
  %min.iters.check31 = icmp ult i64 %n, 32, !dbg !24
  br i1 %min.iters.check31, label %vec.epilog.ph, label %vector.ph, !dbg !24

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.mod.vf = and i64 %n, 28
  %n.vec = and i64 %n, -32
  br label %vector.body, !dbg !24

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %next.gep = getelementptr i8, ptr %src, i64 %index
  %next.gep32 = getelementptr i8, ptr %dst, i64 %index
  %2 = getelementptr i8, ptr %next.gep, i64 16, !dbg !25
  %wide.load = load <16 x i8>, ptr %next.gep, align 1, !dbg !25, !tbaa !26
  %wide.load33 = load <16 x i8>, ptr %2, align 1, !dbg !25, !tbaa !26
  %3 = getelementptr i8, ptr %next.gep32, i64 16, !dbg !27
  store <16 x i8> %wide.load, ptr %next.gep32, align 1, !dbg !27, !tbaa !26
  store <16 x i8> %wide.load33, ptr %3, align 1, !dbg !27, !tbaa !26
  %index.next = add nuw i64 %index, 32
  %4 = icmp eq i64 %index.next, %n.vec, !dbg !28
  br i1 %4, label %middle.block, label %vector.body, !dbg !28, !llvm.loop !29

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n, %n.vec, !dbg !28
  br i1 %cmp.n, label %if.end10, label %vec.epilog.iter.check, !dbg !28

vec.epilog.iter.check:                            ; preds = %middle.block
  %ind.end = getelementptr i8, ptr %src, i64 %n.vec
  %ind.end44 = getelementptr i8, ptr %dst, i64 %n.vec
  %ind.end45 = and i64 %n, 31
  %min.epilog.iters.check = icmp eq i64 %n.mod.vf, 0
  br i1 %min.epilog.iters.check, label %while.body7.preheader, label %vec.epilog.ph, !prof !33

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %n.vec35 = and i64 %n, -4
  %5 = getelementptr i8, ptr %src, i64 %n.vec35
  %6 = getelementptr i8, ptr %dst, i64 %n.vec35
  %7 = and i64 %n, 3
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %index36 = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next40, %vec.epilog.vector.body ]
  %next.gep37 = getelementptr i8, ptr %src, i64 %index36
  %next.gep38 = getelementptr i8, ptr %dst, i64 %index36
  %wide.load39 = load <4 x i8>, ptr %next.gep37, align 1, !dbg !25, !tbaa !26
  store <4 x i8> %wide.load39, ptr %next.gep38, align 1, !dbg !27, !tbaa !26
  %index.next40 = add nuw i64 %index36, 4
  %8 = icmp eq i64 %index.next40, %n.vec35, !dbg !28
  br i1 %8, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !dbg !28, !llvm.loop !34

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n41 = icmp eq i64 %n, %n.vec35, !dbg !28
  br i1 %cmp.n41, label %if.end10, label %while.body7.preheader, !dbg !28

while.body7.preheader:                            ; preds = %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %srcp.023.ph = phi ptr [ %src, %iter.check ], [ %ind.end, %vec.epilog.iter.check ], [ %5, %vec.epilog.middle.block ]
  %dstp.022.ph = phi ptr [ %dst, %iter.check ], [ %ind.end44, %vec.epilog.iter.check ], [ %6, %vec.epilog.middle.block ]
  %n.addr.121.ph = phi i64 [ %n, %iter.check ], [ %ind.end45, %vec.epilog.iter.check ], [ %7, %vec.epilog.middle.block ]
  %9 = add i64 %n.addr.121.ph, -1, !dbg !24
  %xtraiter = and i64 %n.addr.121.ph, 7, !dbg !24
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !24
  br i1 %lcmp.mod.not, label %while.body7.prol.loopexit, label %while.body7.prol, !dbg !24

while.body7.prol:                                 ; preds = %while.body7.preheader, %while.body7.prol
  %srcp.023.prol = phi ptr [ %incdec.ptr.prol, %while.body7.prol ], [ %srcp.023.ph, %while.body7.preheader ]
  %dstp.022.prol = phi ptr [ %incdec.ptr8.prol, %while.body7.prol ], [ %dstp.022.ph, %while.body7.preheader ]
  %n.addr.121.prol = phi i64 [ %dec5.prol, %while.body7.prol ], [ %n.addr.121.ph, %while.body7.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %while.body7.prol ], [ 0, %while.body7.preheader ]
  %dec5.prol = add i64 %n.addr.121.prol, -1, !dbg !35
  %incdec.ptr.prol = getelementptr inbounds nuw i8, ptr %srcp.023.prol, i64 1, !dbg !36
  %10 = load i8, ptr %srcp.023.prol, align 1, !dbg !37, !tbaa !26
  %incdec.ptr8.prol = getelementptr inbounds nuw i8, ptr %dstp.022.prol, i64 1, !dbg !38
  store i8 %10, ptr %dstp.022.prol, align 1, !dbg !39, !tbaa !26
  %prol.iter.next = add i64 %prol.iter, 1, !dbg !40
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter, !dbg !40
  br i1 %prol.iter.cmp.not, label %while.body7.prol.loopexit, label %while.body7.prol, !dbg !40, !llvm.loop !41

while.body7.prol.loopexit:                        ; preds = %while.body7.prol, %while.body7.preheader
  %srcp.023.unr = phi ptr [ %srcp.023.ph, %while.body7.preheader ], [ %incdec.ptr.prol, %while.body7.prol ]
  %dstp.022.unr = phi ptr [ %dstp.022.ph, %while.body7.preheader ], [ %incdec.ptr8.prol, %while.body7.prol ]
  %n.addr.121.unr = phi i64 [ %n.addr.121.ph, %while.body7.preheader ], [ %dec5.prol, %while.body7.prol ]
  %11 = icmp ult i64 %9, 7, !dbg !24
  br i1 %11, label %if.end10, label %while.body7, !dbg !24

while.cond.preheader:                             ; preds = %if.end
  br i1 %cmp2.not24, label %if.end10, label %iter.check51, !dbg !43

iter.check51:                                     ; preds = %while.cond.preheader
  %min.iters.check49 = icmp ult i64 %n, 8, !dbg !44
  %12 = sub i64 %src30, %dst47, !dbg !44
  %diff.check48 = icmp ult i64 %12, 32, !dbg !44
  %or.cond84 = or i1 %min.iters.check49, %diff.check48, !dbg !44
  br i1 %or.cond84, label %while.body.preheader, label %vector.main.loop.iter.check53, !dbg !44

vector.main.loop.iter.check53:                    ; preds = %iter.check51
  %min.iters.check52 = icmp ult i64 %n, 32, !dbg !44
  br i1 %min.iters.check52, label %vec.epilog.ph71, label %vector.ph54, !dbg !44

vector.ph54:                                      ; preds = %vector.main.loop.iter.check53
  %n.mod.vf55 = and i64 %n, 24
  %n.vec56 = and i64 %n, -32
  br label %vector.body57, !dbg !44

vector.body57:                                    ; preds = %vector.body57, %vector.ph54
  %index58 = phi i64 [ 0, %vector.ph54 ], [ %index.next64, %vector.body57 ]
  %13 = xor i64 %index58, -1, !dbg !45
  %14 = add i64 %n, %13, !dbg !45
  %15 = getelementptr inbounds nuw i8, ptr %src, i64 %14, !dbg !46
  %16 = getelementptr inbounds i8, ptr %15, i64 -15, !dbg !47
  %17 = getelementptr inbounds i8, ptr %15, i64 -31, !dbg !47
  %wide.load59 = load <16 x i8>, ptr %16, align 1, !dbg !47, !tbaa !26
  %wide.load60 = load <16 x i8>, ptr %17, align 1, !dbg !47, !tbaa !26
  %18 = getelementptr inbounds nuw i8, ptr %dst, i64 %14, !dbg !48
  %19 = getelementptr inbounds i8, ptr %18, i64 -15, !dbg !49
  %20 = getelementptr inbounds i8, ptr %18, i64 -31, !dbg !49
  store <16 x i8> %wide.load59, ptr %19, align 1, !dbg !49, !tbaa !26
  store <16 x i8> %wide.load60, ptr %20, align 1, !dbg !49, !tbaa !26
  %index.next64 = add nuw i64 %index58, 32
  %21 = icmp eq i64 %index.next64, %n.vec56, !dbg !50
  br i1 %21, label %middle.block65, label %vector.body57, !dbg !50, !llvm.loop !51

middle.block65:                                   ; preds = %vector.body57
  %cmp.n66 = icmp eq i64 %n, %n.vec56, !dbg !50
  br i1 %cmp.n66, label %if.end10, label %vec.epilog.iter.check69, !dbg !50

vec.epilog.iter.check69:                          ; preds = %middle.block65
  %ind.end83 = and i64 %n, 31
  %min.epilog.iters.check70 = icmp eq i64 %n.mod.vf55, 0
  br i1 %min.epilog.iters.check70, label %while.body.preheader, label %vec.epilog.ph71, !prof !52

vec.epilog.ph71:                                  ; preds = %vector.main.loop.iter.check53, %vec.epilog.iter.check69
  %vec.epilog.resume.val67 = phi i64 [ %n.vec56, %vec.epilog.iter.check69 ], [ 0, %vector.main.loop.iter.check53 ]
  %n.vec73 = and i64 %n, -8
  %22 = and i64 %n, 7
  br label %vec.epilog.vector.body74

vec.epilog.vector.body74:                         ; preds = %vec.epilog.vector.body74, %vec.epilog.ph71
  %index75 = phi i64 [ %vec.epilog.resume.val67, %vec.epilog.ph71 ], [ %index.next79, %vec.epilog.vector.body74 ]
  %23 = xor i64 %index75, -1, !dbg !45
  %24 = add i64 %n, %23, !dbg !45
  %25 = getelementptr inbounds nuw i8, ptr %src, i64 %24, !dbg !46
  %26 = getelementptr inbounds i8, ptr %25, i64 -7, !dbg !47
  %wide.load76 = load <8 x i8>, ptr %26, align 1, !dbg !47, !tbaa !26
  %27 = getelementptr inbounds nuw i8, ptr %dst, i64 %24, !dbg !48
  %28 = getelementptr inbounds i8, ptr %27, i64 -7, !dbg !49
  store <8 x i8> %wide.load76, ptr %28, align 1, !dbg !49, !tbaa !26
  %index.next79 = add nuw i64 %index75, 8
  %29 = icmp eq i64 %index.next79, %n.vec73, !dbg !50
  br i1 %29, label %vec.epilog.middle.block80, label %vec.epilog.vector.body74, !dbg !50, !llvm.loop !53

vec.epilog.middle.block80:                        ; preds = %vec.epilog.vector.body74
  %cmp.n81 = icmp eq i64 %n, %n.vec73, !dbg !50
  br i1 %cmp.n81, label %if.end10, label %while.body.preheader, !dbg !50

while.body.preheader:                             ; preds = %iter.check51, %vec.epilog.iter.check69, %vec.epilog.middle.block80
  %n.addr.025.ph = phi i64 [ %n, %iter.check51 ], [ %ind.end83, %vec.epilog.iter.check69 ], [ %22, %vec.epilog.middle.block80 ]
  %30 = add i64 %n.addr.025.ph, -1, !dbg !44
  %xtraiter86 = and i64 %n.addr.025.ph, 3, !dbg !44
  %lcmp.mod87.not = icmp eq i64 %xtraiter86, 0, !dbg !44
  br i1 %lcmp.mod87.not, label %while.body.prol.loopexit, label %while.body.prol, !dbg !44

while.body.prol:                                  ; preds = %while.body.preheader, %while.body.prol
  %n.addr.025.prol = phi i64 [ %dec.prol, %while.body.prol ], [ %n.addr.025.ph, %while.body.preheader ]
  %prol.iter88 = phi i64 [ %prol.iter88.next, %while.body.prol ], [ 0, %while.body.preheader ]
  %dec.prol = add i64 %n.addr.025.prol, -1, !dbg !54
  %arrayidx.prol = getelementptr inbounds nuw i8, ptr %src, i64 %dec.prol, !dbg !46
  %31 = load i8, ptr %arrayidx.prol, align 1, !dbg !55, !tbaa !26
  %arrayidx3.prol = getelementptr inbounds nuw i8, ptr %dst, i64 %dec.prol, !dbg !48
  store i8 %31, ptr %arrayidx3.prol, align 1, !dbg !56, !tbaa !26
  %prol.iter88.next = add i64 %prol.iter88, 1, !dbg !57
  %prol.iter88.cmp.not = icmp eq i64 %prol.iter88.next, %xtraiter86, !dbg !57
  br i1 %prol.iter88.cmp.not, label %while.body.prol.loopexit, label %while.body.prol, !dbg !57, !llvm.loop !58

while.body.prol.loopexit:                         ; preds = %while.body.prol, %while.body.preheader
  %n.addr.025.unr = phi i64 [ %n.addr.025.ph, %while.body.preheader ], [ %dec.prol, %while.body.prol ]
  %32 = icmp ult i64 %30, 3, !dbg !44
  br i1 %32, label %if.end10, label %while.body, !dbg !44

while.body:                                       ; preds = %while.body.prol.loopexit, %while.body
  %n.addr.025 = phi i64 [ %dec.3, %while.body ], [ %n.addr.025.unr, %while.body.prol.loopexit ]
  %dec = add i64 %n.addr.025, -1, !dbg !45
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i64 %dec, !dbg !46
  %33 = load i8, ptr %arrayidx, align 1, !dbg !47, !tbaa !26
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %dst, i64 %dec, !dbg !48
  store i8 %33, ptr %arrayidx3, align 1, !dbg !49, !tbaa !26
  %dec.1 = add i64 %n.addr.025, -2, !dbg !59
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %src, i64 %dec.1, !dbg !46
  %34 = load i8, ptr %arrayidx.1, align 1, !dbg !60, !tbaa !26
  %arrayidx3.1 = getelementptr inbounds nuw i8, ptr %dst, i64 %dec.1, !dbg !48
  store i8 %34, ptr %arrayidx3.1, align 1, !dbg !61, !tbaa !26
  %dec.2 = add i64 %n.addr.025, -3, !dbg !62
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %src, i64 %dec.2, !dbg !46
  %35 = load i8, ptr %arrayidx.2, align 1, !dbg !63, !tbaa !26
  %arrayidx3.2 = getelementptr inbounds nuw i8, ptr %dst, i64 %dec.2, !dbg !48
  store i8 %35, ptr %arrayidx3.2, align 1, !dbg !64, !tbaa !26
  %dec.3 = add i64 %n.addr.025, -4, !dbg !65
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %src, i64 %dec.3, !dbg !46
  %36 = load i8, ptr %arrayidx.3, align 1, !dbg !66, !tbaa !26
  %arrayidx3.3 = getelementptr inbounds nuw i8, ptr %dst, i64 %dec.3, !dbg !48
  store i8 %36, ptr %arrayidx3.3, align 1, !dbg !67, !tbaa !26
  %cmp2.not.3 = icmp eq i64 %dec.3, 0, !dbg !68
  br i1 %cmp2.not.3, label %if.end10, label %while.body, !dbg !69, !llvm.loop !70

while.body7:                                      ; preds = %while.body7.prol.loopexit, %while.body7
  %srcp.023 = phi ptr [ %incdec.ptr.7, %while.body7 ], [ %srcp.023.unr, %while.body7.prol.loopexit ]
  %dstp.022 = phi ptr [ %incdec.ptr8.7, %while.body7 ], [ %dstp.022.unr, %while.body7.prol.loopexit ]
  %n.addr.121 = phi i64 [ %dec5.7, %while.body7 ], [ %n.addr.121.unr, %while.body7.prol.loopexit ]
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %srcp.023, i64 1, !dbg !72
  %37 = load i8, ptr %srcp.023, align 1, !dbg !25, !tbaa !26
  %incdec.ptr8 = getelementptr inbounds nuw i8, ptr %dstp.022, i64 1, !dbg !73
  store i8 %37, ptr %dstp.022, align 1, !dbg !27, !tbaa !26
  %incdec.ptr.1 = getelementptr inbounds nuw i8, ptr %srcp.023, i64 2, !dbg !74
  %38 = load i8, ptr %incdec.ptr, align 1, !dbg !75, !tbaa !26
  %incdec.ptr8.1 = getelementptr inbounds nuw i8, ptr %dstp.022, i64 2, !dbg !76
  store i8 %38, ptr %incdec.ptr8, align 1, !dbg !77, !tbaa !26
  %incdec.ptr.2 = getelementptr inbounds nuw i8, ptr %srcp.023, i64 3, !dbg !78
  %39 = load i8, ptr %incdec.ptr.1, align 1, !dbg !79, !tbaa !26
  %incdec.ptr8.2 = getelementptr inbounds nuw i8, ptr %dstp.022, i64 3, !dbg !80
  store i8 %39, ptr %incdec.ptr8.1, align 1, !dbg !81, !tbaa !26
  %incdec.ptr.3 = getelementptr inbounds nuw i8, ptr %srcp.023, i64 4, !dbg !82
  %40 = load i8, ptr %incdec.ptr.2, align 1, !dbg !83, !tbaa !26
  %incdec.ptr8.3 = getelementptr inbounds nuw i8, ptr %dstp.022, i64 4, !dbg !84
  store i8 %40, ptr %incdec.ptr8.2, align 1, !dbg !85, !tbaa !26
  %incdec.ptr.4 = getelementptr inbounds nuw i8, ptr %srcp.023, i64 5, !dbg !86
  %41 = load i8, ptr %incdec.ptr.3, align 1, !dbg !87, !tbaa !26
  %incdec.ptr8.4 = getelementptr inbounds nuw i8, ptr %dstp.022, i64 5, !dbg !88
  store i8 %41, ptr %incdec.ptr8.3, align 1, !dbg !89, !tbaa !26
  %incdec.ptr.5 = getelementptr inbounds nuw i8, ptr %srcp.023, i64 6, !dbg !90
  %42 = load i8, ptr %incdec.ptr.4, align 1, !dbg !91, !tbaa !26
  %incdec.ptr8.5 = getelementptr inbounds nuw i8, ptr %dstp.022, i64 6, !dbg !92
  store i8 %42, ptr %incdec.ptr8.4, align 1, !dbg !93, !tbaa !26
  %incdec.ptr.6 = getelementptr inbounds nuw i8, ptr %srcp.023, i64 7, !dbg !94
  %43 = load i8, ptr %incdec.ptr.5, align 1, !dbg !95, !tbaa !26
  %incdec.ptr8.6 = getelementptr inbounds nuw i8, ptr %dstp.022, i64 7, !dbg !96
  store i8 %43, ptr %incdec.ptr8.5, align 1, !dbg !97, !tbaa !26
  %dec5.7 = add i64 %n.addr.121, -8, !dbg !98
  %incdec.ptr.7 = getelementptr inbounds nuw i8, ptr %srcp.023, i64 8, !dbg !99
  %44 = load i8, ptr %incdec.ptr.6, align 1, !dbg !100, !tbaa !26
  %incdec.ptr8.7 = getelementptr inbounds nuw i8, ptr %dstp.022, i64 8, !dbg !101
  store i8 %44, ptr %incdec.ptr8.6, align 1, !dbg !102, !tbaa !26
  %cmp6.not.7 = icmp eq i64 %dec5.7, 0, !dbg !103
  br i1 %cmp6.not.7, label %if.end10, label %while.body7, !dbg !104, !llvm.loop !105

if.end10:                                         ; preds = %while.body7.prol.loopexit, %while.body7, %while.body.prol.loopexit, %while.body, %middle.block, %vec.epilog.middle.block, %middle.block65, %vec.epilog.middle.block80, %while.cond4.preheader, %while.cond.preheader
  ret ptr %dst, !dbg !107
}

declare !dbg !108 void @abort() local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @bcopy(ptr noundef readonly captures(address) %src, ptr noundef captures(address) %dst, i64 noundef %n) local_unnamed_addr #2 !dbg !109 {
entry:
  %call = tail call ptr @memmove(ptr noundef %dst, ptr noundef %src, i64 noundef %n) #4, !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind "no-builtins" }
attributes #4 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\memmove-lib.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "12d5271f2b0ee71140bbd923f27a8c94")
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
!12 = distinct !DISubprogram(name: "memmove", scope: !13, file: !13, line: 6, type: !14, scopeLine: 7, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\lib\\memmove.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "72d079e52fb7828d5757597a15a70c43")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 12, column: 7, scope: !12)
!17 = !DILocation(line: 12, column: 7, scope: !12, atomGroup: 1, atomRank: 2)
!18 = !DILocation(line: 12, column: 7, scope: !12, atomGroup: 1, atomRank: 1)
!19 = !DILocation(line: 13, column: 5, scope: !12)
!20 = !DILocation(line: 18, column: 12, scope: !12, atomGroup: 4, atomRank: 2)
!21 = !DILocation(line: 0, scope: !12)
!22 = !DILocation(line: 18, column: 12, scope: !12, atomGroup: 4, atomRank: 1)
!23 = !DILocation(line: 22, column: 5, scope: !12, atomGroup: 18, atomRank: 1)
!24 = !DILocation(line: 22, column: 5, scope: !12)
!25 = !DILocation(line: 23, column: 17, scope: !12, atomGroup: 12, atomRank: 2)
!26 = !{!10, !10, i64 0}
!27 = !DILocation(line: 23, column: 15, scope: !12, atomGroup: 12, atomRank: 1)
!28 = !DILocation(line: 22, column: 5, scope: !12, atomGroup: 11, atomRank: 1)
!29 = distinct !{!29, !30, !31, !32}
!30 = !{!"llvm.loop.mustprogress"}
!31 = !{!"llvm.loop.isvectorized", i32 1}
!32 = !{!"llvm.loop.unroll.runtime.disable"}
!33 = !{!"branch_weights", i32 4, i32 28}
!34 = distinct !{!34, !30, !31, !32}
!35 = !DILocation(line: 22, column: 13, scope: !12, atomGroup: 21, atomRank: 2)
!36 = !DILocation(line: 23, column: 22, scope: !12, atomGroup: 22, atomRank: 2)
!37 = !DILocation(line: 23, column: 17, scope: !12, atomGroup: 23, atomRank: 2)
!38 = !DILocation(line: 23, column: 12, scope: !12, atomGroup: 24, atomRank: 2)
!39 = !DILocation(line: 23, column: 15, scope: !12, atomGroup: 23, atomRank: 1)
!40 = !DILocation(line: 22, column: 5, scope: !12, atomGroup: 26, atomRank: 1)
!41 = distinct !{!41, !42}
!42 = !{!"llvm.loop.unroll.disable"}
!43 = !DILocation(line: 19, column: 5, scope: !12, atomGroup: 20, atomRank: 1)
!44 = !DILocation(line: 19, column: 5, scope: !12)
!45 = !DILocation(line: 19, column: 13, scope: !12, atomGroup: 5, atomRank: 2)
!46 = !DILocation(line: 20, column: 17, scope: !12)
!47 = !DILocation(line: 20, column: 17, scope: !12, atomGroup: 8, atomRank: 2)
!48 = !DILocation(line: 20, column: 7, scope: !12)
!49 = !DILocation(line: 20, column: 15, scope: !12, atomGroup: 8, atomRank: 1)
!50 = !DILocation(line: 19, column: 5, scope: !12, atomGroup: 7, atomRank: 1)
!51 = distinct !{!51, !30, !31, !32}
!52 = !{!"branch_weights", i32 8, i32 24}
!53 = distinct !{!53, !30, !31, !32}
!54 = !DILocation(line: 19, column: 13, scope: !12, atomGroup: 69, atomRank: 2)
!55 = !DILocation(line: 20, column: 17, scope: !12, atomGroup: 70, atomRank: 2)
!56 = !DILocation(line: 20, column: 15, scope: !12, atomGroup: 70, atomRank: 1)
!57 = !DILocation(line: 19, column: 5, scope: !12, atomGroup: 72, atomRank: 1)
!58 = distinct !{!58, !42}
!59 = !DILocation(line: 19, column: 13, scope: !12, atomGroup: 73, atomRank: 2)
!60 = !DILocation(line: 20, column: 17, scope: !12, atomGroup: 74, atomRank: 2)
!61 = !DILocation(line: 20, column: 15, scope: !12, atomGroup: 74, atomRank: 1)
!62 = !DILocation(line: 19, column: 13, scope: !12, atomGroup: 77, atomRank: 2)
!63 = !DILocation(line: 20, column: 17, scope: !12, atomGroup: 78, atomRank: 2)
!64 = !DILocation(line: 20, column: 15, scope: !12, atomGroup: 78, atomRank: 1)
!65 = !DILocation(line: 19, column: 13, scope: !12, atomGroup: 81, atomRank: 2)
!66 = !DILocation(line: 20, column: 17, scope: !12, atomGroup: 82, atomRank: 2)
!67 = !DILocation(line: 20, column: 15, scope: !12, atomGroup: 82, atomRank: 1)
!68 = !DILocation(line: 19, column: 16, scope: !12, atomGroup: 83, atomRank: 1)
!69 = !DILocation(line: 19, column: 5, scope: !12, atomGroup: 84, atomRank: 1)
!70 = distinct !{!70, !44, !71, !30, !31}
!71 = !DILocation(line: 20, column: 23, scope: !12)
!72 = !DILocation(line: 23, column: 22, scope: !12, atomGroup: 13, atomRank: 2)
!73 = !DILocation(line: 23, column: 12, scope: !12, atomGroup: 14, atomRank: 2)
!74 = !DILocation(line: 23, column: 22, scope: !12, atomGroup: 28, atomRank: 2)
!75 = !DILocation(line: 23, column: 17, scope: !12, atomGroup: 29, atomRank: 2)
!76 = !DILocation(line: 23, column: 12, scope: !12, atomGroup: 30, atomRank: 2)
!77 = !DILocation(line: 23, column: 15, scope: !12, atomGroup: 29, atomRank: 1)
!78 = !DILocation(line: 23, column: 22, scope: !12, atomGroup: 34, atomRank: 2)
!79 = !DILocation(line: 23, column: 17, scope: !12, atomGroup: 35, atomRank: 2)
!80 = !DILocation(line: 23, column: 12, scope: !12, atomGroup: 36, atomRank: 2)
!81 = !DILocation(line: 23, column: 15, scope: !12, atomGroup: 35, atomRank: 1)
!82 = !DILocation(line: 23, column: 22, scope: !12, atomGroup: 40, atomRank: 2)
!83 = !DILocation(line: 23, column: 17, scope: !12, atomGroup: 41, atomRank: 2)
!84 = !DILocation(line: 23, column: 12, scope: !12, atomGroup: 42, atomRank: 2)
!85 = !DILocation(line: 23, column: 15, scope: !12, atomGroup: 41, atomRank: 1)
!86 = !DILocation(line: 23, column: 22, scope: !12, atomGroup: 46, atomRank: 2)
!87 = !DILocation(line: 23, column: 17, scope: !12, atomGroup: 47, atomRank: 2)
!88 = !DILocation(line: 23, column: 12, scope: !12, atomGroup: 48, atomRank: 2)
!89 = !DILocation(line: 23, column: 15, scope: !12, atomGroup: 47, atomRank: 1)
!90 = !DILocation(line: 23, column: 22, scope: !12, atomGroup: 52, atomRank: 2)
!91 = !DILocation(line: 23, column: 17, scope: !12, atomGroup: 53, atomRank: 2)
!92 = !DILocation(line: 23, column: 12, scope: !12, atomGroup: 54, atomRank: 2)
!93 = !DILocation(line: 23, column: 15, scope: !12, atomGroup: 53, atomRank: 1)
!94 = !DILocation(line: 23, column: 22, scope: !12, atomGroup: 58, atomRank: 2)
!95 = !DILocation(line: 23, column: 17, scope: !12, atomGroup: 59, atomRank: 2)
!96 = !DILocation(line: 23, column: 12, scope: !12, atomGroup: 60, atomRank: 2)
!97 = !DILocation(line: 23, column: 15, scope: !12, atomGroup: 59, atomRank: 1)
!98 = !DILocation(line: 22, column: 13, scope: !12, atomGroup: 63, atomRank: 2)
!99 = !DILocation(line: 23, column: 22, scope: !12, atomGroup: 64, atomRank: 2)
!100 = !DILocation(line: 23, column: 17, scope: !12, atomGroup: 65, atomRank: 2)
!101 = !DILocation(line: 23, column: 12, scope: !12, atomGroup: 66, atomRank: 2)
!102 = !DILocation(line: 23, column: 15, scope: !12, atomGroup: 65, atomRank: 1)
!103 = !DILocation(line: 22, column: 16, scope: !12, atomGroup: 67, atomRank: 1)
!104 = !DILocation(line: 22, column: 5, scope: !12, atomGroup: 68, atomRank: 1)
!105 = distinct !{!105, !24, !106, !30, !31}
!106 = !DILocation(line: 23, column: 22, scope: !12)
!107 = !DILocation(line: 25, column: 3, scope: !12, atomGroup: 16, atomRank: 1)
!108 = !DISubprogram(name: "abort", scope: !13, file: !13, line: 1, type: !14, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!109 = distinct !DISubprogram(name: "bcopy", scope: !13, file: !13, line: 29, type: !14, scopeLine: 30, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!110 = !DILocation(line: 31, column: 3, scope: !109)
!111 = !DILocation(line: 32, column: 1, scope: !109, atomGroup: 1, atomRank: 1)
