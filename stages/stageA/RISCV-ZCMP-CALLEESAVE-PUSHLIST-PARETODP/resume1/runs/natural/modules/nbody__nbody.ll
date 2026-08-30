; ModuleID = 'D:\project\writing\reserch\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1\resources\corpus\embench\src\nbody\nbody.c'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\\resume1\\resources\\corpus\\embench\\src\\nbody\\nbody.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

%struct.body = type { [3 x double], double, [3 x double], double }

@verify_benchmark.expected = internal unnamed_addr constant [5 x %struct.body] [%struct.body { [3 x double] zeroinitializer, double 0.000000e+00, [3 x double] [double 0xBF3967E9A7E0D6F3, double 0xBF6AD4ECFE5089FB, double 0x3EF919331F0B8A72], double 0x4043BD3CC9BE45DE }, %struct.body { [3 x double] [double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0], double 0.000000e+00, [3 x double] [double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715], double 0x3FA34C95D9AB33D8 }, %struct.body { [3 x double] [double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C], double 0.000000e+00, [3 x double] [double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4], double 0x3F871D490D07C637 }, %struct.body { [3 x double] [double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0], double 0.000000e+00, [3 x double] [double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C], double 0x3F5C3DD29CF41EB3 }, %struct.body { [3 x double] [double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540], double 0.000000e+00, [3 x double] [double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6], double 0x3F60A8F3531799AC }], align 8
@solar_bodies = internal unnamed_addr global [5 x %struct.body] [%struct.body { [3 x double] zeroinitializer, double 0.000000e+00, [3 x double] zeroinitializer, double 0x4043BD3CC9BE45DE }, %struct.body { [3 x double] [double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0], double 0.000000e+00, [3 x double] [double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715], double 0x3FA34C95D9AB33D8 }, %struct.body { [3 x double] [double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C], double 0.000000e+00, [3 x double] [double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4], double 0x3F871D490D07C637 }, %struct.body { [3 x double] [double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0], double 0.000000e+00, [3 x double] [double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C], double 0x3F5C3DD29CF41EB3 }, %struct.body { [3 x double] [double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540], double 0.000000e+00, [3 x double] [double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6], double 0x3F60A8F3531799AC }], align 8

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @offset_momentum(ptr noundef captures(none) %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %33, label %4

4:                                                ; preds = %2
  %5 = getelementptr inbounds nuw i8, ptr %0, i32 32
  %6 = load double, ptr %5, align 8, !tbaa !10
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 40
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 48
  %9 = load <2 x double>, ptr %7, align 8, !tbaa !10
  br label %10

10:                                               ; preds = %4, %10
  %11 = phi double [ %6, %4 ], [ %21, %10 ]
  %12 = phi i32 [ 0, %4 ], [ %31, %10 ]
  %13 = phi <2 x double> [ %9, %4 ], [ %28, %10 ]
  %14 = getelementptr inbounds nuw %struct.body, ptr %0, i32 %12
  %15 = getelementptr inbounds nuw i8, ptr %14, i32 32
  %16 = getelementptr inbounds nuw i8, ptr %14, i32 56
  %17 = load double, ptr %15, align 8, !tbaa !10
  %18 = load double, ptr %16, align 8, !tbaa !12
  %19 = fmul double %17, %18
  %20 = fdiv double %19, 0x4043BD3CC9BE45DE
  %21 = fsub double %11, %20
  store double %21, ptr %5, align 8, !tbaa !10
  %22 = getelementptr inbounds nuw i8, ptr %14, i32 40
  %23 = load <2 x double>, ptr %22, align 8, !tbaa !10
  %24 = insertelement <2 x double> poison, double %18, i64 0
  %25 = shufflevector <2 x double> %24, <2 x double> poison, <2 x i32> zeroinitializer
  %26 = fmul <2 x double> %23, %25
  %27 = fdiv <2 x double> %26, splat (double 0x4043BD3CC9BE45DE)
  %28 = fsub <2 x double> %13, %27
  %29 = extractelement <2 x double> %28, i64 0
  store double %29, ptr %7, align 8, !tbaa !10
  %30 = extractelement <2 x double> %28, i64 1
  store double %30, ptr %8, align 8, !tbaa !10
  %31 = add nuw i32 %12, 1
  %32 = icmp eq i32 %31, %1
  br i1 %32, label %33, label %10, !llvm.loop !14

33:                                               ; preds = %10, %2
  ret void
}

