; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1\resources\corpus\embench\src\ud\libud.c'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\\resume1\\resources\\corpus\\embench\\src\\ud\\libud.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

@x = dso_local global [20 x i32] zeroinitializer, align 4
@a = dso_local local_unnamed_addr global [20 x [20 x i32]] zeroinitializer, align 4
@b = dso_local local_unnamed_addr global [20 x i32] zeroinitializer, align 4
@chkerr = dso_local global i32 0, align 4

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @verify_benchmark(i32 noundef %0) local_unnamed_addr #0 {
  %2 = alloca [20 x i32], align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #8
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 4 dereferenceable(80) %2, i8 0, i32 80, i1 false)
  %3 = getelementptr inbounds nuw i8, ptr %2, i32 8
  store i32 1, ptr %3, align 4
  %4 = getelementptr inbounds nuw i8, ptr %2, i32 12
  store i32 1, ptr %4, align 4
  %5 = getelementptr inbounds nuw i8, ptr %2, i32 16
  store i32 1, ptr %5, align 4
  %6 = getelementptr inbounds nuw i8, ptr %2, i32 20
  store i32 2, ptr %6, align 4
  %7 = call i32 @memcmp(ptr noundef nonnull @x, ptr noundef nonnull %2, i32 noundef 80) #9
  %8 = or i32 %7, %0
  %9 = icmp eq i32 %8, 0
  %10 = zext i1 %9 to i32
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #8
  ret i32 %10
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #2

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local void @initialise_benchmark() local_unnamed_addr #4 {
  ret void
}

; Function Attrs: nofree norecurse nounwind memory(readwrite, target_mem0: none, target_mem1: none)
define dso_local void @warm_caches(i32 noundef %0) local_unnamed_addr #5 {
  %2 = tail call fastcc i32 @benchmark_body(i32 noundef %0) #10
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind memory(readwrite, target_mem0: none, target_mem1: none)
define internal fastcc i32 @benchmark_body(i32 noundef %0) unnamed_addr #6 {
  %2 = icmp sgt i32 %0, 0
  br i1 %2, label %3, label %8

