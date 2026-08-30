; ModuleID = 'D:\project\writing\reserch\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1\resources\corpus\embench\src\matmult-int\matmult-int.c'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\\resume1\\resources\\corpus\\embench\\src\\matmult-int\\matmult-int.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

@Seed = dso_local local_unnamed_addr global i32 0, align 4
@ArrayA_ref = dso_local global [20 x [20 x i32]] zeroinitializer, align 4
@ArrayB_ref = dso_local global [20 x [20 x i32]] zeroinitializer, align 4
@__const.verify_benchmark.exp = private unnamed_addr constant [20 x [20 x i32]] [[20 x i32] [i32 291018000, i32 315000075, i32 279049970, i32 205074215, i32 382719905, i32 302595865, i32 348060915, i32 308986330, i32 343160760, i32 307099935, i32 292564810, i32 240954510, i32 232755815, i32 246511665, i32 328466830, i32 263664375, i32 324016395, i32 334656070, i32 285978755, i32 345370360], [20 x i32] [i32 252241835, i32 333432715, i32 299220275, i32 247745815, i32 422508990, i32 316728505, i32 359662270, i32 277775280, i32 323336795, i32 320656600, i32 249903690, i32 251499360, i32 242195700, i32 263484280, i32 348207635, i32 289485100, i32 328607555, i32 300799835, i32 269351410, i32 305703460], [20 x i32] [i32 304901010, i32 316252815, i32 263230275, i32 208939015, i32 421993740, i32 335002930, i32 348571170, i32 280992155, i32 289749970, i32 259701175, i32 295249990, i32 310900035, i32 250896625, i32 250154105, i32 315096035, i32 236364800, i32 312879355, i32 312580685, i32 275998435, i32 344137885], [20 x i32] [i32 286700525, i32 325985600, i32 253054970, i32 224361490, i32 353502130, i32 306544290, i32 323492140, i32 259123905, i32 307731610, i32 282414410, i32 281127810, i32 246936935, i32 207890815, i32 233789540, i32 339836730, i32 277296350, i32 319925620, i32 307470895, i32 290537580, i32 292297535], [20 x i32] [i32 272571255, i32 377663320, i32 304545985, i32 263001340, i32 375034885, i32 325423710, i32 410620380, i32 313191730, i32 356989815, i32 308508355, i32 218003850, i32 272487135, i32 266000220, i32 264734710, i32 367539620, i32 304146675, i32 355295500, i32 276019740, i32 251415695, i32 301225235], [20 x i32] [i32 272547900, i32 321522300, i32 288294345, i32 247748015, i32 389912855, i32 331874890, i32 370798315, i32 315467255, i32 367554485, i32 311947660, i32 258809685, i32 270536510, i32 256730515, i32 287143040, i32 363087030, i32 285672775, i32 353670120, i32 304219695, i32 274897255, i32 324684660], [20 x i32] [i32 233123995, i32 227142480, i32 212655155, i32 198592290, i32 345335250, i32 302661845, i32 253374925, i32 233243305, i32 233750030, i32 224590040, i32 200404820, i32 250791135, i32 234405760, i32 211723645, i32 280630165, i32 185245875, i32 296423665, i32 276278575, i32 252368265, i32 278726535], [20 x i32] [i32 277690535, i32 339615440, i32 320921550, i32 307114315, i32 400187215, i32 334374655, i32 376286920, i32 295993530, i32 362988020, i32 356272700, i32 293965465, i32 261574710, i32 259690975, i32 263037705, i32 416748985, i32 274683275, i32 385571030, i32 402782385, i32 323927010, i32 362778710], [20 x i32] [i32 267168970, i32 323401680, i32 279474330, i32 201934365, i32 362624300, i32 330736145, i32 371793675, i32 299650280, i32 333646005, i32 264791490, i32 215918320, i32 277512760, i32 264068435, i32 234555295, i32 321772515, i32 217507025, i32 310372440, i32 317544750, i32 245525965, i32 343183435], [20 x i32] [i32 281293570, i32 326519505, i32 233494705, i32 238516065, i32 297038200, i32 266273420, i32 349521550, i32 259343530, i32 306032255, i32 266397915, i32 210274920, i32 263743085, i32 231689610, i32 251949545, i32 293562740, i32 226822900, i32 309225440, i32 286212000, i32 206108715, i32 236678985], [20 x i32] [i32 288404350, i32 310319375, i32 282695670, i32 244150740, i32 426489380, i32 387525790, i32 342018190, i32 326086505, i32 352250260, i32 319997735, i32 300645835, i32 284822660, i32 271837440, i32 274000415, i32 361826730, i32 252399600, i32 348582320, i32 375813820, i32 316588255, i32 322499110], [20 x i32] [i32 273368780, i32 329706295, i32 288668335, i32 234501665, i32 381962610, i32 343186285, i32 337520205, i32 259637405, i32 295755465, i32 284778105, i32 205310525, i32 249598310, i32 256662470, i32 251533535, i32 336159770, i32 249342150, i32 333559450, i32 329296590, i32 278254845, i32 300673860], [20 x i32] [i32 318589575, i32 315522800, i32 260632295, i32 250009765, i32 337127730, i32 312810490, i32 346698590, i32 260810030, i32 388289910, i32 337081285, i32 283635410, i32 208148610, i32 234123865, i32 259653165, i32 370115255, i32 243311450, i32 377808245, i32 358786770, i32 286839730, i32 321912835], [20 x i32] [i32 229541925, i32 253967450, i32 223002545, i32 202302515, i32 303446955, i32 268472740, i32 285580065, i32 211013405, i32 287677960, i32 279773910, i32 227377310, i32 197461135, i32 222469715, i32 179536615, i32 306957380, i32 178407075, i32 281051570, i32 279718120, i32 234868230, i32 288991535], [20 x i32] [i32 290692955, i32 317729070, i32 297868235, i32 213450065, i32 469270935, i32 375344910, i32 326987580, i32 334565680, i32 325300040, i32 290325655, i32 254703825, i32 284914960, i32 245773820, i32 276641510, i32 323510795, i32 271034400, i32 337424250, i32 360011440, i32 281515520, i32 331261535], [20 x i32] [i32 287075125, i32 313194850, i32 269889345, i32 208109115, i32 420653930, i32 331900290, i32 355440665, i32 318065155, i32 343785360, i32 302163035, i32 308959360, i32 312666110, i32 268997740, i32 288557415, i32 370158305, i32 205012650, i32 318198795, i32 384484520, i32 316450105, i32 378714460], [20 x i32] [i32 278680580, i32 356815220, i32 307597060, i32 216073365, i32 390879235, i32 358775185, i32 358895230, i32 306434180, i32 315569040, i32 272688130, i32 249424325, i32 274584610, i32 273530970, i32 265450585, i32 325127920, i32 312802050, i32 317134900, i32 298518590, i32 269975470, i32 332586535], [20 x i32] [i32 245629780, i32 267021570, i32 234689035, i32 208808065, i32 366356035, i32 267059560, i32 349348005, i32 270158755, i32 348048340, i32 291550930, i32 272717800, i32 259714410, i32 236033845, i32 280627610, i32 335089770, i32 176610475, i32 259339950, i32 322752840, i32 236218295, i32 329687310], [20 x i32] [i32 226517370, i32 272306005, i32 271484080, i32 216145515, i32 400972075, i32 288475645, i32 332969550, i32 338410905, i32 329052205, i32 330392265, i32 306488095, i32 271979085, i32 232795960, i32 257593945, i32 339558165, i32 202700275, i32 320622065, i32 386350450, i32 315344865, i32 329233410], [20 x i32] [i32 224852610, i32 231292540, i32 236945875, i32 243273740, i32 336327040, i32 305144680, i32 248261920, i32 191671605, i32 241699245, i32 263085200, i32 198883715, i32 175742885, i32 202517850, i32 172427630, i32 296304160, i32 209188850, i32 326546955, i32 252990460, i32 238844535, i32 289753485]], align 4
@ResultArray = dso_local global [20 x [20 x i32]] zeroinitializer, align 4
@ArrayA = dso_local global [20 x [20 x i32]] zeroinitializer, align 4
@ArrayB = dso_local global [20 x [20 x i32]] zeroinitializer, align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @values_match(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i32 %0, %1
  %4 = zext i1 %3 to i32
  ret i32 %4
}