; Function Attrs: nounwind
define dso_local double @bodies_energy(ptr noundef readonly captures(none) %0, i32 noundef %1) local_unnamed_addr #1 {
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %57, label %7

4:                                                ; preds = %30, %7
  %5 = phi double [ %24, %7 ], [ %54, %30 ]
  %6 = icmp eq i32 %25, %1
  br i1 %6, label %57, label %7, !llvm.loop !16

7:                                                ; preds = %2, %4
  %8 = phi i32 [ %25, %4 ], [ 0, %2 ]
  %9 = phi double [ %5, %4 ], [ 0.000000e+00, %2 ]
  %10 = getelementptr inbounds nuw %struct.body, ptr %0, i32 %8
  %11 = getelementptr inbounds nuw i8, ptr %10, i32 56
  %12 = load double, ptr %11, align 8, !tbaa !12
  %13 = getelementptr inbounds nuw i8, ptr %10, i32 32
  %14 = load double, ptr %13, align 8, !tbaa !10
  %15 = getelementptr inbounds nuw i8, ptr %10, i32 40
  %16 = load double, ptr %15, align 8, !tbaa !10
  %17 = fmul double %16, %16
  %18 = tail call double @llvm.fmuladd.f64(double %14, double %14, double %17)
  %19 = getelementptr inbounds nuw i8, ptr %10, i32 48
  %20 = load double, ptr %19, align 8, !tbaa !10
  %21 = tail call double @llvm.fmuladd.f64(double %20, double %20, double %18)
  %22 = fmul double %12, %21
  %23 = fmul double %22, 5.000000e-01
  %24 = fadd double %9, %23
  %25 = add nuw i32 %8, 1
  %26 = icmp ult i32 %25, %1
  br i1 %26, label %27, label %4

27:                                               ; preds = %7
  %28 = getelementptr inbounds nuw i8, ptr %10, i32 8
  %29 = getelementptr inbounds nuw i8, ptr %10, i32 16
  br label %30

30:                                               ; preds = %27, %30
  %31 = phi i32 [ %55, %30 ], [ %25, %27 ]
  %32 = phi double [ %54, %30 ], [ %24, %27 ]
  %33 = getelementptr inbounds nuw %struct.body, ptr %0, i32 %31
  %34 = load double, ptr %10, align 8, !tbaa !10
  %35 = load double, ptr %33, align 8, !tbaa !10
  %36 = fsub double %34, %35
  %37 = load double, ptr %28, align 8, !tbaa !10
  %38 = getelementptr inbounds nuw i8, ptr %33, i32 8
  %39 = load double, ptr %38, align 8, !tbaa !10
  %40 = fsub double %37, %39
  %41 = load double, ptr %29, align 8, !tbaa !10
  %42 = getelementptr inbounds nuw i8, ptr %33, i32 16
  %43 = load double, ptr %42, align 8, !tbaa !10
  %44 = fsub double %41, %43
  %45 = fmul double %40, %40
  %46 = tail call double @llvm.fmuladd.f64(double %36, double %36, double %45)
  %47 = tail call double @llvm.fmuladd.f64(double %44, double %44, double %46)
  %48 = tail call double @sqrt(double noundef %47) #6
  %49 = load double, ptr %11, align 8, !tbaa !12
  %50 = getelementptr inbounds nuw i8, ptr %33, i32 56
  %51 = load double, ptr %50, align 8, !tbaa !12
  %52 = fmul double %49, %51
  %53 = fdiv double %52, %48
  %54 = fsub double %32, %53
  %55 = add nuw i32 %31, 1
  %56 = icmp eq i32 %55, %1
  br i1 %56, label %4, label %30, !llvm.loop !17

57:                                               ; preds = %4, %2
  %58 = phi double [ 0.000000e+00, %2 ], [ %5, %4 ]
  ret double %58
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #2

declare dso_local double @sqrt(double noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local void @initialise_benchmark() local_unnamed_addr #4 {
  ret void
}

; Function Attrs: nounwind
define dso_local void @warm_caches(i32 noundef %0) local_unnamed_addr #1 {
  %2 = tail call fastcc i32 @benchmark_body(i32 noundef %0) #7
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc range(i32 0, 2) i32 @benchmark_body(i32 noundef %0) unnamed_addr #5 {
  %2 = icmp sgt i32 %0, 0
  br i1 %2, label %3, label %135

