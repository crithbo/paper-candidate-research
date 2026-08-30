; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\084_0f75b7a151302bdf\B2.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr28982a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@incs = dso_local local_unnamed_addr global [20 x i32] zeroinitializer, align 16
@ptrs = dso_local local_unnamed_addr global [20 x ptr] zeroinitializer, align 16
@results = dso_local local_unnamed_addr global [20 x float] zeroinitializer, align 64
@input = dso_local global [80 x float] zeroinitializer, align 16

; Function Attrs: nofree noinline norecurse nosync nounwind memory(readwrite, argmem: read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @foo(i32 noundef %n) local_unnamed_addr #0 !dbg !12 {
entry:
  %tobool.not98 = icmp eq i32 %n, 0, !dbg !16
  br i1 %tobool.not98, label %while.end, label %while.body.lr.ph, !dbg !17

while.body.lr.ph:                                 ; preds = %entry
  %0 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 152), align 8, !dbg !18, !tbaa !19
  %1 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 144), align 16, !dbg !22, !tbaa !19
  %2 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 136), align 8, !dbg !23, !tbaa !19
  %3 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 128), align 16, !dbg !24, !tbaa !19
  %4 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 120), align 8, !dbg !25, !tbaa !19
  %5 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 112), align 16, !dbg !26, !tbaa !19
  %6 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 104), align 8, !dbg !27, !tbaa !19
  %7 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 96), align 16, !dbg !28, !tbaa !19
  %8 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 88), align 8, !dbg !29, !tbaa !19
  %9 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 80), align 16, !dbg !30, !tbaa !19
  %10 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 72), align 8, !dbg !31, !tbaa !19
  %11 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 64), align 16, !dbg !32, !tbaa !19
  %12 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 56), align 8, !dbg !33, !tbaa !19
  %13 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 48), align 16, !dbg !34, !tbaa !19
  %14 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 40), align 8, !dbg !35, !tbaa !19
  %15 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 32), align 16, !dbg !36, !tbaa !19
  %16 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 24), align 8, !dbg !37, !tbaa !19
  %17 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 16), align 16, !dbg !38, !tbaa !19
  %18 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 8), align 8, !dbg !39, !tbaa !19
  %19 = load ptr, ptr @ptrs, align 16, !dbg !40, !tbaa !19
  %20 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 76), align 4, !dbg !41, !tbaa !8
  %21 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 72), align 8, !dbg !42, !tbaa !8
  %22 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 68), align 4, !dbg !43, !tbaa !8
  %23 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 64), align 16, !dbg !44, !tbaa !8
  %24 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 60), align 4, !dbg !45, !tbaa !8
  %25 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 56), align 8, !dbg !46, !tbaa !8
  %26 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 52), align 4, !dbg !47, !tbaa !8
  %27 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 48), align 16, !dbg !48, !tbaa !8
  %28 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 44), align 4, !dbg !49, !tbaa !8
  %29 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 40), align 8, !dbg !50, !tbaa !8
  %30 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 36), align 4, !dbg !51, !tbaa !8
  %31 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 32), align 16, !dbg !52, !tbaa !8
  %32 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 28), align 4, !dbg !53, !tbaa !8
  %33 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 24), align 8, !dbg !54, !tbaa !8
  %34 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 20), align 4, !dbg !55, !tbaa !8
  %35 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 16), align 16, !dbg !56, !tbaa !8
  %36 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 12), align 4, !dbg !57, !tbaa !8
  %37 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 8), align 8, !dbg !58, !tbaa !8
  %38 = load i32, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 4), align 4, !dbg !59, !tbaa !8
  %39 = load i32, ptr @incs, align 16, !dbg !60, !tbaa !8
  %idx.ext = sext i32 %39 to i64
  %idx.ext2 = sext i32 %38 to i64
  %idx.ext5 = sext i32 %37 to i64
  %idx.ext8 = sext i32 %36 to i64
  %idx.ext11 = sext i32 %35 to i64
  %idx.ext14 = sext i32 %34 to i64
  %idx.ext17 = sext i32 %33 to i64
  %idx.ext20 = sext i32 %32 to i64
  %idx.ext23 = sext i32 %31 to i64
  %idx.ext26 = sext i32 %30 to i64
  %idx.ext29 = sext i32 %29 to i64
  %idx.ext32 = sext i32 %28 to i64
  %idx.ext35 = sext i32 %27 to i64
  %idx.ext38 = sext i32 %26 to i64
  %idx.ext41 = sext i32 %25 to i64
  %idx.ext44 = sext i32 %24 to i64
  %idx.ext47 = sext i32 %23 to i64
  %idx.ext50 = sext i32 %22 to i64
  %idx.ext53 = sext i32 %21 to i64
  %idx.ext56 = sext i32 %20 to i64
  br label %while.body, !dbg !17

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %ptr19.0138 = phi ptr [ %0, %while.body.lr.ph ], [ %add.ptr57, %while.body ]
  %ptr18.0136 = phi ptr [ %1, %while.body.lr.ph ], [ %add.ptr54, %while.body ]
  %ptr17.0134 = phi ptr [ %2, %while.body.lr.ph ], [ %add.ptr51, %while.body ]
  %ptr16.0132 = phi ptr [ %3, %while.body.lr.ph ], [ %add.ptr48, %while.body ]
  %ptr15.0130 = phi ptr [ %4, %while.body.lr.ph ], [ %add.ptr45, %while.body ]
  %ptr14.0128 = phi ptr [ %5, %while.body.lr.ph ], [ %add.ptr42, %while.body ]
  %ptr13.0126 = phi ptr [ %6, %while.body.lr.ph ], [ %add.ptr39, %while.body ]
  %ptr12.0124 = phi ptr [ %7, %while.body.lr.ph ], [ %add.ptr36, %while.body ]
  %ptr11.0122 = phi ptr [ %8, %while.body.lr.ph ], [ %add.ptr33, %while.body ]
  %ptr10.0120 = phi ptr [ %9, %while.body.lr.ph ], [ %add.ptr30, %while.body ]
  %ptr9.0118 = phi ptr [ %10, %while.body.lr.ph ], [ %add.ptr27, %while.body ]
  %ptr8.0116 = phi ptr [ %11, %while.body.lr.ph ], [ %add.ptr24, %while.body ]
  %ptr7.0114 = phi ptr [ %12, %while.body.lr.ph ], [ %add.ptr21, %while.body ]
  %ptr6.0112 = phi ptr [ %13, %while.body.lr.ph ], [ %add.ptr18, %while.body ]
  %ptr5.0110 = phi ptr [ %14, %while.body.lr.ph ], [ %add.ptr15, %while.body ]
  %ptr4.0108 = phi ptr [ %15, %while.body.lr.ph ], [ %add.ptr12, %while.body ]
  %ptr3.0106 = phi ptr [ %16, %while.body.lr.ph ], [ %add.ptr9, %while.body ]
  %ptr2.0104 = phi ptr [ %17, %while.body.lr.ph ], [ %add.ptr6, %while.body ]
  %ptr1.0102 = phi ptr [ %18, %while.body.lr.ph ], [ %add.ptr3, %while.body ]
  %ptr0.0100 = phi ptr [ %19, %while.body.lr.ph ], [ %add.ptr, %while.body ]
  %n.addr.099 = phi i32 [ %n, %while.body.lr.ph ], [ %dec, %while.body ]
  %40 = phi <4 x float> [ zeroinitializer, %while.body.lr.ph ], [ %53, %while.body ]
  %41 = phi <4 x float> [ zeroinitializer, %while.body.lr.ph ], [ %62, %while.body ]
  %42 = phi <4 x float> [ zeroinitializer, %while.body.lr.ph ], [ %71, %while.body ]
  %43 = phi <4 x float> [ zeroinitializer, %while.body.lr.ph ], [ %80, %while.body ]
  %44 = phi <4 x float> [ zeroinitializer, %while.body.lr.ph ], [ %89, %while.body ]
  %dec = add nsw i32 %n.addr.099, -1, !dbg !61
  %45 = load float, ptr %ptr0.0100, align 4, !dbg !62, !tbaa !63
  %add.ptr = getelementptr inbounds float, ptr %ptr0.0100, i64 %idx.ext, !dbg !65
  %46 = load float, ptr %ptr1.0102, align 4, !dbg !62, !tbaa !63
  %add.ptr3 = getelementptr inbounds float, ptr %ptr1.0102, i64 %idx.ext2, !dbg !66
  %47 = load float, ptr %ptr2.0104, align 4, !dbg !62, !tbaa !63
  %add.ptr6 = getelementptr inbounds float, ptr %ptr2.0104, i64 %idx.ext5, !dbg !67
  %48 = load float, ptr %ptr3.0106, align 4, !dbg !62, !tbaa !63
  %49 = insertelement <4 x float> poison, float %45, i64 0, !dbg !68
  %50 = insertelement <4 x float> %49, float %46, i64 1, !dbg !68
  %51 = insertelement <4 x float> %50, float %47, i64 2, !dbg !68
  %52 = insertelement <4 x float> %51, float %48, i64 3, !dbg !68
  %53 = fadd <4 x float> %40, %52, !dbg !69
  %add.ptr9 = getelementptr inbounds float, ptr %ptr3.0106, i64 %idx.ext8, !dbg !70
  %54 = load float, ptr %ptr4.0108, align 4, !dbg !62, !tbaa !63
  %add.ptr12 = getelementptr inbounds float, ptr %ptr4.0108, i64 %idx.ext11, !dbg !71
  %55 = load float, ptr %ptr5.0110, align 4, !dbg !62, !tbaa !63
  %add.ptr15 = getelementptr inbounds float, ptr %ptr5.0110, i64 %idx.ext14, !dbg !72
  %56 = load float, ptr %ptr6.0112, align 4, !dbg !62, !tbaa !63
  %add.ptr18 = getelementptr inbounds float, ptr %ptr6.0112, i64 %idx.ext17, !dbg !73
  %57 = load float, ptr %ptr7.0114, align 4, !dbg !62, !tbaa !63
  %58 = insertelement <4 x float> poison, float %54, i64 0, !dbg !74
  %59 = insertelement <4 x float> %58, float %55, i64 1, !dbg !74
  %60 = insertelement <4 x float> %59, float %56, i64 2, !dbg !74
  %61 = insertelement <4 x float> %60, float %57, i64 3, !dbg !74
  %62 = fadd <4 x float> %41, %61, !dbg !75
  %add.ptr21 = getelementptr inbounds float, ptr %ptr7.0114, i64 %idx.ext20, !dbg !76
  %63 = load float, ptr %ptr8.0116, align 4, !dbg !62, !tbaa !63
  %add.ptr24 = getelementptr inbounds float, ptr %ptr8.0116, i64 %idx.ext23, !dbg !77
  %64 = load float, ptr %ptr9.0118, align 4, !dbg !62, !tbaa !63
  %add.ptr27 = getelementptr inbounds float, ptr %ptr9.0118, i64 %idx.ext26, !dbg !78
  %65 = load float, ptr %ptr10.0120, align 4, !dbg !62, !tbaa !63
  %add.ptr30 = getelementptr inbounds float, ptr %ptr10.0120, i64 %idx.ext29, !dbg !79
  %66 = load float, ptr %ptr11.0122, align 4, !dbg !62, !tbaa !63
  %67 = insertelement <4 x float> poison, float %63, i64 0, !dbg !80
  %68 = insertelement <4 x float> %67, float %64, i64 1, !dbg !80
  %69 = insertelement <4 x float> %68, float %65, i64 2, !dbg !80
  %70 = insertelement <4 x float> %69, float %66, i64 3, !dbg !80
  %71 = fadd <4 x float> %42, %70, !dbg !81
  %add.ptr33 = getelementptr inbounds float, ptr %ptr11.0122, i64 %idx.ext32, !dbg !82
  %72 = load float, ptr %ptr12.0124, align 4, !dbg !62, !tbaa !63
  %add.ptr36 = getelementptr inbounds float, ptr %ptr12.0124, i64 %idx.ext35, !dbg !83
  %73 = load float, ptr %ptr13.0126, align 4, !dbg !62, !tbaa !63
  %add.ptr39 = getelementptr inbounds float, ptr %ptr13.0126, i64 %idx.ext38, !dbg !84
  %74 = load float, ptr %ptr14.0128, align 4, !dbg !62, !tbaa !63
  %add.ptr42 = getelementptr inbounds float, ptr %ptr14.0128, i64 %idx.ext41, !dbg !85
  %75 = load float, ptr %ptr15.0130, align 4, !dbg !62, !tbaa !63
  %76 = insertelement <4 x float> poison, float %72, i64 0, !dbg !86
  %77 = insertelement <4 x float> %76, float %73, i64 1, !dbg !86
  %78 = insertelement <4 x float> %77, float %74, i64 2, !dbg !86
  %79 = insertelement <4 x float> %78, float %75, i64 3, !dbg !86
  %80 = fadd <4 x float> %43, %79, !dbg !87
  %add.ptr45 = getelementptr inbounds float, ptr %ptr15.0130, i64 %idx.ext44, !dbg !88
  %81 = load float, ptr %ptr16.0132, align 4, !dbg !62, !tbaa !63
  %add.ptr48 = getelementptr inbounds float, ptr %ptr16.0132, i64 %idx.ext47, !dbg !89
  %82 = load float, ptr %ptr17.0134, align 4, !dbg !62, !tbaa !63
  %add.ptr51 = getelementptr inbounds float, ptr %ptr17.0134, i64 %idx.ext50, !dbg !90
  %83 = load float, ptr %ptr18.0136, align 4, !dbg !62, !tbaa !63
  %add.ptr54 = getelementptr inbounds float, ptr %ptr18.0136, i64 %idx.ext53, !dbg !91
  %84 = load float, ptr %ptr19.0138, align 4, !dbg !62, !tbaa !63
  %85 = insertelement <4 x float> poison, float %81, i64 0, !dbg !92
  %86 = insertelement <4 x float> %85, float %82, i64 1, !dbg !92
  %87 = insertelement <4 x float> %86, float %83, i64 2, !dbg !92
  %88 = insertelement <4 x float> %87, float %84, i64 3, !dbg !92
  %89 = fadd <4 x float> %44, %88, !dbg !93
  %add.ptr57 = getelementptr inbounds float, ptr %ptr19.0138, i64 %idx.ext56, !dbg !94
  %tobool.not = icmp eq i32 %dec, 0, !dbg !95
  br i1 %tobool.not, label %while.end, label %while.body, !dbg !96, !llvm.loop !97