; Function Attrs: nounwind
define dso_local void @warm_caches(i32 noundef %0) local_unnamed_addr #1 {
  tail call fastcc void @benchmark_body(i32 noundef %0) #11
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: noinline nounwind
define internal fastcc void @benchmark_body(i32 noundef %0) unnamed_addr #3 {
  %2 = icmp sgt i32 %0, 0
  br i1 %2, label %3, label %91

3:                                                ; preds = %1, %88
  %4 = phi i32 [ %89, %88 ], [ 0, %1 ]
  %5 = tail call ptr @memcpy(ptr noundef nonnull @ArrayA, ptr noundef nonnull @ArrayA_ref, i32 noundef 1600) #12
  %6 = tail call ptr @memcpy(ptr noundef nonnull @ArrayB, ptr noundef nonnull @ArrayB_ref, i32 noundef 1600) #12
  br label %7

7:                                                ; preds = %85, %3
  %8 = phi i32 [ 0, %3 ], [ %86, %85 ]
  %9 = getelementptr inbounds nuw [20 x i32], ptr @ResultArray, i32 %8
  %10 = getelementptr inbounds nuw [20 x i32], ptr @ArrayA, i32 %8
  %11 = getelementptr inbounds nuw i8, ptr %10, i32 64
  %12 = load <16 x i32>, ptr %10, align 4, !tbaa !10
  %13 = load <4 x i32>, ptr %11, align 4, !tbaa !10
  br label %14

