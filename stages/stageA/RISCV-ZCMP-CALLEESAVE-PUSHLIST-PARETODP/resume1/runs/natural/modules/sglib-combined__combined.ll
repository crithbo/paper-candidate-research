; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1\resources\corpus\embench\src\sglib-combined\combined.c'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\\resume1\\resources\\corpus\\embench\\src\\sglib-combined\\combined.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

%struct.sglib_rbtree_iterator = type { ptr, [128 x i8], [128 x ptr], i16, i16, ptr, ptr }

@verify_benchmark.array_exp = internal constant [100 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99], align 4
@the_list = dso_local global ptr null, align 4
@array = internal constant [100 x i32] [i32 14, i32 66, i32 12, i32 41, i32 86, i32 69, i32 19, i32 77, i32 68, i32 38, i32 26, i32 42, i32 37, i32 23, i32 17, i32 29, i32 55, i32 13, i32 90, i32 92, i32 76, i32 99, i32 10, i32 54, i32 57, i32 83, i32 40, i32 44, i32 75, i32 33, i32 24, i32 28, i32 80, i32 18, i32 78, i32 32, i32 93, i32 89, i32 52, i32 11, i32 21, i32 96, i32 50, i32 15, i32 48, i32 63, i32 87, i32 20, i32 8, i32 85, i32 43, i32 16, i32 94, i32 88, i32 53, i32 84, i32 74, i32 91, i32 67, i32 36, i32 95, i32 61, i32 64, i32 5, i32 30, i32 82, i32 72, i32 46, i32 59, i32 9, i32 7, i32 3, i32 39, i32 31, i32 4, i32 73, i32 70, i32 60, i32 58, i32 81, i32 56, i32 51, i32 45, i32 1, i32 6, i32 49, i32 27, i32 47, i32 34, i32 35, i32 62, i32 97, i32 2, i32 79, i32 98, i32 25, i32 22, i32 65, i32 71, i32 0], align 4
@htab = dso_local local_unnamed_addr global [20 x ptr] zeroinitializer, align 4
@heap = internal global [8192 x i8] zeroinitializer, align 1
@array2 = dso_local global [100 x i32] zeroinitializer, align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @sglib_dllist_add(ptr noundef captures(none) %0, ptr noundef %1) local_unnamed_addr #0 {
  %3 = load ptr, ptr %0, align 4, !tbaa !10
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %8

5:                                                ; preds = %2
  store ptr %1, ptr %0, align 4, !tbaa !10
  %6 = getelementptr inbounds nuw i8, ptr %1, i32 8
  store ptr null, ptr %6, align 4, !tbaa !13
  %7 = load ptr, ptr %0, align 4, !tbaa !10
  br label %18

8:                                                ; preds = %2
  %9 = getelementptr inbounds nuw i8, ptr %1, i32 4
  store ptr %3, ptr %9, align 4, !tbaa !15
  %10 = load ptr, ptr %0, align 4, !tbaa !10
  %11 = getelementptr inbounds nuw i8, ptr %10, i32 8
  %12 = load ptr, ptr %11, align 4, !tbaa !13
  %13 = getelementptr inbounds nuw i8, ptr %1, i32 8
  store ptr %12, ptr %13, align 4, !tbaa !13
  %14 = load ptr, ptr %0, align 4, !tbaa !10
  %15 = getelementptr inbounds nuw i8, ptr %14, i32 8
  store ptr %1, ptr %15, align 4, !tbaa !13
  %16 = load ptr, ptr %13, align 4, !tbaa !13
  %17 = icmp eq ptr %16, null
  br i1 %17, label %22, label %18

18:                                               ; preds = %8, %5
  %19 = phi ptr [ %7, %5 ], [ %16, %8 ]
  %20 = phi ptr [ null, %5 ], [ %1, %8 ]
  %21 = getelementptr inbounds nuw i8, ptr %19, i32 4
  store ptr %20, ptr %21, align 4, !tbaa !15
  br label %22

22:                                               ; preds = %18, %8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @sglib_dllist_add_after(ptr noundef captures(none) %0, ptr noundef %1) local_unnamed_addr #0 {
  %3 = load ptr, ptr %0, align 4, !tbaa !10
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %9

5:                                                ; preds = %2
  store ptr %1, ptr %0, align 4, !tbaa !10
  %6 = getelementptr inbounds nuw i8, ptr %1, i32 8
  store ptr null, ptr %6, align 4, !tbaa !13
  %7 = load ptr, ptr %0, align 4, !tbaa !10
  %8 = getelementptr inbounds nuw i8, ptr %7, i32 4
  store ptr null, ptr %8, align 4, !tbaa !15
  br label %20

9:                                                ; preds = %2
  %10 = getelementptr inbounds nuw i8, ptr %3, i32 4
  %11 = load ptr, ptr %10, align 4, !tbaa !15
  %12 = getelementptr inbounds nuw i8, ptr %1, i32 4
  store ptr %11, ptr %12, align 4, !tbaa !15
  %13 = load ptr, ptr %0, align 4, !tbaa !10
  %14 = getelementptr inbounds nuw i8, ptr %1, i32 8
  store ptr %13, ptr %14, align 4, !tbaa !13
  %15 = getelementptr inbounds nuw i8, ptr %13, i32 4
  store ptr %1, ptr %15, align 4, !tbaa !15
  %16 = load ptr, ptr %12, align 4, !tbaa !15
  %17 = icmp eq ptr %16, null
  br i1 %17, label %20, label %18

18:                                               ; preds = %9
  %19 = getelementptr inbounds nuw i8, ptr %16, i32 8
  store ptr %1, ptr %19, align 4, !tbaa !13
  br label %20

20:                                               ; preds = %9, %18, %5
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @sglib_dllist_add_before(ptr noundef captures(none) %0, ptr noundef %1) local_unnamed_addr #0 {
  %3 = load ptr, ptr %0, align 4, !tbaa !10
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %8

5:                                                ; preds = %2
  store ptr %1, ptr %0, align 4, !tbaa !10
  %6 = getelementptr inbounds nuw i8, ptr %1, i32 8
  store ptr null, ptr %6, align 4, !tbaa !13
  %7 = load ptr, ptr %0, align 4, !tbaa !10
  br label %18

8:                                                ; preds = %2
  %9 = getelementptr inbounds nuw i8, ptr %1, i32 4
  store ptr %3, ptr %9, align 4, !tbaa !15
  %10 = load ptr, ptr %0, align 4, !tbaa !10
  %11 = getelementptr inbounds nuw i8, ptr %10, i32 8
  %12 = load ptr, ptr %11, align 4, !tbaa !13
  %13 = getelementptr inbounds nuw i8, ptr %1, i32 8
  store ptr %12, ptr %13, align 4, !tbaa !13
  %14 = load ptr, ptr %0, align 4, !tbaa !10
  %15 = getelementptr inbounds nuw i8, ptr %14, i32 8
  store ptr %1, ptr %15, align 4, !tbaa !13
  %16 = load ptr, ptr %13, align 4, !tbaa !13
  %17 = icmp eq ptr %16, null
  br i1 %17, label %22, label %18

18:                                               ; preds = %8, %5
  %19 = phi ptr [ %7, %5 ], [ %16, %8 ]
  %20 = phi ptr [ null, %5 ], [ %1, %8 ]
  %21 = getelementptr inbounds nuw i8, ptr %19, i32 4
  store ptr %20, ptr %21, align 4, !tbaa !15
  br label %22

22:                                               ; preds = %18, %8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @sglib_dllist_add_if_not_member(ptr noundef captures(none) %0, ptr noundef %1, ptr noundef captures(none) %2) local_unnamed_addr #1 {
  %4 = load ptr, ptr %0, align 4, !tbaa !10
  %5 = icmp eq ptr %4, null
  br i1 %5, label %27, label %6

6:                                                ; preds = %3
  %7 = load i32, ptr %1, align 4, !tbaa !16
  br label %8

8:                                                ; preds = %6, %12
  %9 = phi ptr [ %4, %6 ], [ %14, %12 ]
  %10 = load i32, ptr %9, align 4, !tbaa !16
  %11 = icmp eq i32 %10, %7
  br i1 %11, label %25, label %12

12:                                               ; preds = %8
  %13 = getelementptr inbounds nuw i8, ptr %9, i32 8
  %14 = load ptr, ptr %13, align 4, !tbaa !10
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %8, !llvm.loop !17

16:                                               ; preds = %12, %21
  %17 = phi ptr [ %19, %21 ], [ %4, %12 ]
  %18 = getelementptr inbounds nuw i8, ptr %17, i32 4
  %19 = load ptr, ptr %18, align 4, !tbaa !15
  %20 = icmp eq ptr %19, null
  br i1 %20, label %27, label %21

21:                                               ; preds = %16
  %22 = load i32, ptr %19, align 4, !tbaa !16
  %23 = load i32, ptr %1, align 4, !tbaa !16
  %24 = icmp eq i32 %22, %23
  br i1 %24, label %25, label %16, !llvm.loop !19

25:                                               ; preds = %8, %21
  %26 = phi ptr [ %19, %21 ], [ %9, %8 ]
  store ptr %26, ptr %2, align 4, !tbaa !10
  br label %46

27:                                               ; preds = %16, %3
  store ptr null, ptr %2, align 4, !tbaa !10
  %28 = load ptr, ptr %0, align 4, !tbaa !10
  %29 = icmp eq ptr %28, null
  br i1 %29, label %30, label %34

30:                                               ; preds = %27
  store ptr %1, ptr %0, align 4, !tbaa !10
  %31 = getelementptr inbounds nuw i8, ptr %1, i32 8
  store ptr null, ptr %31, align 4, !tbaa !13
  %32 = load ptr, ptr %0, align 4, !tbaa !10
  %33 = getelementptr inbounds nuw i8, ptr %32, i32 4
  store ptr null, ptr %33, align 4, !tbaa !15
  br label %46

34:                                               ; preds = %27
  %35 = getelementptr inbounds nuw i8, ptr %1, i32 4
  store ptr %28, ptr %35, align 4, !tbaa !15
  %36 = load ptr, ptr %0, align 4, !tbaa !10
  %37 = getelementptr inbounds nuw i8, ptr %36, i32 8
  %38 = load ptr, ptr %37, align 4, !tbaa !13
  %39 = getelementptr inbounds nuw i8, ptr %1, i32 8
  store ptr %38, ptr %39, align 4, !tbaa !13
  %40 = load ptr, ptr %0, align 4, !tbaa !10
  %41 = getelementptr inbounds nuw i8, ptr %40, i32 8
  store ptr %1, ptr %41, align 4, !tbaa !13
  %42 = load ptr, ptr %39, align 4, !tbaa !13
  %43 = icmp eq ptr %42, null
  br i1 %43, label %46, label %44

44:                                               ; preds = %34
  %45 = getelementptr inbounds nuw i8, ptr %42, i32 4
  store ptr %1, ptr %45, align 4, !tbaa !15
  br label %46

46:                                               ; preds = %25, %30, %44, %34
  %47 = load ptr, ptr %2, align 4, !tbaa !10
  %48 = icmp eq ptr %47, null
  %49 = zext i1 %48 to i32
  ret i32 %49
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @sglib_dllist_add_after_if_not_member(ptr noundef captures(none) %0, ptr noundef %1, ptr noundef captures(none) %2) local_unnamed_addr #1 {
  %4 = load ptr, ptr %0, align 4, !tbaa !10
  %5 = icmp eq ptr %4, null
  br i1 %5, label %27, label %6

6:                                                ; preds = %3
  %7 = load i32, ptr %1, align 4, !tbaa !16
  br label %8

8:                                                ; preds = %6, %12
  %9 = phi ptr [ %4, %6 ], [ %14, %12 ]
  %10 = load i32, ptr %9, align 4, !tbaa !16
  %11 = icmp eq i32 %10, %7
  br i1 %11, label %25, label %12

12:                                               ; preds = %8
  %13 = getelementptr inbounds nuw i8, ptr %9, i32 8
  %14 = load ptr, ptr %13, align 4, !tbaa !10
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %8, !llvm.loop !20

16:                                               ; preds = %12, %21
  %17 = phi ptr [ %19, %21 ], [ %4, %12 ]
  %18 = getelementptr inbounds nuw i8, ptr %17, i32 4
  %19 = load ptr, ptr %18, align 4, !tbaa !15
  %20 = icmp eq ptr %19, null
  br i1 %20, label %27, label %21

21:                                               ; preds = %16
  %22 = load i32, ptr %19, align 4, !tbaa !16
  %23 = load i32, ptr %1, align 4, !tbaa !16
  %24 = icmp eq i32 %22, %23
  br i1 %24, label %25, label %16, !llvm.loop !21

25:                                               ; preds = %8, %21
  %26 = phi ptr [ %19, %21 ], [ %9, %8 ]
  store ptr %26, ptr %2, align 4, !tbaa !10
  br label %45

27:                                               ; preds = %16, %3
  store ptr null, ptr %2, align 4, !tbaa !10
  %28 = load ptr, ptr %0, align 4, !tbaa !10
  %29 = icmp eq ptr %28, null
  br i1 %29, label %30, label %34

30:                                               ; preds = %27
  store ptr %1, ptr %0, align 4, !tbaa !10
  %31 = getelementptr inbounds nuw i8, ptr %1, i32 8
  store ptr null, ptr %31, align 4, !tbaa !13
  %32 = load ptr, ptr %0, align 4, !tbaa !10
  %33 = getelementptr inbounds nuw i8, ptr %32, i32 4
  store ptr null, ptr %33, align 4, !tbaa !15
  br label %45

34:                                               ; preds = %27
  %35 = getelementptr inbounds nuw i8, ptr %28, i32 4
  %36 = load ptr, ptr %35, align 4, !tbaa !15
  %37 = getelementptr inbounds nuw i8, ptr %1, i32 4
  store ptr %36, ptr %37, align 4, !tbaa !15
  %38 = load ptr, ptr %0, align 4, !tbaa !10
  %39 = getelementptr inbounds nuw i8, ptr %1, i32 8
  store ptr %38, ptr %39, align 4, !tbaa !13
  %40 = getelementptr inbounds nuw i8, ptr %38, i32 4
  store ptr %1, ptr %40, align 4, !tbaa !15
  %41 = load ptr, ptr %37, align 4, !tbaa !15
  %42 = icmp eq ptr %41, null
  br i1 %42, label %45, label %43

43:                                               ; preds = %34
  %44 = getelementptr inbounds nuw i8, ptr %41, i32 8
  store ptr %1, ptr %44, align 4, !tbaa !13
  br label %45

45:                                               ; preds = %25, %30, %43, %34
  %46 = load ptr, ptr %2, align 4, !tbaa !10
  %47 = icmp eq ptr %46, null
  %48 = zext i1 %47 to i32
  ret i32 %48
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @sglib_dllist_add_before_if_not_member(ptr noundef captures(none) %0, ptr noundef %1, ptr noundef captures(none) %2) local_unnamed_addr #1 {
  %4 = load ptr, ptr %0, align 4, !tbaa !10
  %5 = icmp eq ptr %4, null
  br i1 %5, label %27, label %6

6:                                                ; preds = %3
  %7 = load i32, ptr %1, align 4, !tbaa !16
  br label %8

8:                                                ; preds = %6, %12
  %9 = phi ptr [ %4, %6 ], [ %14, %12 ]
  %10 = load i32, ptr %9, align 4, !tbaa !16
  %11 = icmp eq i32 %10, %7
  br i1 %11, label %25, label %12

12:                                               ; preds = %8
  %13 = getelementptr inbounds nuw i8, ptr %9, i32 8
  %14 = load ptr, ptr %13, align 4, !tbaa !10
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %8, !llvm.loop !22

16:                                               ; preds = %12, %21
  %17 = phi ptr [ %19, %21 ], [ %4, %12 ]
  %18 = getelementptr inbounds nuw i8, ptr %17, i32 4
  %19 = load ptr, ptr %18, align 4, !tbaa !15
  %20 = icmp eq ptr %19, null
  br i1 %20, label %27, label %21

21:                                               ; preds = %16
  %22 = load i32, ptr %19, align 4, !tbaa !16
  %23 = load i32, ptr %1, align 4, !tbaa !16
  %24 = icmp eq i32 %22, %23
  br i1 %24, label %25, label %16, !llvm.loop !23

25:                                               ; preds = %8, %21
  %26 = phi ptr [ %19, %21 ], [ %9, %8 ]
  store ptr %26, ptr %2, align 4, !tbaa !10
  br label %46

27:                                               ; preds = %16, %3
  store ptr null, ptr %2, align 4, !tbaa !10
  %28 = load ptr, ptr %0, align 4, !tbaa !10
  %29 = icmp eq ptr %28, null
  br i1 %29, label %30, label %34

30:                                               ; preds = %27
  store ptr %1, ptr %0, align 4, !tbaa !10
  %31 = getelementptr inbounds nuw i8, ptr %1, i32 8
  store ptr null, ptr %31, align 4, !tbaa !13
  %32 = load ptr, ptr %0, align 4, !tbaa !10
  %33 = getelementptr inbounds nuw i8, ptr %32, i32 4
  store ptr null, ptr %33, align 4, !tbaa !15
  br label %46

34:                                               ; preds = %27
  %35 = getelementptr inbounds nuw i8, ptr %1, i32 4
  store ptr %28, ptr %35, align 4, !tbaa !15
  %36 = load ptr, ptr %0, align 4, !tbaa !10
  %37 = getelementptr inbounds nuw i8, ptr %36, i32 8
  %38 = load ptr, ptr %37, align 4, !tbaa !13
  %39 = getelementptr inbounds nuw i8, ptr %1, i32 8
  store ptr %38, ptr %39, align 4, !tbaa !13
  %40 = load ptr, ptr %0, align 4, !tbaa !10
  %41 = getelementptr inbounds nuw i8, ptr %40, i32 8
  store ptr %1, ptr %41, align 4, !tbaa !13
  %42 = load ptr, ptr %39, align 4, !tbaa !13
  %43 = icmp eq ptr %42, null
  br i1 %43, label %46, label %44

44:                                               ; preds = %34
  %45 = getelementptr inbounds nuw i8, ptr %42, i32 4
  store ptr %1, ptr %45, align 4, !tbaa !15
  br label %46

46:                                               ; preds = %25, %30, %44, %34
  %47 = load ptr, ptr %2, align 4, !tbaa !10
  %48 = icmp eq ptr %47, null
  %49 = zext i1 %48 to i32
  ret i32 %49
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @sglib_dllist_concat(ptr noundef captures(none) %0, ptr noundef %1) local_unnamed_addr #1 {
  %3 = load ptr, ptr %0, align 4, !tbaa !10
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %2
  store ptr %1, ptr %0, align 4, !tbaa !10
  br label %20

6:                                                ; preds = %2
  %7 = icmp eq ptr %1, null
  br i1 %7, label %20, label %8

8:                                                ; preds = %6, %8
  %9 = phi ptr [ %11, %8 ], [ %3, %6 ]
  %10 = getelementptr inbounds nuw i8, ptr %9, i32 4
  %11 = load ptr, ptr %10, align 4, !tbaa !15
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %8, !llvm.loop !24

13:                                               ; preds = %8
  %14 = getelementptr inbounds nuw i8, ptr %1, i32 4
  store ptr null, ptr %14, align 4, !tbaa !15
  %15 = getelementptr inbounds nuw i8, ptr %1, i32 8
  store ptr %9, ptr %15, align 4, !tbaa !13
  store ptr %1, ptr %10, align 4, !tbaa !15
  %16 = load ptr, ptr %14, align 4, !tbaa !15
  %17 = icmp eq ptr %16, null
  br i1 %17, label %20, label %18

18:                                               ; preds = %13
  %19 = getelementptr inbounds nuw i8, ptr %16, i32 8
  store ptr %1, ptr %19, align 4, !tbaa !13
  br label %20

20:                                               ; preds = %18, %13, %6, %5
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @sglib_dllist_delete(ptr noundef captures(none) %0, ptr noundef readonly captures(address) %1) local_unnamed_addr #3 {
  %3 = load ptr, ptr %0, align 4, !tbaa !10
  %4 = icmp eq ptr %3, %1
  br i1 %4, label %5, label %12

5:                                                ; preds = %2
  %6 = getelementptr inbounds nuw i8, ptr %1, i32 8
  %7 = load ptr, ptr %6, align 4, !tbaa !13
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %12

9:                                                ; preds = %5
  %10 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %11 = load ptr, ptr %10, align 4, !tbaa !15
  br label %12

12:                                               ; preds = %5, %9, %2
  %13 = phi ptr [ %3, %2 ], [ %11, %9 ], [ %7, %5 ]
  %14 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %15 = load ptr, ptr %14, align 4, !tbaa !15
  %16 = icmp eq ptr %15, null
  %17 = getelementptr inbounds nuw i8, ptr %1, i32 8
  %18 = load ptr, ptr %17, align 4, !tbaa !13
  br i1 %16, label %21, label %19

19:                                               ; preds = %12
  %20 = getelementptr inbounds nuw i8, ptr %15, i32 8
  store ptr %18, ptr %20, align 4, !tbaa !13
  br label %21

21:                                               ; preds = %12, %19
  %22 = icmp eq ptr %18, null
  br i1 %22, label %25, label %23

23:                                               ; preds = %21
  %24 = getelementptr inbounds nuw i8, ptr %18, i32 4
  store ptr %15, ptr %24, align 4, !tbaa !15
  br label %25

25:                                               ; preds = %23, %21
  store ptr %13, ptr %0, align 4, !tbaa !10
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @sglib_dllist_delete_if_member(ptr noundef captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef captures(none) %2) local_unnamed_addr #1 {
  %4 = load ptr, ptr %0, align 4, !tbaa !10
  %5 = icmp eq ptr %4, null
  br i1 %5, label %25, label %6

6:                                                ; preds = %3
  %7 = load i32, ptr %1, align 4, !tbaa !16
  br label %8

8:                                                ; preds = %6, %12
  %9 = phi ptr [ %4, %6 ], [ %14, %12 ]
  %10 = load i32, ptr %9, align 4, !tbaa !16
  %11 = icmp eq i32 %10, %7
  br i1 %11, label %26, label %12

12:                                               ; preds = %8
  %13 = getelementptr inbounds nuw i8, ptr %9, i32 8
  %14 = load ptr, ptr %13, align 4, !tbaa !10
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %8, !llvm.loop !25

16:                                               ; preds = %12, %21
  %17 = phi ptr [ %19, %21 ], [ %4, %12 ]
  %18 = getelementptr inbounds nuw i8, ptr %17, i32 4
  %19 = load ptr, ptr %18, align 4, !tbaa !15
  %20 = icmp eq ptr %19, null
  br i1 %20, label %25, label %21

21:                                               ; preds = %16
  %22 = load i32, ptr %19, align 4, !tbaa !16
  %23 = load i32, ptr %1, align 4, !tbaa !16
  %24 = icmp eq i32 %22, %23
  br i1 %24, label %26, label %16, !llvm.loop !26

25:                                               ; preds = %16, %3
  store ptr null, ptr %2, align 4, !tbaa !10
  br label %54

26:                                               ; preds = %8, %21
  %27 = phi ptr [ %19, %21 ], [ %9, %8 ]
  store ptr %27, ptr %2, align 4, !tbaa !10
  %28 = load ptr, ptr %0, align 4, !tbaa !10
  %29 = icmp eq ptr %28, %27
  br i1 %29, label %30, label %37

30:                                               ; preds = %26
  %31 = getelementptr inbounds nuw i8, ptr %27, i32 8
  %32 = load ptr, ptr %31, align 4, !tbaa !13
  %33 = icmp eq ptr %32, null
  br i1 %33, label %34, label %37

34:                                               ; preds = %30
  %35 = getelementptr inbounds nuw i8, ptr %27, i32 4
  %36 = load ptr, ptr %35, align 4, !tbaa !15
  br label %37

37:                                               ; preds = %30, %34, %26
  %38 = phi ptr [ %28, %26 ], [ %36, %34 ], [ %32, %30 ]
  %39 = getelementptr inbounds nuw i8, ptr %27, i32 4
  %40 = load ptr, ptr %39, align 4, !tbaa !15
  %41 = icmp eq ptr %40, null
  %42 = getelementptr inbounds nuw i8, ptr %27, i32 8
  %43 = load ptr, ptr %42, align 4, !tbaa !13
  br i1 %41, label %46, label %44

44:                                               ; preds = %37
  %45 = getelementptr inbounds nuw i8, ptr %40, i32 8
  store ptr %43, ptr %45, align 4, !tbaa !13
  br label %46

46:                                               ; preds = %37, %44
  %47 = icmp eq ptr %43, null
  br i1 %47, label %50, label %48

48:                                               ; preds = %46
  %49 = getelementptr inbounds nuw i8, ptr %43, i32 4
  store ptr %40, ptr %49, align 4, !tbaa !15
  br label %50

50:                                               ; preds = %48, %46
  store ptr %38, ptr %0, align 4, !tbaa !10
  %51 = load ptr, ptr %2, align 4, !tbaa !10
  %52 = icmp ne ptr %51, null
  %53 = zext i1 %52 to i32
  br label %54

54:                                               ; preds = %25, %50
  %55 = phi i32 [ 0, %25 ], [ %53, %50 ]
  ret i32 %55
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @sglib_dllist_is_member(ptr noundef readonly captures(address) %0, ptr noundef readnone captures(address) %1) local_unnamed_addr #4 {
  %3 = icmp ne ptr %0, null
  %4 = icmp ne ptr %0, %1
  %5 = and i1 %3, %4
  br i1 %5, label %6, label %13

6:                                                ; preds = %2, %6
  %7 = phi ptr [ %9, %6 ], [ %0, %2 ]
  %8 = getelementptr inbounds nuw i8, ptr %7, i32 8
  %9 = load ptr, ptr %8, align 4, !tbaa !13
  %10 = icmp ne ptr %9, null
  %11 = icmp ne ptr %9, %1
  %12 = and i1 %10, %11
  br i1 %12, label %6, label %13, !llvm.loop !27

