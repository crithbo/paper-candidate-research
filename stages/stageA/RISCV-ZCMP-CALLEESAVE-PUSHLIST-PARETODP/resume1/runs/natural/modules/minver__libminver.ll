; ModuleID = 'D:\project\writing\reserch\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1\resources\corpus\embench\src\minver\libminver.c'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\\resume1\\resources\\corpus\\embench\\src\\minver\\libminver.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

@a = internal global [3 x [3 x float]] zeroinitializer, align 4
@b = internal unnamed_addr constant [3 x [3 x float]] [[3 x float] [float -3.000000e+00, float 0.000000e+00, float 2.000000e+00], [3 x float] [float 3.000000e+00, float -2.000000e+00, float 0.000000e+00], [3 x float] [float 0.000000e+00, float 2.000000e+00, float -3.000000e+00]], align 4
@c = internal unnamed_addr global [3 x [3 x float]] zeroinitializer, align 4
@det = internal unnamed_addr global float 0.000000e+00, align 4
@d = internal global [3 x [3 x float]] zeroinitializer, align 4
@a_ref = internal global [3 x [3 x float]] [[3 x float] [float 3.000000e+00, float -6.000000e+00, float 7.000000e+00], [3 x float] [float 9.000000e+00, float 0.000000e+00, float -5.000000e+00], [3 x float] [float 5.000000e+00, float -8.000000e+00, float 6.000000e+00]], align 4

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 1000) i32 @mmul(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = insertelement <4 x i32> poison, i32 %0, i64 0
  %6 = insertelement <4 x i32> %5, i32 %2, i64 1
  %7 = insertelement <4 x i32> %6, i32 %3, i64 2
  %8 = shufflevector <4 x i32> %7, <4 x i32> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 1>
  %9 = insertelement <4 x i32> <i32 0, i32 0, i32 0, i32 poison>, i32 %1, i64 3
  %10 = icmp sgt <4 x i32> %8, %9
  %11 = icmp eq <4 x i32> %8, %9
  %12 = shufflevector <4 x i1> %10, <4 x i1> %11, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %13 = bitcast <4 x i1> %12 to i4
  %14 = icmp eq i4 %13, -1
  br i1 %14, label %15, label %39

15:                                               ; preds = %4, %36
  %16 = phi i32 [ %37, %36 ], [ 0, %4 ]
  %17 = getelementptr inbounds nuw [3 x float], ptr @a, i32 %16
  %18 = getelementptr inbounds nuw [3 x float], ptr @c, i32 %16
  br label %19

19:                                               ; preds = %32, %15
  %20 = phi i32 [ 0, %15 ], [ %34, %32 ]
  %21 = getelementptr inbounds nuw float, ptr @b, i32 %20
  br label %22

22:                                               ; preds = %19, %22
  %23 = phi float [ %29, %22 ], [ 0.000000e+00, %19 ]
  %24 = phi i32 [ %30, %22 ], [ 0, %19 ]
  %25 = getelementptr inbounds nuw float, ptr %17, i32 %24
  %26 = load float, ptr %25, align 4, !tbaa !10
  %27 = getelementptr inbounds nuw [3 x float], ptr %21, i32 %24
  %28 = load float, ptr %27, align 4, !tbaa !10
  %29 = tail call float @llvm.fmuladd.f32(float %26, float %28, float %23)
  %30 = add nuw nsw i32 %24, 1
  %31 = icmp eq i32 %30, %2
  br i1 %31, label %32, label %22, !llvm.loop !12

32:                                               ; preds = %22
  %33 = getelementptr inbounds nuw float, ptr %18, i32 %20
  store float %29, ptr %33, align 4, !tbaa !10
  %34 = add nuw nsw i32 %20, 1
  %35 = icmp eq i32 %34, %3
  br i1 %35, label %36, label %19, !llvm.loop !14

36:                                               ; preds = %32
  %37 = add nuw nsw i32 %16, 1
  %38 = icmp eq i32 %37, %0
  br i1 %38, label %39, label %15, !llvm.loop !15

39:                                               ; preds = %36, %4
  %40 = phi i32 [ 999, %4 ], [ 0, %36 ]
  ret i32 %40
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 1000) i32 @minver(i32 noundef %0, i32 %1, float noundef %2) local_unnamed_addr #0 {
  %4 = alloca [500 x i32], align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #8
  %5 = add i32 %0, -2
  %6 = icmp ult i32 %5, 499
  %7 = fcmp ugt float %2, 0.000000e+00
  %8 = and i1 %6, %7
  br i1 %8, label %9, label %129