while.end:                                        ; preds = %while.body, %entry
  %90 = phi <4 x float> [ zeroinitializer, %entry ], [ %53, %while.body ], !dbg !100
  %91 = phi <4 x float> [ zeroinitializer, %entry ], [ %62, %while.body ], !dbg !100
  %92 = phi <4 x float> [ zeroinitializer, %entry ], [ %71, %while.body ], !dbg !100
  %93 = phi <4 x float> [ zeroinitializer, %entry ], [ %80, %while.body ], !dbg !100
  %94 = phi <4 x float> [ zeroinitializer, %entry ], [ %89, %while.body ], !dbg !100
  store <4 x float> %90, ptr @results, align 16, !dbg !101, !tbaa !63
  store <4 x float> %91, ptr getelementptr inbounds nuw (i8, ptr @results, i64 16), align 16, !dbg !102, !tbaa !63
  store <4 x float> %92, ptr getelementptr inbounds nuw (i8, ptr @results, i64 32), align 16, !dbg !103, !tbaa !63
  store <4 x float> %93, ptr getelementptr inbounds nuw (i8, ptr @results, i64 48), align 16, !dbg !104, !tbaa !63
  store <4 x float> %94, ptr getelementptr inbounds nuw (i8, ptr @results, i64 64), align 16, !dbg !105, !tbaa !63
  ret void, !dbg !106
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @main() local_unnamed_addr #1 !dbg !107 {
entry:
  store <2 x ptr> getelementptr inbounds nuw (float, ptr @input, <2 x i64> <i64 0, i64 1>), ptr @ptrs, align 16, !dbg !108, !tbaa !19
  store <2 x ptr> getelementptr inbounds nuw (float, ptr @input, <2 x i64> <i64 2, i64 3>), ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 16), align 16, !dbg !108, !tbaa !19
  store <2 x i32> <i32 0, i32 1>, ptr @incs, align 16, !dbg !109, !tbaa !8
  store <2 x i32> <i32 2, i32 3>, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 8), align 8, !dbg !109, !tbaa !8
  store <2 x ptr> getelementptr inbounds nuw (float, ptr @input, <2 x i64> <i64 4, i64 5>), ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 32), align 16, !dbg !110, !tbaa !19
  store <2 x ptr> getelementptr inbounds nuw (float, ptr @input, <2 x i64> <i64 6, i64 7>), ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 48), align 16, !dbg !110, !tbaa !19
  store <2 x i32> <i32 4, i32 5>, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 16), align 16, !dbg !111, !tbaa !8
  store <2 x i32> <i32 6, i32 7>, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 24), align 8, !dbg !111, !tbaa !8
  store <2 x ptr> getelementptr inbounds nuw (float, ptr @input, <2 x i64> <i64 8, i64 9>), ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 64), align 16, !dbg !112, !tbaa !19
  store <2 x ptr> getelementptr inbounds nuw (float, ptr @input, <2 x i64> <i64 10, i64 11>), ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 80), align 16, !dbg !112, !tbaa !19
  store <2 x i32> <i32 8, i32 9>, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 32), align 16, !dbg !113, !tbaa !8
  store <2 x i32> <i32 10, i32 11>, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 40), align 8, !dbg !113, !tbaa !8
  store <2 x ptr> getelementptr inbounds nuw (float, ptr @input, <2 x i64> <i64 12, i64 13>), ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 96), align 16, !dbg !114, !tbaa !19
  store <2 x ptr> getelementptr inbounds nuw (float, ptr @input, <2 x i64> <i64 14, i64 15>), ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 112), align 16, !dbg !114, !tbaa !19
  store <2 x i32> <i32 12, i32 13>, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 48), align 16, !dbg !115, !tbaa !8
  store <2 x i32> <i32 14, i32 15>, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 56), align 8, !dbg !115, !tbaa !8
  store <2 x ptr> getelementptr inbounds nuw (float, ptr @input, <2 x i64> <i64 16, i64 17>), ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 128), align 16, !dbg !116, !tbaa !19
  store <2 x ptr> getelementptr inbounds nuw (float, ptr @input, <2 x i64> <i64 18, i64 19>), ptr getelementptr inbounds nuw (i8, ptr @ptrs, i64 144), align 16, !dbg !116, !tbaa !19
  store <2 x i32> <i32 16, i32 17>, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 64), align 16, !dbg !117, !tbaa !8
  store <2 x i32> <i32 18, i32 19>, ptr getelementptr inbounds nuw (i8, ptr @incs, i64 72), align 8, !dbg !117, !tbaa !8
  store <4 x float> <float 0.000000e+00, float 1.000000e+00, float 2.000000e+00, float 3.000000e+00>, ptr @input, align 16, !dbg !118, !tbaa !63
  store <4 x float> <float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 16), align 16, !dbg !118, !tbaa !63
  store <4 x float> <float 8.000000e+00, float 9.000000e+00, float 1.000000e+01, float 1.100000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 32), align 16, !dbg !119, !tbaa !63
  store <4 x float> <float 1.200000e+01, float 1.300000e+01, float 1.400000e+01, float 1.500000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 48), align 16, !dbg !119, !tbaa !63
  store <4 x float> <float 1.600000e+01, float 1.700000e+01, float 1.800000e+01, float 1.900000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 64), align 16, !dbg !120, !tbaa !63
  store <4 x float> <float 2.000000e+01, float 2.100000e+01, float 2.200000e+01, float 2.300000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 80), align 16, !dbg !120, !tbaa !63
  store <4 x float> <float 2.400000e+01, float 2.500000e+01, float 2.600000e+01, float 2.700000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 96), align 16, !dbg !121, !tbaa !63
  store <4 x float> <float 2.800000e+01, float 2.900000e+01, float 3.000000e+01, float 3.100000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 112), align 16, !dbg !121, !tbaa !63
  store <4 x float> <float 3.200000e+01, float 3.300000e+01, float 3.400000e+01, float 3.500000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 128), align 16, !dbg !122, !tbaa !63
  store <4 x float> <float 3.600000e+01, float 3.700000e+01, float 3.800000e+01, float 3.900000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 144), align 16, !dbg !122, !tbaa !63
  store <4 x float> <float 4.000000e+01, float 4.100000e+01, float 4.200000e+01, float 4.300000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 160), align 16, !dbg !123, !tbaa !63
  store <4 x float> <float 4.400000e+01, float 4.500000e+01, float 4.600000e+01, float 4.700000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 176), align 16, !dbg !123, !tbaa !63
  store <4 x float> <float 4.800000e+01, float 4.900000e+01, float 5.000000e+01, float 5.100000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 192), align 16, !dbg !124, !tbaa !63
  store <4 x float> <float 5.200000e+01, float 5.300000e+01, float 5.400000e+01, float 5.500000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 208), align 16, !dbg !124, !tbaa !63
  store <4 x float> <float 5.600000e+01, float 5.700000e+01, float 5.800000e+01, float 5.900000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 224), align 16, !dbg !125, !tbaa !63
  store <4 x float> <float 6.000000e+01, float 6.100000e+01, float 6.200000e+01, float 6.300000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 240), align 16, !dbg !125, !tbaa !63
  store <4 x float> <float 6.400000e+01, float 6.500000e+01, float 6.600000e+01, float 6.700000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 256), align 16, !dbg !126, !tbaa !63
  store <4 x float> <float 6.800000e+01, float 6.900000e+01, float 7.000000e+01, float 7.100000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 272), align 16, !dbg !126, !tbaa !63
  store <4 x float> <float 7.200000e+01, float 7.300000e+01, float 7.400000e+01, float 7.500000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 288), align 16, !dbg !127, !tbaa !63
  store <4 x float> <float 7.600000e+01, float 7.700000e+01, float 7.800000e+01, float 7.900000e+01>, ptr getelementptr inbounds nuw (i8, ptr @input, i64 304), align 16, !dbg !127, !tbaa !63
  tail call void @foo(i32 noundef 4) #2, !dbg !128
  %0 = load <16 x float>, ptr @results, align 64, !dbg !129
  %.fr = freeze <16 x float> %0, !dbg !130
  %1 = fcmp une <16 x float> %.fr, <float 0.000000e+00, float 1.000000e+01, float 2.000000e+01, float 3.000000e+01, float 4.000000e+01, float 5.000000e+01, float 6.000000e+01, float 7.000000e+01, float 8.000000e+01, float 9.000000e+01, float 1.000000e+02, float 1.100000e+02, float 1.200000e+02, float 1.300000e+02, float 1.400000e+02, float 1.500000e+02>, !dbg !130
  %2 = load <4 x float>, ptr getelementptr inbounds nuw (i8, ptr @results, i64 64), align 64
  %.fr79 = freeze <4 x float> %2, !dbg !131
  %3 = fcmp une <4 x float> %.fr79, <float 1.600000e+02, float 1.700000e+02, float 1.800000e+02, float 1.900000e+02>, !dbg !131
  %4 = shufflevector <16 x i1> %1, <16 x i1> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>, !dbg !132
  %rdx.op = or <4 x i1> %4, %3, !dbg !132
  %5 = shufflevector <4 x i1> %rdx.op, <4 x i1> poison, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>, !dbg !132
  %6 = shufflevector <16 x i1> %5, <16 x i1> %1, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>, !dbg !132
  %7 = bitcast <16 x i1> %6 to i16, !dbg !132
  %8 = icmp ne i16 %7, 0, !dbg !132
  %retval.0 = zext i1 %8 to i32, !dbg !132
  ret i32 %retval.0, !dbg !133
}