13:                                               ; preds = %6, %2
  %14 = phi i1 [ %3, %2 ], [ %10, %6 ]
  %15 = icmp eq ptr %0, null
  %16 = or i1 %15, %14
  br i1 %16, label %24, label %17

17:                                               ; preds = %13, %17
  %18 = phi ptr [ %20, %17 ], [ %0, %13 ]
  %19 = getelementptr inbounds nuw i8, ptr %18, i32 4
  %20 = load ptr, ptr %19, align 4, !tbaa !15
  %21 = icmp ne ptr %20, null
  %22 = icmp ne ptr %20, %1
  %23 = and i1 %21, %22
  br i1 %23, label %17, label %24, !llvm.loop !28

24:                                               ; preds = %17, %13
  %25 = phi i1 [ %14, %13 ], [ %21, %17 ]
  %26 = zext i1 %25 to i32
  ret i32 %26
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local ptr @sglib_dllist_find_member(ptr noundef readonly captures(address_is_null, ret: address, provenance) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #4 {
  %3 = icmp eq ptr %0, null
  br i1 %3, label %22, label %4

4:                                                ; preds = %2
  %5 = load i32, ptr %1, align 4, !tbaa !16
  br label %6

6:                                                ; preds = %4, %10
  %7 = phi ptr [ %0, %4 ], [ %12, %10 ]
  %8 = load i32, ptr %7, align 4, !tbaa !16
  %9 = icmp eq i32 %8, %5
  br i1 %9, label %22, label %10

10:                                               ; preds = %6
  %11 = getelementptr inbounds nuw i8, ptr %7, i32 8
  %12 = load ptr, ptr %11, align 4, !tbaa !13
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %6, !llvm.loop !29

14:                                               ; preds = %10, %19
  %15 = phi ptr [ %17, %19 ], [ %0, %10 ]
  %16 = getelementptr inbounds nuw i8, ptr %15, i32 4
  %17 = load ptr, ptr %16, align 4, !tbaa !15
  %18 = icmp eq ptr %17, null
  br i1 %18, label %22, label %19

19:                                               ; preds = %14
  %20 = load i32, ptr %17, align 4, !tbaa !16
  %21 = icmp eq i32 %20, %5
  br i1 %21, label %22, label %14, !llvm.loop !30

22:                                               ; preds = %6, %19, %14, %2
  %23 = phi ptr [ null, %14 ], [ null, %2 ], [ %17, %19 ], [ %7, %6 ]
  ret ptr %23
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local ptr @sglib_dllist_get_first(ptr noundef readonly captures(address_is_null, ret: address, provenance) %0) local_unnamed_addr #4 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %8, label %3

3:                                                ; preds = %1, %3
  %4 = phi ptr [ %6, %3 ], [ %0, %1 ]
  %5 = getelementptr inbounds nuw i8, ptr %4, i32 8
  %6 = load ptr, ptr %5, align 4, !tbaa !13
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %3, !llvm.loop !31

8:                                                ; preds = %3, %1
  %9 = phi ptr [ null, %1 ], [ %4, %3 ]
  ret ptr %9
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local ptr @sglib_dllist_get_last(ptr noundef readonly captures(address_is_null, ret: address, provenance) %0) local_unnamed_addr #4 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %8, label %3

3:                                                ; preds = %1, %3
  %4 = phi ptr [ %6, %3 ], [ %0, %1 ]
  %5 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %6 = load ptr, ptr %5, align 4, !tbaa !15
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %3, !llvm.loop !32

8:                                                ; preds = %3, %1
  %9 = phi ptr [ null, %1 ], [ %4, %3 ]
  ret ptr %9
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @sglib_dllist_sort(ptr noundef captures(none) %0) local_unnamed_addr #1 {
  %2 = alloca ptr, align 4
  %3 = load ptr, ptr %0, align 4, !tbaa !10
  %4 = icmp eq ptr %3, null
  br i1 %4, label %108, label %5

5:                                                ; preds = %1, %5
  %6 = phi ptr [ %8, %5 ], [ %3, %1 ]
  %7 = getelementptr inbounds nuw i8, ptr %6, i32 8
  %8 = load ptr, ptr %7, align 4, !tbaa !13
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %5, !llvm.loop !33

10:                                               ; preds = %5
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store ptr null, ptr %2, align 4, !tbaa !10
  br label %16

11:                                               ; preds = %20, %95
  %12 = shl nsw i32 %17, 1
  %13 = load ptr, ptr %2, align 4, !tbaa !10
  store ptr null, ptr %2, align 4, !tbaa !10
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %11
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  br label %106

16:                                               ; preds = %10, %11
  %17 = phi i32 [ 1, %10 ], [ %12, %11 ]
  %18 = phi ptr [ %6, %10 ], [ %13, %11 ]
  %19 = icmp sgt i32 %17, 1
  br label %23

20:                                               ; preds = %90, %85
  %21 = phi ptr [ %81, %85 ], [ %92, %90 ]
  %22 = icmp eq ptr %62, null
  br i1 %22, label %11, label %23, !llvm.loop !34

23:                                               ; preds = %16, %20
  %24 = phi i1 [ true, %16 ], [ false, %20 ]
  %25 = phi ptr [ %2, %16 ], [ %21, %20 ]
  %26 = phi ptr [ %18, %16 ], [ %62, %20 ]
  br i1 %19, label %30, label %27

27:                                               ; preds = %23
  %28 = getelementptr inbounds nuw i8, ptr %26, i32 4
  %29 = load ptr, ptr %28, align 4, !tbaa !15
  store ptr null, ptr %28, align 4, !tbaa !15
  br label %54

30:                                               ; preds = %23, %30
  %31 = phi i32 [ %33, %30 ], [ 1, %23 ]
  %32 = phi ptr [ %35, %30 ], [ %26, %23 ]
  %33 = add nuw nsw i32 %31, 1
  %34 = getelementptr inbounds nuw i8, ptr %32, i32 4
  %35 = load ptr, ptr %34, align 4, !tbaa !15
  %36 = icmp slt i32 %33, %17
  %37 = icmp ne ptr %35, null
  %38 = select i1 %36, i1 %37, i1 false
  br i1 %38, label %30, label %39, !llvm.loop !35

39:                                               ; preds = %30
  %40 = icmp eq ptr %35, null
  br i1 %40, label %95, label %41

41:                                               ; preds = %39
  %42 = getelementptr inbounds nuw i8, ptr %35, i32 4
  %43 = load ptr, ptr %42, align 4, !tbaa !15
  store ptr null, ptr %42, align 4, !tbaa !15
  %44 = icmp eq ptr %43, null
  br i1 %44, label %54, label %45

45:                                               ; preds = %41, %45
  %46 = phi i32 [ %48, %45 ], [ 1, %41 ]
  %47 = phi ptr [ %50, %45 ], [ %43, %41 ]
  %48 = add nuw nsw i32 %46, 1
  %49 = getelementptr inbounds nuw i8, ptr %47, i32 4
  %50 = load ptr, ptr %49, align 4, !tbaa !15
  %51 = icmp slt i32 %48, %17
  %52 = icmp ne ptr %50, null
  %53 = select i1 %51, i1 %52, i1 false
  br i1 %53, label %45, label %54, !llvm.loop !36

54:                                               ; preds = %45, %27, %41
  %55 = phi ptr [ null, %41 ], [ %29, %27 ], [ %43, %45 ]
  %56 = phi ptr [ null, %41 ], [ %29, %27 ], [ %50, %45 ]
  %57 = icmp eq ptr %56, null
  br i1 %57, label %61, label %58

58:                                               ; preds = %54
  %59 = getelementptr inbounds nuw i8, ptr %56, i32 4
  %60 = load ptr, ptr %59, align 4, !tbaa !15
  store ptr null, ptr %59, align 4, !tbaa !15
  br label %61

61:                                               ; preds = %54, %58
  %62 = phi ptr [ %60, %58 ], [ null, %54 ]
  %63 = icmp eq ptr %55, null
  br i1 %63, label %64, label %65

64:                                               ; preds = %61
  store ptr %26, ptr %25, align 4, !tbaa !10
  br label %88

65:                                               ; preds = %61, %78
  %66 = phi ptr [ %81, %78 ], [ %25, %61 ]
  %67 = phi ptr [ %80, %78 ], [ %55, %61 ]
  %68 = phi ptr [ %79, %78 ], [ %26, %61 ]
  %69 = load i32, ptr %68, align 4, !tbaa !16
  %70 = load i32, ptr %67, align 4, !tbaa !16
  %71 = icmp slt i32 %69, %70
  br i1 %71, label %72, label %75

72:                                               ; preds = %65
  store ptr %68, ptr %66, align 4, !tbaa !10
  %73 = getelementptr inbounds nuw i8, ptr %68, i32 4
  %74 = load ptr, ptr %73, align 4, !tbaa !15
  br label %78

75:                                               ; preds = %65
  store ptr %67, ptr %66, align 4, !tbaa !10
  %76 = getelementptr inbounds nuw i8, ptr %67, i32 4
  %77 = load ptr, ptr %76, align 4, !tbaa !15
  br label %78

78:                                               ; preds = %75, %72
  %79 = phi ptr [ %74, %72 ], [ %68, %75 ]
  %80 = phi ptr [ %67, %72 ], [ %77, %75 ]
  %81 = phi ptr [ %73, %72 ], [ %76, %75 ]
  %82 = icmp ne ptr %79, null
  %83 = icmp ne ptr %80, null
  %84 = select i1 %82, i1 %83, i1 false
  br i1 %84, label %65, label %85, !llvm.loop !37

85:                                               ; preds = %78
  %86 = select i1 %82, ptr %79, ptr %80
  store ptr %86, ptr %81, align 4, !tbaa !10
  %87 = icmp eq ptr %86, null
  br i1 %87, label %20, label %88

88:                                               ; preds = %64, %85
  %89 = phi ptr [ %86, %85 ], [ %26, %64 ]
  br label %90

90:                                               ; preds = %88, %90
  %91 = phi ptr [ %93, %90 ], [ %89, %88 ]
  %92 = getelementptr inbounds nuw i8, ptr %91, i32 4
  %93 = load ptr, ptr %92, align 4, !tbaa !10
  %94 = icmp eq ptr %93, null
  br i1 %94, label %20, label %90, !llvm.loop !38

95:                                               ; preds = %39
  store ptr %26, ptr %25, align 4, !tbaa !10
  br i1 %24, label %96, label %11, !llvm.loop !39

96:                                               ; preds = %95
  %97 = load ptr, ptr %2, align 4, !tbaa !10
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %98 = icmp eq ptr %97, null
  br i1 %98, label %106, label %99

99:                                               ; preds = %96, %99
  %100 = phi ptr [ %104, %99 ], [ %97, %96 ]
  %101 = phi ptr [ %100, %99 ], [ null, %96 ]
  %102 = getelementptr inbounds nuw i8, ptr %100, i32 8
  store ptr %101, ptr %102, align 4, !tbaa !13
  %103 = getelementptr inbounds nuw i8, ptr %100, i32 4
  %104 = load ptr, ptr %103, align 4, !tbaa !15
  %105 = icmp eq ptr %104, null
  br i1 %105, label %106, label %99, !llvm.loop !40

106:                                              ; preds = %99, %15, %96
  %107 = phi ptr [ null, %15 ], [ null, %96 ], [ %97, %99 ]
  store ptr %107, ptr %0, align 4, !tbaa !10
  br label %108

108:                                              ; preds = %106, %1
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local i32 @sglib_dllist_len(ptr noundef readonly captures(address_is_null) %0) local_unnamed_addr #4 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %19, label %3

3:                                                ; preds = %1, %3
  %4 = phi i32 [ %8, %3 ], [ 0, %1 ]
  %5 = phi ptr [ %7, %3 ], [ %0, %1 ]
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 8
  %7 = load ptr, ptr %6, align 4, !tbaa !13
  %8 = add nuw nsw i32 %4, 1
  %9 = icmp eq ptr %7, null
  br i1 %9, label %10, label %3, !llvm.loop !41

10:                                               ; preds = %3, %10
  %11 = phi i32 [ %16, %10 ], [ 0, %3 ]
  %12 = phi ptr [ %14, %10 ], [ %0, %3 ]
  %13 = getelementptr inbounds nuw i8, ptr %12, i32 4
  %14 = load ptr, ptr %13, align 4, !tbaa !15
  %15 = icmp eq ptr %14, null
  %16 = add nuw nsw i32 %11, 1
  br i1 %15, label %17, label %10, !llvm.loop !42

17:                                               ; preds = %10
  %18 = add nuw nsw i32 %11, %8
  br label %19

19:                                               ; preds = %1, %17
  %20 = phi i32 [ %18, %17 ], [ 0, %1 ]
  ret i32 %20
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @sglib_dllist_reverse(ptr noundef readonly captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr %0, align 4, !tbaa !10
  %3 = icmp eq ptr %2, null
  br i1 %3, label %23, label %4

4:                                                ; preds = %1
  %5 = getelementptr inbounds nuw i8, ptr %2, i32 4
  %6 = load ptr, ptr %5, align 4, !tbaa !15
  br label %9

7:                                                ; preds = %9
  %8 = icmp eq ptr %6, null
  br i1 %8, label %23, label %16

9:                                                ; preds = %4, %9
  %10 = phi ptr [ %2, %4 ], [ %14, %9 ]
  %11 = getelementptr inbounds nuw i8, ptr %10, i32 4
  %12 = load ptr, ptr %11, align 4, !tbaa !15
  %13 = getelementptr inbounds nuw i8, ptr %10, i32 8
  %14 = load ptr, ptr %13, align 4, !tbaa !13
  store ptr %14, ptr %11, align 4, !tbaa !15
  store ptr %12, ptr %13, align 4, !tbaa !13
  %15 = icmp eq ptr %14, null
  br i1 %15, label %7, label %9, !llvm.loop !43

16:                                               ; preds = %7, %16
  %17 = phi ptr [ %19, %16 ], [ %6, %7 ]
  %18 = getelementptr inbounds nuw i8, ptr %17, i32 4
  %19 = load ptr, ptr %18, align 4, !tbaa !15
  %20 = getelementptr inbounds nuw i8, ptr %17, i32 8
  %21 = load ptr, ptr %20, align 4, !tbaa !13
  store ptr %21, ptr %18, align 4, !tbaa !15
  store ptr %19, ptr %20, align 4, !tbaa !13
  %22 = icmp eq ptr %19, null
  br i1 %22, label %23, label %16, !llvm.loop !44

23:                                               ; preds = %16, %7, %1
  ret void
}

; Function Attrs: nounwind
define dso_local ptr @sglib_dllist_it_init_on_equal(ptr noundef captures(none) initializes((4, 20)) %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) local_unnamed_addr #5 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 12
  store ptr %2, ptr %5, align 4, !tbaa !45
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 16
  store ptr %3, ptr %6, align 4, !tbaa !47
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 8
  %9 = icmp eq ptr %1, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %4
  store ptr null, ptr %7, align 4, !tbaa !48
  store ptr null, ptr %8, align 4, !tbaa !49
  br label %48

11:                                               ; preds = %4
  %12 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %13 = load ptr, ptr %12, align 4, !tbaa !15
  store ptr %13, ptr %8, align 4, !tbaa !49
  store ptr null, ptr %7, align 4, !tbaa !48
  %14 = icmp eq ptr %2, null
  br i1 %14, label %23, label %15

15:                                               ; preds = %11, %19
  %16 = phi ptr [ %21, %19 ], [ %1, %11 ]
  %17 = tail call i32 %2(ptr noundef %3, ptr noundef nonnull %16) #15
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %23, label %19

19:                                               ; preds = %15
  %20 = getelementptr inbounds nuw i8, ptr %16, i32 8
  %21 = load ptr, ptr %20, align 4, !tbaa !13
  %22 = icmp eq ptr %21, null
  br i1 %22, label %27, label %15, !llvm.loop !50

23:                                               ; preds = %15, %11
  %24 = phi ptr [ %1, %11 ], [ %16, %15 ]
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 8
  %26 = load ptr, ptr %25, align 4, !tbaa !13
  store ptr %26, ptr %7, align 4, !tbaa !48
  br label %48

27:                                               ; preds = %19
  %28 = load ptr, ptr %5, align 4, !tbaa !45
  %29 = load ptr, ptr %8, align 4, !tbaa !49
  store ptr null, ptr %8, align 4, !tbaa !49
  %30 = icmp eq ptr %28, null
  br i1 %30, label %42, label %31

31:                                               ; preds = %27
  %32 = load ptr, ptr %6, align 4, !tbaa !47
  %33 = icmp eq ptr %29, null
  br i1 %33, label %48, label %34

34:                                               ; preds = %31, %38
  %35 = phi ptr [ %40, %38 ], [ %29, %31 ]
  %36 = tail call i32 %28(ptr noundef nonnull %35, ptr noundef %32) #15
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %44, label %38

38:                                               ; preds = %34
  %39 = getelementptr inbounds nuw i8, ptr %35, i32 4
  %40 = load ptr, ptr %39, align 4, !tbaa !15
  %41 = icmp eq ptr %40, null
  br i1 %41, label %48, label %34, !llvm.loop !51

42:                                               ; preds = %27
  %43 = icmp eq ptr %29, null
  br i1 %43, label %48, label %44

44:                                               ; preds = %34, %42
  %45 = phi ptr [ %29, %42 ], [ %35, %34 ]
  %46 = getelementptr inbounds nuw i8, ptr %45, i32 4
  %47 = load ptr, ptr %46, align 4, !tbaa !15
  store ptr %47, ptr %8, align 4, !tbaa !49
  br label %48

48:                                               ; preds = %38, %10, %23, %31, %42, %44
  %49 = phi ptr [ %24, %23 ], [ %45, %44 ], [ null, %42 ], [ null, %31 ], [ null, %10 ], [ null, %38 ]
  store ptr %49, ptr %0, align 4, !tbaa !52
  ret ptr %49
}

; Function Attrs: nounwind
define dso_local ptr @sglib_dllist_it_next(ptr noundef captures(none) %0) local_unnamed_addr #5 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %3 = load ptr, ptr %2, align 4, !tbaa !48
  store ptr null, ptr %2, align 4, !tbaa !48
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %5 = load ptr, ptr %4, align 4, !tbaa !45
  %6 = icmp eq ptr %5, null
  br i1 %6, label %22, label %7

7:                                                ; preds = %1
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 16
  %9 = load ptr, ptr %8, align 4, !tbaa !47
  %10 = icmp eq ptr %3, null
  br i1 %10, label %11, label %14

11:                                               ; preds = %7
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 8
  %13 = load ptr, ptr %12, align 4, !tbaa !49
  store ptr null, ptr %12, align 4, !tbaa !49
  br label %36

14:                                               ; preds = %7, %18
  %15 = phi ptr [ %20, %18 ], [ %3, %7 ]
  %16 = tail call i32 %5(ptr noundef %9, ptr noundef nonnull %15) #15
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %27, label %18

18:                                               ; preds = %14
  %19 = getelementptr inbounds nuw i8, ptr %15, i32 8
  %20 = load ptr, ptr %19, align 4, !tbaa !13
  %21 = icmp eq ptr %20, null
  br i1 %21, label %31, label %14, !llvm.loop !50

22:                                               ; preds = %1
  %23 = icmp eq ptr %3, null
  br i1 %23, label %24, label %27

24:                                               ; preds = %22
  %25 = getelementptr inbounds nuw i8, ptr %0, i32 8
  %26 = load ptr, ptr %25, align 4, !tbaa !49
  store ptr null, ptr %25, align 4, !tbaa !49
  br label %50

27:                                               ; preds = %14, %22
  %28 = phi ptr [ %3, %22 ], [ %15, %14 ]
  %29 = getelementptr inbounds nuw i8, ptr %28, i32 8
  %30 = load ptr, ptr %29, align 4, !tbaa !13
  store ptr %30, ptr %2, align 4, !tbaa !48
  br label %59

31:                                               ; preds = %18
  %32 = load ptr, ptr %4, align 4, !tbaa !45
  %33 = getelementptr inbounds nuw i8, ptr %0, i32 8
  %34 = load ptr, ptr %33, align 4, !tbaa !49
  store ptr null, ptr %33, align 4, !tbaa !49
  %35 = icmp eq ptr %32, null
  br i1 %35, label %50, label %36

36:                                               ; preds = %11, %31
  %37 = phi ptr [ %13, %11 ], [ %34, %31 ]
  %38 = phi ptr [ %12, %11 ], [ %33, %31 ]
  %39 = phi ptr [ %5, %11 ], [ %32, %31 ]
  %40 = load ptr, ptr %8, align 4, !tbaa !47
  %41 = icmp eq ptr %37, null
  br i1 %41, label %59, label %42

42:                                               ; preds = %36, %46
  %43 = phi ptr [ %48, %46 ], [ %37, %36 ]
  %44 = tail call i32 %39(ptr noundef nonnull %43, ptr noundef %40) #15
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %54, label %46

46:                                               ; preds = %42
  %47 = getelementptr inbounds nuw i8, ptr %43, i32 4
  %48 = load ptr, ptr %47, align 4, !tbaa !15
  %49 = icmp eq ptr %48, null
  br i1 %49, label %59, label %42, !llvm.loop !51

50:                                               ; preds = %24, %31
  %51 = phi ptr [ %33, %31 ], [ %25, %24 ]
  %52 = phi ptr [ %34, %31 ], [ %26, %24 ]
  %53 = icmp eq ptr %52, null
  br i1 %53, label %59, label %54

54:                                               ; preds = %42, %50
  %55 = phi ptr [ %52, %50 ], [ %43, %42 ]
  %56 = phi ptr [ %51, %50 ], [ %38, %42 ]
  %57 = getelementptr inbounds nuw i8, ptr %55, i32 4
  %58 = load ptr, ptr %57, align 4, !tbaa !15
  store ptr %58, ptr %56, align 4, !tbaa !49
  br label %59

59:                                               ; preds = %46, %36, %50, %54, %27
  %60 = phi ptr [ %28, %27 ], [ %55, %54 ], [ null, %50 ], [ null, %36 ], [ null, %46 ]
  store ptr %60, ptr %0, align 4, !tbaa !52
  ret ptr %60
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local noundef ptr @sglib_dllist_it_init(ptr noundef writeonly captures(none) initializes((0, 20)) %0, ptr noundef returned %1) local_unnamed_addr #6 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 12
  store ptr null, ptr %3, align 4, !tbaa !45
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 16
  store ptr null, ptr %4, align 4, !tbaa !47
  %5 = icmp eq ptr %1, null
  br i1 %5, label %11, label %6

6:                                                ; preds = %2
  %7 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %8 = load ptr, ptr %7, align 4, !tbaa !15
  %9 = getelementptr inbounds nuw i8, ptr %1, i32 8
  %10 = load ptr, ptr %9, align 4, !tbaa !13
  br label %11

11:                                               ; preds = %2, %6
  %12 = phi ptr [ %10, %6 ], [ null, %2 ]
  %13 = phi ptr [ %8, %6 ], [ null, %2 ]
  %14 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %15 = getelementptr inbounds nuw i8, ptr %0, i32 8
  store ptr %12, ptr %14, align 4, !tbaa !48
  store ptr %13, ptr %15, align 4, !tbaa !49
  store ptr %1, ptr %0, align 4, !tbaa !52
  ret ptr %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define dso_local ptr @sglib_dllist_it_current(ptr noundef readonly captures(none) %0) local_unnamed_addr #7 {
  %2 = load ptr, ptr %0, align 4, !tbaa !52
  ret ptr %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define dso_local i32 @ilist_hash_function(ptr noundef readonly captures(none) %0) local_unnamed_addr #7 {
  %2 = load i32, ptr %0, align 4, !tbaa !53
  ret i32 %2
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @sglib_ilist_is_member(ptr noundef readonly captures(address) %0, ptr noundef readnone captures(address) %1) local_unnamed_addr #4 {
  %3 = icmp ne ptr %0, null
  %4 = icmp ne ptr %0, %1
  %5 = and i1 %3, %4
  br i1 %5, label %6, label %13

6:                                                ; preds = %2, %6
  %7 = phi ptr [ %9, %6 ], [ %0, %2 ]
  %8 = getelementptr inbounds nuw i8, ptr %7, i32 4
  %9 = load ptr, ptr %8, align 4, !tbaa !56
  %10 = icmp ne ptr %9, null
  %11 = icmp ne ptr %9, %1
  %12 = and i1 %10, %11
  br i1 %12, label %6, label %13, !llvm.loop !57