9:                                                ; preds = %3, %9
  %10 = phi i32 [ %12, %9 ], [ 0, %3 ]
  %11 = getelementptr inbounds nuw i32, ptr %4, i32 %10
  store i32 %10, ptr %11, align 4, !tbaa !6
  %12 = add nuw nsw i32 %10, 1
  %13 = icmp eq i32 %12, %0
  br i1 %13, label %14, label %9, !llvm.loop !16

14:                                               ; preds = %9, %96
  %15 = phi float [ %58, %96 ], [ 1.000000e+00, %9 ]
  %16 = phi i32 [ %29, %96 ], [ 0, %9 ]
  %17 = phi i32 [ %100, %96 ], [ 0, %9 ]
  %18 = getelementptr inbounds nuw float, ptr @a, i32 %17
  br label %19

19:                                               ; preds = %14, %19
  %20 = phi i32 [ %17, %14 ], [ %31, %19 ]
  %21 = phi float [ 0.000000e+00, %14 ], [ %30, %19 ]
  %22 = phi i32 [ %16, %14 ], [ %29, %19 ]
  %23 = getelementptr inbounds nuw [3 x float], ptr %18, i32 %20
  %24 = load float, ptr %23, align 4, !tbaa !10
  %25 = fcmp ult float %24, 0.000000e+00
  %26 = fneg float %24
  %27 = select i1 %25, float %26, float %24
  %28 = fcmp ogt float %27, %21
  %29 = select i1 %28, i32 %20, i32 %22
  %30 = select i1 %28, float %27, float %21
  %31 = add nuw nsw i32 %20, 1
  %32 = icmp eq i32 %31, %0
  br i1 %32, label %33, label %19, !llvm.loop !17

33:                                               ; preds = %19
  %34 = getelementptr inbounds [3 x float], ptr @a, i32 %29
  %35 = getelementptr inbounds nuw float, ptr %34, i32 %17
  %36 = load float, ptr %35, align 4, !tbaa !10
  %37 = tail call float @llvm.fabs.f32(float %36)
  %38 = fcmp ugt float %37, %2
  br i1 %38, label %39, label %126

39:                                               ; preds = %33
  %40 = fmul float %15, %36
  %41 = icmp eq i32 %29, %17
  br i1 %41, label %57, label %42

42:                                               ; preds = %39
  %43 = fneg float %27
  %44 = getelementptr inbounds nuw i32, ptr %4, i32 %17
  %45 = load i32, ptr %44, align 4, !tbaa !6
  %46 = getelementptr inbounds i32, ptr %4, i32 %29
  %47 = load i32, ptr %46, align 4, !tbaa !6
  store i32 %47, ptr %44, align 4, !tbaa !6
  store i32 %45, ptr %46, align 4, !tbaa !6
  %48 = getelementptr inbounds nuw [3 x float], ptr @a, i32 %17
  br label %49

49:                                               ; preds = %42, %49
  %50 = phi i32 [ 0, %42 ], [ %55, %49 ]
  %51 = getelementptr inbounds nuw float, ptr %48, i32 %50
  %52 = load float, ptr %51, align 4, !tbaa !10
  %53 = getelementptr inbounds nuw float, ptr %34, i32 %50
  %54 = load float, ptr %53, align 4, !tbaa !10
  store float %54, ptr %51, align 4, !tbaa !10
  store float %52, ptr %53, align 4, !tbaa !10
  %55 = add nuw nsw i32 %50, 1
  %56 = icmp eq i32 %55, %0
  br i1 %56, label %57, label %49, !llvm.loop !18

57:                                               ; preds = %49, %39
  %58 = phi float [ %40, %39 ], [ %43, %49 ]
  %59 = getelementptr inbounds nuw [3 x float], ptr @a, i32 %17
  br label %62

60:                                               ; preds = %62
  %61 = getelementptr inbounds nuw [3 x float], ptr @a, i32 %17
  br label %69