14:                                               ; preds = %14, %7
  %15 = phi i32 [ 0, %7 ], [ %83, %14 ]
  %16 = getelementptr inbounds nuw i32, ptr %9, i32 %15
  %17 = getelementptr inbounds nuw i32, ptr @ArrayB, i32 %15
  %18 = load i32, ptr %17, align 4, !tbaa !10
  %19 = getelementptr inbounds nuw i8, ptr %17, i32 80
  %20 = load i32, ptr %19, align 4, !tbaa !10
  %21 = getelementptr inbounds nuw i8, ptr %17, i32 160
  %22 = load i32, ptr %21, align 4, !tbaa !10
  %23 = getelementptr inbounds nuw i8, ptr %17, i32 240
  %24 = load i32, ptr %23, align 4, !tbaa !10
  %25 = getelementptr inbounds nuw i8, ptr %17, i32 320
  %26 = load i32, ptr %25, align 4, !tbaa !10
  %27 = getelementptr inbounds nuw i8, ptr %17, i32 400
  %28 = load i32, ptr %27, align 4, !tbaa !10
  %29 = getelementptr inbounds nuw i8, ptr %17, i32 480
  %30 = load i32, ptr %29, align 4, !tbaa !10
  %31 = getelementptr inbounds nuw i8, ptr %17, i32 560
  %32 = load i32, ptr %31, align 4, !tbaa !10
  %33 = getelementptr inbounds nuw i8, ptr %17, i32 640
  %34 = load i32, ptr %33, align 4, !tbaa !10
  %35 = getelementptr inbounds nuw i8, ptr %17, i32 720
  %36 = load i32, ptr %35, align 4, !tbaa !10
  %37 = getelementptr inbounds nuw i8, ptr %17, i32 800
  %38 = load i32, ptr %37, align 4, !tbaa !10
  %39 = getelementptr inbounds nuw i8, ptr %17, i32 880
  %40 = load i32, ptr %39, align 4, !tbaa !10
  %41 = getelementptr inbounds nuw i8, ptr %17, i32 960
  %42 = load i32, ptr %41, align 4, !tbaa !10
  %43 = getelementptr inbounds nuw i8, ptr %17, i32 1040
  %44 = load i32, ptr %43, align 4, !tbaa !10
  %45 = getelementptr inbounds nuw i8, ptr %17, i32 1120
  %46 = load i32, ptr %45, align 4, !tbaa !10
  %47 = getelementptr inbounds nuw i8, ptr %17, i32 1200
  %48 = load i32, ptr %47, align 4, !tbaa !10
  %49 = insertelement <16 x i32> poison, i32 %18, i64 0
  %50 = insertelement <16 x i32> %49, i32 %20, i64 1
  %51 = insertelement <16 x i32> %50, i32 %22, i64 2
  %52 = insertelement <16 x i32> %51, i32 %24, i64 3
  %53 = insertelement <16 x i32> %52, i32 %26, i64 4
  %54 = insertelement <16 x i32> %53, i32 %28, i64 5
  %55 = insertelement <16 x i32> %54, i32 %30, i64 6
  %56 = insertelement <16 x i32> %55, i32 %32, i64 7
  %57 = insertelement <16 x i32> %56, i32 %34, i64 8
  %58 = insertelement <16 x i32> %57, i32 %36, i64 9
  %59 = insertelement <16 x i32> %58, i32 %38, i64 10
  %60 = insertelement <16 x i32> %59, i32 %40, i64 11
  %61 = insertelement <16 x i32> %60, i32 %42, i64 12
  %62 = insertelement <16 x i32> %61, i32 %44, i64 13
  %63 = insertelement <16 x i32> %62, i32 %46, i64 14
  %64 = insertelement <16 x i32> %63, i32 %48, i64 15
  %65 = mul nsw <16 x i32> %64, %12
  %66 = getelementptr inbounds nuw i8, ptr %17, i32 1280
  %67 = load i32, ptr %66, align 4, !tbaa !10
  %68 = getelementptr inbounds nuw i8, ptr %17, i32 1360
  %69 = load i32, ptr %68, align 4, !tbaa !10
  %70 = getelementptr inbounds nuw i8, ptr %17, i32 1440
  %71 = load i32, ptr %70, align 4, !tbaa !10
  %72 = getelementptr inbounds nuw i8, ptr %17, i32 1520
  %73 = load i32, ptr %72, align 4, !tbaa !10
  %74 = insertelement <4 x i32> poison, i32 %67, i64 0
  %75 = insertelement <4 x i32> %74, i32 %69, i64 1
  %76 = insertelement <4 x i32> %75, i32 %71, i64 2
  %77 = insertelement <4 x i32> %76, i32 %73, i64 3
  %78 = mul nsw <4 x i32> %77, %13
  %79 = shufflevector <4 x i32> %78, <4 x i32> poison, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %80 = add <16 x i32> %65, %79
  %81 = shufflevector <16 x i32> %80, <16 x i32> %65, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %82 = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %81)
  store i32 %82, ptr %16, align 4, !tbaa !10
  %83 = add nuw nsw i32 %15, 1
  %84 = icmp eq i32 %83, 20
  br i1 %84, label %85, label %14, !llvm.loop !12