attributes #0 = { nofree noinline norecurse nosync nounwind memory(readwrite, argmem: read, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}
!llvm.errno.tbaa = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr28982a.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "8eda9d885d6a243be561e48ad8dde87a")
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
!12 = distinct !DISubprogram(name: "foo", scope: !13, file: !13, line: 40, type: !14, scopeLine: 41, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!13 = !DIFile(filename: "stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr28982a.c", directory: "D:\\project\\writing\\reserch", checksumkind: CSK_MD5, checksum: "8eda9d885d6a243be561e48ad8dde87a")
!14 = !DISubroutineType(types: !15)
!15 = !{}
!16 = !DILocation(line: 44, column: 3, scope: !12, atomGroup: 125, atomRank: 1)
!17 = !DILocation(line: 44, column: 3, scope: !12, atomGroup: 126, atomRank: 1)
!18 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 59, atomRank: 2)
!19 = !{!20, !20, i64 0}
!20 = !{!"p1 float", !21, i64 0}
!21 = !{!"any pointer", !10, i64 0}
!22 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 57, atomRank: 2)
!23 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 55, atomRank: 2)
!24 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 53, atomRank: 2)
!25 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 51, atomRank: 2)
!26 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 49, atomRank: 2)
!27 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 47, atomRank: 2)
!28 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 45, atomRank: 2)
!29 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 43, atomRank: 2)
!30 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 41, atomRank: 2)
!31 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 39, atomRank: 2)
!32 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 37, atomRank: 2)
!33 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 35, atomRank: 2)
!34 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 33, atomRank: 2)
!35 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 31, atomRank: 2)
!36 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 29, atomRank: 2)
!37 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 27, atomRank: 2)
!38 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 25, atomRank: 2)
!39 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 23, atomRank: 2)
!40 = !DILocation(line: 43, column: 16, scope: !12, atomGroup: 21, atomRank: 2)
!41 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 20, atomRank: 2)
!42 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 19, atomRank: 2)
!43 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 18, atomRank: 2)
!44 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 17, atomRank: 2)
!45 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 16, atomRank: 2)
!46 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 15, atomRank: 2)
!47 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 14, atomRank: 2)
!48 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 13, atomRank: 2)
!49 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 12, atomRank: 2)
!50 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 11, atomRank: 2)
!51 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 10, atomRank: 2)
!52 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 9, atomRank: 2)
!53 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 8, atomRank: 2)
!54 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 7, atomRank: 2)
!55 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 6, atomRank: 2)
!56 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 5, atomRank: 2)
!57 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 4, atomRank: 2)
!58 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 3, atomRank: 2)
!59 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 2, atomRank: 2)
!60 = !DILocation(line: 42, column: 14, scope: !12, atomGroup: 1, atomRank: 2)
!61 = !DILocation(line: 44, column: 11, scope: !12, atomGroup: 61, atomRank: 2)
!62 = !DILocation(line: 45, column: 12, scope: !12)
!63 = !{!64, !64, i64 0}
!64 = !{!"float", !10, i64 0}
!65 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 65, atomRank: 2)
!66 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 67, atomRank: 2)
!67 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 69, atomRank: 2)
!68 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 70, atomRank: 2)
!69 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 64, atomRank: 2)
!70 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 71, atomRank: 2)
!71 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 73, atomRank: 2)
!72 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 75, atomRank: 2)
!73 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 77, atomRank: 2)
!74 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 78, atomRank: 2)
!75 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 72, atomRank: 2)
!76 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 79, atomRank: 2)
!77 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 81, atomRank: 2)
!78 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 83, atomRank: 2)
!79 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 85, atomRank: 2)
!80 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 86, atomRank: 2)
!81 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 80, atomRank: 2)
!82 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 87, atomRank: 2)
!83 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 89, atomRank: 2)
!84 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 91, atomRank: 2)
!85 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 93, atomRank: 2)
!86 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 94, atomRank: 2)
!87 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 88, atomRank: 2)
!88 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 95, atomRank: 2)
!89 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 97, atomRank: 2)
!90 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 99, atomRank: 2)
!91 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 101, atomRank: 2)
!92 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 102, atomRank: 2)
!93 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 96, atomRank: 2)
!94 = !DILocation(line: 45, column: 12, scope: !12, atomGroup: 103, atomRank: 2)
!95 = !DILocation(line: 44, column: 3, scope: !12, atomGroup: 62, atomRank: 1)
!96 = !DILocation(line: 44, column: 3, scope: !12, atomGroup: 63, atomRank: 1)
!97 = distinct !{!97, !98, !62, !99}
!98 = !DILocation(line: 44, column: 3, scope: !12)
!99 = !{!"llvm.loop.mustprogress"}
!100 = !DILocation(line: 0, scope: !12)
!101 = !DILocation(line: 46, column: 10, scope: !12, atomGroup: 104, atomRank: 1)
!102 = !DILocation(line: 46, column: 10, scope: !12, atomGroup: 108, atomRank: 1)
!103 = !DILocation(line: 46, column: 10, scope: !12, atomGroup: 112, atomRank: 1)
!104 = !DILocation(line: 46, column: 10, scope: !12, atomGroup: 116, atomRank: 1)
!105 = !DILocation(line: 46, column: 10, scope: !12, atomGroup: 120, atomRank: 1)
!106 = !DILocation(line: 47, column: 1, scope: !12, atomGroup: 124, atomRank: 1)
!107 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 52, type: !14, scopeLine: 53, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, keyInstructions: true)
!108 = !DILocation(line: 57, column: 13, scope: !107, atomGroup: 4, atomRank: 1)
!109 = !DILocation(line: 57, column: 34, scope: !107, atomGroup: 5, atomRank: 1)
!110 = !DILocation(line: 57, column: 13, scope: !107, atomGroup: 230, atomRank: 1)
!111 = !DILocation(line: 57, column: 34, scope: !107, atomGroup: 229, atomRank: 1)
!112 = !DILocation(line: 57, column: 13, scope: !107, atomGroup: 234, atomRank: 1)
!113 = !DILocation(line: 57, column: 34, scope: !107, atomGroup: 233, atomRank: 1)
!114 = !DILocation(line: 57, column: 13, scope: !107, atomGroup: 238, atomRank: 1)
!115 = !DILocation(line: 57, column: 34, scope: !107, atomGroup: 237, atomRank: 1)
!116 = !DILocation(line: 57, column: 13, scope: !107, atomGroup: 242, atomRank: 1)
!117 = !DILocation(line: 57, column: 34, scope: !107, atomGroup: 241, atomRank: 1)
!118 = !DILocation(line: 59, column: 14, scope: !107, atomGroup: 11, atomRank: 1)
!119 = !DILocation(line: 59, column: 14, scope: !107, atomGroup: 245, atomRank: 1)
!120 = !DILocation(line: 59, column: 14, scope: !107, atomGroup: 248, atomRank: 1)
!121 = !DILocation(line: 59, column: 14, scope: !107, atomGroup: 251, atomRank: 1)
!122 = !DILocation(line: 59, column: 14, scope: !107, atomGroup: 254, atomRank: 1)
!123 = !DILocation(line: 59, column: 14, scope: !107, atomGroup: 257, atomRank: 1)
!124 = !DILocation(line: 59, column: 14, scope: !107, atomGroup: 260, atomRank: 1)
!125 = !DILocation(line: 59, column: 14, scope: !107, atomGroup: 263, atomRank: 1)
!126 = !DILocation(line: 59, column: 14, scope: !107, atomGroup: 266, atomRank: 1)
!127 = !DILocation(line: 59, column: 14, scope: !107, atomGroup: 269, atomRank: 1)
!128 = !DILocation(line: 60, column: 3, scope: !107)
!129 = !DILocation(line: 62, column: 9, scope: !107)
!130 = !DILocation(line: 62, column: 20, scope: !107, atomGroup: 17, atomRank: 2)
!131 = !DILocation(line: 62, column: 20, scope: !107, atomGroup: 224, atomRank: 2)
!132 = !DILocation(line: 62, column: 20, scope: !107, atomGroup: 17, atomRank: 1)
!133 = !DILocation(line: 65, column: 1, scope: !107, atomGroup: 22, atomRank: 1)