13:                                               ; preds = %6, %2
  %14 = phi i1 [ %3, %2 ], [ %10, %6 ]
  %15 = zext i1 %14 to i32
  ret i32 %15
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef ptr @sglib_ilist_find_member(ptr noundef readonly captures(address_is_null, ret: address, provenance) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #4 {
  %3 = icmp eq ptr %0, null
  br i1 %3, label %14, label %4

4:                                                ; preds = %2
  %5 = load i32, ptr %1, align 4, !tbaa !53
  br label %6

6:                                                ; preds = %4, %10
  %7 = phi ptr [ %0, %4 ], [ %12, %10 ]
  %8 = load i32, ptr %7, align 4, !tbaa !53
  %9 = icmp eq i32 %8, %5
  br i1 %9, label %14, label %10

10:                                               ; preds = %6
  %11 = getelementptr inbounds nuw i8, ptr %7, i32 4
  %12 = load ptr, ptr %11, align 4, !tbaa !56
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %6, !llvm.loop !58

14:                                               ; preds = %6, %10, %2
  %15 = phi ptr [ null, %2 ], [ null, %10 ], [ %7, %6 ]
  ret ptr %15
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @sglib_ilist_add_if_not_member(ptr noundef captures(none) %0, ptr noundef %1, ptr noundef captures(none) %2) local_unnamed_addr #8 {
  %4 = load ptr, ptr %0, align 4, !tbaa !59
  %5 = icmp eq ptr %4, null
  br i1 %5, label %17, label %6

6:                                                ; preds = %3
  %7 = load i32, ptr %1, align 4, !tbaa !53
  br label %8

8:                                                ; preds = %6, %12
  %9 = phi ptr [ %4, %6 ], [ %14, %12 ]
  %10 = load i32, ptr %9, align 4, !tbaa !53
  %11 = icmp eq i32 %10, %7
  br i1 %11, label %16, label %12

12:                                               ; preds = %8
  %13 = getelementptr inbounds nuw i8, ptr %9, i32 4
  %14 = load ptr, ptr %13, align 4, !tbaa !59
  %15 = icmp eq ptr %14, null
  br i1 %15, label %17, label %8, !llvm.loop !60

16:                                               ; preds = %8
  store ptr %9, ptr %2, align 4, !tbaa !59
  br label %23

17:                                               ; preds = %12, %3
  store ptr null, ptr %2, align 4, !tbaa !59
  %18 = load ptr, ptr %0, align 4, !tbaa !59
  %19 = getelementptr inbounds nuw i8, ptr %1, i32 4
  store ptr %18, ptr %19, align 4, !tbaa !56
  store ptr %1, ptr %0, align 4, !tbaa !59
  %20 = load ptr, ptr %2, align 4, !tbaa !59
  %21 = icmp eq ptr %20, null
  %22 = zext i1 %21 to i32
  br label %23

23:                                               ; preds = %16, %17
  %24 = phi i32 [ 0, %16 ], [ %22, %17 ]
  ret i32 %24
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local void @sglib_ilist_add(ptr noundef captures(none) %0, ptr noundef initializes((4, 8)) %1) local_unnamed_addr #6 {
  %3 = load ptr, ptr %0, align 4, !tbaa !59
  %4 = getelementptr inbounds nuw i8, ptr %1, i32 4
  store ptr %3, ptr %4, align 4, !tbaa !56
  store ptr %1, ptr %0, align 4, !tbaa !59
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @sglib_ilist_concat(ptr noundef captures(none) %0, ptr noundef %1) local_unnamed_addr #1 {
  %3 = load ptr, ptr %0, align 4, !tbaa !59
  %4 = icmp eq ptr %3, null
  br i1 %4, label %10, label %5

5:                                                ; preds = %2, %5
  %6 = phi ptr [ %8, %5 ], [ %3, %2 ]
  %7 = getelementptr inbounds nuw i8, ptr %6, i32 4
  %8 = load ptr, ptr %7, align 4, !tbaa !56
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %5, !llvm.loop !61

10:                                               ; preds = %5, %2
  %11 = phi ptr [ %0, %2 ], [ %7, %5 ]
  store ptr %1, ptr %11, align 4, !tbaa !59
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @sglib_ilist_delete(ptr noundef captures(none) %0, ptr noundef readnone captures(address) %1) local_unnamed_addr #1 {
  br label %3

3:                                                ; preds = %3, %2
  %4 = phi ptr [ %0, %2 ], [ %9, %3 ]
  %5 = load ptr, ptr %4, align 4, !tbaa !59
  %6 = icmp eq ptr %5, null
  %7 = icmp eq ptr %5, %1
  %8 = or i1 %6, %7
  %9 = getelementptr inbounds nuw i8, ptr %5, i32 4
  br i1 %8, label %10, label %3, !llvm.loop !62

10:                                               ; preds = %3
  %11 = load ptr, ptr %9, align 4, !tbaa !56
  store ptr %11, ptr %4, align 4, !tbaa !59
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @sglib_ilist_delete_if_member(ptr noundef captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef captures(none) %2) local_unnamed_addr #1 {
  %4 = load ptr, ptr %0, align 4, !tbaa !59
  %5 = icmp eq ptr %4, null
  br i1 %5, label %19, label %6

6:                                                ; preds = %3
  %7 = load i32, ptr %1, align 4, !tbaa !53
  %8 = load i32, ptr %4, align 4, !tbaa !53
  %9 = icmp eq i32 %8, %7
  br i1 %9, label %19, label %13

10:                                               ; preds = %13
  %11 = load i32, ptr %16, align 4, !tbaa !53
  %12 = icmp eq i32 %11, %7
  br i1 %12, label %19, label %13, !llvm.loop !63

13:                                               ; preds = %6, %10
  %14 = phi ptr [ %16, %10 ], [ %4, %6 ]
  %15 = getelementptr inbounds nuw i8, ptr %14, i32 4
  %16 = load ptr, ptr %15, align 4, !tbaa !59
  %17 = icmp eq ptr %16, null
  br i1 %17, label %18, label %10, !llvm.loop !63

18:                                               ; preds = %13
  br label %19, !llvm.loop !63

19:                                               ; preds = %10, %6, %18, %3
  %20 = phi ptr [ %0, %3 ], [ %0, %6 ], [ %15, %18 ], [ %15, %10 ]
  %21 = phi ptr [ null, %3 ], [ %4, %6 ], [ null, %18 ], [ %16, %10 ]
  store ptr %21, ptr %2, align 4, !tbaa !59
  %22 = load ptr, ptr %20, align 4, !tbaa !59
  %23 = icmp eq ptr %22, null
  br i1 %23, label %28, label %24

24:                                               ; preds = %19
  %25 = getelementptr inbounds nuw i8, ptr %22, i32 4
  %26 = load ptr, ptr %25, align 4, !tbaa !56
  store ptr %26, ptr %20, align 4, !tbaa !59
  %27 = load ptr, ptr %2, align 4, !tbaa !59
  br label %28

28:                                               ; preds = %24, %19
  %29 = phi ptr [ %27, %24 ], [ %21, %19 ]
  %30 = icmp ne ptr %29, null
  %31 = zext i1 %30 to i32
  ret i32 %31
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @sglib_ilist_sort(ptr noundef captures(none) %0) local_unnamed_addr #1 {
  %2 = alloca ptr, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  %3 = load ptr, ptr %0, align 4, !tbaa !59
  store ptr null, ptr %2, align 4, !tbaa !59
  %4 = icmp eq ptr %3, null
  br i1 %4, label %90, label %9

5:                                                ; preds = %13, %88
  %6 = shl nsw i32 %11, 1
  %7 = load ptr, ptr %2, align 4, !tbaa !59
  store ptr null, ptr %2, align 4, !tbaa !59
  %8 = icmp eq ptr %7, null
  br i1 %8, label %90, label %9

9:                                                ; preds = %1, %5
  %10 = phi ptr [ %7, %5 ], [ %3, %1 ]
  %11 = phi i32 [ %6, %5 ], [ 1, %1 ]
  %12 = icmp sgt i32 %11, 1
  br label %16

13:                                               ; preds = %83, %78
  %14 = phi ptr [ %74, %78 ], [ %85, %83 ]
  %15 = icmp eq ptr %55, null
  br i1 %15, label %5, label %16, !llvm.loop !64

16:                                               ; preds = %9, %13
  %17 = phi i1 [ true, %9 ], [ false, %13 ]
  %18 = phi ptr [ %2, %9 ], [ %14, %13 ]
  %19 = phi ptr [ %10, %9 ], [ %55, %13 ]
  br i1 %12, label %23, label %20

20:                                               ; preds = %16
  %21 = getelementptr inbounds nuw i8, ptr %19, i32 4
  %22 = load ptr, ptr %21, align 4, !tbaa !56
  store ptr null, ptr %21, align 4, !tbaa !56
  br label %47

23:                                               ; preds = %16, %23
  %24 = phi i32 [ %26, %23 ], [ 1, %16 ]
  %25 = phi ptr [ %28, %23 ], [ %19, %16 ]
  %26 = add nuw nsw i32 %24, 1
  %27 = getelementptr inbounds nuw i8, ptr %25, i32 4
  %28 = load ptr, ptr %27, align 4, !tbaa !56
  %29 = icmp slt i32 %26, %11
  %30 = icmp ne ptr %28, null
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %23, label %32, !llvm.loop !65

32:                                               ; preds = %23
  %33 = icmp eq ptr %28, null
  br i1 %33, label %88, label %34

34:                                               ; preds = %32
  %35 = getelementptr inbounds nuw i8, ptr %28, i32 4
  %36 = load ptr, ptr %35, align 4, !tbaa !56
  store ptr null, ptr %35, align 4, !tbaa !56
  %37 = icmp eq ptr %36, null
  br i1 %37, label %47, label %38

38:                                               ; preds = %34, %38
  %39 = phi i32 [ %41, %38 ], [ 1, %34 ]
  %40 = phi ptr [ %43, %38 ], [ %36, %34 ]
  %41 = add nuw nsw i32 %39, 1
  %42 = getelementptr inbounds nuw i8, ptr %40, i32 4
  %43 = load ptr, ptr %42, align 4, !tbaa !56
  %44 = icmp slt i32 %41, %11
  %45 = icmp ne ptr %43, null
  %46 = select i1 %44, i1 %45, i1 false
  br i1 %46, label %38, label %47, !llvm.loop !66

47:                                               ; preds = %38, %20, %34
  %48 = phi ptr [ null, %34 ], [ %22, %20 ], [ %36, %38 ]
  %49 = phi ptr [ null, %34 ], [ %22, %20 ], [ %43, %38 ]
  %50 = icmp eq ptr %49, null
  br i1 %50, label %54, label %51

51:                                               ; preds = %47
  %52 = getelementptr inbounds nuw i8, ptr %49, i32 4
  %53 = load ptr, ptr %52, align 4, !tbaa !56
  store ptr null, ptr %52, align 4, !tbaa !56
  br label %54

54:                                               ; preds = %47, %51
  %55 = phi ptr [ %53, %51 ], [ null, %47 ]
  %56 = icmp eq ptr %48, null
  br i1 %56, label %57, label %58

57:                                               ; preds = %54
  store ptr %19, ptr %18, align 4, !tbaa !59
  br label %81

58:                                               ; preds = %54, %71
  %59 = phi ptr [ %74, %71 ], [ %18, %54 ]
  %60 = phi ptr [ %73, %71 ], [ %48, %54 ]
  %61 = phi ptr [ %72, %71 ], [ %19, %54 ]
  %62 = load i32, ptr %61, align 4, !tbaa !53
  %63 = load i32, ptr %60, align 4, !tbaa !53
  %64 = icmp slt i32 %62, %63
  br i1 %64, label %65, label %68

65:                                               ; preds = %58
  store ptr %61, ptr %59, align 4, !tbaa !59
  %66 = getelementptr inbounds nuw i8, ptr %61, i32 4
  %67 = load ptr, ptr %66, align 4, !tbaa !56
  br label %71

68:                                               ; preds = %58
  store ptr %60, ptr %59, align 4, !tbaa !59
  %69 = getelementptr inbounds nuw i8, ptr %60, i32 4
  %70 = load ptr, ptr %69, align 4, !tbaa !56
  br label %71

71:                                               ; preds = %68, %65
  %72 = phi ptr [ %67, %65 ], [ %61, %68 ]
  %73 = phi ptr [ %60, %65 ], [ %70, %68 ]
  %74 = phi ptr [ %66, %65 ], [ %69, %68 ]
  %75 = icmp ne ptr %72, null
  %76 = icmp ne ptr %73, null
  %77 = select i1 %75, i1 %76, i1 false
  br i1 %77, label %58, label %78, !llvm.loop !67

78:                                               ; preds = %71
  %79 = select i1 %75, ptr %72, ptr %73
  store ptr %79, ptr %74, align 4, !tbaa !59
  %80 = icmp eq ptr %79, null
  br i1 %80, label %13, label %81

81:                                               ; preds = %57, %78
  %82 = phi ptr [ %79, %78 ], [ %19, %57 ]
  br label %83

83:                                               ; preds = %81, %83
  %84 = phi ptr [ %86, %83 ], [ %82, %81 ]
  %85 = getelementptr inbounds nuw i8, ptr %84, i32 4
  %86 = load ptr, ptr %85, align 4, !tbaa !59
  %87 = icmp eq ptr %86, null
  br i1 %87, label %13, label %83, !llvm.loop !68

88:                                               ; preds = %32
  store ptr %19, ptr %18, align 4, !tbaa !59
  br i1 %17, label %89, label %5, !llvm.loop !69

89:                                               ; preds = %88
  br label %90, !llvm.loop !69

90:                                               ; preds = %5, %89, %1
  %91 = load ptr, ptr %2, align 4, !tbaa !59
  store ptr %91, ptr %0, align 4, !tbaa !59
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local i32 @sglib_ilist_len(ptr noundef readonly captures(address_is_null) %0) local_unnamed_addr #4 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %10, label %3

3:                                                ; preds = %1, %3
  %4 = phi ptr [ %7, %3 ], [ %0, %1 ]
  %5 = phi i32 [ %8, %3 ], [ 0, %1 ]
  %6 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %7 = load ptr, ptr %6, align 4, !tbaa !56
  %8 = add nuw nsw i32 %5, 1
  %9 = icmp eq ptr %7, null
  br i1 %9, label %10, label %3, !llvm.loop !70

10:                                               ; preds = %3, %1
  %11 = phi i32 [ 0, %1 ], [ %8, %3 ]
  ret i32 %11
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @sglib_ilist_reverse(ptr noundef captures(none) %0) local_unnamed_addr #1 {
  %2 = load ptr, ptr %0, align 4, !tbaa !59
  %3 = icmp eq ptr %2, null
  br i1 %3, label %10, label %4

4:                                                ; preds = %1, %4
  %5 = phi ptr [ %6, %4 ], [ null, %1 ]
  %6 = phi ptr [ %8, %4 ], [ %2, %1 ]
  %7 = getelementptr inbounds nuw i8, ptr %6, i32 4
  %8 = load ptr, ptr %7, align 4, !tbaa !56
  store ptr %5, ptr %7, align 4, !tbaa !56
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %4, !llvm.loop !71

10:                                               ; preds = %4, %1
  %11 = phi ptr [ null, %1 ], [ %6, %4 ]
  store ptr %11, ptr %0, align 4, !tbaa !59
  ret void
}

; Function Attrs: nounwind
define dso_local noundef ptr @sglib_ilist_it_init_on_equal(ptr noundef writeonly captures(none) initializes((4, 16)) %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) local_unnamed_addr #5 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 8
  store ptr %2, ptr %5, align 4, !tbaa !72
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 12
  store ptr %3, ptr %6, align 4, !tbaa !74
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store ptr null, ptr %7, align 4, !tbaa !75
  %8 = icmp eq ptr %2, null
  br i1 %8, label %21, label %9

9:                                                ; preds = %4
  %10 = icmp eq ptr %1, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %17, %9
  store ptr null, ptr %0, align 4, !tbaa !76
  br label %27

12:                                               ; preds = %9, %17
  %13 = phi ptr [ %19, %17 ], [ %1, %9 ]
  %14 = tail call i32 %2(ptr noundef nonnull %13, ptr noundef %3) #15
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %12
  store ptr %13, ptr %0, align 4, !tbaa !76
  br label %23

17:                                               ; preds = %12
  %18 = getelementptr inbounds nuw i8, ptr %13, i32 4
  %19 = load ptr, ptr %18, align 4, !tbaa !56
  %20 = icmp eq ptr %19, null
  br i1 %20, label %11, label %12, !llvm.loop !77

21:                                               ; preds = %4
  store ptr %1, ptr %0, align 4, !tbaa !76
  %22 = icmp eq ptr %1, null
  br i1 %22, label %27, label %23

23:                                               ; preds = %21, %16
  %24 = phi ptr [ %13, %16 ], [ %1, %21 ]
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 4
  %26 = load ptr, ptr %25, align 4, !tbaa !56
  store ptr %26, ptr %7, align 4, !tbaa !75
  br label %27

27:                                               ; preds = %11, %21, %23
  %28 = phi ptr [ null, %11 ], [ %24, %23 ], [ null, %21 ]
  ret ptr %28
}

; Function Attrs: nounwind
define dso_local ptr @sglib_ilist_it_next(ptr noundef captures(none) %0) local_unnamed_addr #5 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %3 = load ptr, ptr %2, align 4, !tbaa !75
  store ptr null, ptr %2, align 4, !tbaa !75
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 8
  %5 = load ptr, ptr %4, align 4, !tbaa !72
  %6 = icmp eq ptr %5, null
  br i1 %6, label %21, label %7

7:                                                ; preds = %1
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %9 = load ptr, ptr %8, align 4, !tbaa !74
  %10 = icmp eq ptr %3, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %17, %7
  store ptr null, ptr %0, align 4, !tbaa !76
  br label %27

12:                                               ; preds = %7, %17
  %13 = phi ptr [ %19, %17 ], [ %3, %7 ]
  %14 = tail call i32 %5(ptr noundef nonnull %13, ptr noundef %9) #15
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %12
  store ptr %13, ptr %0, align 4, !tbaa !76
  br label %23

17:                                               ; preds = %12
  %18 = getelementptr inbounds nuw i8, ptr %13, i32 4
  %19 = load ptr, ptr %18, align 4, !tbaa !56
  %20 = icmp eq ptr %19, null
  br i1 %20, label %11, label %12, !llvm.loop !77

21:                                               ; preds = %1
  store ptr %3, ptr %0, align 4, !tbaa !76
  %22 = icmp eq ptr %3, null
  br i1 %22, label %27, label %23

23:                                               ; preds = %16, %21
  %24 = phi ptr [ %13, %16 ], [ %3, %21 ]
  %25 = getelementptr inbounds nuw i8, ptr %24, i32 4
  %26 = load ptr, ptr %25, align 4, !tbaa !56
  store ptr %26, ptr %2, align 4, !tbaa !75
  br label %27

27:                                               ; preds = %11, %23, %21
  %28 = phi ptr [ null, %11 ], [ %24, %23 ], [ null, %21 ]
  ret ptr %28
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local noundef ptr @sglib_ilist_it_init(ptr noundef writeonly captures(none) initializes((0, 16)) %0, ptr noundef returned %1) local_unnamed_addr #6 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 8
  store ptr null, ptr %3, align 4, !tbaa !72
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 12
  store ptr null, ptr %4, align 4, !tbaa !74
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store ptr null, ptr %5, align 4, !tbaa !75
  store ptr %1, ptr %0, align 4, !tbaa !76
  %6 = icmp eq ptr %1, null
  br i1 %6, label %10, label %7

7:                                                ; preds = %2
  %8 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %9 = load ptr, ptr %8, align 4, !tbaa !56
  store ptr %9, ptr %5, align 4, !tbaa !75
  br label %10

10:                                               ; preds = %2, %7
  ret ptr %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define dso_local ptr @sglib_ilist_it_current(ptr noundef readonly captures(none) %0) local_unnamed_addr #7 {
  %2 = load ptr, ptr %0, align 4, !tbaa !76
  ret ptr %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local void @sglib_hashed_ilist_init(ptr noundef writeonly captures(none) initializes((0, 80)) %0) local_unnamed_addr #9 {
  store ptr null, ptr %0, align 4, !tbaa !59
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store ptr null, ptr %2, align 4, !tbaa !59
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 8
  store ptr null, ptr %3, align 4, !tbaa !59
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 12
  store ptr null, ptr %4, align 4, !tbaa !59
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 16
  store ptr null, ptr %5, align 4, !tbaa !59
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 20
  store ptr null, ptr %6, align 4, !tbaa !59
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 24
  store ptr null, ptr %7, align 4, !tbaa !59
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 28
  store ptr null, ptr %8, align 4, !tbaa !59
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 32
  store ptr null, ptr %9, align 4, !tbaa !59
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 36
  store ptr null, ptr %10, align 4, !tbaa !59
  %11 = getelementptr inbounds nuw i8, ptr %0, i32 40
  store ptr null, ptr %11, align 4, !tbaa !59
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 44
  store ptr null, ptr %12, align 4, !tbaa !59
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 48
  store ptr null, ptr %13, align 4, !tbaa !59
  %14 = getelementptr inbounds nuw i8, ptr %0, i32 52
  store ptr null, ptr %14, align 4, !tbaa !59
  %15 = getelementptr inbounds nuw i8, ptr %0, i32 56
  store ptr null, ptr %15, align 4, !tbaa !59
  %16 = getelementptr inbounds nuw i8, ptr %0, i32 60
  store ptr null, ptr %16, align 4, !tbaa !59
  %17 = getelementptr inbounds nuw i8, ptr %0, i32 64
  store ptr null, ptr %17, align 4, !tbaa !59
  %18 = getelementptr inbounds nuw i8, ptr %0, i32 68
  store ptr null, ptr %18, align 4, !tbaa !59
  %19 = getelementptr inbounds nuw i8, ptr %0, i32 72
  store ptr null, ptr %19, align 4, !tbaa !59
  %20 = getelementptr inbounds nuw i8, ptr %0, i32 76
  store ptr null, ptr %20, align 4, !tbaa !59
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local void @sglib_hashed_ilist_add(ptr noundef captures(none) %0, ptr noundef initializes((4, 8)) %1) local_unnamed_addr #6 {
  %3 = load i32, ptr %1, align 4, !tbaa !53
  %4 = urem i32 %3, 20
  %5 = getelementptr inbounds nuw ptr, ptr %0, i32 %4
  %6 = load ptr, ptr %5, align 4, !tbaa !59
  %7 = getelementptr inbounds nuw i8, ptr %1, i32 4
  store ptr %6, ptr %7, align 4, !tbaa !56
  store ptr %1, ptr %5, align 4, !tbaa !59
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @sglib_hashed_ilist_add_if_not_member(ptr noundef captures(none) %0, ptr noundef %1, ptr noundef captures(none) %2) local_unnamed_addr #8 {
  %4 = load i32, ptr %1, align 4, !tbaa !53
  %5 = urem i32 %4, 20
  %6 = getelementptr inbounds nuw ptr, ptr %0, i32 %5
  %7 = load ptr, ptr %6, align 4, !tbaa !59
  %8 = icmp eq ptr %7, null
  br i1 %8, label %18, label %9

9:                                                ; preds = %3, %13
  %10 = phi ptr [ %15, %13 ], [ %7, %3 ]
  %11 = load i32, ptr %10, align 4, !tbaa !53
  %12 = icmp eq i32 %11, %4
  br i1 %12, label %17, label %13

13:                                               ; preds = %9
  %14 = getelementptr inbounds nuw i8, ptr %10, i32 4
  %15 = load ptr, ptr %14, align 4, !tbaa !59
  %16 = icmp eq ptr %15, null
  br i1 %16, label %18, label %9, !llvm.loop !60

17:                                               ; preds = %9
  store ptr %10, ptr %2, align 4, !tbaa !59
  br label %24

18:                                               ; preds = %13, %3
  store ptr null, ptr %2, align 4, !tbaa !59
  %19 = load ptr, ptr %6, align 4, !tbaa !59
  %20 = getelementptr inbounds nuw i8, ptr %1, i32 4
  store ptr %19, ptr %20, align 4, !tbaa !56
  store ptr %1, ptr %6, align 4, !tbaa !59
  %21 = load ptr, ptr %2, align 4, !tbaa !59
  %22 = icmp eq ptr %21, null
  %23 = zext i1 %22 to i32
  br label %24

24:                                               ; preds = %17, %18
  %25 = phi i32 [ 0, %17 ], [ %23, %18 ]
  ret i32 %25
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @sglib_hashed_ilist_delete(ptr noundef captures(none) %0, ptr noundef readonly captures(address) %1) local_unnamed_addr #1 {
  %3 = load i32, ptr %1, align 4, !tbaa !53
  %4 = urem i32 %3, 20
  %5 = getelementptr inbounds nuw ptr, ptr %0, i32 %4
  br label %6

6:                                                ; preds = %6, %2
  %7 = phi ptr [ %5, %2 ], [ %12, %6 ]
  %8 = load ptr, ptr %7, align 4, !tbaa !59
  %9 = icmp eq ptr %8, null
  %10 = icmp eq ptr %8, %1
  %11 = or i1 %9, %10
  %12 = getelementptr inbounds nuw i8, ptr %8, i32 4
  br i1 %11, label %13, label %6, !llvm.loop !62

13:                                               ; preds = %6
  %14 = load ptr, ptr %12, align 4, !tbaa !56
  store ptr %14, ptr %7, align 4, !tbaa !59
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @sglib_hashed_ilist_delete_if_member(ptr noundef captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef captures(none) %2) local_unnamed_addr #1 {
  %4 = load i32, ptr %1, align 4, !tbaa !53
  %5 = urem i32 %4, 20
  %6 = getelementptr inbounds nuw ptr, ptr %0, i32 %5
  %7 = load ptr, ptr %6, align 4, !tbaa !59
  %8 = icmp eq ptr %7, null
  br i1 %8, label %21, label %9

9:                                                ; preds = %3
  %10 = load i32, ptr %7, align 4, !tbaa !53
  %11 = icmp eq i32 %10, %4
  br i1 %11, label %21, label %15

12:                                               ; preds = %15
  %13 = load i32, ptr %18, align 4, !tbaa !53
  %14 = icmp eq i32 %13, %4
  br i1 %14, label %21, label %15, !llvm.loop !63

15:                                               ; preds = %9, %12
  %16 = phi ptr [ %18, %12 ], [ %7, %9 ]
  %17 = getelementptr inbounds nuw i8, ptr %16, i32 4
  %18 = load ptr, ptr %17, align 4, !tbaa !59
  %19 = icmp eq ptr %18, null
  br i1 %19, label %20, label %12, !llvm.loop !63

20:                                               ; preds = %15
  br label %21, !llvm.loop !63

21:                                               ; preds = %12, %9, %20, %3
  %22 = phi ptr [ %6, %3 ], [ %6, %9 ], [ %17, %20 ], [ %17, %12 ]
  %23 = phi ptr [ null, %3 ], [ %7, %9 ], [ null, %20 ], [ %18, %12 ]
  store ptr %23, ptr %2, align 4, !tbaa !59
  %24 = load ptr, ptr %22, align 4, !tbaa !59
  %25 = icmp eq ptr %24, null
  br i1 %25, label %30, label %26

26:                                               ; preds = %21
  %27 = getelementptr inbounds nuw i8, ptr %24, i32 4
  %28 = load ptr, ptr %27, align 4, !tbaa !56
  store ptr %28, ptr %22, align 4, !tbaa !59
  %29 = load ptr, ptr %2, align 4, !tbaa !59
  br label %30