3:                                                ; preds = %1, %130
  %4 = phi i32 [ %131, %130 ], [ 0, %1 ]
  %5 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 32), align 8, !tbaa !10
  %6 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 40), align 8, !tbaa !10
  %7 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 48), align 8, !tbaa !10
  %8 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 56), align 8, !tbaa !12
  %9 = fmul double %5, %8
  %10 = fdiv double %9, 0x4043BD3CC9BE45DE
  %11 = fsub double %5, %10
  %12 = fmul double %8, %6
  %13 = fdiv double %12, 0x4043BD3CC9BE45DE
  %14 = fsub double %6, %13
  %15 = fmul double %8, %7
  %16 = fdiv double %15, 0x4043BD3CC9BE45DE
  %17 = fsub double %7, %16
  %18 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 96), align 8, !tbaa !10
  %19 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 120), align 8, !tbaa !12
  %20 = fmul double %18, %19
  %21 = fdiv double %20, 0x4043BD3CC9BE45DE
  %22 = fsub double %11, %21
  %23 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 104), align 8, !tbaa !10
  %24 = fmul double %19, %23
  %25 = fdiv double %24, 0x4043BD3CC9BE45DE
  %26 = fsub double %14, %25
  %27 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 112), align 8, !tbaa !10
  %28 = fmul double %19, %27
  %29 = fdiv double %28, 0x4043BD3CC9BE45DE
  %30 = fsub double %17, %29
  %31 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 160), align 8, !tbaa !10
  %32 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 184), align 8, !tbaa !12
  %33 = fmul double %31, %32
  %34 = fdiv double %33, 0x4043BD3CC9BE45DE
  %35 = fsub double %22, %34
  %36 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 168), align 8, !tbaa !10
  %37 = fmul double %32, %36
  %38 = fdiv double %37, 0x4043BD3CC9BE45DE
  %39 = fsub double %26, %38
  %40 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 176), align 8, !tbaa !10
  %41 = fmul double %32, %40
  %42 = fdiv double %41, 0x4043BD3CC9BE45DE
  %43 = fsub double %30, %42
  %44 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 224), align 8, !tbaa !10
  %45 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 248), align 8, !tbaa !12
  %46 = fmul double %44, %45
  %47 = fdiv double %46, 0x4043BD3CC9BE45DE
  %48 = fsub double %35, %47
  %49 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 232), align 8, !tbaa !10
  %50 = fmul double %45, %49
  %51 = fdiv double %50, 0x4043BD3CC9BE45DE
  %52 = fsub double %39, %51
  %53 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 240), align 8, !tbaa !10
  %54 = fmul double %45, %53
  %55 = fdiv double %54, 0x4043BD3CC9BE45DE
  %56 = fsub double %43, %55
  %57 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 288), align 8, !tbaa !10
  %58 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 312), align 8, !tbaa !12
  %59 = fmul double %57, %58
  %60 = fdiv double %59, 0x4043BD3CC9BE45DE
  %61 = fsub double %48, %60
  store double %61, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 32), align 8, !tbaa !10
  %62 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 296), align 8, !tbaa !10
  %63 = fmul double %58, %62
  %64 = fdiv double %63, 0x4043BD3CC9BE45DE
  %65 = fsub double %52, %64
  store double %65, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 40), align 8, !tbaa !10
  %66 = load double, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 304), align 8, !tbaa !10
  %67 = fmul double %58, %66
  %68 = fdiv double %67, 0x4043BD3CC9BE45DE
  %69 = fsub double %56, %68
  store double %69, ptr getelementptr inbounds nuw (i8, ptr @solar_bodies, i32 48), align 8, !tbaa !10
  br label %70

70:                                               ; preds = %3, %126
  %71 = phi i32 [ %128, %126 ], [ 0, %3 ]
  %72 = phi double [ %127, %126 ], [ 0.000000e+00, %3 ]
  br label %76

73:                                               ; preds = %99, %76
  %74 = phi double [ %93, %76 ], [ %123, %99 ]
  %75 = icmp eq i32 %94, 5
  br i1 %75, label %126, label %76, !llvm.loop !16