85:                                               ; preds = %14
  %86 = add nuw nsw i32 %8, 1
  %87 = icmp eq i32 %86, 20
  br i1 %87, label %88, label %7, !llvm.loop !14

88:                                               ; preds = %85
  %89 = add nuw nsw i32 %4, 1
  %90 = icmp eq i32 %89, %0
  br i1 %90, label %91, label %3, !llvm.loop !15

91:                                               ; preds = %88, %1
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: noinline nounwind
define dso_local noundef i32 @benchmark() local_unnamed_addr #3 {
  tail call fastcc void @benchmark_body(i32 noundef 46) #11
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @InitSeed() local_unnamed_addr #4 {
  store i32 0, ptr @Seed, align 4, !tbaa !6
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @Test(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef writeonly captures(none) %2) local_unnamed_addr #5 {
  br label %4

4:                                                ; preds = %26, %3
  %5 = phi i32 [ 0, %3 ], [ %27, %26 ]
  %6 = getelementptr inbounds nuw [20 x i32], ptr %2, i32 %5
  %7 = getelementptr inbounds nuw [20 x i32], ptr %0, i32 %5
  br label %8

8:                                                ; preds = %23, %4
  %9 = phi i32 [ 0, %4 ], [ %24, %23 ]
  %10 = getelementptr inbounds nuw i32, ptr %6, i32 %9
  store i32 0, ptr %10, align 4, !tbaa !10
  %11 = getelementptr inbounds nuw i32, ptr %1, i32 %9
  br label %12