30:                                               ; preds = %21, %26
  %31 = phi ptr [ %29, %26 ], [ %23, %21 ]
  %32 = icmp ne ptr %31, null
  %33 = zext i1 %32 to i32
  ret i32 %33
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @sglib_hashed_ilist_is_member(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(address) %1) local_unnamed_addr #4 {
  %3 = load i32, ptr %1, align 4, !tbaa !53
  %4 = urem i32 %3, 20
  %5 = getelementptr inbounds nuw ptr, ptr %0, i32 %4
  %6 = load ptr, ptr %5, align 4, !tbaa !59
  %7 = icmp ne ptr %6, null
  %8 = icmp ne ptr %6, %1
  %9 = and i1 %7, %8
  br i1 %9, label %10, label %17

10:                                               ; preds = %2, %10
  %11 = phi ptr [ %13, %10 ], [ %6, %2 ]
  %12 = getelementptr inbounds nuw i8, ptr %11, i32 4
  %13 = load ptr, ptr %12, align 4, !tbaa !56
  %14 = icmp ne ptr %13, null
  %15 = icmp ne ptr %13, %1
  %16 = and i1 %14, %15
  br i1 %16, label %10, label %17, !llvm.loop !57

17:                                               ; preds = %10, %2
  %18 = phi i1 [ %7, %2 ], [ %14, %10 ]
  %19 = zext i1 %18 to i32
  ret i32 %19
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef ptr @sglib_hashed_ilist_find_member(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #4 {
  %3 = load i32, ptr %1, align 4, !tbaa !53
  %4 = urem i32 %3, 20
  %5 = getelementptr inbounds nuw ptr, ptr %0, i32 %4
  %6 = load ptr, ptr %5, align 4, !tbaa !59
  %7 = icmp eq ptr %6, null
  br i1 %7, label %16, label %8

8:                                                ; preds = %2, %12
  %9 = phi ptr [ %14, %12 ], [ %6, %2 ]
  %10 = load i32, ptr %9, align 4, !tbaa !53
  %11 = icmp eq i32 %10, %3
  br i1 %11, label %16, label %12

12:                                               ; preds = %8
  %13 = getelementptr inbounds nuw i8, ptr %9, i32 4
  %14 = load ptr, ptr %13, align 4, !tbaa !56
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %8, !llvm.loop !58

16:                                               ; preds = %8, %12, %2
  %17 = phi ptr [ null, %2 ], [ %9, %8 ], [ null, %12 ]
  ret ptr %17
}

; Function Attrs: nounwind
define dso_local ptr @sglib_hashed_ilist_it_init_on_equal(ptr noundef captures(none) initializes((4, 32)) %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) local_unnamed_addr #5 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 16
  store ptr %1, ptr %5, align 4, !tbaa !78
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 20
  store i32 0, ptr %6, align 4, !tbaa !82
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 24
  store ptr %2, ptr %7, align 4, !tbaa !83
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 28
  store ptr %3, ptr %8, align 4, !tbaa !84
  %9 = load ptr, ptr %1, align 4, !tbaa !59
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 8
  store ptr %2, ptr %10, align 4, !tbaa !72
  %11 = getelementptr inbounds nuw i8, ptr %0, i32 12
  store ptr %3, ptr %11, align 4, !tbaa !74
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store ptr null, ptr %12, align 4, !tbaa !75
  %13 = icmp eq ptr %2, null
  br i1 %13, label %26, label %14

14:                                               ; preds = %4
  %15 = icmp eq ptr %9, null
  br i1 %15, label %16, label %17

16:                                               ; preds = %22, %14
  store ptr null, ptr %0, align 4, !tbaa !76
  br label %32

17:                                               ; preds = %14, %22
  %18 = phi ptr [ %24, %22 ], [ %9, %14 ]
  %19 = tail call i32 %2(ptr noundef nonnull %18, ptr noundef %3) #15
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %17
  store ptr %18, ptr %0, align 4, !tbaa !76
  br label %28

22:                                               ; preds = %17
  %23 = getelementptr inbounds nuw i8, ptr %18, i32 4
  %24 = load ptr, ptr %23, align 4, !tbaa !56
  %25 = icmp eq ptr %24, null
  br i1 %25, label %16, label %17, !llvm.loop !77

26:                                               ; preds = %4
  store ptr %9, ptr %0, align 4, !tbaa !76
  %27 = icmp eq ptr %9, null
  br i1 %27, label %32, label %28

28:                                               ; preds = %21, %26
  %29 = phi ptr [ %18, %21 ], [ %9, %26 ]
  %30 = getelementptr inbounds nuw i8, ptr %29, i32 4
  %31 = load ptr, ptr %30, align 4, !tbaa !56
  store ptr %31, ptr %12, align 4, !tbaa !75
  br label %34

32:                                               ; preds = %16, %26
  %33 = tail call ptr @sglib_hashed_ilist_it_next(ptr noundef nonnull %0) #16
  br label %34

34:                                               ; preds = %28, %32
  %35 = phi ptr [ %33, %32 ], [ %29, %28 ]
  ret ptr %35
}

; Function Attrs: nounwind
define dso_local ptr @sglib_hashed_ilist_it_next(ptr noundef captures(none) %0) local_unnamed_addr #5 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %3 = load ptr, ptr %2, align 4, !tbaa !75
  store ptr null, ptr %2, align 4, !tbaa !75
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 8
  %5 = load ptr, ptr %4, align 4, !tbaa !72
  %6 = icmp eq ptr %5, null
  br i1 %6, label %20, label %7

7:                                                ; preds = %1
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %9 = load ptr, ptr %8, align 4, !tbaa !74
  %10 = icmp eq ptr %3, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %16, %7
  store ptr null, ptr %0, align 4, !tbaa !76
  br label %22

12:                                               ; preds = %7, %16
  %13 = phi ptr [ %18, %16 ], [ %3, %7 ]
  %14 = tail call i32 %5(ptr noundef nonnull %13, ptr noundef %9) #15
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %56, label %16

16:                                               ; preds = %12
  %17 = getelementptr inbounds nuw i8, ptr %13, i32 4
  %18 = load ptr, ptr %17, align 4, !tbaa !56
  %19 = icmp eq ptr %18, null
  br i1 %19, label %11, label %12, !llvm.loop !77

20:                                               ; preds = %1
  store ptr %3, ptr %0, align 4, !tbaa !76
  %21 = icmp eq ptr %3, null
  br i1 %21, label %22, label %58

22:                                               ; preds = %11, %20
  %23 = getelementptr inbounds nuw i8, ptr %0, i32 20
  %24 = getelementptr inbounds nuw i8, ptr %0, i32 16
  %25 = getelementptr inbounds nuw i8, ptr %0, i32 24
  %26 = getelementptr inbounds nuw i8, ptr %0, i32 28
  %27 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %28 = load i32, ptr %23, align 4, !tbaa !82
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %23, align 4, !tbaa !82
  %30 = icmp slt i32 %28, 19
  br i1 %30, label %31, label %62

31:                                               ; preds = %22, %52
  %32 = phi i32 [ %54, %52 ], [ %29, %22 ]
  %33 = load ptr, ptr %24, align 4, !tbaa !78
  %34 = getelementptr inbounds ptr, ptr %33, i32 %32
  %35 = load ptr, ptr %34, align 4, !tbaa !59
  %36 = load ptr, ptr %25, align 4, !tbaa !83
  %37 = load ptr, ptr %26, align 4, !tbaa !84
  store ptr %36, ptr %4, align 4, !tbaa !72
  store ptr %37, ptr %27, align 4, !tbaa !74
  store ptr null, ptr %2, align 4, !tbaa !75
  %38 = icmp eq ptr %36, null
  br i1 %38, label %50, label %39

39:                                               ; preds = %31
  %40 = icmp eq ptr %35, null
  br i1 %40, label %41, label %42

41:                                               ; preds = %46, %39
  store ptr null, ptr %0, align 4, !tbaa !76
  br label %52

42:                                               ; preds = %39, %46
  %43 = phi ptr [ %48, %46 ], [ %35, %39 ]
  %44 = tail call i32 %36(ptr noundef nonnull %43, ptr noundef %37) #15
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %56, label %46

46:                                               ; preds = %42
  %47 = getelementptr inbounds nuw i8, ptr %43, i32 4
  %48 = load ptr, ptr %47, align 4, !tbaa !56
  %49 = icmp eq ptr %48, null
  br i1 %49, label %41, label %42, !llvm.loop !77

50:                                               ; preds = %31
  store ptr %35, ptr %0, align 4, !tbaa !76
  %51 = icmp eq ptr %35, null
  br i1 %51, label %52, label %58

52:                                               ; preds = %41, %50
  %53 = load i32, ptr %23, align 4, !tbaa !82
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %23, align 4, !tbaa !82
  %55 = icmp slt i32 %53, 19
  br i1 %55, label %31, label %62, !llvm.loop !85

56:                                               ; preds = %12, %42
  %57 = phi ptr [ %43, %42 ], [ %13, %12 ]
  store ptr %57, ptr %0, align 4, !tbaa !76
  br label %58

58:                                               ; preds = %50, %56, %20
  %59 = phi ptr [ %3, %20 ], [ %57, %56 ], [ %35, %50 ]
  %60 = getelementptr inbounds nuw i8, ptr %59, i32 4
  %61 = load ptr, ptr %60, align 4, !tbaa !56
  store ptr %61, ptr %2, align 4, !tbaa !75
  br label %62

62:                                               ; preds = %52, %22, %58
  %63 = phi ptr [ %59, %58 ], [ null, %22 ], [ null, %52 ]
  ret ptr %63
}

; Function Attrs: nounwind
define dso_local ptr @sglib_hashed_ilist_it_init(ptr noundef captures(none) initializes((0, 32)) %0, ptr noundef %1) local_unnamed_addr #5 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 16
  store ptr %1, ptr %3, align 4, !tbaa !78
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 20
  store i32 0, ptr %4, align 4, !tbaa !82
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 24
  store ptr null, ptr %5, align 4, !tbaa !83
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 28
  store ptr null, ptr %6, align 4, !tbaa !84
  %7 = load ptr, ptr %1, align 4, !tbaa !59
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 8
  store ptr null, ptr %8, align 4, !tbaa !72
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 12
  store ptr null, ptr %9, align 4, !tbaa !74
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store ptr null, ptr %10, align 4, !tbaa !75
  store ptr %7, ptr %0, align 4, !tbaa !76
  %11 = icmp eq ptr %7, null
  br i1 %11, label %15, label %12

12:                                               ; preds = %2
  %13 = getelementptr inbounds nuw i8, ptr %7, i32 4
  %14 = load ptr, ptr %13, align 4, !tbaa !56
  store ptr %14, ptr %10, align 4, !tbaa !75
  br label %17

15:                                               ; preds = %2
  %16 = tail call ptr @sglib_hashed_ilist_it_next(ptr noundef nonnull %0) #16
  br label %17

17:                                               ; preds = %12, %15
  %18 = phi ptr [ %16, %15 ], [ %7, %12 ]
  ret ptr %18
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define dso_local ptr @sglib_hashed_ilist_it_current(ptr noundef readonly captures(none) %0) local_unnamed_addr #7 {
  %2 = load ptr, ptr %0, align 4, !tbaa !76
  ret ptr %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local void @sglib_iq_init(ptr noundef writeonly captures(none) initializes((404, 412)) %0) local_unnamed_addr #9 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 408
  store i32 0, ptr %2, align 4, !tbaa !86
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 404
  store i32 0, ptr %3, align 4, !tbaa !88
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define dso_local range(i32 0, 2) i32 @sglib_iq_is_empty(ptr noundef readonly captures(none) %0) local_unnamed_addr #7 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 404
  %3 = load i32, ptr %2, align 4, !tbaa !88
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 408
  %5 = load i32, ptr %4, align 4, !tbaa !86
  %6 = icmp eq i32 %3, %5
  %7 = zext i1 %6 to i32
  ret i32 %7
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define dso_local range(i32 0, 2) i32 @sglib_iq_is_full(ptr noundef readonly captures(none) %0) local_unnamed_addr #7 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 404
  %3 = load i32, ptr %2, align 4, !tbaa !88
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 408
  %5 = load i32, ptr %4, align 4, !tbaa !86
  %6 = add nsw i32 %5, 1
  %7 = srem i32 %6, 101
  %8 = icmp eq i32 %3, %7
  %9 = zext i1 %8 to i32
  ret i32 %9
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define dso_local i32 @sglib_iq_first_element(ptr noundef readonly captures(none) %0) local_unnamed_addr #7 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 404
  %3 = load i32, ptr %2, align 4, !tbaa !88
  %4 = getelementptr inbounds i32, ptr %0, i32 %3
  %5 = load i32, ptr %4, align 4, !tbaa !6
  ret i32 %5
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define dso_local ptr @sglib_iq_first_element_ptr(ptr noundef readonly captures(ret: address, provenance) %0) local_unnamed_addr #7 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 404
  %3 = load i32, ptr %2, align 4, !tbaa !88
  %4 = getelementptr inbounds i32, ptr %0, i32 %3
  ret ptr %4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local void @sglib_iq_add_next(ptr noundef captures(none) %0) local_unnamed_addr #6 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 408
  %3 = load i32, ptr %2, align 4, !tbaa !86
  %4 = add nsw i32 %3, 1
  %5 = srem i32 %4, 101
  store i32 %5, ptr %2, align 4, !tbaa !86
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local void @sglib_iq_add(ptr noundef captures(none) %0, i32 noundef %1) local_unnamed_addr #6 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 408
  %4 = load i32, ptr %3, align 4, !tbaa !86
  %5 = getelementptr inbounds i32, ptr %0, i32 %4
  store i32 %1, ptr %5, align 4, !tbaa !6
  %6 = load i32, ptr %3, align 4, !tbaa !86
  %7 = add nsw i32 %6, 1
  %8 = srem i32 %7, 101
  store i32 %8, ptr %3, align 4, !tbaa !86
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local void @sglib_iq_delete_first(ptr noundef captures(none) %0) local_unnamed_addr #6 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 404
  %3 = load i32, ptr %2, align 4, !tbaa !88
  %4 = add nsw i32 %3, 1
  %5 = srem i32 %4, 101
  store i32 %5, ptr %2, align 4, !tbaa !88
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local void @sglib_iq_delete(ptr noundef captures(none) %0) local_unnamed_addr #6 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 404
  %3 = load i32, ptr %2, align 4, !tbaa !88
  %4 = add nsw i32 %3, 1
  %5 = srem i32 %4, 101
  store i32 %5, ptr %2, align 4, !tbaa !88
  ret void
}

; Function Attrs: nofree nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @sglib___rbtree_delete_recursive(ptr noundef captures(none) %0, ptr noundef %1) local_unnamed_addr #10 {
  %3 = alloca ptr, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #17
  %4 = load ptr, ptr %0, align 4, !tbaa !89
  %5 = icmp eq ptr %4, null
  br i1 %5, label %69, label %6

6:                                                ; preds = %2
  %7 = load i32, ptr %1, align 4, !tbaa !91
  %8 = load i32, ptr %4, align 4, !tbaa !91
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %14, label %10

10:                                               ; preds = %6
  %11 = icmp eq i32 %7, %8
  %12 = icmp ult ptr %1, %4
  %13 = and i1 %12, %11
  br i1 %13, label %14, label %20

14:                                               ; preds = %10, %6
  %15 = getelementptr inbounds nuw i8, ptr %4, i32 8
  %16 = tail call i32 @sglib___rbtree_delete_recursive(ptr noundef nonnull %15, ptr noundef nonnull %1) #16
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %69, label %18

18:                                               ; preds = %14
  %19 = tail call fastcc i32 @sglib___rbtree_fix_left_deletion_discrepancy(ptr noundef nonnull %0) #16
  br label %69

20:                                               ; preds = %10
  %21 = icmp ne i32 %7, %8
  %22 = icmp ugt ptr %1, %4
  %23 = or i1 %22, %21
  br i1 %23, label %24, label %30

24:                                               ; preds = %20
  %25 = getelementptr inbounds nuw i8, ptr %4, i32 12
  %26 = tail call i32 @sglib___rbtree_delete_recursive(ptr noundef nonnull %25, ptr noundef nonnull %1) #16
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %69, label %28

28:                                               ; preds = %24
  %29 = tail call fastcc i32 @sglib___rbtree_fix_right_deletion_discrepancy(ptr noundef nonnull %0) #16
  br label %69

30:                                               ; preds = %20
  %31 = getelementptr inbounds nuw i8, ptr %4, i32 8
  %32 = load ptr, ptr %31, align 4, !tbaa !93
  %33 = icmp eq ptr %32, null
  br i1 %33, label %34, label %55

34:                                               ; preds = %30
  %35 = getelementptr inbounds nuw i8, ptr %4, i32 12
  %36 = load ptr, ptr %35, align 4, !tbaa !94
  %37 = icmp eq ptr %36, null
  br i1 %37, label %38, label %43

38:                                               ; preds = %34
  store ptr null, ptr %0, align 4, !tbaa !89
  %39 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %40 = load i8, ptr %39, align 4, !tbaa !95
  %41 = icmp eq i8 %40, 0
  %42 = zext i1 %41 to i32
  br label %69

43:                                               ; preds = %34
  %44 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %45 = load i8, ptr %44, align 4, !tbaa !95
  %46 = icmp eq i8 %45, 0
  br i1 %46, label %47, label %52

47:                                               ; preds = %43
  %48 = getelementptr inbounds nuw i8, ptr %36, i32 4
  %49 = load i8, ptr %48, align 4, !tbaa !95
  %50 = icmp eq i8 %49, 0
  %51 = zext i1 %50 to i32
  br label %52

52:                                               ; preds = %47, %43
  %53 = phi i32 [ 0, %43 ], [ %51, %47 ]
  %54 = getelementptr inbounds nuw i8, ptr %36, i32 4
  store i8 0, ptr %54, align 4, !tbaa !95
  store ptr %36, ptr %0, align 4, !tbaa !89
  br label %69

55:                                               ; preds = %30
  %56 = call fastcc i32 @sglib___rbtree_delete_rightmost_leaf(ptr noundef nonnull %31, ptr noundef %3) #16
  %57 = load ptr, ptr %31, align 4, !tbaa !93
  %58 = load ptr, ptr %3, align 4, !tbaa !89
  %59 = getelementptr inbounds nuw i8, ptr %58, i32 8
  store ptr %57, ptr %59, align 4, !tbaa !93
  %60 = getelementptr inbounds nuw i8, ptr %4, i32 12
  %61 = load ptr, ptr %60, align 4, !tbaa !94
  %62 = getelementptr inbounds nuw i8, ptr %58, i32 12
  store ptr %61, ptr %62, align 4, !tbaa !94
  %63 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %64 = load i8, ptr %63, align 4, !tbaa !95
  %65 = getelementptr inbounds nuw i8, ptr %58, i32 4
  store i8 %64, ptr %65, align 4, !tbaa !95
  store ptr %58, ptr %0, align 4, !tbaa !89
  %66 = icmp eq i32 %56, 0
  br i1 %66, label %69, label %67

67:                                               ; preds = %55
  %68 = tail call fastcc i32 @sglib___rbtree_fix_left_deletion_discrepancy(ptr noundef nonnull %0) #16
  br label %69