3:                                                ; preds = %1, %3
  %4 = phi i32 [ %6, %3 ], [ 0, %1 ]
  store i32 4, ptr @a, align 4, !tbaa !10
  store i32 3, ptr getelementptr inbounds nuw (i8, ptr @a, i32 4), align 4, !tbaa !10
  store i32 4, ptr getelementptr inbounds nuw (i8, ptr @a, i32 8), align 4, !tbaa !10
  store i32 5, ptr getelementptr inbounds nuw (i8, ptr @a, i32 12), align 4, !tbaa !10
  store i32 6, ptr getelementptr inbounds nuw (i8, ptr @a, i32 16), align 4, !tbaa !10
  store i32 7, ptr getelementptr inbounds nuw (i8, ptr @a, i32 20), align 4, !tbaa !10
  store i32 29, ptr @b, align 4, !tbaa !10
  store i32 3, ptr getelementptr inbounds nuw (i8, ptr @a, i32 80), align 4, !tbaa !10
  store i32 8, ptr getelementptr inbounds nuw (i8, ptr @a, i32 84), align 4, !tbaa !10
  store i32 5, ptr getelementptr inbounds nuw (i8, ptr @a, i32 88), align 4, !tbaa !10
  store i32 6, ptr getelementptr inbounds nuw (i8, ptr @a, i32 92), align 4, !tbaa !10
  store i32 7, ptr getelementptr inbounds nuw (i8, ptr @a, i32 96), align 4, !tbaa !10
  store i32 8, ptr getelementptr inbounds nuw (i8, ptr @a, i32 100), align 4, !tbaa !10
  store i32 37, ptr getelementptr inbounds nuw (i8, ptr @b, i32 4), align 4, !tbaa !10
  store i32 4, ptr getelementptr inbounds nuw (i8, ptr @a, i32 160), align 4, !tbaa !10
  store i32 5, ptr getelementptr inbounds nuw (i8, ptr @a, i32 164), align 4, !tbaa !10
  store i32 12, ptr getelementptr inbounds nuw (i8, ptr @a, i32 168), align 4, !tbaa !10
  store i32 7, ptr getelementptr inbounds nuw (i8, ptr @a, i32 172), align 4, !tbaa !10
  store i32 8, ptr getelementptr inbounds nuw (i8, ptr @a, i32 176), align 4, !tbaa !10
  store i32 9, ptr getelementptr inbounds nuw (i8, ptr @a, i32 180), align 4, !tbaa !10
  store i32 45, ptr getelementptr inbounds nuw (i8, ptr @b, i32 8), align 4, !tbaa !10
  store i32 5, ptr getelementptr inbounds nuw (i8, ptr @a, i32 240), align 4, !tbaa !10
  store i32 6, ptr getelementptr inbounds nuw (i8, ptr @a, i32 244), align 4, !tbaa !10
  store i32 7, ptr getelementptr inbounds nuw (i8, ptr @a, i32 248), align 4, !tbaa !10
  store i32 16, ptr getelementptr inbounds nuw (i8, ptr @a, i32 252), align 4, !tbaa !10
  store i32 9, ptr getelementptr inbounds nuw (i8, ptr @a, i32 256), align 4, !tbaa !10
  store i32 10, ptr getelementptr inbounds nuw (i8, ptr @a, i32 260), align 4, !tbaa !10
  store i32 53, ptr getelementptr inbounds nuw (i8, ptr @b, i32 12), align 4, !tbaa !10
  store i32 6, ptr getelementptr inbounds nuw (i8, ptr @a, i32 320), align 4, !tbaa !10
  store i32 7, ptr getelementptr inbounds nuw (i8, ptr @a, i32 324), align 4, !tbaa !10
  store i32 8, ptr getelementptr inbounds nuw (i8, ptr @a, i32 328), align 4, !tbaa !10
  store i32 9, ptr getelementptr inbounds nuw (i8, ptr @a, i32 332), align 4, !tbaa !10
  store i32 20, ptr getelementptr inbounds nuw (i8, ptr @a, i32 336), align 4, !tbaa !10
  store i32 11, ptr getelementptr inbounds nuw (i8, ptr @a, i32 340), align 4, !tbaa !10
  store i32 61, ptr getelementptr inbounds nuw (i8, ptr @b, i32 16), align 4, !tbaa !10
  store i32 7, ptr getelementptr inbounds nuw (i8, ptr @a, i32 400), align 4, !tbaa !10
  store i32 8, ptr getelementptr inbounds nuw (i8, ptr @a, i32 404), align 4, !tbaa !10
  store i32 9, ptr getelementptr inbounds nuw (i8, ptr @a, i32 408), align 4, !tbaa !10
  store i32 10, ptr getelementptr inbounds nuw (i8, ptr @a, i32 412), align 4, !tbaa !10
  store i32 11, ptr getelementptr inbounds nuw (i8, ptr @a, i32 416), align 4, !tbaa !10
  store i32 24, ptr getelementptr inbounds nuw (i8, ptr @a, i32 420), align 4, !tbaa !10
  store i32 69, ptr getelementptr inbounds nuw (i8, ptr @b, i32 20), align 4, !tbaa !10
  %5 = tail call i32 @ludcmp(i32 poison, i32 noundef 5) #10
  store volatile i32 0, ptr @chkerr, align 4, !tbaa !6
  %6 = add nuw nsw i32 %4, 1
  %7 = icmp eq i32 %6, %0
  br i1 %7, label %8, label %3, !llvm.loop !12

8:                                                ; preds = %3, %1
  %9 = load volatile i32, ptr @chkerr, align 4, !tbaa !6
  ret i32 %9
}

; Function Attrs: nofree noinline norecurse nounwind memory(readwrite, target_mem0: none, target_mem1: none)
define dso_local i32 @benchmark() local_unnamed_addr #6 {
  %1 = tail call fastcc i32 @benchmark_body(i32 noundef 1478) #10
  ret i32 %1
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local noundef i32 @ludcmp(i32 %0, i32 noundef %1) local_unnamed_addr #7 {
  %3 = alloca [100 x i32], align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #8
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %10, label %5

5:                                                ; preds = %2
  %6 = load i32, ptr @b, align 4, !tbaa !10
  store i32 %6, ptr %3, align 4, !tbaa !10
  br label %83