76:                                               ; preds = %70, %73
  %77 = phi i32 [ %94, %73 ], [ 0, %70 ]
  %78 = phi double [ %74, %73 ], [ 0.000000e+00, %70 ]
  %79 = getelementptr inbounds nuw %struct.body, ptr @solar_bodies, i32 %77
  %80 = getelementptr inbounds nuw i8, ptr %79, i32 56
  %81 = load double, ptr %80, align 8, !tbaa !12
  %82 = getelementptr inbounds nuw i8, ptr %79, i32 32
  %83 = load double, ptr %82, align 8, !tbaa !10
  %84 = getelementptr inbounds nuw i8, ptr %79, i32 40
  %85 = load double, ptr %84, align 8, !tbaa !10
  %86 = fmul double %85, %85
  %87 = tail call double @llvm.fmuladd.f64(double %83, double %83, double %86)
  %88 = getelementptr inbounds nuw i8, ptr %79, i32 48
  %89 = load double, ptr %88, align 8, !tbaa !10
  %90 = tail call double @llvm.fmuladd.f64(double %89, double %89, double %87)
  %91 = fmul double %81, %90
  %92 = fmul double %91, 5.000000e-01
  %93 = fadd double %78, %92
  %94 = add nuw nsw i32 %77, 1
  %95 = icmp samesign ult i32 %77, 4
  br i1 %95, label %96, label %73

96:                                               ; preds = %76
  %97 = getelementptr inbounds nuw i8, ptr %79, i32 8
  %98 = getelementptr inbounds nuw i8, ptr %79, i32 16
  br label %99

99:                                               ; preds = %99, %96
  %100 = phi i32 [ %124, %99 ], [ %94, %96 ]
  %101 = phi double [ %123, %99 ], [ %93, %96 ]
  %102 = getelementptr inbounds nuw %struct.body, ptr @solar_bodies, i32 %100
  %103 = load double, ptr %79, align 8, !tbaa !10
  %104 = load double, ptr %102, align 8, !tbaa !10
  %105 = fsub double %103, %104
  %106 = load double, ptr %97, align 8, !tbaa !10
  %107 = getelementptr inbounds nuw i8, ptr %102, i32 8
  %108 = load double, ptr %107, align 8, !tbaa !10
  %109 = fsub double %106, %108
  %110 = load double, ptr %98, align 8, !tbaa !10
  %111 = getelementptr inbounds nuw i8, ptr %102, i32 16
  %112 = load double, ptr %111, align 8, !tbaa !10
  %113 = fsub double %110, %112
  %114 = fmul double %109, %109
  %115 = tail call double @llvm.fmuladd.f64(double %105, double %105, double %114)
  %116 = tail call double @llvm.fmuladd.f64(double %113, double %113, double %115)
  %117 = tail call double @sqrt(double noundef %116) #6
  %118 = load double, ptr %80, align 8, !tbaa !12
  %119 = getelementptr inbounds nuw i8, ptr %102, i32 56
  %120 = load double, ptr %119, align 8, !tbaa !12
  %121 = fmul double %118, %120
  %122 = fdiv double %121, %117
  %123 = fsub double %101, %122
  %124 = add nuw i32 %100, 1
  %125 = icmp eq i32 %124, 5
  br i1 %125, label %73, label %99, !llvm.loop !17

126:                                              ; preds = %73
  %127 = fadd double %72, %74
  %128 = add nuw nsw i32 %71, 1
  %129 = icmp eq i32 %128, 100
  br i1 %129, label %130, label %70, !llvm.loop !18

130:                                              ; preds = %126
  %131 = add nuw nsw i32 %4, 1
  %132 = icmp eq i32 %131, %0
  br i1 %132, label %133, label %3, !llvm.loop !19

133:                                              ; preds = %130
  %134 = fadd double %127, 0x4030E852FE60EF84
  br label %135

135:                                              ; preds = %133, %1
  %136 = phi double [ 0x4030E852FE60EF84, %1 ], [ %134, %133 ]
  %137 = tail call double @fabs(double noundef %136) #6
  %138 = fcmp olt double %137, 1.000000e-13
  %139 = zext i1 %138 to i32
  ret i32 %139
}

; Function Attrs: noinline nounwind
define dso_local range(i32 0, 2) i32 @benchmark() local_unnamed_addr #5 {
  %1 = tail call fastcc i32 @benchmark_body(i32 noundef 1) #7
  ret i32 %1
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @verify_benchmark(i32 noundef %0) local_unnamed_addr #1 {
  %2 = icmp eq i32 %0, 0
  br i1 %2, label %63, label %6

3:                                                ; preds = %47
  %4 = add nuw nsw i32 %7, 1
  %5 = icmp eq i32 %4, 5
  br i1 %5, label %63, label %6, !llvm.loop !20