69:                                               ; preds = %18, %14, %52, %38, %67, %55, %24, %28, %2
  %70 = phi i32 [ 0, %2 ], [ %19, %18 ], [ 0, %14 ], [ %29, %28 ], [ 0, %24 ], [ %42, %38 ], [ %53, %52 ], [ %68, %67 ], [ 0, %55 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #17
  ret i32 %70
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define internal fastcc range(i32 0, 2) i32 @sglib___rbtree_fix_left_deletion_discrepancy(ptr noundef captures(none) %0) unnamed_addr #0 {
  %2 = load ptr, ptr %0, align 4, !tbaa !89
  %3 = getelementptr inbounds nuw i8, ptr %2, i32 12
  %4 = load ptr, ptr %3, align 4, !tbaa !94
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %8

6:                                                ; preds = %1
  %7 = getelementptr inbounds nuw i8, ptr %2, i32 4
  store i8 0, ptr %7, align 4, !tbaa !95
  br label %119

8:                                                ; preds = %1
  %9 = getelementptr inbounds nuw i8, ptr %4, i32 12
  %10 = load ptr, ptr %9, align 4, !tbaa !94
  %11 = getelementptr inbounds nuw i8, ptr %4, i32 8
  %12 = load ptr, ptr %11, align 4, !tbaa !93
  %13 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %14 = load i8, ptr %13, align 4, !tbaa !95
  %15 = icmp eq i8 %14, 1
  br i1 %15, label %16, label %70

16:                                               ; preds = %8
  %17 = icmp eq ptr %12, null
  br i1 %17, label %18, label %19

18:                                               ; preds = %16
  store ptr %4, ptr %0, align 4, !tbaa !89
  store i8 0, ptr %13, align 4, !tbaa !95
  store ptr %2, ptr %11, align 4, !tbaa !93
  store ptr null, ptr %3, align 4, !tbaa !94
  br label %119

19:                                               ; preds = %16
  %20 = getelementptr inbounds nuw i8, ptr %12, i32 12
  %21 = load ptr, ptr %20, align 4, !tbaa !94
  %22 = getelementptr inbounds nuw i8, ptr %12, i32 8
  %23 = load ptr, ptr %22, align 4, !tbaa !93
  %24 = icmp eq ptr %21, null
  br i1 %24, label %29, label %25

25:                                               ; preds = %19
  %26 = getelementptr inbounds nuw i8, ptr %21, i32 4
  %27 = load i8, ptr %26, align 4, !tbaa !95
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %29, label %41

29:                                               ; preds = %25, %19
  %30 = icmp eq ptr %23, null
  br i1 %30, label %35, label %31

31:                                               ; preds = %29
  %32 = getelementptr inbounds nuw i8, ptr %23, i32 4
  %33 = load i8, ptr %32, align 4, !tbaa !95
  %34 = icmp eq i8 %33, 0
  br i1 %34, label %35, label %37

35:                                               ; preds = %31, %29
  store ptr %4, ptr %0, align 4, !tbaa !89
  store ptr %2, ptr %11, align 4, !tbaa !93
  store i8 0, ptr %13, align 4, !tbaa !95
  store ptr %12, ptr %3, align 4, !tbaa !94
  %36 = getelementptr inbounds nuw i8, ptr %12, i32 4
  store i8 1, ptr %36, align 4, !tbaa !95
  br label %119

37:                                               ; preds = %31
  br i1 %24, label %61, label %38

38:                                               ; preds = %37
  %39 = getelementptr inbounds nuw i8, ptr %21, i32 4
  %40 = load i8, ptr %39, align 4, !tbaa !95
  br label %41

41:                                               ; preds = %38, %25
  %42 = phi i8 [ %40, %38 ], [ %27, %25 ]
  %43 = getelementptr inbounds nuw i8, ptr %21, i32 4
  %44 = icmp eq i8 %42, 1
  %45 = icmp eq ptr %23, null
  br i1 %44, label %46, label %57

46:                                               ; preds = %41
  br i1 %45, label %56, label %47

47:                                               ; preds = %46
  %48 = getelementptr inbounds nuw i8, ptr %23, i32 4
  %49 = load i8, ptr %48, align 4, !tbaa !95
  %50 = icmp eq i8 %49, 1
  br i1 %50, label %51, label %56

51:                                               ; preds = %47
  %52 = getelementptr inbounds nuw i8, ptr %23, i32 12
  %53 = load ptr, ptr %52, align 4, !tbaa !94
  %54 = getelementptr inbounds nuw i8, ptr %23, i32 8
  %55 = load ptr, ptr %54, align 4, !tbaa !93
  store ptr %23, ptr %0, align 4, !tbaa !89
  store i8 0, ptr %48, align 4, !tbaa !95
  store ptr %4, ptr %52, align 4, !tbaa !94
  store ptr %53, ptr %22, align 4, !tbaa !93
  store ptr %2, ptr %54, align 4, !tbaa !93
  store ptr %55, ptr %3, align 4, !tbaa !94
  br label %119

56:                                               ; preds = %47, %46
  store ptr %12, ptr %0, align 4, !tbaa !89
  store ptr %4, ptr %20, align 4, !tbaa !94
  store ptr %2, ptr %22, align 4, !tbaa !93
  store ptr %10, ptr %9, align 4, !tbaa !94
  store ptr %21, ptr %11, align 4, !tbaa !93
  store ptr %23, ptr %3, align 4, !tbaa !94
  store i8 0, ptr %43, align 4, !tbaa !95
  br label %119

57:                                               ; preds = %41
  br i1 %45, label %119, label %58

58:                                               ; preds = %57
  %59 = getelementptr inbounds nuw i8, ptr %23, i32 4
  %60 = load i8, ptr %59, align 4, !tbaa !95
  br label %61

61:                                               ; preds = %58, %37
  %62 = phi i8 [ %60, %58 ], [ %33, %37 ]
  %63 = icmp eq i8 %62, 1
  br i1 %63, label %64, label %119

64:                                               ; preds = %61
  %65 = getelementptr inbounds nuw i8, ptr %23, i32 4
  %66 = getelementptr inbounds nuw i8, ptr %23, i32 12
  %67 = load ptr, ptr %66, align 4, !tbaa !94
  %68 = getelementptr inbounds nuw i8, ptr %23, i32 8
  %69 = load ptr, ptr %68, align 4, !tbaa !93
  store ptr %23, ptr %0, align 4, !tbaa !89
  store i8 0, ptr %65, align 4, !tbaa !95
  store ptr %4, ptr %66, align 4, !tbaa !94
  store ptr %67, ptr %22, align 4, !tbaa !93
  store ptr %2, ptr %68, align 4, !tbaa !93
  store ptr %69, ptr %3, align 4, !tbaa !94
  br label %119

70:                                               ; preds = %8
  %71 = icmp eq ptr %10, null
  br i1 %71, label %76, label %72

72:                                               ; preds = %70
  %73 = getelementptr inbounds nuw i8, ptr %10, i32 4
  %74 = load i8, ptr %73, align 4, !tbaa !95
  %75 = icmp eq i8 %74, 0
  br i1 %75, label %76, label %91

76:                                               ; preds = %72, %70
  %77 = icmp eq ptr %12, null
  br i1 %77, label %82, label %78

78:                                               ; preds = %76
  %79 = getelementptr inbounds nuw i8, ptr %12, i32 4
  %80 = load i8, ptr %79, align 4, !tbaa !95
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %82, label %87

82:                                               ; preds = %78, %76
  %83 = getelementptr inbounds nuw i8, ptr %2, i32 4
  %84 = load i8, ptr %83, align 4, !tbaa !95
  %85 = icmp eq i8 %84, 0
  %86 = zext i1 %85 to i32
  store i8 0, ptr %83, align 4, !tbaa !95
  store i8 1, ptr %13, align 4, !tbaa !95
  br label %119

87:                                               ; preds = %78
  br i1 %71, label %111, label %88

88:                                               ; preds = %87
  %89 = getelementptr inbounds nuw i8, ptr %10, i32 4
  %90 = load i8, ptr %89, align 4, !tbaa !95
  br label %91

91:                                               ; preds = %88, %72
  %92 = phi i8 [ %90, %88 ], [ %74, %72 ]
  %93 = getelementptr inbounds nuw i8, ptr %10, i32 4
  %94 = icmp eq i8 %92, 1
  br i1 %94, label %95, label %111

95:                                               ; preds = %91
  %96 = icmp eq ptr %12, null
  br i1 %96, label %101, label %97

97:                                               ; preds = %95
  %98 = getelementptr inbounds nuw i8, ptr %12, i32 4
  %99 = load i8, ptr %98, align 4, !tbaa !95
  %100 = icmp eq i8 %99, 0
  br i1 %100, label %101, label %104

101:                                              ; preds = %97, %95
  store ptr %4, ptr %0, align 4, !tbaa !89
  %102 = getelementptr inbounds nuw i8, ptr %2, i32 4
  %103 = load i8, ptr %102, align 4, !tbaa !95
  store i8 %103, ptr %13, align 4, !tbaa !95
  store i8 0, ptr %102, align 4, !tbaa !95
  store ptr %2, ptr %11, align 4, !tbaa !93
  store ptr %12, ptr %3, align 4, !tbaa !94
  store i8 0, ptr %93, align 4, !tbaa !95
  br label %119

104:                                              ; preds = %97
  %105 = getelementptr inbounds nuw i8, ptr %12, i32 12
  %106 = load ptr, ptr %105, align 4, !tbaa !94
  %107 = getelementptr inbounds nuw i8, ptr %12, i32 8
  %108 = load ptr, ptr %107, align 4, !tbaa !93
  store ptr %12, ptr %0, align 4, !tbaa !89
  %109 = getelementptr inbounds nuw i8, ptr %2, i32 4
  %110 = load i8, ptr %109, align 4, !tbaa !95
  store i8 %110, ptr %98, align 4, !tbaa !95
  store i8 0, ptr %109, align 4, !tbaa !95
  store ptr %4, ptr %105, align 4, !tbaa !94
  store ptr %2, ptr %107, align 4, !tbaa !93
  store ptr %106, ptr %11, align 4, !tbaa !93
  store ptr %108, ptr %3, align 4, !tbaa !94
  br label %119

111:                                              ; preds = %91, %87
  %112 = getelementptr inbounds nuw i8, ptr %12, i32 12
  %113 = load ptr, ptr %112, align 4, !tbaa !94
  %114 = getelementptr inbounds nuw i8, ptr %12, i32 8
  %115 = load ptr, ptr %114, align 4, !tbaa !93
  store ptr %12, ptr %0, align 4, !tbaa !89
  %116 = getelementptr inbounds nuw i8, ptr %2, i32 4
  %117 = load i8, ptr %116, align 4, !tbaa !95
  %118 = getelementptr inbounds nuw i8, ptr %12, i32 4
  store i8 %117, ptr %118, align 4, !tbaa !95
  store i8 0, ptr %116, align 4, !tbaa !95
  store ptr %4, ptr %112, align 4, !tbaa !94
  store ptr %2, ptr %114, align 4, !tbaa !93
  store ptr %113, ptr %11, align 4, !tbaa !93
  store ptr %115, ptr %3, align 4, !tbaa !94
  br label %119

119:                                              ; preds = %57, %61, %35, %64, %51, %56, %18, %111, %104, %101, %82, %6
  %120 = phi i32 [ 0, %6 ], [ 0, %18 ], [ 0, %35 ], [ 0, %51 ], [ 0, %56 ], [ 0, %64 ], [ 0, %111 ], [ %86, %82 ], [ 0, %101 ], [ 0, %104 ], [ 0, %61 ], [ 0, %57 ]
  ret i32 %120
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define internal fastcc range(i32 0, 2) i32 @sglib___rbtree_fix_right_deletion_discrepancy(ptr noundef captures(none) %0) unnamed_addr #0 {
  %2 = load ptr, ptr %0, align 4, !tbaa !89
  %3 = getelementptr inbounds nuw i8, ptr %2, i32 8
  %4 = load ptr, ptr %3, align 4, !tbaa !93
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %8

6:                                                ; preds = %1
  %7 = getelementptr inbounds nuw i8, ptr %2, i32 4
  store i8 0, ptr %7, align 4, !tbaa !95
  br label %119

8:                                                ; preds = %1
  %9 = getelementptr inbounds nuw i8, ptr %4, i32 8
  %10 = load ptr, ptr %9, align 4, !tbaa !93
  %11 = getelementptr inbounds nuw i8, ptr %4, i32 12
  %12 = load ptr, ptr %11, align 4, !tbaa !94
  %13 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %14 = load i8, ptr %13, align 4, !tbaa !95
  %15 = icmp eq i8 %14, 1
  br i1 %15, label %16, label %70

16:                                               ; preds = %8
  %17 = icmp eq ptr %12, null
  br i1 %17, label %18, label %19

18:                                               ; preds = %16
  store ptr %4, ptr %0, align 4, !tbaa !89
  store i8 0, ptr %13, align 4, !tbaa !95
  store ptr %2, ptr %11, align 4, !tbaa !94
  store ptr null, ptr %3, align 4, !tbaa !93
  br label %119

19:                                               ; preds = %16
  %20 = getelementptr inbounds nuw i8, ptr %12, i32 8
  %21 = load ptr, ptr %20, align 4, !tbaa !93
  %22 = getelementptr inbounds nuw i8, ptr %12, i32 12
  %23 = load ptr, ptr %22, align 4, !tbaa !94
  %24 = icmp eq ptr %21, null
  br i1 %24, label %29, label %25

25:                                               ; preds = %19
  %26 = getelementptr inbounds nuw i8, ptr %21, i32 4
  %27 = load i8, ptr %26, align 4, !tbaa !95
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %29, label %41

29:                                               ; preds = %25, %19
  %30 = icmp eq ptr %23, null
  br i1 %30, label %35, label %31

31:                                               ; preds = %29
  %32 = getelementptr inbounds nuw i8, ptr %23, i32 4
  %33 = load i8, ptr %32, align 4, !tbaa !95
  %34 = icmp eq i8 %33, 0
  br i1 %34, label %35, label %37

35:                                               ; preds = %31, %29
  store ptr %4, ptr %0, align 4, !tbaa !89
  store ptr %2, ptr %11, align 4, !tbaa !94
  store i8 0, ptr %13, align 4, !tbaa !95
  store ptr %12, ptr %3, align 4, !tbaa !93
  %36 = getelementptr inbounds nuw i8, ptr %12, i32 4
  store i8 1, ptr %36, align 4, !tbaa !95
  br label %119

37:                                               ; preds = %31
  br i1 %24, label %61, label %38

38:                                               ; preds = %37
  %39 = getelementptr inbounds nuw i8, ptr %21, i32 4
  %40 = load i8, ptr %39, align 4, !tbaa !95
  br label %41

41:                                               ; preds = %38, %25
  %42 = phi i8 [ %40, %38 ], [ %27, %25 ]
  %43 = getelementptr inbounds nuw i8, ptr %21, i32 4
  %44 = icmp eq i8 %42, 1
  %45 = icmp eq ptr %23, null
  br i1 %44, label %46, label %57

46:                                               ; preds = %41
  br i1 %45, label %56, label %47

47:                                               ; preds = %46
  %48 = getelementptr inbounds nuw i8, ptr %23, i32 4
  %49 = load i8, ptr %48, align 4, !tbaa !95
  %50 = icmp eq i8 %49, 1
  br i1 %50, label %51, label %56

51:                                               ; preds = %47
  %52 = getelementptr inbounds nuw i8, ptr %23, i32 8
  %53 = load ptr, ptr %52, align 4, !tbaa !93
  %54 = getelementptr inbounds nuw i8, ptr %23, i32 12
  %55 = load ptr, ptr %54, align 4, !tbaa !94
  store ptr %23, ptr %0, align 4, !tbaa !89
  store i8 0, ptr %48, align 4, !tbaa !95
  store ptr %4, ptr %52, align 4, !tbaa !93
  store ptr %53, ptr %22, align 4, !tbaa !94
  store ptr %2, ptr %54, align 4, !tbaa !94
  store ptr %55, ptr %3, align 4, !tbaa !93
  br label %119

56:                                               ; preds = %47, %46
  store ptr %12, ptr %0, align 4, !tbaa !89
  store ptr %4, ptr %20, align 4, !tbaa !93
  store ptr %2, ptr %22, align 4, !tbaa !94
  store ptr %10, ptr %9, align 4, !tbaa !93
  store ptr %21, ptr %11, align 4, !tbaa !94
  store ptr %23, ptr %3, align 4, !tbaa !93
  store i8 0, ptr %43, align 4, !tbaa !95
  br label %119

57:                                               ; preds = %41
  br i1 %45, label %119, label %58

58:                                               ; preds = %57
  %59 = getelementptr inbounds nuw i8, ptr %23, i32 4
  %60 = load i8, ptr %59, align 4, !tbaa !95
  br label %61

61:                                               ; preds = %58, %37
  %62 = phi i8 [ %60, %58 ], [ %33, %37 ]
  %63 = icmp eq i8 %62, 1
  br i1 %63, label %64, label %119

64:                                               ; preds = %61
  %65 = getelementptr inbounds nuw i8, ptr %23, i32 4
  %66 = getelementptr inbounds nuw i8, ptr %23, i32 8
  %67 = load ptr, ptr %66, align 4, !tbaa !93
  %68 = getelementptr inbounds nuw i8, ptr %23, i32 12
  %69 = load ptr, ptr %68, align 4, !tbaa !94
  store ptr %23, ptr %0, align 4, !tbaa !89
  store i8 0, ptr %65, align 4, !tbaa !95
  store ptr %4, ptr %66, align 4, !tbaa !93
  store ptr %67, ptr %22, align 4, !tbaa !94
  store ptr %2, ptr %68, align 4, !tbaa !94
  store ptr %69, ptr %3, align 4, !tbaa !93
  br label %119

70:                                               ; preds = %8
  %71 = icmp eq ptr %10, null
  br i1 %71, label %76, label %72

72:                                               ; preds = %70
  %73 = getelementptr inbounds nuw i8, ptr %10, i32 4
  %74 = load i8, ptr %73, align 4, !tbaa !95
  %75 = icmp eq i8 %74, 0
  br i1 %75, label %76, label %91

76:                                               ; preds = %72, %70
  %77 = icmp eq ptr %12, null
  br i1 %77, label %82, label %78

78:                                               ; preds = %76
  %79 = getelementptr inbounds nuw i8, ptr %12, i32 4
  %80 = load i8, ptr %79, align 4, !tbaa !95
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %82, label %87

82:                                               ; preds = %78, %76
  %83 = getelementptr inbounds nuw i8, ptr %2, i32 4
  %84 = load i8, ptr %83, align 4, !tbaa !95
  %85 = icmp eq i8 %84, 0
  %86 = zext i1 %85 to i32
  store i8 0, ptr %83, align 4, !tbaa !95
  store i8 1, ptr %13, align 4, !tbaa !95
  br label %119

87:                                               ; preds = %78
  br i1 %71, label %111, label %88

88:                                               ; preds = %87
  %89 = getelementptr inbounds nuw i8, ptr %10, i32 4
  %90 = load i8, ptr %89, align 4, !tbaa !95
  br label %91

91:                                               ; preds = %88, %72
  %92 = phi i8 [ %90, %88 ], [ %74, %72 ]
  %93 = getelementptr inbounds nuw i8, ptr %10, i32 4
  %94 = icmp eq i8 %92, 1
  br i1 %94, label %95, label %111

95:                                               ; preds = %91
  %96 = icmp eq ptr %12, null
  br i1 %96, label %101, label %97

97:                                               ; preds = %95
  %98 = getelementptr inbounds nuw i8, ptr %12, i32 4
  %99 = load i8, ptr %98, align 4, !tbaa !95
  %100 = icmp eq i8 %99, 0
  br i1 %100, label %101, label %104

101:                                              ; preds = %97, %95
  store ptr %4, ptr %0, align 4, !tbaa !89
  %102 = getelementptr inbounds nuw i8, ptr %2, i32 4
  %103 = load i8, ptr %102, align 4, !tbaa !95
  store i8 %103, ptr %13, align 4, !tbaa !95
  store i8 0, ptr %102, align 4, !tbaa !95
  store ptr %2, ptr %11, align 4, !tbaa !94
  store ptr %12, ptr %3, align 4, !tbaa !93
  store i8 0, ptr %93, align 4, !tbaa !95
  br label %119

104:                                              ; preds = %97
  %105 = getelementptr inbounds nuw i8, ptr %12, i32 8
  %106 = load ptr, ptr %105, align 4, !tbaa !93
  %107 = getelementptr inbounds nuw i8, ptr %12, i32 12
  %108 = load ptr, ptr %107, align 4, !tbaa !94
  store ptr %12, ptr %0, align 4, !tbaa !89
  %109 = getelementptr inbounds nuw i8, ptr %2, i32 4
  %110 = load i8, ptr %109, align 4, !tbaa !95
  store i8 %110, ptr %98, align 4, !tbaa !95
  store i8 0, ptr %109, align 4, !tbaa !95
  store ptr %4, ptr %105, align 4, !tbaa !93
  store ptr %2, ptr %107, align 4, !tbaa !94
  store ptr %106, ptr %11, align 4, !tbaa !94
  store ptr %108, ptr %3, align 4, !tbaa !93
  br label %119

111:                                              ; preds = %91, %87
  %112 = getelementptr inbounds nuw i8, ptr %12, i32 8
  %113 = load ptr, ptr %112, align 4, !tbaa !93
  %114 = getelementptr inbounds nuw i8, ptr %12, i32 12
  %115 = load ptr, ptr %114, align 4, !tbaa !94
  store ptr %12, ptr %0, align 4, !tbaa !89
  %116 = getelementptr inbounds nuw i8, ptr %2, i32 4
  %117 = load i8, ptr %116, align 4, !tbaa !95
  %118 = getelementptr inbounds nuw i8, ptr %12, i32 4
  store i8 %117, ptr %118, align 4, !tbaa !95
  store i8 0, ptr %116, align 4, !tbaa !95
  store ptr %4, ptr %112, align 4, !tbaa !93
  store ptr %2, ptr %114, align 4, !tbaa !94
  store ptr %113, ptr %11, align 4, !tbaa !94
  store ptr %115, ptr %3, align 4, !tbaa !93
  br label %119

119:                                              ; preds = %57, %61, %35, %64, %51, %56, %18, %111, %104, %101, %82, %6
  %120 = phi i32 [ 0, %6 ], [ 0, %18 ], [ 0, %35 ], [ 0, %51 ], [ 0, %56 ], [ 0, %64 ], [ 0, %111 ], [ %86, %82 ], [ 0, %101 ], [ 0, %104 ], [ 0, %61 ], [ 0, %57 ]
  ret i32 %120
}

; Function Attrs: nofree nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define internal fastcc range(i32 0, 2) i32 @sglib___rbtree_delete_rightmost_leaf(ptr noundef captures(none) %0, ptr noundef nonnull writeonly captures(none) %1) unnamed_addr #10 {
  %3 = load ptr, ptr %0, align 4, !tbaa !89
  %4 = getelementptr inbounds nuw i8, ptr %3, i32 12
  %5 = load ptr, ptr %4, align 4, !tbaa !94
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %28

7:                                                ; preds = %2
  store ptr %3, ptr %1, align 4, !tbaa !89
  %8 = getelementptr inbounds nuw i8, ptr %3, i32 8
  %9 = load ptr, ptr %8, align 4, !tbaa !93
  %10 = icmp eq ptr %9, null
  br i1 %10, label %23, label %11

11:                                               ; preds = %7
  %12 = getelementptr inbounds nuw i8, ptr %3, i32 4
  %13 = load i8, ptr %12, align 4, !tbaa !95
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %15, label %20

15:                                               ; preds = %11
  %16 = getelementptr inbounds nuw i8, ptr %9, i32 4
  %17 = load i8, ptr %16, align 4, !tbaa !95
  %18 = icmp eq i8 %17, 0
  %19 = zext i1 %18 to i32
  br label %20

20:                                               ; preds = %15, %11
  %21 = phi i32 [ 0, %11 ], [ %19, %15 ]
  %22 = getelementptr inbounds nuw i8, ptr %9, i32 4
  store i8 0, ptr %22, align 4, !tbaa !95
  store ptr %9, ptr %0, align 4, !tbaa !89
  br label %33

23:                                               ; preds = %7
  store ptr null, ptr %0, align 4, !tbaa !89
  %24 = getelementptr inbounds nuw i8, ptr %3, i32 4
  %25 = load i8, ptr %24, align 4, !tbaa !95
  %26 = icmp eq i8 %25, 0
  %27 = zext i1 %26 to i32
  br label %33

28:                                               ; preds = %2
  %29 = tail call fastcc i32 @sglib___rbtree_delete_rightmost_leaf(ptr noundef nonnull %4, ptr noundef %1) #16
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %33, label %31

31:                                               ; preds = %28
  %32 = tail call fastcc i32 @sglib___rbtree_fix_right_deletion_discrepancy(ptr noundef nonnull %0) #16
  br label %33

33:                                               ; preds = %28, %31, %20, %23
  %34 = phi i32 [ %21, %20 ], [ %27, %23 ], [ %32, %31 ], [ 0, %28 ]
  ret i32 %34
}

; Function Attrs: nofree nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @sglib_rbtree_add(ptr noundef captures(none) %0, ptr noundef initializes((8, 16)) %1) local_unnamed_addr #10 {
  %3 = getelementptr inbounds nuw i8, ptr %1, i32 12
  store ptr null, ptr %3, align 4, !tbaa !94
  %4 = getelementptr inbounds nuw i8, ptr %1, i32 8
  store ptr null, ptr %4, align 4, !tbaa !93
  tail call fastcc void @sglib___rbtree_add_recursive(ptr noundef %0, ptr noundef %1) #16
  %5 = load ptr, ptr %0, align 4, !tbaa !89
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 4
  store i8 0, ptr %6, align 4, !tbaa !95
  ret void
}

; Function Attrs: nofree nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define internal fastcc void @sglib___rbtree_add_recursive(ptr noundef captures(none) %0, ptr noundef %1) unnamed_addr #10 {
  %3 = load ptr, ptr %0, align 4, !tbaa !89
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %2
  %6 = getelementptr inbounds nuw i8, ptr %1, i32 4
  store i8 1, ptr %6, align 4, !tbaa !95
  store ptr %1, ptr %0, align 4, !tbaa !89
  br label %151

7:                                                ; preds = %2
  %8 = load i32, ptr %1, align 4, !tbaa !91
  %9 = load i32, ptr %3, align 4, !tbaa !91
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %15, label %11

11:                                               ; preds = %7
  %12 = icmp eq i32 %8, %9
  %13 = icmp ult ptr %1, %3
  %14 = and i1 %13, %12
  br i1 %14, label %15, label %83

15:                                               ; preds = %11, %7
  %16 = getelementptr inbounds nuw i8, ptr %3, i32 8
  tail call fastcc void @sglib___rbtree_add_recursive(ptr noundef nonnull %16, ptr noundef nonnull %1) #16
  %17 = getelementptr inbounds nuw i8, ptr %3, i32 4
  %18 = load i8, ptr %17, align 4, !tbaa !95
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %20, label %151

20:                                               ; preds = %15
  %21 = load ptr, ptr %0, align 4, !tbaa !89
  %22 = getelementptr inbounds nuw i8, ptr %21, i32 8
  %23 = load ptr, ptr %22, align 4, !tbaa !93
  %24 = getelementptr inbounds nuw i8, ptr %21, i32 12
  %25 = load ptr, ptr %24, align 4, !tbaa !94
  %26 = icmp eq ptr %25, null
  br i1 %26, label %53, label %27

27:                                               ; preds = %20
  %28 = getelementptr inbounds nuw i8, ptr %25, i32 4
  %29 = load i8, ptr %28, align 4, !tbaa !95
  %30 = icmp eq i8 %29, 1
  br i1 %30, label %31, label %53

31:                                               ; preds = %27
  %32 = getelementptr inbounds nuw i8, ptr %23, i32 4
  %33 = load i8, ptr %32, align 4, !tbaa !95
  %34 = icmp eq i8 %33, 1
  br i1 %34, label %35, label %151

35:                                               ; preds = %31
  %36 = getelementptr inbounds nuw i8, ptr %23, i32 8
  %37 = load ptr, ptr %36, align 4, !tbaa !93
  %38 = icmp eq ptr %37, null
  br i1 %38, label %43, label %39

39:                                               ; preds = %35
  %40 = getelementptr inbounds nuw i8, ptr %37, i32 4
  %41 = load i8, ptr %40, align 4, !tbaa !95
  %42 = icmp eq i8 %41, 1
  br i1 %42, label %51, label %43

43:                                               ; preds = %39, %35
  %44 = getelementptr inbounds nuw i8, ptr %23, i32 12
  %45 = load ptr, ptr %44, align 4, !tbaa !94
  %46 = icmp eq ptr %45, null
  br i1 %46, label %151, label %47

47:                                               ; preds = %43
  %48 = getelementptr inbounds nuw i8, ptr %45, i32 4
  %49 = load i8, ptr %48, align 4, !tbaa !95
  %50 = icmp eq i8 %49, 1
  br i1 %50, label %51, label %151

51:                                               ; preds = %47, %39
  store i8 0, ptr %32, align 4, !tbaa !95
  store i8 0, ptr %28, align 4, !tbaa !95
  %52 = getelementptr inbounds nuw i8, ptr %21, i32 4
  store i8 1, ptr %52, align 4, !tbaa !95
  br label %151

53:                                               ; preds = %27, %20
  %54 = getelementptr inbounds nuw i8, ptr %23, i32 4
  %55 = load i8, ptr %54, align 4, !tbaa !95
  %56 = icmp eq i8 %55, 1
  br i1 %56, label %57, label %151

57:                                               ; preds = %53
  %58 = getelementptr inbounds nuw i8, ptr %23, i32 8
  %59 = load ptr, ptr %58, align 4, !tbaa !93
  %60 = icmp eq ptr %59, null
  br i1 %60, label %69, label %61

61:                                               ; preds = %57
  %62 = getelementptr inbounds nuw i8, ptr %59, i32 4
  %63 = load i8, ptr %62, align 4, !tbaa !95
  %64 = icmp eq i8 %63, 1
  br i1 %64, label %65, label %69

65:                                               ; preds = %61
  %66 = getelementptr inbounds nuw i8, ptr %23, i32 12
  %67 = load ptr, ptr %66, align 4, !tbaa !94
  store ptr %67, ptr %22, align 4, !tbaa !93
  store ptr %59, ptr %58, align 4, !tbaa !93
  store ptr %21, ptr %66, align 4, !tbaa !94
  %68 = getelementptr inbounds nuw i8, ptr %21, i32 4
  store i8 1, ptr %68, align 4, !tbaa !95
  store i8 0, ptr %54, align 4, !tbaa !95
  store ptr %23, ptr %0, align 4, !tbaa !89
  br label %151

69:                                               ; preds = %61, %57
  %70 = getelementptr inbounds nuw i8, ptr %23, i32 12
  %71 = load ptr, ptr %70, align 4, !tbaa !94
  %72 = icmp eq ptr %71, null
  br i1 %72, label %151, label %73

73:                                               ; preds = %69
  %74 = getelementptr inbounds nuw i8, ptr %71, i32 4
  %75 = load i8, ptr %74, align 4, !tbaa !95
  %76 = icmp eq i8 %75, 1
  br i1 %76, label %77, label %151

77:                                               ; preds = %73
  %78 = getelementptr inbounds nuw i8, ptr %71, i32 8
  %79 = load ptr, ptr %78, align 4, !tbaa !93
  %80 = getelementptr inbounds nuw i8, ptr %71, i32 12
  %81 = load ptr, ptr %80, align 4, !tbaa !94
  store ptr %79, ptr %70, align 4, !tbaa !94
  store ptr %81, ptr %22, align 4, !tbaa !93
  store ptr %23, ptr %78, align 4, !tbaa !93
  store ptr %21, ptr %80, align 4, !tbaa !94
  store i8 0, ptr %74, align 4, !tbaa !95
  %82 = getelementptr inbounds nuw i8, ptr %21, i32 4
  store i8 1, ptr %82, align 4, !tbaa !95
  store ptr %71, ptr %0, align 4, !tbaa !89
  br label %151

83:                                               ; preds = %11
  %84 = getelementptr inbounds nuw i8, ptr %3, i32 12
  tail call fastcc void @sglib___rbtree_add_recursive(ptr noundef nonnull %84, ptr noundef nonnull %1) #16
  %85 = getelementptr inbounds nuw i8, ptr %3, i32 4
  %86 = load i8, ptr %85, align 4, !tbaa !95
  %87 = icmp eq i8 %86, 0
  br i1 %87, label %88, label %151

