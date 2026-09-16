; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1\resources\corpus\embench\src\edn\libedn.c'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\\resume1\\resources\\corpus\\embench\\src\\edn\\libedn.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

@__const.verify_benchmark.exp_output = private unnamed_addr constant <{ [101 x i32], [99 x i32] }> <{ [101 x i32] [i32 3760, i32 4269, i32 3126, i32 1030, i32 2453, i32 -4601, i32 1981, i32 -1056, i32 2621, i32 4269, i32 3058, i32 1030, i32 2378, i32 -4601, i32 1902, i32 -1056, i32 2548, i32 4269, i32 2988, i32 1030, i32 2300, i32 -4601, i32 1822, i32 -1056, i32 2474, i32 4269, i32 2917, i32 1030, i32 2220, i32 -4601, i32 1738, i32 -1056, i32 2398, i32 4269, i32 2844, i32 1030, i32 2140, i32 -4601, i32 1655, i32 -1056, i32 2321, i32 4269, i32 2770, i32 1030, i32 2058, i32 -4601, i32 1569, i32 -1056, i32 2242, i32 4269, i32 2152, i32 1030, i32 1683, i32 -4601, i32 1627, i32 -1056, i32 2030, i32 4269, i32 2080, i32 1030, i32 1611, i32 -4601, i32 1555, i32 -1056, i32 1958, i32 4269, i32 2008, i32 1030, i32 1539, i32 -4601, i32 1483, i32 -1056, i32 1886, i32 4269, i32 1935, i32 1030, i32 1466, i32 -4601, i32 1410, i32 -1056, i32 1813, i32 4269, i32 1862, i32 1030, i32 1393, i32 -4601, i32 1337, i32 -1056, i32 1740, i32 4269, i32 1789, i32 1030, i32 1320, i32 -4601, i32 1264, i32 -1056, i32 1667, i32 4269, i32 1716, i32 1030, i32 1968], [99 x i32] zeroinitializer }>, align 4
@output = internal global [200 x i32] zeroinitializer, align 4
@c = internal unnamed_addr global i16 0, align 2
@d = internal unnamed_addr global i32 0, align 4
@e = internal unnamed_addr global i32 0, align 4
@__const.benchmark_body.in_a = private unnamed_addr constant [200 x i16] [i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024], align 2
@__const.benchmark_body.in_b = private unnamed_addr constant [200 x i16] [i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096], align 2
@a = internal global [200 x i16] zeroinitializer, align 2
@b = internal global [200 x i16] zeroinitializer, align 2

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @vec_mpy1(ptr noundef captures(none) %0, ptr noundef readonly captures(none) %1, i16 noundef signext %2) local_unnamed_addr #0 {
  %4 = sext i16 %2 to i32
  %5 = getelementptr i8, ptr %0, i32 300
  %6 = getelementptr i8, ptr %1, i32 300
  %7 = icmp ult ptr %0, %6
  %8 = icmp ult ptr %1, %5
  %9 = and i1 %7, %8
  br i1 %9, label %26, label %10

10:                                               ; preds = %3
  %11 = insertelement <2 x i32> poison, i32 %4, i64 0
  %12 = shufflevector <2 x i32> %11, <2 x i32> poison, <2 x i32> zeroinitializer
  br label %13

13:                                               ; preds = %13, %10
  %14 = phi i32 [ 0, %10 ], [ %24, %13 ]
  %15 = getelementptr inbounds nuw i16, ptr %1, i32 %14
  %16 = load <2 x i16>, ptr %15, align 2, !tbaa !10, !alias.scope !12
  %17 = sext <2 x i16> %16 to <2 x i32>
  %18 = mul nsw <2 x i32> %12, %17
  %19 = lshr <2 x i32> %18, splat (i32 15)
  %20 = getelementptr inbounds nuw i16, ptr %0, i32 %14
  %21 = load <2 x i16>, ptr %20, align 2, !tbaa !10, !alias.scope !15, !noalias !12
  %22 = trunc <2 x i32> %19 to <2 x i16>
  %23 = add <2 x i16> %21, %22
  store <2 x i16> %23, ptr %20, align 2, !tbaa !10, !alias.scope !15, !noalias !12
  %24 = add nuw i32 %14, 2
  %25 = icmp eq i32 %24, 150
  br i1 %25, label %39, label %13, !llvm.loop !17

26:                                               ; preds = %3, %26
  %27 = phi i32 [ %37, %26 ], [ 0, %3 ]
  %28 = getelementptr inbounds nuw i16, ptr %1, i32 %27
  %29 = load i16, ptr %28, align 2, !tbaa !10
  %30 = sext i16 %29 to i32
  %31 = mul nsw i32 %30, %4
  %32 = lshr i32 %31, 15
  %33 = getelementptr inbounds nuw i16, ptr %0, i32 %27
  %34 = load i16, ptr %33, align 2, !tbaa !10
  %35 = trunc i32 %32 to i16
  %36 = add i16 %34, %35
  store i16 %36, ptr %33, align 2, !tbaa !10
  %37 = add nuw nsw i32 %27, 1
  %38 = icmp eq i32 %37, 150
  br i1 %38, label %39, label %26, !llvm.loop !21