7:                                                ; preds = %58
  %8 = add nuw i32 %11, 1
  %9 = icmp eq i32 %13, %1
  br i1 %9, label %61, label %10, !llvm.loop !14

10:                                               ; preds = %2, %7
  %11 = phi i32 [ %8, %7 ], [ 1, %2 ]
  %12 = phi i32 [ %13, %7 ], [ 0, %2 ]
  %13 = add nuw nsw i32 %12, 1
  %14 = icmp eq i32 %12, 0
  %15 = getelementptr inbounds nuw i32, ptr @a, i32 %12
  %16 = getelementptr inbounds nuw [20 x i32], ptr @a, i32 %12
  %17 = getelementptr inbounds nuw i32, ptr %16, i32 %12
  br label %20

18:                                               ; preds = %36
  %19 = getelementptr inbounds nuw [20 x i32], ptr @a, i32 %13
  br label %42

20:                                               ; preds = %10, %36
  %21 = phi i32 [ %13, %10 ], [ %40, %36 ]
  %22 = getelementptr inbounds nuw [20 x i32], ptr @a, i32 %21
  %23 = getelementptr inbounds nuw i32, ptr %22, i32 %12
  %24 = load i32, ptr %23, align 4, !tbaa !10
  br i1 %14, label %36, label %25

25:                                               ; preds = %20, %25
  %26 = phi i32 [ %33, %25 ], [ %24, %20 ]
  %27 = phi i32 [ %34, %25 ], [ 0, %20 ]
  %28 = getelementptr inbounds nuw i32, ptr %22, i32 %27
  %29 = load i32, ptr %28, align 4, !tbaa !10
  %30 = getelementptr inbounds nuw [20 x i32], ptr %15, i32 %27
  %31 = load i32, ptr %30, align 4, !tbaa !10
  %32 = mul nsw i32 %31, %29
  %33 = sub nsw i32 %26, %32
  %34 = add nuw nsw i32 %27, 1
  %35 = icmp eq i32 %34, %12
  br i1 %35, label %36, label %25, !llvm.loop !15

36:                                               ; preds = %25, %20
  %37 = phi i32 [ %24, %20 ], [ %33, %25 ]
  %38 = load i32, ptr %17, align 4, !tbaa !10
  %39 = sdiv i32 %37, %38
  store i32 %39, ptr %23, align 4, !tbaa !10
  %40 = add nuw i32 %21, 1
  %41 = icmp eq i32 %21, %1
  br i1 %41, label %18, label %20, !llvm.loop !16

42:                                               ; preds = %18, %58
  %43 = phi i32 [ %13, %18 ], [ %59, %58 ]
  %44 = getelementptr inbounds nuw i32, ptr %19, i32 %43
  %45 = load i32, ptr %44, align 4, !tbaa !10
  %46 = getelementptr inbounds nuw i32, ptr @a, i32 %43
  br label %47

47:                                               ; preds = %42, %47
  %48 = phi i32 [ %45, %42 ], [ %55, %47 ]
  %49 = phi i32 [ 0, %42 ], [ %56, %47 ]
  %50 = getelementptr inbounds nuw i32, ptr %19, i32 %49
  %51 = load i32, ptr %50, align 4, !tbaa !10
  %52 = getelementptr inbounds nuw [20 x i32], ptr %46, i32 %49
  %53 = load i32, ptr %52, align 4, !tbaa !10
  %54 = mul nsw i32 %53, %51
  %55 = sub nsw i32 %48, %54
  %56 = add nuw nsw i32 %49, 1
  %57 = icmp eq i32 %56, %11
  br i1 %57, label %58, label %47, !llvm.loop !17

58:                                               ; preds = %47
  store i32 %55, ptr %44, align 4, !tbaa !10
  %59 = add nuw i32 %43, 1
  %60 = icmp eq i32 %43, %1
  br i1 %60, label %7, label %42, !llvm.loop !18

61:                                               ; preds = %7
  %62 = load i32, ptr @b, align 4, !tbaa !10
  store i32 %62, ptr %3, align 4, !tbaa !10
  br label %63