88:                                               ; preds = %83
  %89 = load ptr, ptr %0, align 4, !tbaa !89
  %90 = getelementptr inbounds nuw i8, ptr %89, i32 12
  %91 = load ptr, ptr %90, align 4, !tbaa !94
  %92 = getelementptr inbounds nuw i8, ptr %89, i32 8
  %93 = load ptr, ptr %92, align 4, !tbaa !93
  %94 = icmp eq ptr %93, null
  br i1 %94, label %121, label %95

95:                                               ; preds = %88
  %96 = getelementptr inbounds nuw i8, ptr %93, i32 4
  %97 = load i8, ptr %96, align 4, !tbaa !95
  %98 = icmp eq i8 %97, 1
  br i1 %98, label %99, label %121

99:                                               ; preds = %95
  %100 = getelementptr inbounds nuw i8, ptr %91, i32 4
  %101 = load i8, ptr %100, align 4, !tbaa !95
  %102 = icmp eq i8 %101, 1
  br i1 %102, label %103, label %151

103:                                              ; preds = %99
  %104 = getelementptr inbounds nuw i8, ptr %91, i32 12
  %105 = load ptr, ptr %104, align 4, !tbaa !94
  %106 = icmp eq ptr %105, null
  br i1 %106, label %111, label %107

107:                                              ; preds = %103
  %108 = getelementptr inbounds nuw i8, ptr %105, i32 4
  %109 = load i8, ptr %108, align 4, !tbaa !95
  %110 = icmp eq i8 %109, 1
  br i1 %110, label %119, label %111

111:                                              ; preds = %107, %103
  %112 = getelementptr inbounds nuw i8, ptr %91, i32 8
  %113 = load ptr, ptr %112, align 4, !tbaa !93
  %114 = icmp eq ptr %113, null
  br i1 %114, label %151, label %115

115:                                              ; preds = %111
  %116 = getelementptr inbounds nuw i8, ptr %113, i32 4
  %117 = load i8, ptr %116, align 4, !tbaa !95
  %118 = icmp eq i8 %117, 1
  br i1 %118, label %119, label %151

119:                                              ; preds = %115, %107
  store i8 0, ptr %100, align 4, !tbaa !95
  store i8 0, ptr %96, align 4, !tbaa !95
  %120 = getelementptr inbounds nuw i8, ptr %89, i32 4
  store i8 1, ptr %120, align 4, !tbaa !95
  br label %151

121:                                              ; preds = %95, %88
  %122 = getelementptr inbounds nuw i8, ptr %91, i32 4
  %123 = load i8, ptr %122, align 4, !tbaa !95
  %124 = icmp eq i8 %123, 1
  br i1 %124, label %125, label %151

125:                                              ; preds = %121
  %126 = getelementptr inbounds nuw i8, ptr %91, i32 12
  %127 = load ptr, ptr %126, align 4, !tbaa !94
  %128 = icmp eq ptr %127, null
  br i1 %128, label %137, label %129

129:                                              ; preds = %125
  %130 = getelementptr inbounds nuw i8, ptr %127, i32 4
  %131 = load i8, ptr %130, align 4, !tbaa !95
  %132 = icmp eq i8 %131, 1
  br i1 %132, label %133, label %137

133:                                              ; preds = %129
  %134 = getelementptr inbounds nuw i8, ptr %91, i32 8
  %135 = load ptr, ptr %134, align 4, !tbaa !93
  store ptr %135, ptr %90, align 4, !tbaa !94
  store ptr %127, ptr %126, align 4, !tbaa !94
  store ptr %89, ptr %134, align 4, !tbaa !93
  %136 = getelementptr inbounds nuw i8, ptr %89, i32 4
  store i8 1, ptr %136, align 4, !tbaa !95
  store i8 0, ptr %122, align 4, !tbaa !95
  store ptr %91, ptr %0, align 4, !tbaa !89
  br label %151

137:                                              ; preds = %129, %125
  %138 = getelementptr inbounds nuw i8, ptr %91, i32 8
  %139 = load ptr, ptr %138, align 4, !tbaa !93
  %140 = icmp eq ptr %139, null
  br i1 %140, label %151, label %141

141:                                              ; preds = %137
  %142 = getelementptr inbounds nuw i8, ptr %139, i32 4
  %143 = load i8, ptr %142, align 4, !tbaa !95
  %144 = icmp eq i8 %143, 1
  br i1 %144, label %145, label %151

145:                                              ; preds = %141
  %146 = getelementptr inbounds nuw i8, ptr %139, i32 12
  %147 = load ptr, ptr %146, align 4, !tbaa !94
  %148 = getelementptr inbounds nuw i8, ptr %139, i32 8
  %149 = load ptr, ptr %148, align 4, !tbaa !93
  store ptr %147, ptr %138, align 4, !tbaa !93
  store ptr %149, ptr %90, align 4, !tbaa !94
  store ptr %91, ptr %146, align 4, !tbaa !94
  store ptr %89, ptr %148, align 4, !tbaa !93
  store i8 0, ptr %142, align 4, !tbaa !95
  %150 = getelementptr inbounds nuw i8, ptr %89, i32 4
  store i8 1, ptr %150, align 4, !tbaa !95
  store ptr %139, ptr %0, align 4, !tbaa !89
  br label %151

151:                                              ; preds = %145, %141, %137, %133, %121, %119, %115, %111, %99, %77, %73, %69, %65, %53, %51, %47, %43, %31, %15, %83, %5
  ret void
}

; Function Attrs: nofree nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @sglib_rbtree_delete(ptr noundef captures(none) %0, ptr noundef %1) local_unnamed_addr #10 {
  %3 = tail call i32 @sglib___rbtree_delete_recursive(ptr noundef %0, ptr noundef %1) #16
  %4 = load ptr, ptr %0, align 4, !tbaa !89
  %5 = icmp eq ptr %4, null
  br i1 %5, label %8, label %6

6:                                                ; preds = %2
  %7 = getelementptr inbounds nuw i8, ptr %4, i32 4
  store i8 0, ptr %7, align 4, !tbaa !95
  br label %8

8:                                                ; preds = %6, %2
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef ptr @sglib_rbtree_find_member(ptr noundef readonly captures(address_is_null, ret: address, provenance) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #4 {
  %3 = icmp eq ptr %0, null
  br i1 %3, label %17, label %4

4:                                                ; preds = %2
  %5 = load i32, ptr %1, align 4, !tbaa !91
  br label %6

6:                                                ; preds = %4, %12
  %7 = phi ptr [ %0, %4 ], [ %15, %12 ]
  %8 = load i32, ptr %7, align 4, !tbaa !91
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %12, label %10

10:                                               ; preds = %6
  %11 = icmp eq i32 %5, %8
  br i1 %11, label %17, label %12

12:                                               ; preds = %10, %6
  %13 = phi i32 [ 8, %6 ], [ 12, %10 ]
  %14 = getelementptr inbounds nuw i8, ptr %7, i32 %13
  %15 = load ptr, ptr %14, align 4, !tbaa !89
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %6, !llvm.loop !96

17:                                               ; preds = %12, %10, %2
  %18 = phi ptr [ null, %2 ], [ %7, %10 ], [ null, %12 ]
  ret ptr %18
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @sglib_rbtree_is_member(ptr noundef readonly captures(address) %0, ptr noundef readonly captures(address) %1) local_unnamed_addr #4 {
  %3 = icmp eq ptr %0, null
  br i1 %3, label %23, label %4

4:                                                ; preds = %2
  %5 = load i32, ptr %1, align 4, !tbaa !91
  br label %6

6:                                                ; preds = %4, %18
  %7 = phi ptr [ %0, %4 ], [ %21, %18 ]
  %8 = load i32, ptr %7, align 4, !tbaa !91
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %18, label %10

10:                                               ; preds = %6
  %11 = icmp eq i32 %5, %8
  %12 = icmp ult ptr %1, %7
  %13 = and i1 %12, %11
  br i1 %13, label %18, label %14

14:                                               ; preds = %10
  %15 = icmp ne i32 %5, %8
  %16 = icmp ugt ptr %1, %7
  %17 = or i1 %16, %15
  br i1 %17, label %18, label %23

18:                                               ; preds = %14, %6, %10
  %19 = phi i32 [ 8, %6 ], [ 8, %10 ], [ 12, %14 ]
  %20 = getelementptr inbounds nuw i8, ptr %7, i32 %19
  %21 = load ptr, ptr %20, align 4, !tbaa !89
  %22 = icmp eq ptr %21, null
  br i1 %22, label %23, label %6, !llvm.loop !97

23:                                               ; preds = %14, %18, %2
  %24 = phi i32 [ 0, %2 ], [ 0, %18 ], [ 1, %14 ]
  ret i32 %24
}

; Function Attrs: nofree nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @sglib_rbtree_delete_if_member(ptr noundef captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef writeonly captures(none) %2) local_unnamed_addr #10 {
  %4 = load ptr, ptr %0, align 4, !tbaa !89
  %5 = icmp eq ptr %4, null
  br i1 %5, label %19, label %6

6:                                                ; preds = %3
  %7 = load i32, ptr %1, align 4, !tbaa !91
  br label %8

8:                                                ; preds = %14, %6
  %9 = phi ptr [ %4, %6 ], [ %17, %14 ]
  %10 = load i32, ptr %9, align 4, !tbaa !91
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %14, label %12

12:                                               ; preds = %8
  %13 = icmp eq i32 %7, %10
  br i1 %13, label %20, label %14

14:                                               ; preds = %12, %8
  %15 = phi i32 [ 8, %8 ], [ 12, %12 ]
  %16 = getelementptr inbounds nuw i8, ptr %9, i32 %15
  %17 = load ptr, ptr %16, align 4, !tbaa !89
  %18 = icmp eq ptr %17, null
  br i1 %18, label %19, label %8, !llvm.loop !96

19:                                               ; preds = %14, %3
  store ptr null, ptr %2, align 4, !tbaa !89
  br label %26

20:                                               ; preds = %12
  store ptr %9, ptr %2, align 4, !tbaa !89
  %21 = tail call i32 @sglib___rbtree_delete_recursive(ptr noundef nonnull %0, ptr noundef nonnull %9) #16
  %22 = load ptr, ptr %0, align 4, !tbaa !89
  %23 = icmp eq ptr %22, null
  br i1 %23, label %26, label %24

24:                                               ; preds = %20
  %25 = getelementptr inbounds nuw i8, ptr %22, i32 4
  store i8 0, ptr %25, align 4, !tbaa !95
  br label %26

26:                                               ; preds = %24, %20, %19
  %27 = phi i32 [ 0, %19 ], [ 1, %20 ], [ 1, %24 ]
  ret i32 %27
}

; Function Attrs: nofree nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @sglib_rbtree_add_if_not_member(ptr noundef captures(none) %0, ptr noundef %1, ptr noundef writeonly captures(none) %2) local_unnamed_addr #10 {
  %4 = load ptr, ptr %0, align 4, !tbaa !89
  %5 = icmp eq ptr %4, null
  br i1 %5, label %20, label %6

6:                                                ; preds = %3
  %7 = load i32, ptr %1, align 4, !tbaa !91
  br label %8

8:                                                ; preds = %14, %6
  %9 = phi ptr [ %4, %6 ], [ %17, %14 ]
  %10 = load i32, ptr %9, align 4, !tbaa !91
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %14, label %12

12:                                               ; preds = %8
  %13 = icmp eq i32 %7, %10
  br i1 %13, label %19, label %14

14:                                               ; preds = %12, %8
  %15 = phi i32 [ 8, %8 ], [ 12, %12 ]
  %16 = getelementptr inbounds nuw i8, ptr %9, i32 %15
  %17 = load ptr, ptr %16, align 4, !tbaa !89
  %18 = icmp eq ptr %17, null
  br i1 %18, label %20, label %8, !llvm.loop !96

19:                                               ; preds = %12
  store ptr %9, ptr %2, align 4, !tbaa !89
  br label %25

20:                                               ; preds = %14, %3
  store ptr null, ptr %2, align 4, !tbaa !89
  %21 = getelementptr inbounds nuw i8, ptr %1, i32 12
  store ptr null, ptr %21, align 4, !tbaa !94
  %22 = getelementptr inbounds nuw i8, ptr %1, i32 8
  store ptr null, ptr %22, align 4, !tbaa !93
  tail call fastcc void @sglib___rbtree_add_recursive(ptr noundef nonnull %0, ptr noundef %1) #16
  %23 = load ptr, ptr %0, align 4, !tbaa !89
  %24 = getelementptr inbounds nuw i8, ptr %23, i32 4
  store i8 0, ptr %24, align 4, !tbaa !95
  br label %25

25:                                               ; preds = %19, %20
  %26 = phi i32 [ 1, %20 ], [ 0, %19 ]
  ret i32 %26
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local i32 @sglib_rbtree_len(ptr noundef readonly captures(address_is_null) %0) local_unnamed_addr #4 {
  %2 = alloca [128 x ptr], align 4
  %3 = alloca [128 x i8], align 1
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #17
  %4 = icmp eq ptr %0, null
  br i1 %4, label %38, label %5

5:                                                ; preds = %1, %35
  %6 = phi i32 [ %28, %35 ], [ 0, %1 ]
  %7 = phi i32 [ %21, %35 ], [ 0, %1 ]
  %8 = phi ptr [ %32, %35 ], [ %0, %1 ]
  br label %9

9:                                                ; preds = %5, %9
  %10 = phi i32 [ %7, %5 ], [ %18, %9 ]
  %11 = phi ptr [ %8, %5 ], [ %17, %9 ]
  %12 = getelementptr inbounds nuw i8, ptr %11, i32 12
  %13 = load ptr, ptr %12, align 4, !tbaa !94
  %14 = getelementptr inbounds ptr, ptr %2, i32 %10
  store ptr %13, ptr %14, align 4, !tbaa !89
  %15 = getelementptr inbounds i8, ptr %3, i32 %10
  store i8 0, ptr %15, align 1, !tbaa !98
  %16 = getelementptr inbounds nuw i8, ptr %11, i32 8
  %17 = load ptr, ptr %16, align 4, !tbaa !93
  %18 = add nsw i32 %10, 1
  %19 = icmp eq ptr %17, null
  br i1 %19, label %20, label %9, !llvm.loop !99

20:                                               ; preds = %9, %20
  %21 = phi i32 [ %23, %20 ], [ %18, %9 ]
  %22 = phi i32 [ %28, %20 ], [ %6, %9 ]
  %23 = add nsw i32 %21, -1
  %24 = getelementptr inbounds i8, ptr %3, i32 %23
  %25 = load i8, ptr %24, align 1, !tbaa !98
  %26 = icmp eq i8 %25, 0
  %27 = zext i1 %26 to i32
  %28 = add nsw i32 %22, %27
  %29 = add i8 %25, 1
  store i8 %29, ptr %24, align 1, !tbaa !98
  %30 = icmp sgt i32 %21, 1
  %31 = getelementptr inbounds ptr, ptr %2, i32 %23
  %32 = load ptr, ptr %31, align 4, !tbaa !89
  %33 = icmp eq ptr %32, null
  %34 = select i1 %30, i1 %33, i1 false
  br i1 %34, label %20, label %35, !llvm.loop !100

35:                                               ; preds = %20
  %36 = getelementptr inbounds ptr, ptr %2, i32 %23
  store ptr null, ptr %36, align 4, !tbaa !89
  %37 = icmp eq ptr %32, null
  br i1 %37, label %38, label %5, !llvm.loop !101

38:                                               ; preds = %35, %1
  %39 = phi i32 [ 0, %1 ], [ %28, %35 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #17
  ret i32 %39
}

; Function Attrs: nounwind
define dso_local void @sglib__rbtree_it_compute_current_elem(ptr noundef captures(none) initializes((0, 4)) %0) local_unnamed_addr #5 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i32 648
  %3 = load ptr, ptr %2, align 4, !tbaa !102
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 652
  %5 = load ptr, ptr %4, align 4, !tbaa !105
  store ptr null, ptr %0, align 4, !tbaa !106
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 644
  %7 = load i16, ptr %6, align 4, !tbaa !107
  %8 = icmp sgt i16 %7, 0
  br i1 %8, label %9, label %90

9:                                                ; preds = %1
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %11 = getelementptr inbounds nuw i8, ptr %0, i32 132
  %12 = icmp eq ptr %3, null
  %13 = icmp eq ptr %5, null
  %14 = getelementptr inbounds nuw i8, ptr %0, i32 646
  %15 = load ptr, ptr %0, align 4, !tbaa !106
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %90

17:                                               ; preds = %9, %87
  %18 = phi i16 [ %73, %87 ], [ %7, %9 ]
  %19 = zext i16 %18 to i32
  %20 = add nsw i32 %19, -1
  %21 = getelementptr inbounds nuw i8, ptr %10, i32 %20
  %22 = load i8, ptr %21, align 1, !tbaa !98
  %23 = icmp ugt i8 %22, 1
  br i1 %23, label %24, label %26

24:                                               ; preds = %17
  %25 = add nsw i16 %18, -1
  store i16 %25, ptr %6, align 4, !tbaa !107
  br label %72

26:                                               ; preds = %17
  %27 = icmp eq i8 %22, 0
  %28 = getelementptr inbounds nuw ptr, ptr %11, i32 %20
  %29 = load ptr, ptr %28, align 4, !tbaa !89
  %30 = select i1 %27, i32 8, i32 12
  %31 = getelementptr inbounds nuw i8, ptr %29, i32 %30
  %32 = load ptr, ptr %31, align 4, !tbaa !89
  %33 = icmp eq ptr %32, null
  br i1 %12, label %61, label %34

34:                                               ; preds = %26
  br i1 %13, label %36, label %35

35:                                               ; preds = %34
  br i1 %33, label %68, label %50

36:                                               ; preds = %34
  br i1 %33, label %68, label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %3, align 4, !tbaa !91
  br label %39

39:                                               ; preds = %37, %45
  %40 = phi ptr [ %32, %37 ], [ %48, %45 ]
  %41 = load i32, ptr %40, align 4, !tbaa !91
  %42 = icmp slt i32 %38, %41
  br i1 %42, label %45, label %43

43:                                               ; preds = %39
  %44 = icmp eq i32 %38, %41
  br i1 %44, label %62, label %45

45:                                               ; preds = %43, %39
  %46 = phi i32 [ 8, %39 ], [ 12, %43 ]
  %47 = getelementptr inbounds nuw i8, ptr %40, i32 %46
  %48 = load ptr, ptr %47, align 4, !tbaa !89
  %49 = icmp eq ptr %48, null
  br i1 %49, label %68, label %39, !llvm.loop !108

50:                                               ; preds = %35, %56
  %51 = phi ptr [ %59, %56 ], [ %32, %35 ]
  %52 = tail call i32 %5(ptr noundef nonnull %3, ptr noundef nonnull %51) #15
  %53 = icmp slt i32 %52, 0
  br i1 %53, label %56, label %54

54:                                               ; preds = %50
  %55 = icmp eq i32 %52, 0
  br i1 %55, label %62, label %56

56:                                               ; preds = %54, %50
  %57 = phi i32 [ 8, %50 ], [ 12, %54 ]
  %58 = getelementptr inbounds nuw i8, ptr %51, i32 %57
  %59 = load ptr, ptr %58, align 4, !tbaa !89
  %60 = icmp eq ptr %59, null
  br i1 %60, label %68, label %50, !llvm.loop !109

61:                                               ; preds = %26
  br i1 %33, label %68, label %62

62:                                               ; preds = %54, %43, %61
  %63 = phi ptr [ %32, %61 ], [ %40, %43 ], [ %51, %54 ]
  %64 = getelementptr inbounds nuw ptr, ptr %11, i32 %19
  store ptr %63, ptr %64, align 4, !tbaa !89
  %65 = getelementptr inbounds nuw i8, ptr %10, i32 %19
  store i8 0, ptr %65, align 1, !tbaa !98
  %66 = load i16, ptr %6, align 4, !tbaa !107
  %67 = add i16 %66, 1
  store i16 %67, ptr %6, align 4, !tbaa !107
  br label %68

68:                                               ; preds = %56, %45, %35, %36, %62, %61
  %69 = load i8, ptr %21, align 1, !tbaa !98
  %70 = add i8 %69, 1
  store i8 %70, ptr %21, align 1, !tbaa !98
  %71 = load i16, ptr %6, align 4, !tbaa !107
  br label %72

72:                                               ; preds = %24, %68
  %73 = phi i16 [ %25, %24 ], [ %71, %68 ]
  %74 = icmp sgt i16 %73, 0
  br i1 %74, label %75, label %90

75:                                               ; preds = %72
  %76 = zext nneg i16 %73 to i32
  %77 = load i16, ptr %14, align 2, !tbaa !110
  %78 = sext i16 %77 to i32
  %79 = add nsw i32 %76, -1
  %80 = getelementptr inbounds nuw i8, ptr %10, i32 %79
  %81 = load i8, ptr %80, align 1, !tbaa !98
  %82 = zext i8 %81 to i32
  %83 = icmp eq i32 %78, %82
  br i1 %83, label %84, label %87

84:                                               ; preds = %75
  %85 = getelementptr inbounds nuw ptr, ptr %11, i32 %79
  %86 = load ptr, ptr %85, align 4, !tbaa !89
  store ptr %86, ptr %0, align 4, !tbaa !106
  br label %87

87:                                               ; preds = %84, %75
  %88 = load ptr, ptr %0, align 4, !tbaa !106
  %89 = icmp eq ptr %88, null
  br i1 %89, label %17, label %90, !llvm.loop !111

90:                                               ; preds = %87, %72, %9, %1
  ret void
}

; Function Attrs: nounwind
define dso_local ptr @sglib__rbtree_it_init(ptr noundef captures(none) initializes((646, 656)) %0, ptr noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4) local_unnamed_addr #5 {
  %6 = trunc i32 %2 to i16
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 646
  store i16 %6, ptr %7, align 2, !tbaa !110
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 648
  store ptr %4, ptr %8, align 4, !tbaa !102
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 652
  store ptr %3, ptr %9, align 4, !tbaa !105
  %10 = icmp eq ptr %4, null
  br i1 %10, label %40, label %11

11:                                               ; preds = %5
  %12 = icmp eq ptr %3, null
  %13 = icmp eq ptr %1, null
  br i1 %12, label %15, label %14

14:                                               ; preds = %11
  br i1 %13, label %42, label %29

15:                                               ; preds = %11
  br i1 %13, label %42, label %16

16:                                               ; preds = %15
  %17 = load i32, ptr %4, align 4, !tbaa !91
  br label %18

18:                                               ; preds = %16, %24
  %19 = phi ptr [ %1, %16 ], [ %27, %24 ]
  %20 = load i32, ptr %19, align 4, !tbaa !91
  %21 = icmp slt i32 %17, %20
  br i1 %21, label %24, label %22

22:                                               ; preds = %18
  %23 = icmp eq i32 %17, %20
  br i1 %23, label %44, label %24

24:                                               ; preds = %22, %18
  %25 = phi i32 [ 8, %18 ], [ 12, %22 ]
  %26 = getelementptr inbounds nuw i8, ptr %19, i32 %25
  %27 = load ptr, ptr %26, align 4, !tbaa !89
  %28 = icmp eq ptr %27, null
  br i1 %28, label %42, label %18, !llvm.loop !112

29:                                               ; preds = %14, %35
  %30 = phi ptr [ %38, %35 ], [ %1, %14 ]
  %31 = tail call i32 %3(ptr noundef nonnull %4, ptr noundef nonnull %30) #15
  %32 = icmp slt i32 %31, 0
  br i1 %32, label %35, label %33

33:                                               ; preds = %29
  %34 = icmp eq i32 %31, 0
  br i1 %34, label %44, label %35

35:                                               ; preds = %33, %29
  %36 = phi i32 [ 8, %29 ], [ 12, %33 ]
  %37 = getelementptr inbounds nuw i8, ptr %30, i32 %36
  %38 = load ptr, ptr %37, align 4, !tbaa !89
  %39 = icmp eq ptr %38, null
  br i1 %39, label %42, label %29, !llvm.loop !113

40:                                               ; preds = %5
  %41 = icmp eq ptr %1, null
  br i1 %41, label %42, label %44

42:                                               ; preds = %35, %24, %14, %15, %40
  %43 = getelementptr inbounds nuw i8, ptr %0, i32 644
  store i16 0, ptr %43, align 4, !tbaa !107
  store ptr null, ptr %0, align 4, !tbaa !106
  br label %53

44:                                               ; preds = %33, %22, %40
  %45 = phi ptr [ %1, %40 ], [ %19, %22 ], [ %30, %33 ]
  %46 = getelementptr inbounds nuw i8, ptr %0, i32 644
  store i16 1, ptr %46, align 4, !tbaa !107
  %47 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i8 0, ptr %47, align 4, !tbaa !98
  %48 = getelementptr inbounds nuw i8, ptr %0, i32 132
  store ptr %45, ptr %48, align 4, !tbaa !89
  %49 = icmp eq i32 %2, 0
  br i1 %49, label %50, label %51

50:                                               ; preds = %44
  store ptr %45, ptr %0, align 4, !tbaa !106
  br label %53

51:                                               ; preds = %44
  tail call void @sglib__rbtree_it_compute_current_elem(ptr noundef nonnull %0) #16
  %52 = load ptr, ptr %0, align 4, !tbaa !106
  br label %53

53:                                               ; preds = %50, %51, %42
  %54 = phi ptr [ %45, %50 ], [ %52, %51 ], [ null, %42 ]
  ret ptr %54
}

; Function Attrs: nounwind
define dso_local ptr @sglib_rbtree_it_init(ptr noundef captures(none) initializes((0, 4), (644, 656)) %0, ptr noundef %1) local_unnamed_addr #5 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 646
  store i16 2, ptr %3, align 2, !tbaa !110
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 648
  store ptr null, ptr %4, align 4, !tbaa !102
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 652
  store ptr null, ptr %5, align 4, !tbaa !105
  %6 = icmp eq ptr %1, null
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 644
  br i1 %6, label %8, label %9