62:                                               ; preds = %57, %62
  %63 = phi i32 [ 0, %57 ], [ %67, %62 ]
  %64 = getelementptr inbounds nuw float, ptr %59, i32 %63
  %65 = load float, ptr %64, align 4, !tbaa !10
  %66 = fdiv float %65, %36
  store float %66, ptr %64, align 4, !tbaa !10
  %67 = add nuw nsw i32 %63, 1
  %68 = icmp eq i32 %67, %0
  br i1 %68, label %60, label %62, !llvm.loop !19

69:                                               ; preds = %60, %93
  %70 = phi i32 [ 0, %60 ], [ %94, %93 ]
  %71 = icmp eq i32 %70, %17
  br i1 %71, label %93, label %72

72:                                               ; preds = %69
  %73 = getelementptr inbounds nuw [3 x float], ptr @a, i32 %70
  %74 = getelementptr inbounds nuw float, ptr %73, i32 %17
  %75 = load float, ptr %74, align 4, !tbaa !10
  %76 = fcmp une float %75, 0.000000e+00
  br i1 %76, label %77, label %93

77:                                               ; preds = %72
  %78 = fneg float %75
  br label %79

79:                                               ; preds = %77, %88
  %80 = phi i32 [ 0, %77 ], [ %89, %88 ]
  %81 = icmp eq i32 %80, %17
  br i1 %81, label %88, label %82

82:                                               ; preds = %79
  %83 = getelementptr inbounds nuw float, ptr %61, i32 %80
  %84 = load float, ptr %83, align 4, !tbaa !10
  %85 = getelementptr inbounds nuw float, ptr %73, i32 %80
  %86 = load float, ptr %85, align 4, !tbaa !10
  %87 = tail call float @llvm.fmuladd.f32(float %78, float %84, float %86)
  store float %87, ptr %85, align 4, !tbaa !10
  br label %88

88:                                               ; preds = %79, %82
  %89 = add nuw nsw i32 %80, 1
  %90 = icmp eq i32 %89, %0
  br i1 %90, label %91, label %79, !llvm.loop !20

91:                                               ; preds = %88
  %92 = fdiv float %78, %36
  store float %92, ptr %74, align 4, !tbaa !10
  br label %93

93:                                               ; preds = %69, %91, %72
  %94 = add nuw nsw i32 %70, 1
  %95 = icmp eq i32 %94, %0
  br i1 %95, label %96, label %69, !llvm.loop !21

96:                                               ; preds = %93
  %97 = fdiv float 1.000000e+00, %36
  %98 = getelementptr inbounds nuw [3 x float], ptr @a, i32 %17
  %99 = getelementptr inbounds nuw float, ptr %98, i32 %17
  store float %97, ptr %99, align 4, !tbaa !10
  %100 = add nuw nsw i32 %17, 1
  %101 = icmp eq i32 %100, %0
  br i1 %101, label %102, label %14, !llvm.loop !22

102:                                              ; preds = %96, %123
  %103 = phi i32 [ %124, %123 ], [ 0, %96 ]
  %104 = getelementptr inbounds nuw i32, ptr %4, i32 %103
  %105 = load i32, ptr %104, align 4, !tbaa !6
  %106 = icmp eq i32 %105, %103
  br i1 %106, label %123, label %109

107:                                              ; preds = %117
  %108 = icmp eq i32 %112, %103
  br i1 %108, label %123, label %109

109:                                              ; preds = %102, %107
  %110 = phi i32 [ %112, %107 ], [ %105, %102 ]
  %111 = getelementptr inbounds i32, ptr %4, i32 %110
  %112 = load i32, ptr %111, align 4, !tbaa !6
  store i32 %110, ptr %111, align 4, !tbaa !6
  store i32 %112, ptr %104, align 4, !tbaa !6
  %113 = getelementptr inbounds [3 x float], ptr @a, i32 %110
  %114 = getelementptr inbounds nuw float, ptr %113, i32 %103
  %115 = getelementptr inbounds float, ptr %113, i32 %110
  %116 = load float, ptr %115, align 4, !tbaa !10
  br label %117