12:                                               ; preds = %12, %8
  %13 = phi i32 [ 0, %8 ], [ %21, %12 ]
  %14 = phi i32 [ 0, %8 ], [ %20, %12 ]
  %15 = getelementptr inbounds nuw i32, ptr %7, i32 %13
  %16 = load i32, ptr %15, align 4, !tbaa !10
  %17 = getelementptr inbounds nuw [20 x i32], ptr %11, i32 %13
  %18 = load i32, ptr %17, align 4, !tbaa !10
  %19 = mul nsw i32 %18, %16
  %20 = add nsw i32 %19, %14
  store i32 %20, ptr %10, align 4, !tbaa !10
  %21 = add nuw nsw i32 %13, 1
  %22 = icmp eq i32 %21, 20
  br i1 %22, label %23, label %12, !llvm.loop !16

23:                                               ; preds = %12
  %24 = add nuw nsw i32 %9, 1
  %25 = icmp eq i32 %24, 20
  br i1 %25, label %26, label %8, !llvm.loop !12

26:                                               ; preds = %23
  %27 = add nuw nsw i32 %5, 1
  %28 = icmp eq i32 %27, 20
  br i1 %28, label %29, label %4, !llvm.loop !14

29:                                               ; preds = %26
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @Multiply(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef writeonly captures(none) %2) local_unnamed_addr #5 {
  br label %4

4:                                                ; preds = %3, %26
  %5 = phi i32 [ 0, %3 ], [ %27, %26 ]
  %6 = getelementptr inbounds nuw [20 x i32], ptr %2, i32 %5
  %7 = getelementptr inbounds nuw [20 x i32], ptr %0, i32 %5
  br label %8

8:                                                ; preds = %4, %23
  %9 = phi i32 [ 0, %4 ], [ %24, %23 ]
  %10 = getelementptr inbounds nuw i32, ptr %6, i32 %9
  store i32 0, ptr %10, align 4, !tbaa !10
  %11 = getelementptr inbounds nuw i32, ptr %1, i32 %9
  br label %12

12:                                               ; preds = %8, %12
  %13 = phi i32 [ 0, %8 ], [ %21, %12 ]
  %14 = phi i32 [ 0, %8 ], [ %20, %12 ]
  %15 = getelementptr inbounds nuw i32, ptr %7, i32 %13
  %16 = load i32, ptr %15, align 4, !tbaa !10
  %17 = getelementptr inbounds nuw [20 x i32], ptr %11, i32 %13
  %18 = load i32, ptr %17, align 4, !tbaa !10
  %19 = mul nsw i32 %18, %16
  %20 = add nsw i32 %14, %19
  store i32 %20, ptr %10, align 4, !tbaa !10
  %21 = add nuw nsw i32 %13, 1
  %22 = icmp eq i32 %21, 20
  br i1 %22, label %23, label %12, !llvm.loop !16

23:                                               ; preds = %12
  %24 = add nuw nsw i32 %9, 1
  %25 = icmp eq i32 %24, 20
  br i1 %25, label %26, label %8, !llvm.loop !12

26:                                               ; preds = %23
  %27 = add nuw nsw i32 %5, 1
  %28 = icmp eq i32 %27, 20
  br i1 %28, label %29, label %4, !llvm.loop !14