8:                                                ; preds = %2
  store i16 0, ptr %7, align 4, !tbaa !107
  store ptr null, ptr %0, align 4, !tbaa !106
  br label %13

9:                                                ; preds = %2
  store i16 1, ptr %7, align 4, !tbaa !107
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i8 0, ptr %10, align 4, !tbaa !98
  %11 = getelementptr inbounds nuw i8, ptr %0, i32 132
  store ptr %1, ptr %11, align 4, !tbaa !89
  tail call void @sglib__rbtree_it_compute_current_elem(ptr noundef nonnull %0) #16
  %12 = load ptr, ptr %0, align 4, !tbaa !106
  br label %13

13:                                               ; preds = %8, %9
  %14 = phi ptr [ null, %8 ], [ %12, %9 ]
  ret ptr %14
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local noundef ptr @sglib_rbtree_it_init_preorder(ptr noundef writeonly captures(none) initializes((0, 4), (644, 656)) %0, ptr noundef returned %1) local_unnamed_addr #9 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 646
  store i16 0, ptr %3, align 2, !tbaa !110
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 648
  store ptr null, ptr %4, align 4, !tbaa !102
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 652
  store ptr null, ptr %5, align 4, !tbaa !105
  %6 = icmp eq ptr %1, null
  br i1 %6, label %10, label %7

7:                                                ; preds = %2
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i8 0, ptr %8, align 4, !tbaa !98
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 132
  store ptr %1, ptr %9, align 4, !tbaa !89
  br label %10

10:                                               ; preds = %2, %7
  %11 = phi i16 [ 1, %7 ], [ 0, %2 ]
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 644
  store i16 %11, ptr %12, align 4, !tbaa !107
  store ptr %1, ptr %0, align 4, !tbaa !106
  ret ptr %1
}

; Function Attrs: nounwind
define dso_local ptr @sglib_rbtree_it_init_inorder(ptr noundef captures(none) initializes((0, 4), (644, 656)) %0, ptr noundef %1) local_unnamed_addr #5 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 646
  store i16 1, ptr %3, align 2, !tbaa !110
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 648
  store ptr null, ptr %4, align 4, !tbaa !102
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 652
  store ptr null, ptr %5, align 4, !tbaa !105
  %6 = icmp eq ptr %1, null
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 644
  br i1 %6, label %8, label %9

8:                                                ; preds = %2
  store i16 0, ptr %7, align 4, !tbaa !107
  store ptr null, ptr %0, align 4, !tbaa !106
  br label %13

9:                                                ; preds = %2
  store i16 1, ptr %7, align 4, !tbaa !107
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i8 0, ptr %10, align 4, !tbaa !98
  %11 = getelementptr inbounds nuw i8, ptr %0, i32 132
  store ptr %1, ptr %11, align 4, !tbaa !89
  tail call void @sglib__rbtree_it_compute_current_elem(ptr noundef nonnull %0) #16
  %12 = load ptr, ptr %0, align 4, !tbaa !106
  br label %13

13:                                               ; preds = %8, %9
  %14 = phi ptr [ null, %8 ], [ %12, %9 ]
  ret ptr %14
}

; Function Attrs: nounwind
define dso_local ptr @sglib_rbtree_it_init_postorder(ptr noundef captures(none) initializes((0, 4), (644, 656)) %0, ptr noundef %1) local_unnamed_addr #5 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 646
  store i16 2, ptr %3, align 2, !tbaa !110
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 648
  store ptr null, ptr %4, align 4, !tbaa !102
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 652
  store ptr null, ptr %5, align 4, !tbaa !105
  %6 = icmp eq ptr %1, null
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 644
  br i1 %6, label %8, label %9

8:                                                ; preds = %2
  store i16 0, ptr %7, align 4, !tbaa !107
  store ptr null, ptr %0, align 4, !tbaa !106
  br label %13

9:                                                ; preds = %2
  store i16 1, ptr %7, align 4, !tbaa !107
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i8 0, ptr %10, align 4, !tbaa !98
  %11 = getelementptr inbounds nuw i8, ptr %0, i32 132
  store ptr %1, ptr %11, align 4, !tbaa !89
  tail call void @sglib__rbtree_it_compute_current_elem(ptr noundef nonnull %0) #16
  %12 = load ptr, ptr %0, align 4, !tbaa !106
  br label %13

13:                                               ; preds = %8, %9
  %14 = phi ptr [ null, %8 ], [ %12, %9 ]
  ret ptr %14
}

; Function Attrs: nounwind
define dso_local ptr @sglib_rbtree_it_init_on_equal(ptr noundef captures(none) initializes((646, 656)) %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) local_unnamed_addr #5 {
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 646
  store i16 1, ptr %5, align 2, !tbaa !110
  %6 = getelementptr inbounds nuw i8, ptr %0, i32 648
  store ptr %3, ptr %6, align 4, !tbaa !102
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 652
  store ptr %2, ptr %7, align 4, !tbaa !105
  %8 = icmp eq ptr %3, null
  br i1 %8, label %38, label %9

9:                                                ; preds = %4
  %10 = icmp eq ptr %2, null
  %11 = icmp eq ptr %1, null
  br i1 %10, label %13, label %12

12:                                               ; preds = %9
  br i1 %11, label %40, label %27

13:                                               ; preds = %9
  br i1 %11, label %40, label %14

14:                                               ; preds = %13
  %15 = load i32, ptr %3, align 4, !tbaa !91
  br label %16

16:                                               ; preds = %22, %14
  %17 = phi ptr [ %1, %14 ], [ %25, %22 ]
  %18 = load i32, ptr %17, align 4, !tbaa !91
  %19 = icmp slt i32 %15, %18
  br i1 %19, label %22, label %20

20:                                               ; preds = %16
  %21 = icmp eq i32 %15, %18
  br i1 %21, label %42, label %22

22:                                               ; preds = %20, %16
  %23 = phi i32 [ 8, %16 ], [ 12, %20 ]
  %24 = getelementptr inbounds nuw i8, ptr %17, i32 %23
  %25 = load ptr, ptr %24, align 4, !tbaa !89
  %26 = icmp eq ptr %25, null
  br i1 %26, label %40, label %16, !llvm.loop !112

27:                                               ; preds = %12, %33
  %28 = phi ptr [ %36, %33 ], [ %1, %12 ]
  %29 = tail call i32 %2(ptr noundef nonnull %3, ptr noundef nonnull %28) #15
  %30 = icmp slt i32 %29, 0
  br i1 %30, label %33, label %31

31:                                               ; preds = %27
  %32 = icmp eq i32 %29, 0
  br i1 %32, label %42, label %33

33:                                               ; preds = %31, %27
  %34 = phi i32 [ 8, %27 ], [ 12, %31 ]
  %35 = getelementptr inbounds nuw i8, ptr %28, i32 %34
  %36 = load ptr, ptr %35, align 4, !tbaa !89
  %37 = icmp eq ptr %36, null
  br i1 %37, label %40, label %27, !llvm.loop !113

38:                                               ; preds = %4
  %39 = icmp eq ptr %1, null
  br i1 %39, label %40, label %42

40:                                               ; preds = %33, %22, %38, %13, %12
  %41 = getelementptr inbounds nuw i8, ptr %0, i32 644
  store i16 0, ptr %41, align 4, !tbaa !107
  store ptr null, ptr %0, align 4, !tbaa !106
  br label %48

42:                                               ; preds = %31, %20, %38
  %43 = phi ptr [ %1, %38 ], [ %17, %20 ], [ %28, %31 ]
  %44 = getelementptr inbounds nuw i8, ptr %0, i32 644
  store i16 1, ptr %44, align 4, !tbaa !107
  %45 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i8 0, ptr %45, align 4, !tbaa !98
  %46 = getelementptr inbounds nuw i8, ptr %0, i32 132
  store ptr %43, ptr %46, align 4, !tbaa !89
  tail call void @sglib__rbtree_it_compute_current_elem(ptr noundef nonnull %0) #16
  %47 = load ptr, ptr %0, align 4, !tbaa !106
  br label %48

48:                                               ; preds = %40, %42
  %49 = phi ptr [ null, %40 ], [ %47, %42 ]
  ret ptr %49
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define dso_local ptr @sglib_rbtree_it_current(ptr noundef readonly captures(none) %0) local_unnamed_addr #7 {
  %2 = load ptr, ptr %0, align 4, !tbaa !106
  ret ptr %2
}

; Function Attrs: nounwind
define dso_local ptr @sglib_rbtree_it_next(ptr noundef captures(none) initializes((0, 4)) %0) local_unnamed_addr #5 {
  tail call void @sglib__rbtree_it_compute_current_elem(ptr noundef %0) #16
  %2 = load ptr, ptr %0, align 4, !tbaa !106
  ret ptr %2
}

; Function Attrs: nofree nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @sglib___rbtree_consistency_check(ptr noundef readonly captures(address_is_null) %0) local_unnamed_addr #10 {
  %2 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #17
  store i32 -1, ptr %2, align 4, !tbaa !6
  call fastcc void @sglib___rbtree_consistency_check_recursive(ptr noundef %0, ptr noundef %2, i32 noundef 0) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #17
  ret void
}

; Function Attrs: nofree nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define internal fastcc void @sglib___rbtree_consistency_check_recursive(ptr noundef readonly captures(address_is_null) %0, ptr noundef nonnull %1, i32 noundef %2) unnamed_addr #10 {
  %4 = icmp eq ptr %0, null
  br i1 %4, label %8, label %5

5:                                                ; preds = %3, %24
  %6 = phi i32 [ %25, %24 ], [ %2, %3 ]
  %7 = phi ptr [ %26, %24 ], [ %0, %3 ]
  br label %13

8:                                                ; preds = %24, %21, %3
  %9 = phi i32 [ %6, %21 ], [ %2, %3 ], [ %25, %24 ]
  %10 = load i32, ptr %1, align 4, !tbaa !6
  %11 = icmp slt i32 %10, 0
  br i1 %11, label %12, label %28

12:                                               ; preds = %8
  store i32 %9, ptr %1, align 4, !tbaa !6
  br label %28

13:                                               ; preds = %5, %21
  %14 = phi ptr [ %7, %5 ], [ %22, %21 ]
  %15 = getelementptr inbounds nuw i8, ptr %14, i32 8
  %16 = load ptr, ptr %15, align 4, !tbaa !93
  %17 = getelementptr inbounds nuw i8, ptr %14, i32 12
  %18 = getelementptr inbounds nuw i8, ptr %14, i32 4
  %19 = load i8, ptr %18, align 4, !tbaa !95
  %20 = icmp eq i8 %19, 1
  br i1 %20, label %21, label %24

21:                                               ; preds = %13
  tail call fastcc void @sglib___rbtree_consistency_check_recursive(ptr noundef %16, ptr noundef %1, i32 noundef %6) #16
  %22 = load ptr, ptr %17, align 4, !tbaa !94
  %23 = icmp eq ptr %22, null
  br i1 %23, label %8, label %13

24:                                               ; preds = %13
  %25 = add nsw i32 %6, 1
  tail call fastcc void @sglib___rbtree_consistency_check_recursive(ptr noundef %16, ptr noundef %1, i32 noundef %25) #16
  %26 = load ptr, ptr %17, align 4, !tbaa !94
  %27 = icmp eq ptr %26, null
  br i1 %27, label %8, label %5

28:                                               ; preds = %12, %8
  ret void
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @verify_benchmark(i32 noundef %0) local_unnamed_addr #5 {
  %2 = load ptr, ptr @the_list, align 4, !tbaa !10
  %3 = icmp eq ptr %2, null
  br i1 %3, label %19, label %4

4:                                                ; preds = %1, %4
  %5 = phi ptr [ %7, %4 ], [ %2, %1 ]
  %6 = getelementptr inbounds nuw i8, ptr %5, i32 8
  %7 = load ptr, ptr %6, align 4, !tbaa !13
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %4, !llvm.loop !31

9:                                                ; preds = %4, %14
  %10 = phi ptr [ %17, %14 ], [ %5, %4 ]
  %11 = phi i32 [ %15, %14 ], [ 0, %4 ]
  %12 = load i32, ptr %10, align 4, !tbaa !16
  %13 = icmp eq i32 %12, %11
  br i1 %13, label %14, label %48

14:                                               ; preds = %9
  %15 = add nuw nsw i32 %11, 1
  %16 = getelementptr inbounds nuw i8, ptr %10, i32 4
  %17 = load ptr, ptr %16, align 4, !tbaa !15
  %18 = icmp eq ptr %17, null
  br i1 %18, label %19, label %9, !llvm.loop !114

19:                                               ; preds = %14, %1
  br label %23

20:                                               ; preds = %31
  %21 = add nuw nsw i32 %24, 1
  %22 = icmp eq i32 %21, 100
  br i1 %22, label %39, label %23, !llvm.loop !115

23:                                               ; preds = %19, %20
  %24 = phi i32 [ %21, %20 ], [ 0, %19 ]
  %25 = getelementptr inbounds nuw i32, ptr @array, i32 %24
  %26 = load i32, ptr %25, align 4, !tbaa !6
  %27 = urem i32 %26, 20
  %28 = getelementptr inbounds nuw ptr, ptr @htab, i32 %27
  %29 = load ptr, ptr %28, align 4, !tbaa !59
  %30 = icmp eq ptr %29, null
  br i1 %30, label %48, label %31

31:                                               ; preds = %23, %35
  %32 = phi ptr [ %37, %35 ], [ %29, %23 ]
  %33 = load i32, ptr %32, align 4, !tbaa !53
  %34 = icmp eq i32 %33, %26
  br i1 %34, label %20, label %35

35:                                               ; preds = %31
  %36 = getelementptr inbounds nuw i8, ptr %32, i32 4
  %37 = load ptr, ptr %36, align 4, !tbaa !56
  %38 = icmp eq ptr %37, null
  br i1 %38, label %48, label %31, !llvm.loop !58

39:                                               ; preds = %20
  %40 = icmp eq i32 %0, 15050
  br i1 %40, label %41, label %48

41:                                               ; preds = %39
  %42 = tail call i32 @check_heap_beebs(ptr noundef nonnull @heap) #15
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %48, label %44

44:                                               ; preds = %41
  %45 = tail call i32 @memcmp(ptr noundef nonnull @array2, ptr noundef nonnull @verify_benchmark.array_exp, i32 noundef 400) #15
  %46 = icmp eq i32 %45, 0
  %47 = zext i1 %46 to i32
  br label %48

48:                                               ; preds = %9, %23, %35, %39, %41, %44
  %49 = phi i32 [ %47, %44 ], [ 0, %35 ], [ 0, %23 ], [ 0, %41 ], [ 0, %39 ], [ 0, %9 ]
  ret i32 %49
}

declare dso_local i32 @check_heap_beebs(ptr noundef) local_unnamed_addr #11

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #11

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local void @initialise_benchmark() local_unnamed_addr #12 {
  ret void
}

; Function Attrs: nounwind
define dso_local void @warm_caches(i32 noundef %0) local_unnamed_addr #5 {
  %2 = tail call fastcc i32 @benchmark_body(i32 noundef %0) #16
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc i32 @benchmark_body(i32 noundef %0) unnamed_addr #13 {
  %2 = alloca i32, align 4
  %3 = alloca [101 x i32], align 4
  %4 = alloca ptr, align 4
  %5 = alloca %struct.sglib_rbtree_iterator, align 4
  %6 = alloca [64 x i32], align 4
  %7 = alloca [64 x i32], align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %9, label %394

9:                                                ; preds = %1
  %10 = getelementptr inbounds nuw i8, ptr %5, i32 646
  %11 = getelementptr inbounds nuw i8, ptr %5, i32 648
  %12 = getelementptr inbounds nuw i8, ptr %5, i32 652
  %13 = getelementptr inbounds nuw i8, ptr %5, i32 644
  %14 = getelementptr inbounds nuw i8, ptr %5, i32 4
  %15 = getelementptr inbounds nuw i8, ptr %5, i32 132
  br label %16

16:                                               ; preds = %9, %391
  %17 = phi i32 [ 0, %9 ], [ %392, %391 ]
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #17
  %18 = tail call ptr @memcpy(ptr noundef nonnull @array2, ptr noundef nonnull @array, i32 noundef 400) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %7) #17
  store i32 0, ptr %6, align 4, !tbaa !6
  store i32 100, ptr %7, align 4, !tbaa !6
  br label %19

19:                                               ; preds = %16, %125
  %20 = phi i32 [ 1, %16 ], [ %112, %125 ]
  %21 = add nsw i32 %20, -1
  %22 = getelementptr inbounds nuw i32, ptr %6, i32 %21
  %23 = load i32, ptr %22, align 4, !tbaa !6
  %24 = getelementptr inbounds nuw i32, ptr %7, i32 %21
  %25 = load i32, ptr %24, align 4, !tbaa !6
  %26 = sub nsw i32 %25, %23
  %27 = icmp sgt i32 %26, 2
  br i1 %27, label %28, label %111

28:                                               ; preds = %19, %105
  %29 = phi i32 [ %108, %105 ], [ %25, %19 ]
  %30 = phi i32 [ %107, %105 ], [ %23, %19 ]
  %31 = phi i32 [ %106, %105 ], [ %21, %19 ]
  %32 = add nsw i32 %30, 1
  %33 = add nsw i32 %29, -1
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %82

35:                                               ; preds = %28
  %36 = getelementptr inbounds i32, ptr @array2, i32 %30
  br label %37

37:                                               ; preds = %35, %74
  %38 = phi i32 [ %32, %35 ], [ %76, %74 ]
  %39 = phi i32 [ %33, %35 ], [ %75, %74 ]
  %40 = load i32, ptr %36, align 4, !tbaa !6
  %41 = tail call i32 @llvm.smax.i32(i32 %38, i32 %39)
  %42 = add i32 %38, -1
  br label %43

43:                                               ; preds = %37, %51
  %44 = phi i32 [ %42, %37 ], [ %54, %51 ]
  %45 = phi i32 [ %38, %37 ], [ %52, %51 ]
  %46 = getelementptr inbounds i32, ptr @array2, i32 %45
  %47 = load i32, ptr %46, align 4, !tbaa !6
  %48 = icmp sgt i32 %47, %40
  br i1 %48, label %49, label %51

49:                                               ; preds = %43
  %50 = icmp sgt i32 %45, %39
  br i1 %50, label %78, label %55

51:                                               ; preds = %43
  %52 = add i32 %45, 1
  %53 = icmp eq i32 %45, %41
  %54 = add i32 %44, 1
  br i1 %53, label %78, label %43, !llvm.loop !116

55:                                               ; preds = %49, %60
  %56 = phi i32 [ %61, %60 ], [ %39, %49 ]
  %57 = getelementptr inbounds i32, ptr @array2, i32 %56
  %58 = load i32, ptr %57, align 4, !tbaa !6
  %59 = icmp slt i32 %58, %40
  br i1 %59, label %63, label %60

60:                                               ; preds = %55
  %61 = add nsw i32 %56, -1
  %62 = icmp slt i32 %45, %56
  br i1 %62, label %55, label %78, !llvm.loop !117

63:                                               ; preds = %55
  %64 = icmp slt i32 %45, %56
  br i1 %64, label %65, label %74

65:                                               ; preds = %63
  store i32 %58, ptr %46, align 4, !tbaa !6
  store i32 %47, ptr %57, align 4, !tbaa !6
  %66 = add nsw i32 %45, 2
  %67 = icmp slt i32 %66, %56
  %68 = add nsw i32 %45, 1
  br i1 %67, label %69, label %71

69:                                               ; preds = %65
  %70 = add nsw i32 %56, -1
  br label %74

71:                                               ; preds = %65
  %72 = icmp slt i32 %68, %56
  %73 = select i1 %72, i32 %68, i32 %45
  br label %74

74:                                               ; preds = %71, %69, %63
  %75 = phi i32 [ %56, %63 ], [ %56, %71 ], [ %70, %69 ]
  %76 = phi i32 [ %45, %63 ], [ %73, %71 ], [ %68, %69 ]
  %77 = icmp slt i32 %76, %75
  br i1 %77, label %37, label %82, !llvm.loop !118

78:                                               ; preds = %49, %51, %60
  %79 = phi i32 [ %39, %51 ], [ %44, %60 ], [ %39, %49 ]
  %80 = getelementptr inbounds i32, ptr @array2, i32 %79
  %81 = load i32, ptr %80, align 4, !tbaa !6
  store i32 %40, ptr %80, align 4, !tbaa !6
  store i32 %81, ptr %36, align 4, !tbaa !6
  br label %82

82:                                               ; preds = %74, %78, %28
  %83 = phi i32 [ %33, %28 ], [ %79, %78 ], [ %75, %74 ]
  %84 = phi i32 [ %32, %28 ], [ %79, %78 ], [ %76, %74 ]
  %85 = sub nsw i32 %84, %30
  %86 = icmp sgt i32 %85, 1
  br i1 %86, label %87, label %103

87:                                               ; preds = %82
  %88 = sub nsw i32 %29, %83
  %89 = icmp sgt i32 %88, 1
  br i1 %89, label %90, label %105

90:                                               ; preds = %87
  %91 = add nsw i32 %88, -1
  %92 = icmp samesign ult i32 %85, %91
  br i1 %92, label %93, label %98

93:                                               ; preds = %90
  %94 = add nsw i32 %83, 1
  %95 = getelementptr inbounds i32, ptr %6, i32 %31
  store i32 %94, ptr %95, align 4, !tbaa !6
  %96 = getelementptr inbounds i32, ptr %7, i32 %31
  store i32 %29, ptr %96, align 4, !tbaa !6
  %97 = add nsw i32 %31, 1
  br label %105

98:                                               ; preds = %90
  %99 = getelementptr inbounds i32, ptr %6, i32 %31
  store i32 %30, ptr %99, align 4, !tbaa !6
  %100 = getelementptr inbounds i32, ptr %7, i32 %31
  store i32 %84, ptr %100, align 4, !tbaa !6
  %101 = add nsw i32 %31, 1
  %102 = add nsw i32 %83, 1
  br label %105

103:                                              ; preds = %82
  %104 = add nsw i32 %83, 1
  br label %105

105:                                              ; preds = %87, %103, %93, %98
  %106 = phi i32 [ %97, %93 ], [ %101, %98 ], [ %31, %103 ], [ %31, %87 ]
  %107 = phi i32 [ %30, %93 ], [ %102, %98 ], [ %104, %103 ], [ %30, %87 ]
  %108 = phi i32 [ %84, %93 ], [ %29, %98 ], [ %29, %103 ], [ %84, %87 ]
  %109 = sub nsw i32 %108, %107
  %110 = icmp sgt i32 %109, 2
  br i1 %110, label %28, label %111, !llvm.loop !119

111:                                              ; preds = %105, %19
  %112 = phi i32 [ %21, %19 ], [ %106, %105 ]
  %113 = phi i32 [ %23, %19 ], [ %107, %105 ]
  %114 = phi i32 [ %25, %19 ], [ %108, %105 ]
  %115 = phi i32 [ %26, %19 ], [ %109, %105 ]
  %116 = icmp eq i32 %115, 2
  br i1 %116, label %117, label %125

117:                                              ; preds = %111
  %118 = getelementptr inbounds i32, ptr @array2, i32 %113
  %119 = load i32, ptr %118, align 4, !tbaa !6
  %120 = getelementptr i32, ptr @array2, i32 %114
  %121 = getelementptr i8, ptr %120, i32 -4
  %122 = load i32, ptr %121, align 4, !tbaa !6
  %123 = icmp sgt i32 %119, %122
  br i1 %123, label %124, label %125

124:                                              ; preds = %117
  store i32 %122, ptr %118, align 4, !tbaa !6
  store i32 %119, ptr %121, align 4, !tbaa !6
  br label %125

125:                                              ; preds = %117, %124, %111
  %126 = icmp sgt i32 %112, 0
  br i1 %126, label %19, label %127, !llvm.loop !120

127:                                              ; preds = %125
  call void @llvm.lifetime.end.p0(ptr nonnull %7) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #17
  tail call void @init_heap_beebs(ptr noundef nonnull @heap, i32 noundef 8192) #15
  store ptr null, ptr @the_list, align 4, !tbaa !10
  br label %128

128:                                              ; preds = %127, %148
  %129 = phi i32 [ 0, %127 ], [ %149, %148 ]
  %130 = tail call ptr @malloc_beebs(i32 noundef 12) #15
  %131 = getelementptr inbounds nuw i32, ptr @array, i32 %129
  %132 = load i32, ptr %131, align 4, !tbaa !6
  store i32 %132, ptr %130, align 4, !tbaa !16
  %133 = load ptr, ptr @the_list, align 4, !tbaa !10
  %134 = icmp eq ptr %133, null
  br i1 %134, label %135, label %137

135:                                              ; preds = %128
  store ptr %130, ptr @the_list, align 4, !tbaa !10
  %136 = getelementptr inbounds nuw i8, ptr %130, i32 8
  store ptr null, ptr %136, align 4, !tbaa !13
  br label %144

137:                                              ; preds = %128
  %138 = getelementptr inbounds nuw i8, ptr %130, i32 4
  store ptr %133, ptr %138, align 4, !tbaa !15
  %139 = getelementptr inbounds nuw i8, ptr %133, i32 8
  %140 = load ptr, ptr %139, align 4, !tbaa !13
  %141 = getelementptr inbounds nuw i8, ptr %130, i32 8
  store ptr %140, ptr %141, align 4, !tbaa !13
  store ptr %130, ptr %139, align 4, !tbaa !13
  %142 = load ptr, ptr %141, align 4, !tbaa !13
  %143 = icmp eq ptr %142, null
  br i1 %143, label %148, label %144

144:                                              ; preds = %137, %135
  %145 = phi ptr [ %130, %135 ], [ %142, %137 ]
  %146 = phi ptr [ null, %135 ], [ %130, %137 ]
  %147 = getelementptr inbounds nuw i8, ptr %145, i32 4
  store ptr %146, ptr %147, align 4, !tbaa !15
  br label %148