39:                                               ; preds = %13, %26
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local i32 @mac(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, i32 noundef %2, ptr noundef captures(none) %3) local_unnamed_addr #0 {
  %5 = load i32, ptr %3, align 4, !tbaa !22
  br label %6

6:                                                ; preds = %4, %6
  %7 = phi i32 [ %5, %4 ], [ %17, %6 ]
  %8 = phi i32 [ 0, %4 ], [ %20, %6 ]
  %9 = phi i32 [ %2, %4 ], [ %19, %6 ]
  %10 = getelementptr inbounds nuw i16, ptr %1, i32 %8
  %11 = load i16, ptr %10, align 2, !tbaa !10
  %12 = sext i16 %11 to i32
  %13 = getelementptr inbounds nuw i16, ptr %0, i32 %8
  %14 = load i16, ptr %13, align 2, !tbaa !10
  %15 = sext i16 %14 to i32
  %16 = mul nsw i32 %15, %12
  %17 = add nsw i32 %16, %7
  %18 = mul nsw i32 %12, %12
  %19 = add nsw i32 %18, %9
  %20 = add nuw nsw i32 %8, 1
  %21 = icmp eq i32 %20, 150
  br i1 %21, label %22, label %6, !llvm.loop !24

22:                                               ; preds = %6
  store i32 %17, ptr %3, align 4, !tbaa !22
  ret i32 %19
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @fir(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef writeonly captures(none) %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %3, %20
  %5 = phi i32 [ 0, %3 ], [ %23, %20 ]
  %6 = getelementptr inbounds nuw i16, ptr %0, i32 %5
  br label %7

7:                                                ; preds = %4, %7
  %8 = phi i32 [ 0, %4 ], [ %17, %7 ]
  %9 = phi i32 [ 0, %4 ], [ %18, %7 ]
  %10 = getelementptr inbounds nuw i16, ptr %6, i32 %9
  %11 = load i16, ptr %10, align 2, !tbaa !10
  %12 = sext i16 %11 to i32
  %13 = getelementptr inbounds nuw i16, ptr %1, i32 %9
  %14 = load i16, ptr %13, align 2, !tbaa !10
  %15 = sext i16 %14 to i32
  %16 = mul nsw i32 %15, %12
  %17 = add nsw i32 %16, %8
  %18 = add nuw nsw i32 %9, 1
  %19 = icmp eq i32 %18, 50
  br i1 %19, label %20, label %7, !llvm.loop !25

20:                                               ; preds = %7
  %21 = ashr i32 %17, 15
  %22 = getelementptr inbounds nuw i32, ptr %2, i32 %5
  store i32 %21, ptr %22, align 4, !tbaa !22
  %23 = add nuw nsw i32 %5, 1
  %24 = icmp eq i32 %23, 50
  br i1 %24, label %25, label %4, !llvm.loop !26

25:                                               ; preds = %20
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @fir_no_red_ld(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef writeonly captures(none) %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %3, %37
  %5 = phi i32 [ 0, %3 ], [ %42, %37 ]
  %6 = getelementptr inbounds nuw i16, ptr %0, i32 %5
  %7 = load i16, ptr %6, align 2, !tbaa !10
  br label %8

8:                                                ; preds = %4, %8
  %9 = phi i32 [ 0, %4 ], [ %35, %8 ]
  %10 = phi i32 [ 0, %4 ], [ %31, %8 ]
  %11 = phi i16 [ %7, %4 ], [ %26, %8 ]
  %12 = phi i32 [ 0, %4 ], [ %34, %8 ]
  %13 = getelementptr inbounds nuw i16, ptr %6, i32 %9
  %14 = getelementptr inbounds nuw i8, ptr %13, i32 2
  %15 = load i16, ptr %14, align 2, !tbaa !10
  %16 = getelementptr inbounds nuw i16, ptr %1, i32 %9
  %17 = load i16, ptr %16, align 2, !tbaa !10
  %18 = sext i16 %11 to i32
  %19 = sext i16 %17 to i32
  %20 = mul nsw i32 %19, %18
  %21 = add nsw i32 %20, %10
  %22 = sext i16 %15 to i32
  %23 = mul nsw i32 %19, %22
  %24 = add nsw i32 %23, %12
  %25 = getelementptr inbounds nuw i8, ptr %13, i32 4
  %26 = load i16, ptr %25, align 2, !tbaa !10
  %27 = getelementptr inbounds nuw i8, ptr %16, i32 2
  %28 = load i16, ptr %27, align 2, !tbaa !10
  %29 = sext i16 %28 to i32
  %30 = mul nsw i32 %29, %22
  %31 = add nsw i32 %21, %30
  %32 = sext i16 %26 to i32
  %33 = mul nsw i32 %29, %32
  %34 = add nsw i32 %24, %33
  %35 = add nuw nsw i32 %9, 2
  %36 = icmp samesign ult i32 %9, 30
  br i1 %36, label %8, label %37, !llvm.loop !27

37:                                               ; preds = %8
  %38 = ashr i32 %31, 15
  %39 = getelementptr inbounds nuw i32, ptr %2, i32 %5
  store i32 %38, ptr %39, align 4, !tbaa !22
  %40 = ashr i32 %34, 15
  %41 = getelementptr inbounds nuw i8, ptr %39, i32 4
  store i32 %40, ptr %41, align 4, !tbaa !22
  %42 = add nuw nsw i32 %5, 2
  %43 = icmp samesign ult i32 %5, 98
  br i1 %43, label %4, label %44, !llvm.loop !28

44:                                               ; preds = %37
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local i32 @latsynth(ptr noundef captures(none) %0, ptr noundef readonly captures(none) %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = add nsw i32 %2, -1
  %6 = getelementptr inbounds i16, ptr %0, i32 %5
  %7 = load i16, ptr %6, align 2, !tbaa !10
  %8 = sext i16 %7 to i32
  %9 = getelementptr inbounds i16, ptr %1, i32 %5
  %10 = load i16, ptr %9, align 2, !tbaa !10
  %11 = sext i16 %10 to i32
  %12 = mul nsw i32 %11, %8
  %13 = sub nsw i32 %3, %12
  %14 = icmp sgt i32 %2, 1
  br i1 %14, label %15, label %36

15:                                               ; preds = %4
  %16 = add nsw i32 %2, -2
  br label %17

17:                                               ; preds = %15, %17
  %18 = phi i32 [ %34, %17 ], [ %16, %15 ]
  %19 = phi i32 [ %27, %17 ], [ %13, %15 ]
  %20 = getelementptr inbounds nuw i16, ptr %0, i32 %18
  %21 = load i16, ptr %20, align 2, !tbaa !10
  %22 = sext i16 %21 to i32
  %23 = getelementptr inbounds nuw i16, ptr %1, i32 %18
  %24 = load i16, ptr %23, align 2, !tbaa !10
  %25 = sext i16 %24 to i32
  %26 = mul nsw i32 %25, %22
  %27 = sub nsw i32 %19, %26
  %28 = ashr i32 %27, 16
  %29 = mul nsw i32 %28, %25
  %30 = lshr i32 %29, 16
  %31 = trunc nuw i32 %30 to i16
  %32 = add i16 %21, %31
  %33 = getelementptr inbounds nuw i8, ptr %20, i32 2
  store i16 %32, ptr %33, align 2, !tbaa !10
  %34 = add nsw i32 %18, -1
  %35 = icmp eq i32 %18, 0
  br i1 %35, label %36, label %17, !llvm.loop !29

36:                                               ; preds = %17, %4
  %37 = phi i32 [ %13, %4 ], [ %27, %17 ]
  %38 = lshr i32 %37, 16
  %39 = trunc nuw i32 %38 to i16
  store i16 %39, ptr %0, align 2, !tbaa !10
  ret i32 %37
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @iir1(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef writeonly captures(none) %2, ptr noundef captures(none) %3) local_unnamed_addr #0 {
  %5 = load i16, ptr %1, align 2, !tbaa !10
  %6 = sext i16 %5 to i32
  br label %7

7:                                                ; preds = %4, %7
  %8 = phi i32 [ 0, %4 ], [ %38, %7 ]
  %9 = phi ptr [ %0, %4 ], [ %36, %7 ]
  %10 = phi i32 [ %6, %4 ], [ %35, %7 ]
  %11 = phi ptr [ %3, %4 ], [ %37, %7 ]
  %12 = getelementptr inbounds nuw i8, ptr %9, i32 4
  %13 = load i16, ptr %12, align 2, !tbaa !10
  %14 = sext i16 %13 to i32
  %15 = load i32, ptr %11, align 4, !tbaa !22
  %16 = mul nsw i32 %15, %14
  %17 = getelementptr inbounds nuw i8, ptr %9, i32 6
  %18 = load i16, ptr %17, align 2, !tbaa !10
  %19 = sext i16 %18 to i32
  %20 = getelementptr inbounds nuw i8, ptr %11, i32 4
  %21 = load i32, ptr %20, align 4, !tbaa !22
  %22 = mul nsw i32 %21, %19
  %23 = add nsw i32 %22, %16
  %24 = ashr i32 %23, 15
  %25 = add nsw i32 %24, %10
  %26 = load i16, ptr %9, align 2, !tbaa !10
  %27 = sext i16 %26 to i32
  %28 = mul nsw i32 %15, %27
  %29 = getelementptr inbounds nuw i8, ptr %9, i32 2
  %30 = load i16, ptr %29, align 2, !tbaa !10
  %31 = sext i16 %30 to i32
  %32 = mul nsw i32 %21, %31
  %33 = add nsw i32 %32, %28
  %34 = ashr i32 %33, 15
  %35 = add nsw i32 %34, %25
  store i32 %15, ptr %20, align 4, !tbaa !22
  store i32 %25, ptr %11, align 4, !tbaa !22
  %36 = getelementptr inbounds nuw i8, ptr %9, i32 8
  %37 = getelementptr inbounds nuw i8, ptr %11, i32 8
  %38 = add nuw nsw i32 %8, 1
  %39 = icmp eq i32 %38, 50
  br i1 %39, label %40, label %7, !llvm.loop !30

40:                                               ; preds = %7
  store i32 %35, ptr %2, align 4, !tbaa !22
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef i32 @codebook(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef returned %4, ptr noundef readnone captures(none) %5, i16 noundef signext %6, i16 noundef signext %7) local_unnamed_addr #2 {
  ret i32 %4
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @jpegdct(ptr noundef captures(none) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds nuw i8, ptr %1, i32 20
  %4 = getelementptr inbounds nuw i8, ptr %1, i32 18
  %5 = getelementptr inbounds nuw i8, ptr %1, i32 22
  %6 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %7 = getelementptr inbounds nuw i8, ptr %1, i32 16
  %8 = getelementptr inbounds nuw i8, ptr %1, i32 2
  %9 = getelementptr inbounds nuw i8, ptr %1, i32 6
  %10 = getelementptr inbounds nuw i8, ptr %1, i32 8
  %11 = getelementptr inbounds nuw i8, ptr %1, i32 12
  %12 = getelementptr inbounds nuw i8, ptr %1, i32 10
  %13 = getelementptr inbounds nuw i8, ptr %1, i32 14
  br label %14

14:                                               ; preds = %2, %170
  %15 = phi i32 [ 0, %2 ], [ %172, %170 ]
  %16 = phi i32 [ 13, %2 ], [ %173, %170 ]
  %17 = phi i32 [ 8, %2 ], [ %174, %170 ]
  %18 = phi i32 [ 1, %2 ], [ %171, %170 ]
  %19 = phi ptr [ %0, %2 ], [ %175, %170 ]
  %20 = shl nuw nsw i32 %18, 3
  %21 = shl nuw nsw i32 %18, 2
  %22 = mul nuw nsw i32 %18, 12
  %23 = mul nuw nsw i32 %18, 14
  %24 = mul nuw nsw i32 %18, 10
  %25 = mul nuw nsw i32 %18, 6
  %26 = mul nuw nsw i32 %18, 14
  %27 = shl nuw nsw i32 %18, 2
  %28 = mul nuw nsw i32 %18, 10
  %29 = mul nuw nsw i32 %18, 6
  %30 = shl nuw nsw i32 %18, 3
  br label %31

31:                                               ; preds = %14, %31
  %32 = phi i16 [ 0, %14 ], [ %167, %31 ]
  %33 = phi ptr [ %19, %14 ], [ %168, %31 ]
  %34 = load i16, ptr %33, align 2, !tbaa !10
  %35 = sext i16 %34 to i32
  %36 = getelementptr inbounds nuw i8, ptr %33, i32 %26
  %37 = load i16, ptr %36, align 2, !tbaa !10
  %38 = sext i16 %37 to i32
  %39 = add nsw i32 %38, %35
  %40 = sub nsw i32 %35, %38
  %41 = getelementptr inbounds nuw i16, ptr %33, i32 %18
  %42 = load i16, ptr %41, align 2, !tbaa !10
  %43 = sext i16 %42 to i32
  %44 = getelementptr inbounds nuw i16, ptr %33, i32 %25
  %45 = load i16, ptr %44, align 2, !tbaa !10
  %46 = sext i16 %45 to i32
  %47 = add nsw i32 %46, %43
  %48 = sub nsw i32 %43, %46
  %49 = getelementptr inbounds nuw i8, ptr %33, i32 %27
  %50 = load i16, ptr %49, align 2, !tbaa !10
  %51 = sext i16 %50 to i32
  %52 = getelementptr inbounds nuw i8, ptr %33, i32 %28
  %53 = load i16, ptr %52, align 2, !tbaa !10
  %54 = sext i16 %53 to i32
  %55 = add nsw i32 %54, %51
  %56 = sub nsw i32 %51, %54
  %57 = getelementptr inbounds nuw i8, ptr %33, i32 %29
  %58 = load i16, ptr %57, align 2, !tbaa !10
  %59 = sext i16 %58 to i32
  %60 = getelementptr inbounds nuw i8, ptr %33, i32 %30
  %61 = load i16, ptr %60, align 2, !tbaa !10
  %62 = sext i16 %61 to i32
  %63 = add nsw i32 %62, %59
  %64 = sub nsw i32 %59, %62
  %65 = add nsw i32 %63, %39
  %66 = sub nsw i32 %39, %63
  %67 = add nsw i32 %55, %47
  %68 = sub nsw i32 %47, %55
  %69 = add nsw i32 %67, %65
  %70 = ashr i32 %69, %15
  %71 = trunc i32 %70 to i16
  store i16 %71, ptr %33, align 2, !tbaa !10
  %72 = sub nsw i32 %65, %67
  %73 = ashr i32 %72, %15
  %74 = trunc i32 %73 to i16
  %75 = getelementptr inbounds nuw i8, ptr %33, i32 %20
  store i16 %74, ptr %75, align 2, !tbaa !10
  %76 = add nsw i32 %68, %66
  %77 = shl i32 %76, 16
  %78 = ashr exact i32 %77, 16
  %79 = load i16, ptr %3, align 2, !tbaa !10
  %80 = zext i16 %79 to i32
  %81 = mul nsw i32 %78, %80
  %82 = load i16, ptr %4, align 2, !tbaa !10
  %83 = sext i16 %82 to i32
  %84 = mul nsw i32 %66, %83
  %85 = ashr i32 %84, %16
  %86 = add i32 %85, %81
  %87 = trunc i32 %86 to i16
  %88 = getelementptr inbounds nuw i8, ptr %33, i32 %21
  store i16 %87, ptr %88, align 2, !tbaa !10
  %89 = load i16, ptr %5, align 2, !tbaa !10
  %90 = sext i16 %89 to i32
  %91 = mul nsw i32 %68, %90
  %92 = ashr i32 %91, %16
  %93 = add i32 %92, %81
  %94 = trunc i32 %93 to i16
  %95 = getelementptr inbounds nuw i8, ptr %33, i32 %22
  store i16 %94, ptr %95, align 2, !tbaa !10
  %96 = add nsw i32 %40, %64
  %97 = shl i32 %96, 16
  %98 = ashr exact i32 %97, 16
  %99 = load i16, ptr %6, align 2, !tbaa !10
  %100 = zext i16 %99 to i32
  %101 = mul nsw i32 %98, %100
  %102 = add nsw i32 %48, %56
  %103 = shl i32 %102, 16
  %104 = ashr exact i32 %103, 16
  %105 = load i16, ptr %1, align 2, !tbaa !10
  %106 = zext i16 %105 to i32
  %107 = mul nsw i32 %104, %106
  %108 = add nsw i32 %48, %64
  %109 = add nsw i32 %56, %40
  %110 = add nsw i32 %108, %109
  %111 = shl i32 %110, 16
  %112 = ashr exact i32 %111, 16
  %113 = load i16, ptr %7, align 2, !tbaa !10
  %114 = zext i16 %113 to i32
  %115 = mul nsw i32 %112, %114
  %116 = shl i32 %108, 16
  %117 = ashr exact i32 %116, 16
  %118 = load i16, ptr %8, align 2, !tbaa !10
  %119 = zext i16 %118 to i32
  %120 = mul nsw i32 %117, %119
  %121 = add i32 %120, %115
  %122 = shl i32 %109, 16
  %123 = ashr exact i32 %122, 16
  %124 = load i16, ptr %9, align 2, !tbaa !10
  %125 = zext i16 %124 to i32
  %126 = mul nsw i32 %123, %125
  %127 = add i32 %126, %115
  %128 = load i16, ptr %10, align 2, !tbaa !10
  %129 = zext i16 %128 to i32
  %130 = mul i32 %64, %129
  %131 = add i32 %121, %101
  %132 = add i32 %131, %130
  %133 = shl i32 %132, 16
  %134 = ashr exact i32 %133, 16
  %135 = ashr i32 %134, %16
  %136 = trunc nsw i32 %135 to i16
  %137 = getelementptr inbounds nuw i8, ptr %33, i32 %23
  store i16 %136, ptr %137, align 2, !tbaa !10
  %138 = load i16, ptr %11, align 2, !tbaa !10
  %139 = zext i16 %138 to i32
  %140 = mul i32 %56, %139
  %141 = add i32 %127, %107
  %142 = add i32 %141, %140
  %143 = shl i32 %142, 16
  %144 = ashr exact i32 %143, 16
  %145 = ashr i32 %144, %16
  %146 = trunc nsw i32 %145 to i16
  %147 = getelementptr inbounds nuw i8, ptr %33, i32 %24
  store i16 %146, ptr %147, align 2, !tbaa !10
  %148 = load i16, ptr %12, align 2, !tbaa !10
  %149 = zext i16 %148 to i32
  %150 = mul i32 %48, %149
  %151 = add i32 %121, %107
  %152 = add i32 %151, %150
  %153 = shl i32 %152, 16
  %154 = ashr exact i32 %153, 16
  %155 = ashr i32 %154, %16
  %156 = trunc nsw i32 %155 to i16
  %157 = getelementptr inbounds nuw i8, ptr %33, i32 %25
  store i16 %156, ptr %157, align 2, !tbaa !10
  %158 = load i16, ptr %13, align 2, !tbaa !10
  %159 = zext i16 %158 to i32
  %160 = mul i32 %40, %159
  %161 = add i32 %127, %101
  %162 = add i32 %161, %160
  %163 = shl i32 %162, 16
  %164 = ashr exact i32 %163, 16
  %165 = ashr i32 %164, %16
  %166 = trunc nsw i32 %165 to i16
  store i16 %166, ptr %41, align 2, !tbaa !10
  %167 = add nuw nsw i16 %32, 1
  %168 = getelementptr inbounds i16, ptr %33, i32 %17
  %169 = icmp samesign ult i16 %32, 7
  br i1 %169, label %31, label %170, !llvm.loop !31

170:                                              ; preds = %31
  %171 = add nuw nsw i32 %18, 7
  %172 = add nuw nsw i32 %15, 3
  %173 = add nuw nsw i32 %16, 3
  %174 = add nsw i32 %17, -7
  %175 = getelementptr inbounds i8, ptr %168, i32 -128
  %176 = icmp samesign ult i32 %18, 2
  br i1 %176, label %14, label %177, !llvm.loop !32

177:                                              ; preds = %170
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local void @initialise_benchmark() local_unnamed_addr #2 {
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @warm_caches(i32 noundef %0) local_unnamed_addr #3 {
  tail call fastcc void @benchmark_body(i32 noundef %0) #9
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define internal fastcc void @benchmark_body(i32 noundef %0) unnamed_addr #4 {
  %2 = icmp sgt i32 %0, 0
  br i1 %2, label %3, label %176

3:                                                ; preds = %1, %158
  %4 = phi i32 [ %159, %158 ], [ 0, %1 ]
  store i32 61166, ptr @e, align 4, !tbaa !6
  br label %5

5:                                                ; preds = %5, %3
  %6 = phi i32 [ 0, %3 ], [ %13, %5 ]
  %7 = getelementptr inbounds nuw i16, ptr @__const.benchmark_body.in_a, i32 %6
  %8 = load <2 x i16>, ptr %7, align 2, !tbaa !10
  %9 = getelementptr inbounds nuw i16, ptr @a, i32 %6
  store <2 x i16> %8, ptr %9, align 2, !tbaa !10
  %10 = getelementptr inbounds nuw i16, ptr @__const.benchmark_body.in_b, i32 %6
  %11 = load <2 x i16>, ptr %10, align 2, !tbaa !10
  %12 = getelementptr inbounds nuw i16, ptr @b, i32 %6
  store <2 x i16> %11, ptr %12, align 2, !tbaa !10
  %13 = add nuw i32 %6, 2
  %14 = icmp eq i32 %13, 200
  br i1 %14, label %161, label %5, !llvm.loop !33

15:                                               ; preds = %15, %174
  %16 = phi i32 [ %175, %174 ], [ %26, %15 ]
  %17 = phi i32 [ 0, %174 ], [ %29, %15 ]
  %18 = phi i32 [ 3, %174 ], [ %28, %15 ]
  %19 = getelementptr inbounds nuw i16, ptr @b, i32 %17
  %20 = load i16, ptr %19, align 2, !tbaa !10
  %21 = sext i16 %20 to i32
  %22 = getelementptr inbounds nuw i16, ptr @a, i32 %17
  %23 = load i16, ptr %22, align 2, !tbaa !10
  %24 = sext i16 %23 to i32
  %25 = mul nsw i32 %24, %21
  %26 = add nsw i32 %25, %16
  %27 = mul nsw i32 %21, %21
  %28 = add nuw nsw i32 %27, %18
  %29 = add nuw nsw i32 %17, 1
  %30 = icmp eq i32 %29, 150
  br i1 %30, label %31, label %15, !llvm.loop !24

31:                                               ; preds = %15
  store i32 %26, ptr @output, align 4, !tbaa !22
  %32 = trunc i32 %28 to i16
  store i16 %32, ptr @c, align 2, !tbaa !10
  br label %33

33:                                               ; preds = %49, %31
  %34 = phi i32 [ 0, %31 ], [ %52, %49 ]
  %35 = getelementptr inbounds nuw i16, ptr @a, i32 %34
  br label %36

36:                                               ; preds = %36, %33
  %37 = phi i32 [ 0, %33 ], [ %46, %36 ]
  %38 = phi i32 [ 0, %33 ], [ %47, %36 ]
  %39 = getelementptr inbounds nuw i16, ptr %35, i32 %38
  %40 = load i16, ptr %39, align 2, !tbaa !10
  %41 = sext i16 %40 to i32
  %42 = getelementptr inbounds nuw i16, ptr @b, i32 %38
  %43 = load i16, ptr %42, align 2, !tbaa !10
  %44 = sext i16 %43 to i32
  %45 = mul nsw i32 %44, %41
  %46 = add nsw i32 %45, %37
  %47 = add nuw nsw i32 %38, 1
  %48 = icmp eq i32 %47, 50
  br i1 %48, label %49, label %36, !llvm.loop !25

49:                                               ; preds = %36
  %50 = ashr i32 %46, 15
  %51 = getelementptr inbounds nuw i32, ptr @output, i32 %34
  store i32 %50, ptr %51, align 4, !tbaa !22
  %52 = add nuw nsw i32 %34, 1
  %53 = icmp eq i32 %52, 50
  br i1 %53, label %54, label %33, !llvm.loop !26

54:                                               ; preds = %49, %87
  %55 = phi i32 [ %92, %87 ], [ 0, %49 ]
  %56 = getelementptr inbounds nuw i16, ptr @a, i32 %55
  %57 = load i16, ptr %56, align 2, !tbaa !10
  br label %58

58:                                               ; preds = %58, %54
  %59 = phi i32 [ 0, %54 ], [ %85, %58 ]
  %60 = phi i32 [ 0, %54 ], [ %81, %58 ]
  %61 = phi i16 [ %57, %54 ], [ %76, %58 ]
  %62 = phi i32 [ 0, %54 ], [ %84, %58 ]
  %63 = getelementptr inbounds nuw i16, ptr %56, i32 %59
  %64 = getelementptr inbounds nuw i8, ptr %63, i32 2
  %65 = load i16, ptr %64, align 2, !tbaa !10
  %66 = getelementptr inbounds nuw i16, ptr @b, i32 %59
  %67 = load i16, ptr %66, align 2, !tbaa !10
  %68 = sext i16 %61 to i32
  %69 = sext i16 %67 to i32
  %70 = mul nsw i32 %69, %68
  %71 = add nsw i32 %70, %60
  %72 = sext i16 %65 to i32
  %73 = mul nsw i32 %69, %72
  %74 = add nsw i32 %73, %62
  %75 = getelementptr inbounds nuw i8, ptr %63, i32 4
  %76 = load i16, ptr %75, align 2, !tbaa !10
  %77 = getelementptr inbounds nuw i8, ptr %66, i32 2
  %78 = load i16, ptr %77, align 2, !tbaa !10
  %79 = sext i16 %78 to i32
  %80 = mul nsw i32 %79, %72
  %81 = add nsw i32 %71, %80
  %82 = sext i16 %76 to i32
  %83 = mul nsw i32 %79, %82
  %84 = add nsw i32 %74, %83
  %85 = add nuw nsw i32 %59, 2
  %86 = icmp samesign ult i32 %59, 30
  br i1 %86, label %58, label %87, !llvm.loop !27

87:                                               ; preds = %58
  %88 = ashr i32 %81, 15
  %89 = getelementptr inbounds nuw i32, ptr @output, i32 %55
  store i32 %88, ptr %89, align 4, !tbaa !22
  %90 = ashr i32 %84, 15
  %91 = getelementptr inbounds nuw i8, ptr %89, i32 4
  store i32 %90, ptr %91, align 4, !tbaa !22
  %92 = add nuw nsw i32 %55, 2
  %93 = icmp samesign ult i32 %55, 98
  br i1 %93, label %54, label %94, !llvm.loop !28

94:                                               ; preds = %87
  %95 = load i16, ptr getelementptr inbounds nuw (i8, ptr @a, i32 198), align 2, !tbaa !10
  %96 = sext i16 %95 to i32
  %97 = load i16, ptr getelementptr inbounds nuw (i8, ptr @b, i32 198), align 2, !tbaa !10
  %98 = sext i16 %97 to i32
  %99 = mul nsw i32 %98, %96
  %100 = sub nsw i32 43690, %99
  br label %101

101:                                              ; preds = %101, %94
  %102 = phi i32 [ %118, %101 ], [ 98, %94 ]
  %103 = phi i32 [ %111, %101 ], [ %100, %94 ]
  %104 = getelementptr inbounds nuw i16, ptr @a, i32 %102
  %105 = load i16, ptr %104, align 2, !tbaa !10
  %106 = sext i16 %105 to i32
  %107 = getelementptr inbounds nuw i16, ptr @b, i32 %102
  %108 = load i16, ptr %107, align 2, !tbaa !10
  %109 = sext i16 %108 to i32
  %110 = mul nsw i32 %109, %106
  %111 = sub nsw i32 %103, %110
  %112 = ashr i32 %111, 16
  %113 = mul nsw i32 %112, %109
  %114 = lshr i32 %113, 16
  %115 = trunc nuw i32 %114 to i16
  %116 = add i16 %105, %115
  %117 = getelementptr inbounds nuw i8, ptr %104, i32 2
  store i16 %116, ptr %117, align 2, !tbaa !10
  %118 = add nsw i32 %102, -1
  %119 = icmp eq i32 %102, 0
  br i1 %119, label %120, label %101, !llvm.loop !29

120:                                              ; preds = %101
  %121 = lshr i32 %111, 16
  %122 = trunc nuw i32 %121 to i16
  store i16 %122, ptr @a, align 2, !tbaa !10
  store i32 %111, ptr @d, align 4, !tbaa !22
  %123 = load i16, ptr @b, align 2, !tbaa !10
  %124 = sext i16 %123 to i32
  br label %125

125:                                              ; preds = %125, %120
  %126 = phi i32 [ 0, %120 ], [ %156, %125 ]
  %127 = phi ptr [ @a, %120 ], [ %154, %125 ]
  %128 = phi i32 [ %124, %120 ], [ %153, %125 ]
  %129 = phi ptr [ @output, %120 ], [ %155, %125 ]
  %130 = getelementptr inbounds nuw i8, ptr %127, i32 4
  %131 = load i16, ptr %130, align 2, !tbaa !10
  %132 = sext i16 %131 to i32
  %133 = load i32, ptr %129, align 4, !tbaa !22
  %134 = mul nsw i32 %133, %132
  %135 = getelementptr inbounds nuw i8, ptr %127, i32 6
  %136 = load i16, ptr %135, align 2, !tbaa !10
  %137 = sext i16 %136 to i32
  %138 = getelementptr inbounds nuw i8, ptr %129, i32 4
  %139 = load i32, ptr %138, align 4, !tbaa !22
  %140 = mul nsw i32 %139, %137
  %141 = add nsw i32 %140, %134
  %142 = ashr i32 %141, 15
  %143 = add nsw i32 %142, %128
  %144 = load i16, ptr %127, align 2, !tbaa !10
  %145 = sext i16 %144 to i32
  %146 = mul nsw i32 %133, %145
  %147 = getelementptr inbounds nuw i8, ptr %127, i32 2
  %148 = load i16, ptr %147, align 2, !tbaa !10
  %149 = sext i16 %148 to i32
  %150 = mul nsw i32 %139, %149
  %151 = add nsw i32 %150, %146
  %152 = ashr i32 %151, 15
  %153 = add nsw i32 %152, %143
  store i32 %133, ptr %138, align 4, !tbaa !22
  store i32 %143, ptr %129, align 4, !tbaa !22
  %154 = getelementptr inbounds nuw i8, ptr %127, i32 8
  %155 = getelementptr inbounds nuw i8, ptr %129, i32 8
  %156 = add nuw nsw i32 %126, 1
  %157 = icmp eq i32 %156, 50
  br i1 %157, label %158, label %125, !llvm.loop !30

158:                                              ; preds = %125
  store i32 %153, ptr getelementptr inbounds nuw (i8, ptr @output, i32 400), align 4, !tbaa !22
  store i32 %111, ptr @e, align 4, !tbaa !6
  tail call void @jpegdct(ptr noundef nonnull @a, ptr noundef nonnull @b) #9
  %159 = add nuw nsw i32 %4, 1
  %160 = icmp eq i32 %159, %0
  br i1 %160, label %176, label %3, !llvm.loop !34

161:                                              ; preds = %5, %161
  %162 = phi i32 [ %172, %161 ], [ 0, %5 ]
  %163 = getelementptr inbounds nuw i16, ptr @b, i32 %162
  %164 = load <2 x i16>, ptr %163, align 2, !tbaa !10
  %165 = sext <2 x i16> %164 to <2 x i32>
  %166 = mul nsw <2 x i32> %165, splat (i32 3)
  %167 = lshr <2 x i32> %166, splat (i32 15)
  %168 = getelementptr inbounds nuw i16, ptr @a, i32 %162
  %169 = load <2 x i16>, ptr %168, align 2, !tbaa !10
  %170 = trunc <2 x i32> %167 to <2 x i16>
  %171 = add <2 x i16> %169, %170
  store <2 x i16> %171, ptr %168, align 2, !tbaa !10
  %172 = add nuw i32 %162, 2
  %173 = icmp eq i32 %172, 150
  br i1 %173, label %174, label %161, !llvm.loop !35

174:                                              ; preds = %161
  %175 = load i32, ptr @output, align 4, !tbaa !22
  br label %15

176:                                              ; preds = %158, %1
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef i32 @benchmark() local_unnamed_addr #5 {
  tail call fastcc void @benchmark_body(i32 noundef 87) #9
  ret i32 0
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @verify_benchmark(i32 noundef %0) local_unnamed_addr #6 {
  %2 = alloca [200 x i32], align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #10
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 4 dereferenceable(800) %2, ptr noundef nonnull align 4 dereferenceable(800) @__const.verify_benchmark.exp_output, i32 800, i1 false)
  %3 = call i32 @memcmp(ptr noundef nonnull @output, ptr noundef nonnull %2, i32 noundef 800) #11
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %15

5:                                                ; preds = %1
  %6 = load i16, ptr @c, align 2, !tbaa !10
  %7 = icmp eq i16 %6, 10243
  %8 = load i32, ptr @d, align 4
  %9 = icmp eq i32 %8, -441886230
  %10 = select i1 %7, i1 %9, i1 false
  br i1 %10, label %11, label %15

11:                                               ; preds = %5
  %12 = load i32, ptr @e, align 4, !tbaa !6
  %13 = icmp eq i32 %12, -441886230
  %14 = zext i1 %13 to i32
  br label %15

15:                                               ; preds = %11, %5, %1
  %16 = phi i32 [ %14, %11 ], [ 0, %5 ], [ 0, %1 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #10
  ret i32 %16
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #7

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #8

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { nofree noinline norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #5 = { nofree noinline norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #6 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #7 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #9 = { nobuiltin "no-builtins" }
attributes #10 = { nounwind }
attributes #11 = { nobuiltin nounwind "no-builtins" }

!llvm.module.flags = !{!0, !1, !2, !4}
!llvm.ident = !{!5}
!llvm.errno.tbaa = !{!6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32"}
!2 = !{i32 6, !"riscv-isa", !3}
!3 = !{!"rv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcmp1p0"}
!4 = !{i32 8, !"SmallDataLimit", i32 0}
!5 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project.git ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"short", !8, i64 0}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !18, !19, !20}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!"llvm.loop.isvectorized", i32 1}
!20 = !{!"llvm.loop.unroll.runtime.disable"}
!21 = distinct !{!21, !18, !19}
!22 = !{!23, !23, i64 0}
!23 = !{!"long", !8, i64 0}
!24 = distinct !{!24, !18}
!25 = distinct !{!25, !18}
!26 = distinct !{!26, !18}
!27 = distinct !{!27, !18}
!28 = distinct !{!28, !18}
!29 = distinct !{!29, !18}
!30 = distinct !{!30, !18}
!31 = distinct !{!31, !18}
!32 = distinct !{!32, !18}
!33 = distinct !{!33, !18, !19, !20}
!34 = distinct !{!34, !18}
!35 = distinct !{!35, !18, !19, !20}