63:                                               ; preds = %61, %79
  %64 = phi i32 [ %81, %79 ], [ 1, %61 ]
  %65 = getelementptr inbounds nuw i32, ptr @b, i32 %64
  %66 = load i32, ptr %65, align 4, !tbaa !10
  %67 = getelementptr inbounds nuw [20 x i32], ptr @a, i32 %64
  br label %68

68:                                               ; preds = %63, %68
  %69 = phi i32 [ %66, %63 ], [ %76, %68 ]
  %70 = phi i32 [ 0, %63 ], [ %77, %68 ]
  %71 = getelementptr inbounds nuw i32, ptr %67, i32 %70
  %72 = load i32, ptr %71, align 4, !tbaa !10
  %73 = getelementptr inbounds nuw i32, ptr %3, i32 %70
  %74 = load i32, ptr %73, align 4, !tbaa !10
  %75 = mul nsw i32 %74, %72
  %76 = sub nsw i32 %69, %75
  %77 = add nuw nsw i32 %70, 1
  %78 = icmp eq i32 %77, %64
  br i1 %78, label %79, label %68, !llvm.loop !19

79:                                               ; preds = %68
  %80 = getelementptr inbounds nuw i32, ptr %3, i32 %64
  store i32 %76, ptr %80, align 4, !tbaa !10
  %81 = add nuw i32 %64, 1
  %82 = icmp eq i32 %64, %1
  br i1 %82, label %83, label %63, !llvm.loop !20

83:                                               ; preds = %79, %5
  %84 = getelementptr inbounds i32, ptr %3, i32 %1
  %85 = load i32, ptr %84, align 4, !tbaa !10
  %86 = getelementptr inbounds [20 x i32], ptr @a, i32 %1
  %87 = getelementptr inbounds i32, ptr %86, i32 %1
  %88 = load i32, ptr %87, align 4, !tbaa !10
  %89 = sdiv i32 %85, %88
  %90 = getelementptr inbounds i32, ptr @x, i32 %1
  store i32 %89, ptr %90, align 4, !tbaa !10
  br i1 %4, label %91, label %118

91:                                               ; preds = %83, %110
  %92 = phi i32 [ %93, %110 ], [ %1, %83 ]
  %93 = add nsw i32 %92, -1
  %94 = getelementptr inbounds nuw i32, ptr %3, i32 %93
  %95 = load i32, ptr %94, align 4, !tbaa !10
  %96 = icmp sgt i32 %92, %1
  br i1 %96, label %110, label %97

97:                                               ; preds = %91
  %98 = getelementptr inbounds nuw [20 x i32], ptr @a, i32 %93
  br label %99

99:                                               ; preds = %97, %99
  %100 = phi i32 [ %95, %97 ], [ %107, %99 ]
  %101 = phi i32 [ %92, %97 ], [ %108, %99 ]
  %102 = getelementptr inbounds nuw i32, ptr %98, i32 %101
  %103 = load i32, ptr %102, align 4, !tbaa !10
  %104 = getelementptr inbounds nuw i32, ptr @x, i32 %101
  %105 = load i32, ptr %104, align 4, !tbaa !10
  %106 = mul nsw i32 %105, %103
  %107 = sub nsw i32 %100, %106
  %108 = add i32 %101, 1
  %109 = icmp eq i32 %101, %1
  br i1 %109, label %110, label %99, !llvm.loop !21

110:                                              ; preds = %99, %91
  %111 = phi i32 [ %95, %91 ], [ %107, %99 ]
  %112 = getelementptr inbounds nuw [20 x i32], ptr @a, i32 %93
  %113 = getelementptr inbounds nuw i32, ptr %112, i32 %93
  %114 = load i32, ptr %113, align 4, !tbaa !10
  %115 = sdiv i32 %111, %114
  %116 = getelementptr inbounds nuw i32, ptr @x, i32 %93
  store i32 %115, ptr %116, align 4, !tbaa !10
  %117 = icmp samesign ugt i32 %92, 1
  br i1 %117, label %91, label %118, !llvm.loop !22

118:                                              ; preds = %110, %83
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #8
  ret i32 0
}

attributes #0 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #5 = { nofree norecurse nounwind memory(readwrite, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #6 = { nofree noinline norecurse nounwind memory(readwrite, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #7 = { nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
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
!11 = !{!"long", !8, i64 0}
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