148:                                              ; preds = %137, %144
  %149 = add nuw nsw i32 %129, 1
  %150 = icmp eq i32 %149, 100
  br i1 %150, label %151, label %128, !llvm.loop !121

151:                                              ; preds = %148
  tail call void @sglib_dllist_sort(ptr noundef nonnull @the_list) #16
  store volatile i32 0, ptr %2, align 4, !tbaa !6
  %152 = load ptr, ptr @the_list, align 4, !tbaa !10
  %153 = icmp eq ptr %152, null
  br i1 %153, label %166, label %154

154:                                              ; preds = %151, %154
  %155 = phi ptr [ %157, %154 ], [ %152, %151 ]
  %156 = getelementptr inbounds nuw i8, ptr %155, i32 8
  %157 = load ptr, ptr %156, align 4, !tbaa !13
  %158 = icmp eq ptr %157, null
  br i1 %158, label %159, label %154, !llvm.loop !31

159:                                              ; preds = %154, %159
  %160 = phi ptr [ %164, %159 ], [ %155, %154 ]
  %161 = load volatile i32, ptr %2, align 4, !tbaa !6
  %162 = add nsw i32 %161, 1
  store volatile i32 %162, ptr %2, align 4, !tbaa !6
  %163 = getelementptr inbounds nuw i8, ptr %160, i32 4
  %164 = load ptr, ptr %163, align 4, !tbaa !15
  %165 = icmp eq ptr %164, null
  br i1 %165, label %166, label %159, !llvm.loop !122

166:                                              ; preds = %159, %151
  store ptr null, ptr @htab, align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 4), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 8), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 12), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 16), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 20), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 24), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 28), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 32), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 36), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 40), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 44), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 48), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 52), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 56), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 60), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 64), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 68), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 72), align 4, !tbaa !59
  store ptr null, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 76), align 4, !tbaa !59
  br label %167

167:                                              ; preds = %166, %187
  %168 = phi i32 [ 0, %166 ], [ %188, %187 ]
  %169 = getelementptr inbounds nuw i32, ptr @array, i32 %168
  %170 = load i32, ptr %169, align 4, !tbaa !6
  %171 = urem i32 %170, 20
  %172 = getelementptr inbounds nuw ptr, ptr @htab, i32 %171
  %173 = load ptr, ptr %172, align 4, !tbaa !59
  %174 = icmp eq ptr %173, null
  br i1 %174, label %183, label %175

175:                                              ; preds = %167, %179
  %176 = phi ptr [ %181, %179 ], [ %173, %167 ]
  %177 = load i32, ptr %176, align 4, !tbaa !53
  %178 = icmp eq i32 %177, %170
  br i1 %178, label %187, label %179

179:                                              ; preds = %175
  %180 = getelementptr inbounds nuw i8, ptr %176, i32 4
  %181 = load ptr, ptr %180, align 4, !tbaa !56
  %182 = icmp eq ptr %181, null
  br i1 %182, label %183, label %175, !llvm.loop !58

183:                                              ; preds = %179, %167
  %184 = tail call ptr @malloc_beebs(i32 noundef 8) #15
  store i32 %170, ptr %184, align 4, !tbaa !53
  %185 = load ptr, ptr %172, align 4, !tbaa !59
  %186 = getelementptr inbounds nuw i8, ptr %184, i32 4
  store ptr %185, ptr %186, align 4, !tbaa !56
  store ptr %184, ptr %172, align 4, !tbaa !59
  br label %187

187:                                              ; preds = %175, %183
  %188 = add nuw nsw i32 %168, 1
  %189 = icmp eq i32 %188, 100
  br i1 %189, label %190, label %167, !llvm.loop !123

190:                                              ; preds = %187
  %191 = load ptr, ptr @htab, align 4, !tbaa !59
  %192 = icmp eq ptr %191, null
  br i1 %192, label %193, label %250

193:                                              ; preds = %190
  %194 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 4), align 4, !tbaa !59
  %195 = icmp eq ptr %194, null
  br i1 %195, label %196, label %250, !llvm.loop !85

196:                                              ; preds = %193
  %197 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 8), align 4, !tbaa !59
  %198 = icmp eq ptr %197, null
  br i1 %198, label %199, label %250, !llvm.loop !85

199:                                              ; preds = %196
  %200 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 12), align 4, !tbaa !59
  %201 = icmp eq ptr %200, null
  br i1 %201, label %202, label %250, !llvm.loop !85

202:                                              ; preds = %199
  %203 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 16), align 4, !tbaa !59
  %204 = icmp eq ptr %203, null
  br i1 %204, label %205, label %250, !llvm.loop !85

205:                                              ; preds = %202
  %206 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 20), align 4, !tbaa !59
  %207 = icmp eq ptr %206, null
  br i1 %207, label %208, label %250, !llvm.loop !85

208:                                              ; preds = %205
  %209 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 24), align 4, !tbaa !59
  %210 = icmp eq ptr %209, null
  br i1 %210, label %211, label %250, !llvm.loop !85

211:                                              ; preds = %208
  %212 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 28), align 4, !tbaa !59
  %213 = icmp eq ptr %212, null
  br i1 %213, label %214, label %250, !llvm.loop !85

214:                                              ; preds = %211
  %215 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 32), align 4, !tbaa !59
  %216 = icmp eq ptr %215, null
  br i1 %216, label %217, label %250, !llvm.loop !85

217:                                              ; preds = %214
  %218 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 36), align 4, !tbaa !59
  %219 = icmp eq ptr %218, null
  br i1 %219, label %220, label %250, !llvm.loop !85

220:                                              ; preds = %217
  %221 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 40), align 4, !tbaa !59
  %222 = icmp eq ptr %221, null
  br i1 %222, label %223, label %250, !llvm.loop !85

223:                                              ; preds = %220
  %224 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 44), align 4, !tbaa !59
  %225 = icmp eq ptr %224, null
  br i1 %225, label %226, label %250, !llvm.loop !85

226:                                              ; preds = %223
  %227 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 48), align 4, !tbaa !59
  %228 = icmp eq ptr %227, null
  br i1 %228, label %229, label %250, !llvm.loop !85

229:                                              ; preds = %226
  %230 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 52), align 4, !tbaa !59
  %231 = icmp eq ptr %230, null
  br i1 %231, label %232, label %250, !llvm.loop !85

232:                                              ; preds = %229
  %233 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 56), align 4, !tbaa !59
  %234 = icmp eq ptr %233, null
  br i1 %234, label %235, label %250, !llvm.loop !85

235:                                              ; preds = %232
  %236 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 60), align 4, !tbaa !59
  %237 = icmp eq ptr %236, null
  br i1 %237, label %238, label %250, !llvm.loop !85

238:                                              ; preds = %235
  %239 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 64), align 4, !tbaa !59
  %240 = icmp eq ptr %239, null
  br i1 %240, label %241, label %250, !llvm.loop !85

241:                                              ; preds = %238
  %242 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 68), align 4, !tbaa !59
  %243 = icmp eq ptr %242, null
  br i1 %243, label %244, label %250, !llvm.loop !85

244:                                              ; preds = %241
  %245 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 72), align 4, !tbaa !59
  %246 = icmp eq ptr %245, null
  br i1 %246, label %247, label %250, !llvm.loop !85

247:                                              ; preds = %244
  %248 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @htab, i32 76), align 4, !tbaa !59
  %249 = icmp eq ptr %248, null
  br i1 %249, label %274, label %250, !llvm.loop !85

250:                                              ; preds = %193, %196, %199, %202, %205, %208, %211, %214, %217, %220, %223, %226, %229, %232, %235, %238, %241, %244, %247, %190
  %251 = phi ptr [ %248, %247 ], [ %245, %244 ], [ %242, %241 ], [ %239, %238 ], [ %236, %235 ], [ %233, %232 ], [ %230, %229 ], [ %227, %226 ], [ %224, %223 ], [ %221, %220 ], [ %218, %217 ], [ %215, %214 ], [ %212, %211 ], [ %209, %208 ], [ %206, %205 ], [ %203, %202 ], [ %200, %199 ], [ %197, %196 ], [ %194, %193 ], [ %191, %190 ]
  %252 = phi i32 [ 19, %247 ], [ 18, %244 ], [ 17, %241 ], [ 16, %238 ], [ 15, %235 ], [ 14, %232 ], [ 13, %229 ], [ 12, %226 ], [ 11, %223 ], [ 10, %220 ], [ 9, %217 ], [ 8, %214 ], [ 7, %211 ], [ 6, %208 ], [ 5, %205 ], [ 4, %202 ], [ 3, %199 ], [ 2, %196 ], [ 1, %193 ], [ 0, %190 ]
  br label %253

253:                                              ; preds = %250, %271
  %254 = phi ptr [ %273, %271 ], [ %251, %250 ]
  %255 = phi i32 [ %272, %271 ], [ %252, %250 ]
  %256 = getelementptr inbounds nuw i8, ptr %254, i32 4
  %257 = load ptr, ptr %256, align 4, !tbaa !56
  %258 = load volatile i32, ptr %2, align 4, !tbaa !6
  %259 = add nsw i32 %258, 1
  store volatile i32 %259, ptr %2, align 4, !tbaa !6
  %260 = icmp eq ptr %257, null
  br i1 %260, label %261, label %271

261:                                              ; preds = %253
  %262 = tail call i32 @llvm.smax.i32(i32 %255, i32 19)
  br label %263

263:                                              ; preds = %261, %266
  %264 = phi i32 [ %267, %266 ], [ %255, %261 ]
  %265 = icmp eq i32 %264, %262
  br i1 %265, label %274, label %266

266:                                              ; preds = %263
  %267 = add i32 %264, 1
  %268 = getelementptr inbounds ptr, ptr @htab, i32 %267
  %269 = load ptr, ptr %268, align 4, !tbaa !59
  %270 = icmp eq ptr %269, null
  br i1 %270, label %263, label %271, !llvm.loop !85

271:                                              ; preds = %266, %253
  %272 = phi i32 [ %255, %253 ], [ %267, %266 ]
  %273 = phi ptr [ %257, %253 ], [ %269, %266 ]
  br label %253, !llvm.loop !124

274:                                              ; preds = %263, %247
  br label %275

275:                                              ; preds = %274, %275
  %276 = phi i32 [ %283, %275 ], [ 0, %274 ]
  %277 = phi i32 [ %282, %275 ], [ 0, %274 ]
  %278 = getelementptr inbounds nuw i32, ptr @array, i32 %276
  %279 = load i32, ptr %278, align 4, !tbaa !6
  %280 = getelementptr inbounds i32, ptr %3, i32 %277
  store i32 %279, ptr %280, align 4, !tbaa !6
  %281 = add nsw i32 %277, 1
  %282 = srem i32 %281, 101
  %283 = add nuw nsw i32 %276, 1
  %284 = icmp eq i32 %283, 100
  br i1 %284, label %285, label %275, !llvm.loop !125

285:                                              ; preds = %275, %285
  %286 = phi i32 [ %292, %285 ], [ 0, %275 ]
  %287 = getelementptr inbounds i32, ptr %3, i32 %286
  %288 = load i32, ptr %287, align 4, !tbaa !6
  %289 = load volatile i32, ptr %2, align 4, !tbaa !6
  %290 = add nsw i32 %289, %288
  store volatile i32 %290, ptr %2, align 4, !tbaa !6
  %291 = add nsw i32 %286, 1
  %292 = srem i32 %291, 101
  %293 = icmp eq i32 %292, 100
  br i1 %293, label %294, label %285, !llvm.loop !126

294:                                              ; preds = %285, %311
  %295 = phi i32 [ %299, %311 ], [ 0, %285 ]
  %296 = getelementptr inbounds nuw i32, ptr @array, i32 %295
  %297 = load i32, ptr %296, align 4, !tbaa !6
  %298 = getelementptr inbounds nuw i32, ptr %3, i32 %295
  store i32 %297, ptr %298, align 4, !tbaa !6
  %299 = add nuw nsw i32 %295, 1
  %300 = icmp eq i32 %295, 0
  br i1 %300, label %311, label %301

301:                                              ; preds = %294, %309
  %302 = phi i32 [ %303, %309 ], [ %295, %294 ]
  %303 = lshr i32 %302, 1
  %304 = getelementptr inbounds nuw i32, ptr %3, i32 %303
  %305 = load i32, ptr %304, align 4, !tbaa !6
  %306 = getelementptr inbounds nuw i32, ptr %3, i32 %302
  %307 = load i32, ptr %306, align 4, !tbaa !6
  %308 = icmp slt i32 %305, %307
  br i1 %308, label %309, label %311

309:                                              ; preds = %301
  store i32 %307, ptr %304, align 4, !tbaa !6
  store i32 %305, ptr %306, align 4, !tbaa !6
  %310 = icmp eq i32 %303, 0
  br i1 %310, label %311, label %301, !llvm.loop !127

311:                                              ; preds = %301, %309, %294
  %312 = icmp eq i32 %299, 100
  br i1 %312, label %315, label %294, !llvm.loop !128

313:                                              ; preds = %340, %343, %315
  %314 = icmp eq i32 %320, 0
  br i1 %314, label %351, label %315, !llvm.loop !129

315:                                              ; preds = %311, %313
  %316 = phi i32 [ %320, %313 ], [ 100, %311 ]
  %317 = load i32, ptr %3, align 4, !tbaa !6
  %318 = load volatile i32, ptr %2, align 4, !tbaa !6
  %319 = add nsw i32 %318, %317
  store volatile i32 %319, ptr %2, align 4, !tbaa !6
  %320 = add nsw i32 %316, -1
  %321 = getelementptr inbounds i32, ptr %3, i32 %320
  %322 = load i32, ptr %321, align 4, !tbaa !6
  store i32 %322, ptr %3, align 4, !tbaa !6
  %323 = icmp sgt i32 %316, 2
  br i1 %323, label %324, label %313

324:                                              ; preds = %315, %343
  %325 = phi i32 [ %349, %343 ], [ 2, %315 ]
  %326 = phi i32 [ %348, %343 ], [ 1, %315 ]
  %327 = phi i32 [ %341, %343 ], [ 0, %315 ]
  %328 = getelementptr inbounds i32, ptr %3, i32 %326
  %329 = load i32, ptr %328, align 4, !tbaa !6
  %330 = icmp slt i32 %322, %329
  %331 = select i1 %330, i32 %326, i32 %327
  %332 = icmp slt i32 %325, %320
  br i1 %332, label %333, label %340

333:                                              ; preds = %324
  %334 = getelementptr inbounds i32, ptr %3, i32 %331
  %335 = load i32, ptr %334, align 4, !tbaa !6
  %336 = getelementptr inbounds i32, ptr %3, i32 %325
  %337 = load i32, ptr %336, align 4, !tbaa !6
  %338 = icmp slt i32 %335, %337
  %339 = select i1 %338, i32 %325, i32 %331
  br label %340

340:                                              ; preds = %333, %324
  %341 = phi i32 [ %331, %324 ], [ %339, %333 ]
  %342 = icmp eq i32 %341, %327
  br i1 %342, label %313, label %343

343:                                              ; preds = %340
  %344 = getelementptr inbounds i32, ptr %3, i32 %327
  %345 = getelementptr inbounds i32, ptr %3, i32 %341
  %346 = load i32, ptr %345, align 4, !tbaa !6
  store i32 %346, ptr %344, align 4, !tbaa !6
  store i32 %322, ptr %345, align 4, !tbaa !6
  %347 = shl nsw i32 %341, 1
  %348 = or disjoint i32 %347, 1
  %349 = add nsw i32 %347, 2
  %350 = icmp slt i32 %348, %320
  br i1 %350, label %324, label %313, !llvm.loop !130

351:                                              ; preds = %313
  store ptr null, ptr %4, align 4, !tbaa !89
  br label %352

352:                                              ; preds = %351, %375
  %353 = phi ptr [ null, %351 ], [ %376, %375 ]
  %354 = phi i32 [ 0, %351 ], [ %377, %375 ]
  %355 = getelementptr inbounds nuw i32, ptr @array, i32 %354
  %356 = load i32, ptr %355, align 4, !tbaa !6
  %357 = icmp eq ptr %353, null
  br i1 %357, label %369, label %358

358:                                              ; preds = %352, %364
  %359 = phi ptr [ %367, %364 ], [ %353, %352 ]
  %360 = load i32, ptr %359, align 4, !tbaa !91
  %361 = icmp slt i32 %356, %360
  br i1 %361, label %364, label %362

362:                                              ; preds = %358
  %363 = icmp eq i32 %356, %360
  br i1 %363, label %375, label %364

364:                                              ; preds = %362, %358
  %365 = phi i32 [ 8, %358 ], [ 12, %362 ]
  %366 = getelementptr inbounds nuw i8, ptr %359, i32 %365
  %367 = load ptr, ptr %366, align 4, !tbaa !89
  %368 = icmp eq ptr %367, null
  br i1 %368, label %369, label %358, !llvm.loop !96

369:                                              ; preds = %364, %352
  %370 = tail call ptr @malloc_beebs(i32 noundef 16) #15
  store i32 %356, ptr %370, align 4, !tbaa !91
  %371 = getelementptr inbounds nuw i8, ptr %370, i32 12
  store ptr null, ptr %371, align 4, !tbaa !94
  %372 = getelementptr inbounds nuw i8, ptr %370, i32 8
  store ptr null, ptr %372, align 4, !tbaa !93
  call fastcc void @sglib___rbtree_add_recursive(ptr noundef nonnull %4, ptr noundef nonnull %370) #16
  %373 = load ptr, ptr %4, align 4, !tbaa !89
  %374 = getelementptr inbounds nuw i8, ptr %373, i32 4
  store i8 0, ptr %374, align 4, !tbaa !95
  br label %375

375:                                              ; preds = %362, %369
  %376 = phi ptr [ %373, %369 ], [ %353, %362 ]
  %377 = add nuw nsw i32 %354, 1
  %378 = icmp eq i32 %377, 100
  br i1 %378, label %379, label %352, !llvm.loop !131

379:                                              ; preds = %375
  store i16 1, ptr %10, align 2, !tbaa !110
  store ptr null, ptr %11, align 4, !tbaa !102
  store ptr null, ptr %12, align 4, !tbaa !105
  %380 = icmp eq ptr %376, null
  br i1 %380, label %391, label %381

381:                                              ; preds = %379
  store i16 1, ptr %13, align 4, !tbaa !107
  store i8 0, ptr %14, align 4, !tbaa !98
  store ptr %376, ptr %15, align 4, !tbaa !89
  call void @sglib__rbtree_it_compute_current_elem(ptr noundef nonnull %5) #16
  %382 = load ptr, ptr %5, align 4, !tbaa !106
  %383 = icmp eq ptr %382, null
  br i1 %383, label %391, label %384

384:                                              ; preds = %381, %384
  %385 = phi ptr [ %389, %384 ], [ %382, %381 ]
  %386 = load i32, ptr %385, align 4, !tbaa !91
  %387 = load volatile i32, ptr %2, align 4, !tbaa !6
  %388 = add nsw i32 %387, %386
  store volatile i32 %388, ptr %2, align 4, !tbaa !6
  call void @sglib__rbtree_it_compute_current_elem(ptr noundef nonnull %5) #16
  %389 = load ptr, ptr %5, align 4, !tbaa !106
  %390 = icmp eq ptr %389, null
  br i1 %390, label %391, label %384, !llvm.loop !132

391:                                              ; preds = %384, %379, %381
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #17
  %392 = add nuw nsw i32 %17, 1
  %393 = icmp eq i32 %392, %0
  br i1 %393, label %394, label %16, !llvm.loop !133

394:                                              ; preds = %391, %1
  %395 = load volatile i32, ptr %2, align 4, !tbaa !6
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret i32 %395
}

; Function Attrs: noinline nounwind
define dso_local i32 @benchmark() local_unnamed_addr #13 {
  %1 = tail call fastcc i32 @benchmark_body(i32 noundef 29) #16
  ret i32 %1
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #11

declare dso_local void @init_heap_beebs(ptr noundef, i32 noundef) local_unnamed_addr #11

declare dso_local ptr @malloc_beebs(i32 noundef) local_unnamed_addr #11

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #14

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #5 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #7 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #8 = { nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #9 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #10 = { nofree nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #11 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #12 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #13 = { noinline nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #14 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #15 = { nobuiltin nounwind "no-builtins" }
attributes #16 = { nobuiltin "no-builtins" }
attributes #17 = { nounwind }

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
!11 = !{!"p1 _ZTS6dllist", !12, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!14, !11, i64 8}
!14 = !{!"dllist", !7, i64 0, !11, i64 4, !11, i64 8}
!15 = !{!14, !11, i64 4}
!16 = !{!14, !7, i64 0}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = distinct !{!19, !18}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !18}
!22 = distinct !{!22, !18}
!23 = distinct !{!23, !18}
!24 = distinct !{!24, !18}
!25 = distinct !{!25, !18}
!26 = distinct !{!26, !18}
!27 = distinct !{!27, !18}
!28 = distinct !{!28, !18}
!29 = distinct !{!29, !18}
!30 = distinct !{!30, !18}
!31 = distinct !{!31, !18}
!32 = distinct !{!32, !18}
!33 = distinct !{!33, !18}
!34 = distinct !{!34, !18}
!35 = distinct !{!35, !18}
!36 = distinct !{!36, !18}
!37 = distinct !{!37, !18}
!38 = distinct !{!38, !18}
!39 = distinct !{!39, !18}
!40 = distinct !{!40, !18}
!41 = distinct !{!41, !18}
!42 = distinct !{!42, !18}
!43 = distinct !{!43, !18}
!44 = distinct !{!44, !18}
!45 = !{!46, !12, i64 12}
!46 = !{!"sglib_dllist_iterator", !11, i64 0, !11, i64 4, !11, i64 8, !12, i64 12, !11, i64 16}
!47 = !{!46, !11, i64 16}
!48 = !{!46, !11, i64 4}
!49 = !{!46, !11, i64 8}
!50 = distinct !{!50, !18}
!51 = distinct !{!51, !18}
!52 = !{!46, !11, i64 0}
!53 = !{!54, !7, i64 0}
!54 = !{!"ilist", !7, i64 0, !55, i64 4}
!55 = !{!"p1 _ZTS5ilist", !12, i64 0}
!56 = !{!54, !55, i64 4}
!57 = distinct !{!57, !18}
!58 = distinct !{!58, !18}
!59 = !{!55, !55, i64 0}
!60 = distinct !{!60, !18}
!61 = distinct !{!61, !18}
!62 = distinct !{!62, !18}
!63 = distinct !{!63, !18}
!64 = distinct !{!64, !18}
!65 = distinct !{!65, !18}
!66 = distinct !{!66, !18}
!67 = distinct !{!67, !18}
!68 = distinct !{!68, !18}
!69 = distinct !{!69, !18}
!70 = distinct !{!70, !18}
!71 = distinct !{!71, !18}
!72 = !{!73, !12, i64 8}
!73 = !{!"sglib_ilist_iterator", !55, i64 0, !55, i64 4, !12, i64 8, !55, i64 12}
!74 = !{!73, !55, i64 12}
!75 = !{!73, !55, i64 4}
!76 = !{!73, !55, i64 0}
!77 = distinct !{!77, !18}
!78 = !{!79, !80, i64 16}
!79 = !{!"sglib_hashed_ilist_iterator", !73, i64 0, !80, i64 16, !7, i64 20, !12, i64 24, !55, i64 28}
!80 = !{!"p2 _ZTS5ilist", !81, i64 0}
!81 = !{!"any p2 pointer", !12, i64 0}
!82 = !{!79, !7, i64 20}
!83 = !{!79, !12, i64 24}
!84 = !{!79, !55, i64 28}
!85 = distinct !{!85, !18}
!86 = !{!87, !7, i64 408}
!87 = !{!"iq", !8, i64 0, !7, i64 404, !7, i64 408}
!88 = !{!87, !7, i64 404}
!89 = !{!90, !90, i64 0}
!90 = !{!"p1 _ZTS6rbtree", !12, i64 0}
!91 = !{!92, !7, i64 0}
!92 = !{!"rbtree", !7, i64 0, !8, i64 4, !90, i64 8, !90, i64 12}
!93 = !{!92, !90, i64 8}
!94 = !{!92, !90, i64 12}
!95 = !{!92, !8, i64 4}
!96 = distinct !{!96, !18}
!97 = distinct !{!97, !18}
!98 = !{!8, !8, i64 0}
!99 = distinct !{!99, !18}
!100 = distinct !{!100, !18}
!101 = distinct !{!101, !18}
!102 = !{!103, !90, i64 648}
!103 = !{!"sglib_rbtree_iterator", !90, i64 0, !8, i64 4, !8, i64 132, !104, i64 644, !104, i64 646, !90, i64 648, !12, i64 652}
!104 = !{!"short", !8, i64 0}
!105 = !{!103, !12, i64 652}
!106 = !{!103, !90, i64 0}
!107 = !{!103, !104, i64 644}
!108 = distinct !{!108, !18}
!109 = distinct !{!109, !18}
!110 = !{!103, !104, i64 646}
!111 = distinct !{!111, !18}
!112 = distinct !{!112, !18}
!113 = distinct !{!113, !18}
!114 = distinct !{!114, !18}
!115 = distinct !{!115, !18}
!116 = distinct !{!116, !18}
!117 = distinct !{!117, !18}
!118 = distinct !{!118, !18}
!119 = distinct !{!119, !18}
!120 = distinct !{!120, !18}
!121 = distinct !{!121, !18}
!122 = distinct !{!122, !18}
!123 = distinct !{!123, !18}
!124 = distinct !{!124, !18}
!125 = distinct !{!125, !18}
!126 = distinct !{!126, !18}
!127 = distinct !{!127, !18}
!128 = distinct !{!128, !18}
!129 = distinct !{!129, !18}
!130 = distinct !{!130, !18}
!131 = distinct !{!131, !18}
!132 = distinct !{!132, !18}
!133 = distinct !{!133, !18}