29:                                               ; preds = %26
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 -8094, 8095) i32 @RandomInteger() local_unnamed_addr #6 {
  %1 = load i32, ptr @Seed, align 4, !tbaa !6
  %2 = mul nsw i32 %1, 133
  %3 = add nsw i32 %2, 81
  %4 = srem i32 %3, 8095
  store i32 %4, ptr @Seed, align 4, !tbaa !6
  ret i32 %4
}

; Function Attrs: nofree norecurse nosync nounwind memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @initialise_benchmark() local_unnamed_addr #7 {
  br label %1

1:                                                ; preds = %0, %14
  %2 = phi i32 [ 0, %0 ], [ %15, %14 ]
  %3 = phi i32 [ 0, %0 ], [ %10, %14 ]
  %4 = getelementptr inbounds nuw [20 x i32], ptr @ArrayA_ref, i32 %2
  br label %5

5:                                                ; preds = %1, %5
  %6 = phi i32 [ 0, %1 ], [ %12, %5 ]
  %7 = phi i32 [ %3, %1 ], [ %10, %5 ]
  %8 = mul nuw nsw i32 %7, 133
  %9 = add nuw nsw i32 %8, 81
  %10 = urem i32 %9, 8095
  %11 = getelementptr inbounds nuw i32, ptr %4, i32 %6
  store i32 %10, ptr %11, align 4, !tbaa !10
  %12 = add nuw nsw i32 %6, 1
  %13 = icmp eq i32 %12, 20
  br i1 %13, label %14, label %5, !llvm.loop !17

14:                                               ; preds = %5
  %15 = add nuw nsw i32 %2, 1
  %16 = icmp eq i32 %15, 20
  br i1 %16, label %17, label %1, !llvm.loop !18

17:                                               ; preds = %14, %30
  %18 = phi i32 [ %31, %30 ], [ 0, %14 ]
  %19 = phi i32 [ %26, %30 ], [ %10, %14 ]
  %20 = getelementptr inbounds nuw [20 x i32], ptr @ArrayB_ref, i32 %18
  br label %21

21:                                               ; preds = %17, %21
  %22 = phi i32 [ 0, %17 ], [ %28, %21 ]
  %23 = phi i32 [ %19, %17 ], [ %26, %21 ]
  %24 = mul nuw nsw i32 %23, 133
  %25 = add nuw nsw i32 %24, 81
  %26 = urem i32 %25, 8095
  %27 = getelementptr inbounds nuw i32, ptr %20, i32 %22
  store i32 %26, ptr %27, align 4, !tbaa !10
  %28 = add nuw nsw i32 %22, 1
  %29 = icmp eq i32 %28, 20
  br i1 %29, label %30, label %21, !llvm.loop !19

30:                                               ; preds = %21
  %31 = add nuw nsw i32 %18, 1
  %32 = icmp eq i32 %31, 20
  br i1 %32, label %33, label %17, !llvm.loop !20

33:                                               ; preds = %30
  store i32 %26, ptr @Seed, align 4, !tbaa !6
  ret void
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @verify_benchmark(i32 noundef %0) local_unnamed_addr #1 {
  %2 = alloca [20 x [20 x i32]], align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #13
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 4 dereferenceable(1600) %2, ptr noundef nonnull align 4 dereferenceable(1600) @__const.verify_benchmark.exp, i32 1600, i1 false)
  %3 = call i32 @memcmp(ptr noundef nonnull @ResultArray, ptr noundef nonnull %2, i32 noundef 1600) #12
  %4 = icmp eq i32 %3, 0
  %5 = zext i1 %4 to i32
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #13
  ret i32 %5
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #8

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #9

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #9

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v16i32(<16 x i32>) #10

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { noinline nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #5 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #7 = { nofree norecurse nosync nounwind memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #8 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #9 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #10 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #11 = { nobuiltin "no-builtins" }
attributes #12 = { nobuiltin nounwind "no-builtins" }
attributes #13 = { nounwind }

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