117:                                              ; preds = %109, %117
  %118 = phi float [ %116, %109 ], [ %120, %117 ]
  %119 = phi i32 [ 0, %109 ], [ %121, %117 ]
  %120 = load float, ptr %114, align 4, !tbaa !10
  store float %118, ptr %114, align 4, !tbaa !10
  store float %120, ptr %115, align 4, !tbaa !10
  %121 = add nuw nsw i32 %119, 1
  %122 = icmp eq i32 %121, %0
  br i1 %122, label %107, label %117, !llvm.loop !23

123:                                              ; preds = %107, %102
  %124 = add nuw nsw i32 %103, 1
  %125 = icmp eq i32 %124, %0
  br i1 %125, label %126, label %102, !llvm.loop !24

126:                                              ; preds = %33, %123
  %127 = phi float [ %58, %123 ], [ %15, %33 ]
  %128 = phi i32 [ 0, %123 ], [ 1, %33 ]
  store float %127, ptr @det, align 4, !tbaa !10
  br label %129

129:                                              ; preds = %126, %3
  %130 = phi i32 [ 999, %3 ], [ %128, %126 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #8
  ret i32 %130
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @verify_benchmark(i32 noundef %0) local_unnamed_addr #3 {
  %2 = load float, ptr @c, align 4, !tbaa !10
  %3 = fadd float %2, 2.700000e+01
  %4 = tail call float @fabsf(float noundef %3) #9
  %5 = fpext float %4 to double
  %6 = fcmp olt double %5, 1.000000e-05
  br i1 %6, label %112, label %118

7:                                                ; preds = %112
  %8 = load float, ptr getelementptr inbounds nuw (i8, ptr @c, i32 4), align 4, !tbaa !10
  %9 = fadd float %8, -2.600000e+01
  %10 = tail call float @fabsf(float noundef %9) #9
  %11 = fpext float %10 to double
  %12 = fcmp olt double %11, 1.000000e-05
  br i1 %12, label %13, label %118

13:                                               ; preds = %7
  %14 = load float, ptr getelementptr inbounds nuw (i8, ptr @d, i32 4), align 4, !tbaa !10
  %15 = fadd float %14, 0x3FC9999940000000
  %16 = tail call float @fabsf(float noundef %15) #9
  %17 = fpext float %16 to double
  %18 = fcmp olt double %17, 1.000000e-05
  br i1 %18, label %19, label %118

19:                                               ; preds = %13
  %20 = load float, ptr getelementptr inbounds nuw (i8, ptr @c, i32 8), align 4, !tbaa !10
  %21 = fadd float %20, 1.500000e+01
  %22 = tail call float @fabsf(float noundef %21) #9
  %23 = fpext float %22 to double
  %24 = fcmp olt double %23, 1.000000e-05
  br i1 %24, label %25, label %118

25:                                               ; preds = %19
  %26 = load float, ptr getelementptr inbounds nuw (i8, ptr @d, i32 8), align 4, !tbaa !10
  %27 = fadd float %26, 0xBFD11110C0000000
  %28 = tail call float @fabsf(float noundef %27) #9
  %29 = fpext float %28 to double
  %30 = fcmp olt double %29, 1.000000e-05
  br i1 %30, label %31, label %118

31:                                               ; preds = %25
  %32 = load float, ptr getelementptr inbounds nuw (i8, ptr @c, i32 12), align 4, !tbaa !10
  %33 = fadd float %32, 2.700000e+01
  %34 = tail call float @fabsf(float noundef %33) #9
  %35 = fpext float %34 to double
  %36 = fcmp olt double %35, 1.000000e-05
  br i1 %36, label %37, label %118

37:                                               ; preds = %31
  %38 = load float, ptr getelementptr inbounds nuw (i8, ptr @d, i32 12), align 4, !tbaa !10
  %39 = fadd float %38, 0x3FE0A3D6C0000000
  %40 = tail call float @fabsf(float noundef %39) #9
  %41 = fpext float %40 to double
  %42 = fcmp olt double %41, 1.000000e-05
  br i1 %42, label %43, label %118

43:                                               ; preds = %37
  %44 = load float, ptr getelementptr inbounds nuw (i8, ptr @c, i32 16), align 4, !tbaa !10
  %45 = fadd float %44, 1.000000e+01
  %46 = tail call float @fabsf(float noundef %45) #9
  %47 = fpext float %46 to double
  %48 = fcmp olt double %47, 1.000000e-05
  br i1 %48, label %49, label %118

49:                                               ; preds = %43
  %50 = load float, ptr getelementptr inbounds nuw (i8, ptr @d, i32 16), align 4, !tbaa !10
  %51 = fadd float %50, 0xBFBD0369C0000000
  %52 = tail call float @fabsf(float noundef %51) #9
  %53 = fpext float %52 to double
  %54 = fcmp olt double %53, 1.000000e-05
  br i1 %54, label %55, label %118

55:                                               ; preds = %49
  %56 = load float, ptr getelementptr inbounds nuw (i8, ptr @c, i32 20), align 4, !tbaa !10
  %57 = fadd float %56, -3.300000e+01
  %58 = tail call float @fabsf(float noundef %57) #9
  %59 = fpext float %58 to double
  %60 = fcmp olt double %59, 1.000000e-05
  br i1 %60, label %61, label %118

61:                                               ; preds = %55
  %62 = load float, ptr getelementptr inbounds nuw (i8, ptr @d, i32 20), align 4, !tbaa !10
  %63 = fadd float %62, 0xBFE0DA73C0000000
  %64 = tail call float @fabsf(float noundef %63) #9
  %65 = fpext float %64 to double
  %66 = fcmp olt double %65, 1.000000e-05
  br i1 %66, label %67, label %118

67:                                               ; preds = %61
  %68 = load float, ptr getelementptr inbounds nuw (i8, ptr @c, i32 24), align 4, !tbaa !10
  %69 = fadd float %68, 3.900000e+01
  %70 = tail call float @fabsf(float noundef %69) #9
  %71 = fpext float %70 to double
  %72 = fcmp olt double %71, 1.000000e-05
  br i1 %72, label %73, label %118

73:                                               ; preds = %67
  %74 = load float, ptr getelementptr inbounds nuw (i8, ptr @d, i32 24), align 4, !tbaa !10
  %75 = fadd float %74, 0xBFDEB85140000000
  %76 = tail call float @fabsf(float noundef %75) #9
  %77 = fpext float %76 to double
  %78 = fcmp olt double %77, 1.000000e-05
  br i1 %78, label %79, label %118

79:                                               ; preds = %73
  %80 = load float, ptr getelementptr inbounds nuw (i8, ptr @c, i32 28), align 4, !tbaa !10
  %81 = fadd float %80, -2.800000e+01
  %82 = tail call float @fabsf(float noundef %81) #9
  %83 = fpext float %82 to double
  %84 = fcmp olt double %83, 1.000000e-05
  br i1 %84, label %85, label %118

85:                                               ; preds = %79
  %86 = load float, ptr getelementptr inbounds nuw (i8, ptr @d, i32 28), align 4, !tbaa !10
  %87 = fadd float %86, 0x3FD70A3D00000000
  %88 = tail call float @fabsf(float noundef %87) #9
  %89 = fpext float %88 to double
  %90 = fcmp olt double %89, 1.000000e-05
  br i1 %90, label %91, label %118

91:                                               ; preds = %85
  %92 = load float, ptr getelementptr inbounds nuw (i8, ptr @c, i32 32), align 4, !tbaa !10
  %93 = fadd float %92, 8.000000e+00
  %94 = tail call float @fabsf(float noundef %93) #9
  %95 = fpext float %94 to double
  %96 = fcmp olt double %95, 1.000000e-05
  br i1 %96, label %97, label %118

97:                                               ; preds = %91
  %98 = load float, ptr getelementptr inbounds nuw (i8, ptr @d, i32 32), align 4, !tbaa !10
  %99 = fadd float %98, 0xBFA47AE100000000
  %100 = tail call float @fabsf(float noundef %99) #9
  %101 = fpext float %100 to double
  %102 = fcmp olt double %101, 1.000000e-05
  br i1 %102, label %103, label %118

103:                                              ; preds = %97
  %104 = load float, ptr @det, align 4, !tbaa !10
  %105 = fpext float %104 to double
  %106 = fadd double %105, 0x4030AAAB00CA2A5B
  %107 = fptrunc double %106 to float
  %108 = tail call float @fabsf(float noundef %107) #9
  %109 = fpext float %108 to double
  %110 = fcmp olt double %109, 1.000000e-05
  %111 = zext i1 %110 to i32
  br label %118

112:                                              ; preds = %1
  %113 = load float, ptr @d, align 4, !tbaa !10
  %114 = fadd float %113, 0xBFC1111100000000
  %115 = tail call float @fabsf(float noundef %114) #9
  %116 = fpext float %115 to double
  %117 = fcmp olt double %116, 1.000000e-05
  br i1 %117, label %7, label %118

118:                                              ; preds = %1, %112, %7, %13, %19, %25, %31, %37, %43, %49, %55, %61, %67, %73, %79, %85, %91, %97, %103
  %119 = phi i32 [ %111, %103 ], [ 0, %97 ], [ 0, %91 ], [ 0, %85 ], [ 0, %79 ], [ 0, %73 ], [ 0, %67 ], [ 0, %61 ], [ 0, %55 ], [ 0, %49 ], [ 0, %43 ], [ 0, %37 ], [ 0, %31 ], [ 0, %25 ], [ 0, %19 ], [ 0, %13 ], [ 0, %7 ], [ 0, %112 ], [ 0, %1 ]
  ret i32 %119
}