6:                                                ; preds = %1, %3
  %7 = phi i32 [ %4, %3 ], [ 0, %1 ]
  %8 = getelementptr inbounds nuw %struct.body, ptr @solar_bodies, i32 %7
  %9 = getelementptr inbounds nuw %struct.body, ptr @verify_benchmark.expected, i32 %7
  %10 = load double, ptr %8, align 8, !tbaa !10
  %11 = load double, ptr %9, align 8, !tbaa !10
  %12 = fsub double %10, %11
  %13 = tail call double @fabs(double noundef %12) #6
  %14 = fcmp olt double %13, 1.000000e-13
  br i1 %14, label %55, label %63

15:                                               ; preds = %55
  %16 = getelementptr inbounds nuw i8, ptr %8, i32 8
  %17 = load double, ptr %16, align 8, !tbaa !10
  %18 = getelementptr inbounds nuw i8, ptr %9, i32 8
  %19 = load double, ptr %18, align 8, !tbaa !10
  %20 = fsub double %17, %19
  %21 = tail call double @fabs(double noundef %20) #6
  %22 = fcmp olt double %21, 1.000000e-13
  br i1 %22, label %23, label %63

23:                                               ; preds = %15
  %24 = getelementptr inbounds nuw i8, ptr %8, i32 40
  %25 = load double, ptr %24, align 8, !tbaa !10
  %26 = getelementptr inbounds nuw i8, ptr %9, i32 40
  %27 = load double, ptr %26, align 8, !tbaa !10
  %28 = fsub double %25, %27
  %29 = tail call double @fabs(double noundef %28) #6
  %30 = fcmp olt double %29, 1.000000e-13
  br i1 %30, label %31, label %63

31:                                               ; preds = %23
  %32 = getelementptr inbounds nuw i8, ptr %8, i32 16
  %33 = load double, ptr %32, align 8, !tbaa !10
  %34 = getelementptr inbounds nuw i8, ptr %9, i32 16
  %35 = load double, ptr %34, align 8, !tbaa !10
  %36 = fsub double %33, %35
  %37 = tail call double @fabs(double noundef %36) #6
  %38 = fcmp olt double %37, 1.000000e-13
  br i1 %38, label %39, label %63

39:                                               ; preds = %31
  %40 = getelementptr inbounds nuw i8, ptr %8, i32 48
  %41 = load double, ptr %40, align 8, !tbaa !10
  %42 = getelementptr inbounds nuw i8, ptr %9, i32 48
  %43 = load double, ptr %42, align 8, !tbaa !10
  %44 = fsub double %41, %43
  %45 = tail call double @fabs(double noundef %44) #6
  %46 = fcmp olt double %45, 1.000000e-13
  br i1 %46, label %47, label %63

47:                                               ; preds = %39
  %48 = getelementptr inbounds nuw i8, ptr %8, i32 56
  %49 = load double, ptr %48, align 8, !tbaa !12
  %50 = getelementptr inbounds nuw i8, ptr %9, i32 56
  %51 = load double, ptr %50, align 8, !tbaa !12
  %52 = fsub double %49, %51
  %53 = tail call double @fabs(double noundef %52) #6
  %54 = fcmp olt double %53, 1.000000e-13
  br i1 %54, label %3, label %63

55:                                               ; preds = %6
  %56 = getelementptr inbounds nuw i8, ptr %9, i32 32
  %57 = getelementptr inbounds nuw i8, ptr %8, i32 32
  %58 = load double, ptr %57, align 8, !tbaa !10
  %59 = load double, ptr %56, align 8, !tbaa !10
  %60 = fsub double %58, %59
  %61 = tail call double @fabs(double noundef %60) #6
  %62 = fcmp olt double %61, 1.000000e-13
  br i1 %62, label %15, label %63

63:                                               ; preds = %3, %47, %55, %6, %15, %23, %31, %39, %1
  %64 = phi i32 [ 0, %1 ], [ 1, %3 ], [ 0, %47 ], [ 0, %6 ], [ 0, %15 ], [ 0, %23 ], [ 0, %31 ], [ 0, %39 ], [ 0, %55 ]
  ret i32 %64
}

declare dso_local double @fabs(double noundef) local_unnamed_addr #3

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #5 = { noinline nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #6 = { nobuiltin nounwind "no-builtins" }
attributes #7 = { nobuiltin "no-builtins" }

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
!11 = !{!"double", !8, i64 0}
!12 = !{!13, !11, i64 56}
!13 = !{!"body", !8, i64 0, !11, i64 24, !8, i64 32, !11, i64 56}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !15}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !15}
!19 = distinct !{!19, !15}
!20 = distinct !{!20, !15}