declare dso_local float @fabsf(float noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local void @initialise_benchmark() local_unnamed_addr #5 {
  ret void
}

; Function Attrs: nounwind
define dso_local void @warm_caches(i32 noundef %0) local_unnamed_addr #3 {
  tail call fastcc void @benchmark_body(i32 noundef %0) #10
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @benchmark_body(i32 noundef %0) unnamed_addr #6 {
  %2 = icmp sgt i32 %0, 0
  br i1 %2, label %3, label %47

3:                                                ; preds = %1, %3
  %4 = phi i32 [ %45, %3 ], [ 0, %1 ]
  %5 = tail call ptr @memcpy(ptr noundef nonnull @a, ptr noundef nonnull @a_ref, i32 noundef 36) #9
  %6 = tail call i32 @minver(i32 noundef 3, i32 poison, float noundef 0x3EB0C6F7A0000000) #10
  %7 = tail call ptr @memcpy(ptr noundef nonnull @d, ptr noundef nonnull @a, i32 noundef 36) #9
  %8 = tail call ptr @memcpy(ptr noundef nonnull @a, ptr noundef nonnull @a_ref, i32 noundef 36) #9
  %9 = load float, ptr @a, align 4, !tbaa !10
  %10 = tail call float @llvm.fmuladd.f32(float %9, float -3.000000e+00, float 0.000000e+00)
  %11 = load float, ptr getelementptr inbounds nuw (i8, ptr @a, i32 4), align 4, !tbaa !10
  %12 = tail call float @llvm.fmuladd.f32(float %11, float 3.000000e+00, float %10)
  %13 = load float, ptr getelementptr inbounds nuw (i8, ptr @a, i32 8), align 4, !tbaa !10
  %14 = tail call float @llvm.fmuladd.f32(float %13, float 0.000000e+00, float %12)
  store float %14, ptr @c, align 4, !tbaa !10
  %15 = tail call float @llvm.fmuladd.f32(float %9, float 0.000000e+00, float 0.000000e+00)
  %16 = tail call float @llvm.fmuladd.f32(float %11, float -2.000000e+00, float %15)
  %17 = tail call float @llvm.fmuladd.f32(float %13, float 2.000000e+00, float %16)
  store float %17, ptr getelementptr inbounds nuw (i8, ptr @c, i32 4), align 4, !tbaa !10
  %18 = tail call float @llvm.fmuladd.f32(float %9, float 2.000000e+00, float 0.000000e+00)
  %19 = tail call float @llvm.fmuladd.f32(float %11, float 0.000000e+00, float %18)
  %20 = tail call float @llvm.fmuladd.f32(float %13, float -3.000000e+00, float %19)
  store float %20, ptr getelementptr inbounds nuw (i8, ptr @c, i32 8), align 4, !tbaa !10
  %21 = load float, ptr getelementptr inbounds nuw (i8, ptr @a, i32 12), align 4, !tbaa !10
  %22 = tail call float @llvm.fmuladd.f32(float %21, float -3.000000e+00, float 0.000000e+00)
  %23 = load float, ptr getelementptr inbounds nuw (i8, ptr @a, i32 16), align 4, !tbaa !10
  %24 = tail call float @llvm.fmuladd.f32(float %23, float 3.000000e+00, float %22)
  %25 = load float, ptr getelementptr inbounds nuw (i8, ptr @a, i32 20), align 4, !tbaa !10
  %26 = tail call float @llvm.fmuladd.f32(float %25, float 0.000000e+00, float %24)
  store float %26, ptr getelementptr inbounds nuw (i8, ptr @c, i32 12), align 4, !tbaa !10
  %27 = tail call float @llvm.fmuladd.f32(float %21, float 0.000000e+00, float 0.000000e+00)
  %28 = tail call float @llvm.fmuladd.f32(float %23, float -2.000000e+00, float %27)
  %29 = tail call float @llvm.fmuladd.f32(float %25, float 2.000000e+00, float %28)
  store float %29, ptr getelementptr inbounds nuw (i8, ptr @c, i32 16), align 4, !tbaa !10
  %30 = tail call float @llvm.fmuladd.f32(float %21, float 2.000000e+00, float 0.000000e+00)
  %31 = tail call float @llvm.fmuladd.f32(float %23, float 0.000000e+00, float %30)
  %32 = tail call float @llvm.fmuladd.f32(float %25, float -3.000000e+00, float %31)
  store float %32, ptr getelementptr inbounds nuw (i8, ptr @c, i32 20), align 4, !tbaa !10
  %33 = load float, ptr getelementptr inbounds nuw (i8, ptr @a, i32 24), align 4, !tbaa !10
  %34 = tail call float @llvm.fmuladd.f32(float %33, float -3.000000e+00, float 0.000000e+00)
  %35 = load float, ptr getelementptr inbounds nuw (i8, ptr @a, i32 28), align 4, !tbaa !10
  %36 = tail call float @llvm.fmuladd.f32(float %35, float 3.000000e+00, float %34)
  %37 = load float, ptr getelementptr inbounds nuw (i8, ptr @a, i32 32), align 4, !tbaa !10
  %38 = tail call float @llvm.fmuladd.f32(float %37, float 0.000000e+00, float %36)
  store float %38, ptr getelementptr inbounds nuw (i8, ptr @c, i32 24), align 4, !tbaa !10
  %39 = tail call float @llvm.fmuladd.f32(float %33, float 0.000000e+00, float 0.000000e+00)
  %40 = tail call float @llvm.fmuladd.f32(float %35, float -2.000000e+00, float %39)
  %41 = tail call float @llvm.fmuladd.f32(float %37, float 2.000000e+00, float %40)
  store float %41, ptr getelementptr inbounds nuw (i8, ptr @c, i32 28), align 4, !tbaa !10
  %42 = tail call float @llvm.fmuladd.f32(float %33, float 2.000000e+00, float 0.000000e+00)
  %43 = tail call float @llvm.fmuladd.f32(float %35, float 0.000000e+00, float %42)
  %44 = tail call float @llvm.fmuladd.f32(float %37, float -3.000000e+00, float %43)
  store float %44, ptr getelementptr inbounds nuw (i8, ptr @c, i32 32), align 4, !tbaa !10
  %45 = add nuw nsw i32 %4, 1
  %46 = icmp eq i32 %45, %0
  br i1 %46, label %47, label %3, !llvm.loop !25

47:                                               ; preds = %3, %1
  ret void
}

; Function Attrs: noinline nounwind
define dso_local noundef i32 @benchmark() local_unnamed_addr #6 {
  tail call fastcc void @benchmark_body(i32 noundef 555) #10
  ret i32 0
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #7

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #6 = { noinline nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #7 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { nounwind }
attributes #9 = { nobuiltin nounwind "no-builtins" }
attributes #10 = { nobuiltin "no-builtins" }

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
!11 = !{!"float", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !13}
!17 = distinct !{!17, !13}
!18 = distinct !{!18, !13}
!19 = distinct !{!19, !13}
!20 = distinct !{!20, !13}
!21 = distinct !{!21, !13}
!22 = distinct !{!22, !13}
!23 = distinct !{!23, !13}
!24 = distinct !{!24, !13}
!25 = distinct !{!25, !13}
