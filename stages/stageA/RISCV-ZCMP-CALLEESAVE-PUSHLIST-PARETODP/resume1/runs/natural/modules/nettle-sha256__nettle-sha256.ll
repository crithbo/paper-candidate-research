; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1\resources\corpus\embench\src\nettle-sha256\nettle-sha256.c'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\\resume1\\resources\\corpus\\embench\\src\\nettle-sha256\\nettle-sha256.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

%struct.nettle_hash = type { ptr, i32, i32, i32, ptr, ptr, ptr }
%struct.sha256_ctx = type { [8 x i32], i64, [64 x i8], i32 }

@sha256_init.H0 = internal constant [8 x i32] [i32 1779033703, i32 -1150833019, i32 1013904242, i32 -1521486534, i32 1359893119, i32 -1694144372, i32 528734635, i32 1541459225], align 4
@K = internal constant [64 x i32] [i32 1116352408, i32 1899447441, i32 -1245643825, i32 -373957723, i32 961987163, i32 1508970993, i32 -1841331548, i32 -1424204075, i32 -670586216, i32 310598401, i32 607225278, i32 1426881987, i32 1925078388, i32 -2132889090, i32 -1680079193, i32 -1046744716, i32 -459576895, i32 -272742522, i32 264347078, i32 604807628, i32 770255983, i32 1249150122, i32 1555081692, i32 1996064986, i32 -1740746414, i32 -1473132947, i32 -1341970488, i32 -1084653625, i32 -958395405, i32 -710438585, i32 113926993, i32 338241895, i32 666307205, i32 773529912, i32 1294757372, i32 1396182291, i32 1695183700, i32 1986661051, i32 -2117940946, i32 -1838011259, i32 -1564481375, i32 -1474664885, i32 -1035236496, i32 -949202525, i32 -778901479, i32 -694614492, i32 -200395387, i32 275423344, i32 430227734, i32 506948616, i32 659060556, i32 883997877, i32 958139571, i32 1322822218, i32 1537002063, i32 1747873779, i32 1955562222, i32 2024104815, i32 -2067236844, i32 -1933114872, i32 -1866530822, i32 -1538233109, i32 -1090935817, i32 -965641998], align 4
@.str = private unnamed_addr constant [7 x i8] c"sha256\00", align 1
@nettle_sha256 = dso_local local_unnamed_addr constant %struct.nettle_hash { ptr @.str, i32 112, i32 32, i32 64, ptr @sha256_init, ptr @sha256_update, ptr @sha256_digest }, align 4
@msg = dso_local global [56 x i8] c"abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq", align 1
@hash = dso_local local_unnamed_addr global [32 x i8] c"$\8Dja\D2\068\B8\E5\C0&\93\0C>`9\A3<\E4Yd\FF!g\F6\EC\ED\D4\19\DB\06\C1", align 8
@buffer = dso_local global [32 x i8] zeroinitializer, align 8

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @_nettle_write_be32(i32 noundef %0, ptr noundef writeonly captures(none) %1, ptr noundef readonly captures(none) %2) local_unnamed_addr #0 {
  %4 = lshr i32 %0, 2
  %5 = and i32 %0, 3
  %6 = icmp eq i32 %4, 0
  br i1 %6, label %28, label %7

7:                                                ; preds = %3, %7
  %8 = phi ptr [ %26, %7 ], [ %1, %3 ]
  %9 = phi i32 [ %25, %7 ], [ 0, %3 ]
  %10 = getelementptr inbounds nuw i32, ptr %2, i32 %9
  %11 = load i32, ptr %10, align 4, !tbaa !6
  %12 = lshr i32 %11, 24
  %13 = trunc nuw i32 %12 to i8
  store i8 %13, ptr %8, align 1, !tbaa !10
  %14 = load i32, ptr %10, align 4, !tbaa !6
  %15 = lshr i32 %14, 16
  %16 = trunc i32 %15 to i8
  %17 = getelementptr inbounds nuw i8, ptr %8, i32 1
  store i8 %16, ptr %17, align 1, !tbaa !10
  %18 = load i32, ptr %10, align 4, !tbaa !6
  %19 = lshr i32 %18, 8
  %20 = trunc i32 %19 to i8
  %21 = getelementptr inbounds nuw i8, ptr %8, i32 2
  store i8 %20, ptr %21, align 1, !tbaa !10
  %22 = load i32, ptr %10, align 4, !tbaa !6
  %23 = trunc i32 %22 to i8
  %24 = getelementptr inbounds nuw i8, ptr %8, i32 3
  store i8 %23, ptr %24, align 1, !tbaa !10
  %25 = add nuw nsw i32 %9, 1
  %26 = getelementptr inbounds nuw i8, ptr %8, i32 4
  %27 = icmp eq i32 %25, %4
  br i1 %27, label %28, label %7, !llvm.loop !11

28:                                               ; preds = %7, %3
  %29 = phi ptr [ %1, %3 ], [ %26, %7 ]
  %30 = icmp eq i32 %5, 0
  br i1 %30, label %46, label %31

31:                                               ; preds = %28
  %32 = getelementptr inbounds nuw i32, ptr %2, i32 %4
  %33 = load i32, ptr %32, align 4, !tbaa !6
  switch i32 %5, label %34 [
    i32 3, label %35
    i32 2, label %39
    i32 1, label %43
  ]

34:                                               ; preds = %31
  unreachable

35:                                               ; preds = %31
  %36 = lshr i32 %33, 8
  %37 = trunc i32 %36 to i8
  %38 = getelementptr i8, ptr %29, i32 2
  store i8 %37, ptr %38, align 1, !tbaa !10
  br label %39

39:                                               ; preds = %31, %35
  %40 = lshr i32 %33, 16
  %41 = trunc i32 %40 to i8
  %42 = getelementptr inbounds nuw i8, ptr %29, i32 1
  store i8 %41, ptr %42, align 1, !tbaa !10
  br label %43

43:                                               ; preds = %31, %39
  %44 = lshr i32 %33, 24
  %45 = trunc nuw i32 %44 to i8
  store i8 %45, ptr %29, align 1, !tbaa !10
  br label %46

46:                                               ; preds = %43, %28
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @_nettle_sha256_compress(ptr noundef captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2) local_unnamed_addr #0 {
  %4 = alloca [16 x i32], align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #10
  %5 = load <4 x i8>, ptr %1, align 1, !tbaa !10
  %6 = zext <4 x i8> %5 to <4 x i32>
  %7 = shl nuw <4 x i32> %6, <i32 24, i32 16, i32 8, i32 0>
  %8 = tail call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %7)
  store i32 %8, ptr %4, align 4, !tbaa !6
  %9 = getelementptr inbounds nuw i8, ptr %1, i32 4
  %10 = load <4 x i8>, ptr %9, align 1, !tbaa !10
  %11 = zext <4 x i8> %10 to <4 x i32>
  %12 = shl nuw <4 x i32> %11, <i32 24, i32 16, i32 8, i32 0>
  %13 = tail call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %12)
  %14 = getelementptr inbounds nuw i8, ptr %4, i32 4
  store i32 %13, ptr %14, align 4, !tbaa !6
  %15 = getelementptr inbounds nuw i8, ptr %1, i32 8
  %16 = load <4 x i8>, ptr %15, align 1, !tbaa !10
  %17 = zext <4 x i8> %16 to <4 x i32>
  %18 = shl nuw <4 x i32> %17, <i32 24, i32 16, i32 8, i32 0>
  %19 = tail call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %18)
  %20 = getelementptr inbounds nuw i8, ptr %4, i32 8
  store i32 %19, ptr %20, align 4, !tbaa !6
  %21 = getelementptr inbounds nuw i8, ptr %1, i32 12
  %22 = load <4 x i8>, ptr %21, align 1, !tbaa !10
  %23 = zext <4 x i8> %22 to <4 x i32>
  %24 = shl nuw <4 x i32> %23, <i32 24, i32 16, i32 8, i32 0>
  %25 = tail call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %24)
  %26 = getelementptr inbounds nuw i8, ptr %4, i32 12
  store i32 %25, ptr %26, align 4, !tbaa !6
  %27 = getelementptr inbounds nuw i8, ptr %1, i32 16
  %28 = load <4 x i8>, ptr %27, align 1, !tbaa !10
  %29 = zext <4 x i8> %28 to <4 x i32>
  %30 = shl nuw <4 x i32> %29, <i32 24, i32 16, i32 8, i32 0>
  %31 = tail call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %30)
  %32 = getelementptr inbounds nuw i8, ptr %4, i32 16
  store i32 %31, ptr %32, align 4, !tbaa !6
  %33 = getelementptr inbounds nuw i8, ptr %1, i32 20
  %34 = load <4 x i8>, ptr %33, align 1, !tbaa !10
  %35 = zext <4 x i8> %34 to <4 x i32>
  %36 = shl nuw <4 x i32> %35, <i32 24, i32 16, i32 8, i32 0>
  %37 = tail call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %36)
  %38 = getelementptr inbounds nuw i8, ptr %4, i32 20
  store i32 %37, ptr %38, align 4, !tbaa !6
  %39 = getelementptr inbounds nuw i8, ptr %1, i32 24
  %40 = load <4 x i8>, ptr %39, align 1, !tbaa !10
  %41 = zext <4 x i8> %40 to <4 x i32>
  %42 = shl nuw <4 x i32> %41, <i32 24, i32 16, i32 8, i32 0>
  %43 = tail call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %42)
  %44 = getelementptr inbounds nuw i8, ptr %4, i32 24
  store i32 %43, ptr %44, align 4, !tbaa !6
  %45 = getelementptr inbounds nuw i8, ptr %1, i32 28
  %46 = load <4 x i8>, ptr %45, align 1, !tbaa !10
  %47 = zext <4 x i8> %46 to <4 x i32>
  %48 = shl nuw <4 x i32> %47, <i32 24, i32 16, i32 8, i32 0>
  %49 = tail call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %48)
  %50 = getelementptr inbounds nuw i8, ptr %4, i32 28
  store i32 %49, ptr %50, align 4, !tbaa !6
  %51 = getelementptr inbounds nuw i8, ptr %1, i32 32
  %52 = load <4 x i8>, ptr %51, align 1, !tbaa !10
  %53 = zext <4 x i8> %52 to <4 x i32>
  %54 = shl nuw <4 x i32> %53, <i32 24, i32 16, i32 8, i32 0>
  %55 = tail call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %54)
  %56 = getelementptr inbounds nuw i8, ptr %4, i32 32
  store i32 %55, ptr %56, align 4, !tbaa !6
  %57 = getelementptr inbounds nuw i8, ptr %1, i32 36
  %58 = load <4 x i8>, ptr %57, align 1, !tbaa !10
  %59 = zext <4 x i8> %58 to <4 x i32>
  %60 = shl nuw <4 x i32> %59, <i32 24, i32 16, i32 8, i32 0>
  %61 = tail call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %60)
  %62 = getelementptr inbounds nuw i8, ptr %4, i32 36
  store i32 %61, ptr %62, align 4, !tbaa !6
  %63 = getelementptr inbounds nuw i8, ptr %1, i32 40
  %64 = load <4 x i8>, ptr %63, align 1, !tbaa !10
  %65 = zext <4 x i8> %64 to <4 x i32>
  %66 = shl nuw <4 x i32> %65, <i32 24, i32 16, i32 8, i32 0>
  %67 = tail call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %66)
  %68 = getelementptr inbounds nuw i8, ptr %4, i32 40
  store i32 %67, ptr %68, align 4, !tbaa !6
  %69 = getelementptr inbounds nuw i8, ptr %1, i32 44
  %70 = load <4 x i8>, ptr %69, align 1, !tbaa !10
  %71 = zext <4 x i8> %70 to <4 x i32>
  %72 = shl nuw <4 x i32> %71, <i32 24, i32 16, i32 8, i32 0>
  %73 = tail call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %72)
  %74 = getelementptr inbounds nuw i8, ptr %4, i32 44
  store i32 %73, ptr %74, align 4, !tbaa !6
  %75 = getelementptr inbounds nuw i8, ptr %1, i32 48
  %76 = load <4 x i8>, ptr %75, align 1, !tbaa !10
  %77 = zext <4 x i8> %76 to <4 x i32>
  %78 = shl nuw <4 x i32> %77, <i32 24, i32 16, i32 8, i32 0>
  %79 = tail call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %78)
  %80 = getelementptr inbounds nuw i8, ptr %4, i32 48
  store i32 %79, ptr %80, align 4, !tbaa !6
  %81 = getelementptr inbounds nuw i8, ptr %1, i32 52
  %82 = load <4 x i8>, ptr %81, align 1, !tbaa !10
  %83 = zext <4 x i8> %82 to <4 x i32>
  %84 = shl nuw <4 x i32> %83, <i32 24, i32 16, i32 8, i32 0>
  %85 = tail call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %84)
  %86 = getelementptr inbounds nuw i8, ptr %4, i32 52
  store i32 %85, ptr %86, align 4, !tbaa !6
  %87 = getelementptr inbounds nuw i8, ptr %1, i32 56
  %88 = load <4 x i8>, ptr %87, align 1, !tbaa !10
  %89 = zext <4 x i8> %88 to <4 x i32>
  %90 = shl nuw <4 x i32> %89, <i32 24, i32 16, i32 8, i32 0>
  %91 = tail call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %90)
  %92 = getelementptr inbounds nuw i8, ptr %4, i32 56
  store i32 %91, ptr %92, align 4, !tbaa !6
  %93 = getelementptr inbounds nuw i8, ptr %1, i32 60
  %94 = load <4 x i8>, ptr %93, align 1, !tbaa !10
  %95 = zext <4 x i8> %94 to <4 x i32>
  %96 = shl nuw <4 x i32> %95, <i32 24, i32 16, i32 8, i32 0>
  %97 = tail call i32 @llvm.vector.reduce.or.v4i32(<4 x i32> %96)
  %98 = getelementptr inbounds nuw i8, ptr %4, i32 60
  store i32 %97, ptr %98, align 4, !tbaa !6
  %99 = load i32, ptr %0, align 4, !tbaa !6
  %100 = getelementptr inbounds nuw i8, ptr %0, i32 4
  %101 = load i32, ptr %100, align 4, !tbaa !6
  %102 = getelementptr inbounds nuw i8, ptr %0, i32 8
  %103 = load i32, ptr %102, align 4, !tbaa !6
  %104 = getelementptr inbounds nuw i8, ptr %0, i32 12
  %105 = load i32, ptr %104, align 4, !tbaa !6
  %106 = getelementptr inbounds nuw i8, ptr %0, i32 16
  %107 = load i32, ptr %106, align 4, !tbaa !6
  %108 = getelementptr inbounds nuw i8, ptr %0, i32 20
  %109 = load i32, ptr %108, align 4, !tbaa !6
  %110 = getelementptr inbounds nuw i8, ptr %0, i32 24
  %111 = load i32, ptr %110, align 4, !tbaa !6
  %112 = getelementptr inbounds nuw i8, ptr %0, i32 28
  %113 = load i32, ptr %112, align 4, !tbaa !6
  br label %150

114:                                              ; preds = %150
  %115 = load i32, ptr %4, align 4
  %116 = getelementptr inbounds nuw i8, ptr %4, i32 56
  %117 = getelementptr inbounds nuw i8, ptr %4, i32 36
  %118 = getelementptr inbounds nuw i8, ptr %4, i32 4
  %119 = getelementptr inbounds nuw i8, ptr %4, i32 60
  %120 = getelementptr inbounds nuw i8, ptr %4, i32 40
  %121 = getelementptr inbounds nuw i8, ptr %4, i32 8
  %122 = getelementptr inbounds nuw i8, ptr %4, i32 44
  %123 = getelementptr inbounds nuw i8, ptr %4, i32 12
  %124 = getelementptr inbounds nuw i8, ptr %4, i32 48
  %125 = getelementptr inbounds nuw i8, ptr %4, i32 16
  %126 = getelementptr inbounds nuw i8, ptr %4, i32 52
  %127 = getelementptr inbounds nuw i8, ptr %4, i32 20
  %128 = getelementptr inbounds nuw i8, ptr %4, i32 24
  %129 = getelementptr inbounds nuw i8, ptr %4, i32 28
  %130 = getelementptr inbounds nuw i8, ptr %4, i32 32
  %131 = load i32, ptr %116, align 4, !tbaa !6
  %132 = load i32, ptr %117, align 4, !tbaa !6
  %133 = load i32, ptr %118, align 4, !tbaa !6
  %134 = load i32, ptr %119, align 4, !tbaa !6
  %135 = load i32, ptr %120, align 4, !tbaa !6
  %136 = load <4 x i32>, ptr %121, align 4
  %137 = shufflevector <4 x i32> %136, <4 x i32> poison, <2 x i32> <i32 0, i32 poison>
  %138 = load i32, ptr %122, align 4, !tbaa !6
  %139 = load <4 x i32>, ptr %123, align 4
  %140 = shufflevector <4 x i32> %139, <4 x i32> poison, <2 x i32> <i32 0, i32 poison>
  %141 = load i32, ptr %124, align 4, !tbaa !6
  %142 = load i32, ptr %125, align 4, !tbaa !6
  %143 = load i32, ptr %126, align 4, !tbaa !6
  %144 = load i32, ptr %127, align 4, !tbaa !6
  %145 = load i32, ptr %128, align 4, !tbaa !6
  %146 = load i32, ptr %129, align 4, !tbaa !6
  %147 = load i32, ptr %130, align 4, !tbaa !6
  %148 = insertelement <2 x i32> %137, i32 %134, i64 1
  %149 = insertelement <2 x i32> %140, i32 %135, i64 1
  br label %395

150:                                              ; preds = %3, %150
  %151 = phi ptr [ %4, %3 ], [ %394, %150 ]
  %152 = phi i1 [ true, %3 ], [ false, %150 ]
  %153 = phi i32 [ %113, %3 ], [ %314, %150 ]
  %154 = phi i32 [ %111, %3 ], [ %325, %150 ]
  %155 = phi i32 [ %109, %3 ], [ %336, %150 ]
  %156 = phi i32 [ %107, %3 ], [ %358, %150 ]
  %157 = phi i32 [ %105, %3 ], [ %359, %150 ]
  %158 = phi i32 [ %103, %3 ], [ %370, %150 ]
  %159 = phi i32 [ %101, %3 ], [ %381, %150 ]
  %160 = phi i32 [ %99, %3 ], [ %392, %150 ]
  %161 = phi ptr [ %2, %3 ], [ %393, %150 ]
  %162 = tail call i32 @llvm.fshl.i32(i32 %156, i32 %156, i32 26)
  %163 = tail call i32 @llvm.fshl.i32(i32 %156, i32 %156, i32 21)
  %164 = xor i32 %162, %163
  %165 = tail call i32 @llvm.fshl.i32(i32 %156, i32 %156, i32 7)
  %166 = xor i32 %164, %165
  %167 = xor i32 %154, %155
  %168 = and i32 %167, %156
  %169 = xor i32 %168, %154
  %170 = load i32, ptr %161, align 4, !tbaa !6
  %171 = load i32, ptr %151, align 4, !tbaa !6
  %172 = add i32 %153, %166
  %173 = add i32 %172, %169
  %174 = add i32 %173, %170
  %175 = add i32 %174, %171
  %176 = tail call i32 @llvm.fshl.i32(i32 %160, i32 %160, i32 30)
  %177 = tail call i32 @llvm.fshl.i32(i32 %160, i32 %160, i32 19)
  %178 = xor i32 %176, %177
  %179 = tail call i32 @llvm.fshl.i32(i32 %160, i32 %160, i32 10)
  %180 = xor i32 %178, %179
  %181 = and i32 %159, %160
  %182 = xor i32 %159, %160
  %183 = and i32 %158, %182
  %184 = xor i32 %183, %181
  %185 = add i32 %184, %180
  %186 = xor i32 %155, %156
  %187 = getelementptr inbounds nuw i8, ptr %161, i32 4
  %188 = load i32, ptr %187, align 4, !tbaa !6
  %189 = getelementptr inbounds nuw i8, ptr %151, i32 4
  %190 = load i32, ptr %189, align 4, !tbaa !6
  %191 = add i32 %188, %154
  %192 = add i32 %191, %190
  %193 = getelementptr inbounds nuw i8, ptr %161, i32 8
  %194 = load i32, ptr %193, align 4, !tbaa !6
  %195 = getelementptr inbounds nuw i8, ptr %151, i32 8
  %196 = load i32, ptr %195, align 4, !tbaa !6
  %197 = add i32 %194, %155
  %198 = add i32 %197, %196
  %199 = getelementptr inbounds nuw i8, ptr %161, i32 12
  %200 = load i32, ptr %199, align 4, !tbaa !6
  %201 = getelementptr inbounds nuw i8, ptr %151, i32 12
  %202 = load i32, ptr %201, align 4, !tbaa !6
  %203 = add i32 %200, %156
  %204 = add i32 %203, %202
  %205 = getelementptr inbounds nuw i8, ptr %161, i32 16
  %206 = load i32, ptr %205, align 4, !tbaa !6
  %207 = getelementptr inbounds nuw i8, ptr %151, i32 16
  %208 = load i32, ptr %207, align 4, !tbaa !6
  %209 = getelementptr inbounds nuw i8, ptr %161, i32 20
  %210 = load i32, ptr %209, align 4, !tbaa !6
  %211 = getelementptr inbounds nuw i8, ptr %151, i32 20
  %212 = load i32, ptr %211, align 4, !tbaa !6
  %213 = add i32 %212, %210
  %214 = getelementptr inbounds nuw i8, ptr %161, i32 24
  %215 = load i32, ptr %214, align 4, !tbaa !6
  %216 = getelementptr inbounds nuw i8, ptr %151, i32 24
  %217 = load i32, ptr %216, align 4, !tbaa !6
  %218 = add i32 %217, %215
  %219 = getelementptr inbounds nuw i8, ptr %161, i32 28
  %220 = load i32, ptr %219, align 4, !tbaa !6
  %221 = getelementptr inbounds nuw i8, ptr %151, i32 28
  %222 = load i32, ptr %221, align 4, !tbaa !6
  %223 = add i32 %222, %220
  %224 = insertelement <2 x i32> poison, i32 %175, i64 0
  %225 = shufflevector <2 x i32> %224, <2 x i32> poison, <2 x i32> zeroinitializer
  %226 = insertelement <2 x i32> poison, i32 %185, i64 0
  %227 = insertelement <2 x i32> %226, i32 %157, i64 1
  %228 = add <2 x i32> %225, %227
  %229 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %228, <2 x i32> %228, <2 x i32> <i32 30, i32 26>)
  %230 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %228, <2 x i32> %228, <2 x i32> <i32 19, i32 21>)
  %231 = xor <2 x i32> %229, %230
  %232 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %228, <2 x i32> %228, <2 x i32> <i32 10, i32 7>)
  %233 = xor <2 x i32> %231, %232
  %234 = extractelement <2 x i32> %228, i64 0
  %235 = and i32 %234, %160
  %236 = extractelement <2 x i32> %228, i64 1
  %237 = and i32 %236, %186
  %238 = xor i32 %234, %160
  %239 = xor i32 %237, %155
  %240 = and i32 %238, %159
  %241 = add i32 %192, %239
  %242 = xor i32 %240, %235
  %243 = insertelement <2 x i32> poison, i32 %242, i64 0
  %244 = insertelement <2 x i32> %243, i32 %241, i64 1
  %245 = add <2 x i32> %233, %244
  %246 = xor i32 %236, %156
  %247 = add i32 %206, %236
  %248 = add i32 %247, %208
  %249 = shufflevector <2 x i32> %245, <2 x i32> poison, <2 x i32> <i32 1, i32 1>
  %250 = insertelement <2 x i32> %245, i32 %158, i64 1
  %251 = add <2 x i32> %249, %250
  %252 = extractelement <2 x i32> %251, i64 1
  %253 = and i32 %252, %246
  %254 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %251, <2 x i32> %251, <2 x i32> <i32 30, i32 26>)
  %255 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %251, <2 x i32> %251, <2 x i32> <i32 19, i32 21>)
  %256 = xor <2 x i32> %254, %255
  %257 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %251, <2 x i32> %251, <2 x i32> <i32 10, i32 7>)
  %258 = xor <2 x i32> %256, %257
  %259 = extractelement <2 x i32> %251, i64 0
  %260 = and i32 %259, %234
  %261 = xor i32 %259, %234
  %262 = xor i32 %253, %156
  %263 = and i32 %261, %160
  %264 = add i32 %198, %262
  %265 = xor i32 %263, %260
  %266 = insertelement <2 x i32> poison, i32 %265, i64 0
  %267 = insertelement <2 x i32> %266, i32 %264, i64 1
  %268 = add <2 x i32> %258, %267
  %269 = extractelement <2 x i32> %268, i64 1
  %270 = add i32 %269, %159
  %271 = tail call i32 @llvm.fshl.i32(i32 %270, i32 %270, i32 26)
  %272 = tail call i32 @llvm.fshl.i32(i32 %270, i32 %270, i32 21)
  %273 = xor i32 %271, %272
  %274 = tail call i32 @llvm.fshl.i32(i32 %270, i32 %270, i32 7)
  %275 = xor i32 %273, %274
  %276 = xor i32 %252, %236
  %277 = and i32 %270, %276
  %278 = xor i32 %277, %236
  %279 = add i32 %204, %278
  %280 = xor i32 %270, %252
  %281 = add i32 %213, %252
  %282 = add i32 %218, %270
  %283 = add i32 %279, %275
  %284 = extractelement <2 x i32> %268, i64 0
  %285 = add i32 %284, %269
  %286 = tail call i32 @llvm.fshl.i32(i32 %285, i32 %285, i32 30)
  %287 = tail call i32 @llvm.fshl.i32(i32 %285, i32 %285, i32 19)
  %288 = xor i32 %286, %287
  %289 = tail call i32 @llvm.fshl.i32(i32 %285, i32 %285, i32 10)
  %290 = xor i32 %288, %289
  %291 = xor i32 %285, %259
  %292 = and i32 %291, %234
  %293 = add i32 %283, %160
  %294 = tail call i32 @llvm.fshl.i32(i32 %293, i32 %293, i32 26)
  %295 = tail call i32 @llvm.fshl.i32(i32 %293, i32 %293, i32 21)
  %296 = xor i32 %294, %295
  %297 = tail call i32 @llvm.fshl.i32(i32 %293, i32 %293, i32 7)
  %298 = xor i32 %296, %297
  %299 = insertelement <2 x i32> poison, i32 %280, i64 0
  %300 = insertelement <2 x i32> %299, i32 %285, i64 1
  %301 = shufflevector <2 x i32> %251, <2 x i32> poison, <2 x i32> <i32 1, i32 0>
  %302 = insertelement <2 x i32> %301, i32 %293, i64 0
  %303 = and <2 x i32> %300, %302
  %304 = insertelement <2 x i32> %301, i32 %292, i64 1
  %305 = xor <2 x i32> %303, %304
  %306 = insertelement <2 x i32> poison, i32 %248, i64 0
  %307 = insertelement <2 x i32> %306, i32 %290, i64 1
  %308 = add <2 x i32> %307, %305
  %309 = insertelement <2 x i32> poison, i32 %298, i64 0
  %310 = insertelement <2 x i32> %309, i32 %283, i64 1
  %311 = add <2 x i32> %308, %310
  %312 = extractelement <2 x i32> %311, i64 1
  %313 = add <2 x i32> %311, %228
  %314 = extractelement <2 x i32> %313, i64 0
  %315 = tail call i32 @llvm.fshl.i32(i32 %314, i32 %314, i32 26)
  %316 = tail call i32 @llvm.fshl.i32(i32 %314, i32 %314, i32 21)
  %317 = xor i32 %315, %316
  %318 = tail call i32 @llvm.fshl.i32(i32 %314, i32 %314, i32 7)
  %319 = xor i32 %317, %318
  %320 = xor i32 %293, %270
  %321 = and i32 %314, %320
  %322 = xor i32 %321, %270
  %323 = add i32 %281, %322
  %324 = add i32 %323, %319
  %325 = add i32 %324, %259
  %326 = tail call i32 @llvm.fshl.i32(i32 %325, i32 %325, i32 26)
  %327 = tail call i32 @llvm.fshl.i32(i32 %325, i32 %325, i32 21)
  %328 = xor i32 %326, %327
  %329 = tail call i32 @llvm.fshl.i32(i32 %325, i32 %325, i32 7)
  %330 = xor i32 %328, %329
  %331 = xor i32 %314, %293
  %332 = and i32 %325, %331
  %333 = xor i32 %332, %293
  %334 = add i32 %282, %333
  %335 = add i32 %334, %330
  %336 = add i32 %335, %285
  %337 = shufflevector <2 x i32> %311, <2 x i32> poison, <2 x i32> <i32 1, i32 poison>
  %338 = insertelement <2 x i32> %337, i32 %336, i64 1
  %339 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %338, <2 x i32> %338, <2 x i32> <i32 30, i32 26>)
  %340 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %338, <2 x i32> %338, <2 x i32> <i32 19, i32 21>)
  %341 = xor <2 x i32> %339, %340
  %342 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %338, <2 x i32> %338, <2 x i32> <i32 10, i32 7>)
  %343 = xor <2 x i32> %341, %342
  %344 = xor i32 %325, %314
  %345 = xor i32 %312, %285
  %346 = and i32 %336, %344
  %347 = and i32 %345, %259
  %348 = xor i32 %346, %314
  %349 = and i32 %312, %285
  %350 = add i32 %223, %293
  %351 = xor i32 %347, %349
  %352 = add i32 %350, %348
  %353 = insertelement <2 x i32> poison, i32 %351, i64 0
  %354 = insertelement <2 x i32> %353, i32 %352, i64 1
  %355 = add <2 x i32> %354, %343
  %356 = extractelement <2 x i32> %355, i64 1
  %357 = add <2 x i32> %355, %311
  %358 = add i32 %356, %312
  %359 = extractelement <2 x i32> %357, i64 0
  %360 = tail call i32 @llvm.fshl.i32(i32 %359, i32 %359, i32 30)
  %361 = tail call i32 @llvm.fshl.i32(i32 %359, i32 %359, i32 19)
  %362 = xor i32 %360, %361
  %363 = tail call i32 @llvm.fshl.i32(i32 %359, i32 %359, i32 10)
  %364 = xor i32 %362, %363
  %365 = and i32 %359, %312
  %366 = xor i32 %359, %312
  %367 = and i32 %366, %285
  %368 = xor i32 %367, %365
  %369 = add i32 %364, %368
  %370 = add i32 %369, %324
  %371 = tail call i32 @llvm.fshl.i32(i32 %370, i32 %370, i32 30)
  %372 = tail call i32 @llvm.fshl.i32(i32 %370, i32 %370, i32 19)
  %373 = xor i32 %371, %372
  %374 = tail call i32 @llvm.fshl.i32(i32 %370, i32 %370, i32 10)
  %375 = xor i32 %373, %374
  %376 = and i32 %370, %359
  %377 = xor i32 %370, %359
  %378 = and i32 %377, %312
  %379 = xor i32 %378, %376
  %380 = add i32 %375, %379
  %381 = add i32 %380, %335
  %382 = tail call i32 @llvm.fshl.i32(i32 %381, i32 %381, i32 30)
  %383 = tail call i32 @llvm.fshl.i32(i32 %381, i32 %381, i32 19)
  %384 = xor i32 %382, %383
  %385 = tail call i32 @llvm.fshl.i32(i32 %381, i32 %381, i32 10)
  %386 = xor i32 %384, %385
  %387 = and i32 %381, %370
  %388 = xor i32 %381, %370
  %389 = and i32 %388, %359
  %390 = xor i32 %389, %387
  %391 = add i32 %386, %390
  %392 = add i32 %391, %356
  %393 = getelementptr inbounds nuw i8, ptr %161, i32 32
  %394 = getelementptr inbounds nuw i8, ptr %151, i32 32
  br i1 %152, label %150, label %114, !llvm.loop !13

395:                                              ; preds = %114, %395
  %396 = phi i32 [ %147, %114 ], [ %762, %395 ]
  %397 = phi i32 [ %146, %114 ], [ %688, %395 ]
  %398 = phi i32 [ %145, %114 ], [ %609, %395 ]
  %399 = phi i32 [ %144, %114 ], [ %677, %395 ]
  %400 = phi i32 [ %143, %114 ], [ %918, %395 ]
  %401 = phi i32 [ %142, %114 ], [ %585, %395 ]
  %402 = phi i32 [ %141, %114 ], [ %956, %395 ]
  %403 = phi i32 [ %138, %114 ], [ %905, %395 ]
  %404 = phi i32 [ %133, %114 ], [ %557, %395 ]
  %405 = phi i32 [ %132, %114 ], [ %847, %395 ]
  %406 = phi i32 [ %131, %114 ], [ %990, %395 ]
  %407 = phi i32 [ 16, %114 ], [ %1066, %395 ]
  %408 = phi i32 [ %314, %114 ], [ %961, %395 ]
  %409 = phi i32 [ %325, %114 ], [ %974, %395 ]
  %410 = phi i32 [ %336, %114 ], [ %1070, %395 ]
  %411 = phi i32 [ %370, %114 ], [ %1041, %395 ]
  %412 = phi i32 [ %381, %114 ], [ %1053, %395 ]
  %413 = phi i32 [ %392, %114 ], [ %1065, %395 ]
  %414 = phi ptr [ %2, %114 ], [ %419, %395 ]
  %415 = phi i32 [ %115, %114 ], [ %442, %395 ]
  %416 = phi <2 x i32> [ %148, %114 ], [ %1068, %395 ]
  %417 = phi <2 x i32> [ %149, %114 ], [ %1069, %395 ]
  %418 = phi <2 x i32> [ %357, %114 ], [ %1028, %395 ]
  %419 = getelementptr i8, ptr %414, i32 64
  %420 = extractelement <2 x i32> %418, i64 1
  %421 = tail call i32 @llvm.fshl.i32(i32 %420, i32 %420, i32 26)
  %422 = tail call i32 @llvm.fshl.i32(i32 %420, i32 %420, i32 21)
  %423 = xor i32 %421, %422
  %424 = tail call i32 @llvm.fshl.i32(i32 %420, i32 %420, i32 7)
  %425 = xor i32 %423, %424
  %426 = xor i32 %409, %410
  %427 = and i32 %426, %420
  %428 = xor i32 %427, %409
  %429 = load i32, ptr %419, align 4, !tbaa !6
  %430 = tail call i32 @llvm.fshl.i32(i32 %406, i32 %406, i32 15)
  %431 = tail call i32 @llvm.fshl.i32(i32 %406, i32 %406, i32 13)
  %432 = xor i32 %430, %431
  %433 = lshr i32 %406, 10
  %434 = xor i32 %432, %433
  %435 = add i32 %434, %405
  %436 = tail call i32 @llvm.fshl.i32(i32 %404, i32 %404, i32 25)
  %437 = tail call i32 @llvm.fshl.i32(i32 %404, i32 %404, i32 14)
  %438 = xor i32 %436, %437
  %439 = lshr i32 %404, 3
  %440 = xor i32 %438, %439
  %441 = add i32 %435, %415
  %442 = add i32 %441, %440
  %443 = add i32 %408, %425
  %444 = add i32 %443, %428
  %445 = add i32 %444, %429
  %446 = add i32 %445, %442
  %447 = tail call i32 @llvm.fshl.i32(i32 %413, i32 %413, i32 30)
  %448 = tail call i32 @llvm.fshl.i32(i32 %413, i32 %413, i32 19)
  %449 = xor i32 %447, %448
  %450 = tail call i32 @llvm.fshl.i32(i32 %413, i32 %413, i32 10)
  %451 = xor i32 %449, %450
  %452 = and i32 %412, %413
  %453 = xor i32 %412, %413
  %454 = and i32 %411, %453
  %455 = xor i32 %454, %452
  %456 = add i32 %455, %451
  %457 = xor i32 %410, %420
  %458 = getelementptr i8, ptr %414, i32 68
  %459 = load i32, ptr %458, align 4, !tbaa !6
  %460 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %416, <2 x i32> %416, <2 x i32> <i32 25, i32 15>)
  %461 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %416, <2 x i32> %416, <2 x i32> <i32 14, i32 13>)
  %462 = lshr <2 x i32> %416, <i32 3, i32 10>
  %463 = extractelement <2 x i32> %417, i64 1
  %464 = add i32 %463, %404
  %465 = add i32 %459, %409
  %466 = getelementptr i8, ptr %414, i32 72
  %467 = load i32, ptr %466, align 4, !tbaa !6
  %468 = tail call i32 @llvm.fshl.i32(i32 %442, i32 %442, i32 15)
  %469 = tail call i32 @llvm.fshl.i32(i32 %442, i32 %442, i32 13)
  %470 = xor i32 %468, %469
  %471 = lshr i32 %442, 10
  %472 = xor i32 %470, %471
  %473 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %417, <2 x i32> %417, <2 x i32> splat (i32 25))
  %474 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %417, <2 x i32> %417, <2 x i32> splat (i32 14))
  %475 = lshr <2 x i32> %417, splat (i32 3)
  %476 = extractelement <2 x i32> %416, i64 0
  %477 = add i32 %472, %476
  %478 = add i32 %477, %403
  %479 = add i32 %467, %410
  %480 = getelementptr i8, ptr %414, i32 76
  %481 = load i32, ptr %480, align 4, !tbaa !6
  %482 = extractelement <2 x i32> %417, i64 0
  %483 = getelementptr i8, ptr %414, i32 80
  %484 = load i32, ptr %483, align 4, !tbaa !6
  %485 = add i32 %400, %401
  %486 = getelementptr i8, ptr %414, i32 84
  %487 = load i32, ptr %486, align 4, !tbaa !6
  %488 = add i32 %399, %406
  %489 = getelementptr i8, ptr %414, i32 88
  %490 = load i32, ptr %489, align 4, !tbaa !6
  %491 = extractelement <2 x i32> %416, i64 1
  %492 = add i32 %398, %491
  %493 = getelementptr i8, ptr %414, i32 92
  %494 = load i32, ptr %493, align 4, !tbaa !6
  %495 = add i32 %397, %442
  %496 = getelementptr i8, ptr %414, i32 96
  %497 = load i32, ptr %496, align 4, !tbaa !6
  %498 = tail call i32 @llvm.fshl.i32(i32 %405, i32 %405, i32 25)
  %499 = tail call i32 @llvm.fshl.i32(i32 %405, i32 %405, i32 14)
  %500 = xor i32 %498, %499
  %501 = lshr i32 %405, 3
  %502 = xor i32 %500, %501
  %503 = getelementptr i8, ptr %414, i32 100
  %504 = load i32, ptr %503, align 4, !tbaa !6
  %505 = getelementptr i8, ptr %414, i32 104
  %506 = load i32, ptr %505, align 4, !tbaa !6
  %507 = tail call i32 @llvm.fshl.i32(i32 %403, i32 %403, i32 25)
  %508 = tail call i32 @llvm.fshl.i32(i32 %403, i32 %403, i32 14)
  %509 = xor i32 %507, %508
  %510 = lshr i32 %403, 3
  %511 = xor i32 %509, %510
  %512 = add i32 %511, %463
  %513 = getelementptr i8, ptr %414, i32 108
  %514 = load i32, ptr %513, align 4, !tbaa !6
  %515 = tail call i32 @llvm.fshl.i32(i32 %402, i32 %402, i32 25)
  %516 = tail call i32 @llvm.fshl.i32(i32 %402, i32 %402, i32 14)
  %517 = xor i32 %515, %516
  %518 = lshr i32 %402, 3
  %519 = xor i32 %517, %518
  %520 = add i32 %519, %403
  %521 = getelementptr i8, ptr %414, i32 112
  %522 = load i32, ptr %521, align 4, !tbaa !6
  %523 = tail call i32 @llvm.fshl.i32(i32 %400, i32 %400, i32 25)
  %524 = tail call i32 @llvm.fshl.i32(i32 %400, i32 %400, i32 14)
  %525 = xor i32 %523, %524
  %526 = lshr i32 %400, 3
  %527 = xor i32 %525, %526
  %528 = add i32 %527, %402
  %529 = getelementptr i8, ptr %414, i32 116
  %530 = load i32, ptr %529, align 4, !tbaa !6
  %531 = tail call i32 @llvm.fshl.i32(i32 %406, i32 %406, i32 25)
  %532 = tail call i32 @llvm.fshl.i32(i32 %406, i32 %406, i32 14)
  %533 = xor i32 %531, %532
  %534 = lshr i32 %406, 3
  %535 = xor i32 %533, %534
  %536 = add i32 %400, %535
  %537 = getelementptr i8, ptr %414, i32 120
  %538 = load i32, ptr %537, align 4, !tbaa !6
  %539 = tail call i32 @llvm.fshl.i32(i32 %491, i32 %491, i32 25)
  %540 = tail call i32 @llvm.fshl.i32(i32 %491, i32 %491, i32 14)
  %541 = xor i32 %539, %540
  %542 = lshr i32 %491, 3
  %543 = xor i32 %541, %542
  %544 = add i32 %543, %406
  %545 = getelementptr i8, ptr %414, i32 124
  %546 = load i32, ptr %545, align 4, !tbaa !6
  %547 = tail call i32 @llvm.fshl.i32(i32 %442, i32 %442, i32 25)
  %548 = tail call i32 @llvm.fshl.i32(i32 %442, i32 %442, i32 14)
  %549 = xor i32 %547, %548
  %550 = lshr i32 %442, 3
  %551 = xor i32 %549, %550
  %552 = xor <2 x i32> %460, %461
  %553 = xor <2 x i32> %552, %462
  %554 = extractelement <2 x i32> %553, i64 1
  %555 = add i32 %464, %554
  %556 = extractelement <2 x i32> %553, i64 0
  %557 = add i32 %555, %556
  %558 = insertelement <2 x i32> poison, i32 %557, i64 0
  %559 = insertelement <2 x i32> %558, i32 %401, i64 1
  %560 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %559, <2 x i32> %559, <2 x i32> <i32 15, i32 25>)
  %561 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %559, <2 x i32> %559, <2 x i32> <i32 13, i32 14>)
  %562 = xor <2 x i32> %560, %561
  %563 = lshr <2 x i32> %559, <i32 10, i32 3>
  %564 = xor <2 x i32> %562, %563
  %565 = extractelement <2 x i32> %564, i64 0
  %566 = extractelement <2 x i32> %564, i64 1
  %567 = add i32 %557, %502
  %568 = add i32 %567, %396
  %569 = xor <2 x i32> %473, %474
  %570 = xor <2 x i32> %569, %475
  %571 = insertelement <2 x i32> poison, i32 %478, i64 0
  %572 = insertelement <2 x i32> %571, i32 %405, i64 1
  %573 = add <2 x i32> %570, %572
  %574 = extractelement <2 x i32> %573, i64 0
  %575 = add i32 %479, %574
  %576 = insertelement <2 x i32> %573, i32 %399, i64 1
  %577 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %576, <2 x i32> %576, <2 x i32> <i32 15, i32 25>)
  %578 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %576, <2 x i32> %576, <2 x i32> <i32 13, i32 14>)
  %579 = xor <2 x i32> %577, %578
  %580 = lshr <2 x i32> %576, <i32 10, i32 3>
  %581 = xor <2 x i32> %579, %580
  %582 = extractelement <2 x i32> %581, i64 0
  %583 = add i32 %485, %582
  %584 = extractelement <2 x i32> %581, i64 1
  %585 = add i32 %583, %584
  %586 = insertelement <2 x i32> poison, i32 %585, i64 0
  %587 = insertelement <2 x i32> %586, i32 %397, i64 1
  %588 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %587, <2 x i32> %587, <2 x i32> <i32 15, i32 25>)
  %589 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %587, <2 x i32> %587, <2 x i32> <i32 13, i32 14>)
  %590 = xor <2 x i32> %588, %589
  %591 = lshr <2 x i32> %587, <i32 10, i32 3>
  %592 = xor <2 x i32> %590, %591
  %593 = extractelement <2 x i32> %592, i64 0
  %594 = extractelement <2 x i32> %592, i64 1
  %595 = add i32 %456, %446
  %596 = tail call i32 @llvm.fshl.i32(i32 %595, i32 %595, i32 30)
  %597 = tail call i32 @llvm.fshl.i32(i32 %595, i32 %595, i32 19)
  %598 = xor i32 %596, %597
  %599 = tail call i32 @llvm.fshl.i32(i32 %595, i32 %595, i32 10)
  %600 = xor i32 %598, %599
  %601 = and i32 %595, %413
  %602 = xor i32 %595, %413
  %603 = and i32 %602, %412
  %604 = xor i32 %603, %601
  %605 = add i32 %600, %604
  %606 = add i32 %402, %482
  %607 = add i32 %606, %565
  %608 = add i32 %492, %593
  %609 = add i32 %608, %594
  %610 = tail call i32 @llvm.fshl.i32(i32 %609, i32 %609, i32 15)
  %611 = tail call i32 @llvm.fshl.i32(i32 %609, i32 %609, i32 13)
  %612 = xor i32 %610, %611
  %613 = lshr i32 %609, 10
  %614 = xor i32 %612, %613
  %615 = extractelement <2 x i32> %573, i64 1
  %616 = add i32 %615, %574
  %617 = add i32 %520, %585
  %618 = add i32 %536, %609
  %619 = insertelement <2 x i32> poison, i32 %446, i64 0
  %620 = insertelement <2 x i32> %619, i32 %481, i64 1
  %621 = add <2 x i32> %620, %418
  %622 = extractelement <2 x i32> %621, i64 0
  %623 = tail call i32 @llvm.fshl.i32(i32 %622, i32 %622, i32 26)
  %624 = tail call i32 @llvm.fshl.i32(i32 %622, i32 %622, i32 21)
  %625 = xor i32 %623, %624
  %626 = tail call i32 @llvm.fshl.i32(i32 %622, i32 %622, i32 7)
  %627 = xor i32 %625, %626
  %628 = and i32 %622, %457
  %629 = xor i32 %628, %410
  %630 = add i32 %465, %629
  %631 = add i32 %630, %627
  %632 = xor i32 %622, %420
  %633 = add i32 %484, %622
  %634 = add i32 %631, %557
  %635 = add i32 %633, %585
  %636 = add i32 %634, %411
  %637 = add i32 %605, %634
  %638 = tail call i32 @llvm.fshl.i32(i32 %636, i32 %636, i32 26)
  %639 = tail call i32 @llvm.fshl.i32(i32 %636, i32 %636, i32 21)
  %640 = xor i32 %638, %639
  %641 = tail call i32 @llvm.fshl.i32(i32 %636, i32 %636, i32 7)
  %642 = xor i32 %640, %641
  %643 = and i32 %636, %632
  %644 = xor i32 %643, %420
  %645 = tail call i32 @llvm.fshl.i32(i32 %637, i32 %637, i32 30)
  %646 = tail call i32 @llvm.fshl.i32(i32 %637, i32 %637, i32 19)
  %647 = xor i32 %645, %646
  %648 = tail call i32 @llvm.fshl.i32(i32 %637, i32 %637, i32 10)
  %649 = xor i32 %647, %648
  %650 = and i32 %637, %595
  %651 = xor i32 %637, %595
  %652 = and i32 %651, %413
  %653 = xor i32 %652, %650
  %654 = add i32 %649, %653
  %655 = add i32 %575, %644
  %656 = add i32 %655, %642
  %657 = insertelement <2 x i32> poison, i32 %656, i64 0
  %658 = shufflevector <2 x i32> %657, <2 x i32> poison, <2 x i32> zeroinitializer
  %659 = insertelement <2 x i32> poison, i32 %654, i64 0
  %660 = insertelement <2 x i32> %659, i32 %412, i64 1
  %661 = add <2 x i32> %658, %660
  %662 = add i32 %607, %566
  %663 = extractelement <2 x i32> %661, i64 0
  %664 = xor i32 %663, %637
  %665 = insertelement <2 x i32> poison, i32 %662, i64 0
  %666 = insertelement <2 x i32> %665, i32 %398, i64 1
  %667 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %666, <2 x i32> %666, <2 x i32> <i32 15, i32 25>)
  %668 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %666, <2 x i32> %666, <2 x i32> <i32 13, i32 14>)
  %669 = xor <2 x i32> %667, %668
  %670 = lshr <2 x i32> %666, <i32 10, i32 3>
  %671 = xor <2 x i32> %669, %670
  %672 = extractelement <2 x i32> %671, i64 0
  %673 = add i32 %488, %672
  %674 = extractelement <2 x i32> %671, i64 1
  %675 = xor i32 %636, %622
  %676 = and i32 %664, %595
  %677 = add i32 %673, %674
  %678 = insertelement <2 x i32> poison, i32 %677, i64 0
  %679 = insertelement <2 x i32> %678, i32 %396, i64 1
  %680 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %679, <2 x i32> %679, <2 x i32> <i32 15, i32 25>)
  %681 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %679, <2 x i32> %679, <2 x i32> <i32 13, i32 14>)
  %682 = xor <2 x i32> %680, %681
  %683 = lshr <2 x i32> %679, <i32 10, i32 3>
  %684 = xor <2 x i32> %682, %683
  %685 = extractelement <2 x i32> %684, i64 0
  %686 = add i32 %495, %685
  %687 = extractelement <2 x i32> %684, i64 1
  %688 = add i32 %686, %687
  %689 = add i32 %688, %494
  %690 = add i32 %487, %636
  %691 = add i32 %690, %677
  %692 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %661, <2 x i32> %661, <2 x i32> <i32 30, i32 26>)
  %693 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %661, <2 x i32> %661, <2 x i32> <i32 19, i32 21>)
  %694 = xor <2 x i32> %692, %693
  %695 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %661, <2 x i32> %661, <2 x i32> <i32 10, i32 7>)
  %696 = xor <2 x i32> %694, %695
  %697 = extractelement <2 x i32> %661, i64 1
  %698 = and i32 %697, %675
  %699 = insertelement <2 x i32> poison, i32 %698, i64 0
  %700 = insertelement <2 x i32> %699, i32 %662, i64 1
  %701 = add <2 x i32> %621, %700
  %702 = xor <2 x i32> %621, %700
  %703 = and i32 %663, %637
  %704 = shufflevector <2 x i32> %702, <2 x i32> poison, <2 x i32> <i32 poison, i32 0>
  %705 = add <2 x i32> %701, %704
  %706 = xor i32 %676, %703
  %707 = insertelement <2 x i32> %705, i32 %706, i64 0
  %708 = add <2 x i32> %696, %707
  %709 = extractelement <2 x i32> %708, i64 1
  %710 = add i32 %709, %413
  %711 = tail call i32 @llvm.fshl.i32(i32 %710, i32 %710, i32 26)
  %712 = tail call i32 @llvm.fshl.i32(i32 %710, i32 %710, i32 21)
  %713 = xor i32 %711, %712
  %714 = tail call i32 @llvm.fshl.i32(i32 %710, i32 %710, i32 7)
  %715 = xor i32 %713, %714
  %716 = xor i32 %697, %636
  %717 = and i32 %710, %716
  %718 = xor i32 %717, %636
  %719 = add i32 %635, %718
  %720 = add i32 %719, %715
  %721 = xor i32 %710, %697
  %722 = add i32 %697, %490
  %723 = extractelement <2 x i32> %708, i64 0
  %724 = add i32 %723, %709
  %725 = tail call i32 @llvm.fshl.i32(i32 %724, i32 %724, i32 30)
  %726 = tail call i32 @llvm.fshl.i32(i32 %724, i32 %724, i32 19)
  %727 = xor i32 %725, %726
  %728 = tail call i32 @llvm.fshl.i32(i32 %724, i32 %724, i32 10)
  %729 = xor i32 %727, %728
  %730 = and i32 %724, %663
  %731 = xor i32 %724, %663
  %732 = and i32 %731, %637
  %733 = xor i32 %732, %730
  %734 = add i32 %729, %733
  %735 = insertelement <2 x i32> poison, i32 %720, i64 0
  %736 = shufflevector <2 x i32> %735, <2 x i32> poison, <2 x i32> zeroinitializer
  %737 = insertelement <2 x i32> poison, i32 %734, i64 0
  %738 = insertelement <2 x i32> %737, i32 %595, i64 1
  %739 = add <2 x i32> %736, %738
  %740 = extractelement <2 x i32> %739, i64 1
  %741 = and i32 %740, %721
  %742 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %739, <2 x i32> %739, <2 x i32> <i32 30, i32 26>)
  %743 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %739, <2 x i32> %739, <2 x i32> <i32 19, i32 21>)
  %744 = xor <2 x i32> %742, %743
  %745 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %739, <2 x i32> %739, <2 x i32> <i32 10, i32 7>)
  %746 = xor <2 x i32> %744, %745
  %747 = xor i32 %741, %697
  %748 = extractelement <2 x i32> %739, i64 0
  %749 = and i32 %748, %724
  %750 = xor i32 %748, %724
  %751 = and i32 %750, %663
  %752 = add i32 %691, %747
  %753 = xor i32 %751, %749
  %754 = insertelement <2 x i32> poison, i32 %753, i64 0
  %755 = insertelement <2 x i32> %754, i32 %752, i64 1
  %756 = add <2 x i32> %746, %755
  %757 = shufflevector <2 x i32> %756, <2 x i32> poison, <2 x i32> <i32 1, i32 1>
  %758 = insertelement <2 x i32> %756, i32 %637, i64 1
  %759 = add <2 x i32> %757, %758
  %760 = extractelement <2 x i32> %759, i64 0
  %761 = xor i32 %760, %748
  %762 = add i32 %568, %614
  %763 = add i32 %689, %710
  %764 = xor i32 %740, %710
  %765 = extractelement <2 x i32> %759, i64 1
  %766 = and i32 %765, %764
  %767 = xor i32 %766, %710
  %768 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %759, <2 x i32> %759, <2 x i32> <i32 30, i32 26>)
  %769 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %759, <2 x i32> %759, <2 x i32> <i32 19, i32 21>)
  %770 = xor <2 x i32> %768, %769
  %771 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %759, <2 x i32> %759, <2 x i32> <i32 10, i32 7>)
  %772 = xor <2 x i32> %770, %771
  %773 = and i32 %760, %748
  %774 = add i32 %722, %609
  %775 = and i32 %761, %724
  %776 = add i32 %774, %767
  %777 = xor i32 %775, %773
  %778 = insertelement <2 x i32> poison, i32 %777, i64 0
  %779 = insertelement <2 x i32> %778, i32 %776, i64 1
  %780 = add <2 x i32> %772, %779
  %781 = extractelement <2 x i32> %780, i64 1
  %782 = add i32 %781, %663
  %783 = extractelement <2 x i32> %780, i64 0
  %784 = add i32 %783, %781
  %785 = tail call i32 @llvm.fshl.i32(i32 %782, i32 %782, i32 26)
  %786 = tail call i32 @llvm.fshl.i32(i32 %782, i32 %782, i32 21)
  %787 = xor i32 %785, %786
  %788 = tail call i32 @llvm.fshl.i32(i32 %782, i32 %782, i32 7)
  %789 = xor i32 %787, %788
  %790 = xor i32 %765, %740
  %791 = and i32 %782, %790
  %792 = xor i32 %791, %740
  %793 = add i32 %763, %792
  %794 = add i32 %793, %789
  %795 = tail call i32 @llvm.fshl.i32(i32 %784, i32 %784, i32 30)
  %796 = tail call i32 @llvm.fshl.i32(i32 %784, i32 %784, i32 19)
  %797 = xor i32 %795, %796
  %798 = tail call i32 @llvm.fshl.i32(i32 %784, i32 %784, i32 10)
  %799 = xor i32 %797, %798
  %800 = and i32 %784, %760
  %801 = xor i32 %784, %760
  %802 = and i32 %801, %748
  %803 = xor i32 %802, %800
  %804 = add i32 %799, %803
  %805 = insertelement <2 x i32> poison, i32 %794, i64 0
  %806 = shufflevector <2 x i32> %805, <2 x i32> poison, <2 x i32> zeroinitializer
  %807 = insertelement <2 x i32> poison, i32 %804, i64 0
  %808 = insertelement <2 x i32> %807, i32 %724, i64 1
  %809 = add <2 x i32> %806, %808
  %810 = xor i32 %782, %765
  %811 = extractelement <2 x i32> %809, i64 1
  %812 = and i32 %811, %810
  %813 = add i32 %762, %497
  %814 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %809, <2 x i32> %809, <2 x i32> <i32 30, i32 26>)
  %815 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %809, <2 x i32> %809, <2 x i32> <i32 19, i32 21>)
  %816 = xor <2 x i32> %814, %815
  %817 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %809, <2 x i32> %809, <2 x i32> <i32 10, i32 7>)
  %818 = xor <2 x i32> %816, %817
  %819 = xor i32 %812, %765
  %820 = extractelement <2 x i32> %809, i64 0
  %821 = and i32 %820, %784
  %822 = xor i32 %820, %784
  %823 = add i32 %813, %740
  %824 = and i32 %822, %760
  %825 = add i32 %823, %819
  %826 = xor i32 %824, %821
  %827 = insertelement <2 x i32> poison, i32 %826, i64 0
  %828 = insertelement <2 x i32> %827, i32 %825, i64 1
  %829 = add <2 x i32> %818, %828
  %830 = extractelement <2 x i32> %829, i64 1
  %831 = add i32 %830, %748
  %832 = extractelement <2 x i32> %829, i64 0
  %833 = add i32 %832, %830
  %834 = tail call i32 @llvm.fshl.i32(i32 %831, i32 %831, i32 26)
  %835 = tail call i32 @llvm.fshl.i32(i32 %831, i32 %831, i32 21)
  %836 = xor i32 %834, %835
  %837 = tail call i32 @llvm.fshl.i32(i32 %831, i32 %831, i32 7)
  %838 = xor i32 %836, %837
  %839 = xor i32 %811, %782
  %840 = and i32 %831, %839
  %841 = xor i32 %840, %782
  %842 = tail call i32 @llvm.fshl.i32(i32 %688, i32 %688, i32 15)
  %843 = tail call i32 @llvm.fshl.i32(i32 %688, i32 %688, i32 13)
  %844 = xor i32 %842, %843
  %845 = lshr i32 %688, 10
  %846 = xor i32 %844, %845
  %847 = add i32 %616, %846
  %848 = add i32 %847, %504
  %849 = add i32 %848, %765
  %850 = add i32 %849, %841
  %851 = add i32 %850, %838
  %852 = add i32 %851, %760
  %853 = tail call i32 @llvm.fshl.i32(i32 %833, i32 %833, i32 30)
  %854 = tail call i32 @llvm.fshl.i32(i32 %833, i32 %833, i32 19)
  %855 = xor i32 %853, %854
  %856 = tail call i32 @llvm.fshl.i32(i32 %833, i32 %833, i32 10)
  %857 = xor i32 %855, %856
  %858 = and i32 %833, %820
  %859 = xor i32 %833, %820
  %860 = and i32 %859, %784
  %861 = xor i32 %860, %858
  %862 = add i32 %857, %861
  %863 = add i32 %862, %851
  %864 = tail call i32 @llvm.fshl.i32(i32 %852, i32 %852, i32 26)
  %865 = tail call i32 @llvm.fshl.i32(i32 %852, i32 %852, i32 21)
  %866 = xor i32 %864, %865
  %867 = tail call i32 @llvm.fshl.i32(i32 %852, i32 %852, i32 7)
  %868 = xor i32 %866, %867
  %869 = xor i32 %831, %811
  %870 = and i32 %852, %869
  %871 = xor i32 %870, %811
  %872 = tail call i32 @llvm.fshl.i32(i32 %762, i32 %762, i32 15)
  %873 = tail call i32 @llvm.fshl.i32(i32 %762, i32 %762, i32 13)
  %874 = xor i32 %872, %873
  %875 = lshr i32 %762, 10
  %876 = xor i32 %874, %875
  %877 = add i32 %512, %662
  %878 = add i32 %877, %876
  %879 = add i32 %878, %506
  %880 = add i32 %879, %782
  %881 = add i32 %880, %871
  %882 = add i32 %881, %868
  %883 = add i32 %882, %784
  %884 = tail call i32 @llvm.fshl.i32(i32 %863, i32 %863, i32 30)
  %885 = tail call i32 @llvm.fshl.i32(i32 %863, i32 %863, i32 19)
  %886 = xor i32 %884, %885
  %887 = tail call i32 @llvm.fshl.i32(i32 %863, i32 %863, i32 10)
  %888 = and i32 %863, %833
  %889 = xor i32 %863, %833
  %890 = and i32 %889, %820
  %891 = xor i32 %890, %888
  %892 = tail call i32 @llvm.fshl.i32(i32 %883, i32 %883, i32 7)
  %893 = xor i32 %852, %831
  %894 = and i32 %883, %893
  %895 = insertelement <2 x i32> poison, i32 %894, i64 0
  %896 = insertelement <2 x i32> %895, i32 %886, i64 1
  %897 = insertelement <2 x i32> poison, i32 %831, i64 0
  %898 = insertelement <2 x i32> %897, i32 %887, i64 1
  %899 = xor <2 x i32> %896, %898
  %900 = tail call i32 @llvm.fshl.i32(i32 %847, i32 %847, i32 15)
  %901 = tail call i32 @llvm.fshl.i32(i32 %847, i32 %847, i32 13)
  %902 = xor i32 %900, %901
  %903 = lshr i32 %847, 10
  %904 = xor i32 %902, %903
  %905 = add i32 %617, %904
  %906 = add i32 %905, %514
  %907 = insertelement <2 x i32> poison, i32 %906, i64 0
  %908 = insertelement <2 x i32> %907, i32 %551, i64 1
  %909 = shufflevector <2 x i32> %809, <2 x i32> %416, <2 x i32> <i32 1, i32 3>
  %910 = add <2 x i32> %908, %909
  %911 = insertelement <2 x i32> %910, i32 %891, i64 1
  %912 = add <2 x i32> %899, %911
  %913 = tail call i32 @llvm.fshl.i32(i32 %905, i32 %905, i32 15)
  %914 = tail call i32 @llvm.fshl.i32(i32 %905, i32 %905, i32 13)
  %915 = xor i32 %913, %914
  %916 = lshr i32 %905, 10
  %917 = xor i32 %915, %916
  %918 = add i32 %618, %917
  %919 = insertelement <2 x i32> poison, i32 %883, i64 0
  %920 = insertelement <2 x i32> %919, i32 %918, i64 1
  %921 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %920, <2 x i32> %920, <2 x i32> <i32 26, i32 15>)
  %922 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %920, <2 x i32> %920, <2 x i32> <i32 21, i32 13>)
  %923 = xor <2 x i32> %921, %922
  %924 = lshr i32 %918, 10
  %925 = insertelement <2 x i32> poison, i32 %892, i64 0
  %926 = insertelement <2 x i32> %925, i32 %924, i64 1
  %927 = xor <2 x i32> %923, %926
  %928 = insertelement <2 x i32> %899, i32 %762, i64 1
  %929 = add <2 x i32> %910, %928
  %930 = add <2 x i32> %929, %927
  %931 = insertelement <2 x i32> %927, i32 %882, i64 1
  %932 = add <2 x i32> %912, %931
  %933 = insertelement <2 x i32> poison, i32 %882, i64 0
  %934 = shufflevector <2 x i32> %933, <2 x i32> %930, <2 x i32> <i32 0, i32 2>
  %935 = shufflevector <2 x i32> %912, <2 x i32> %809, <2 x i32> <i32 1, i32 2>
  %936 = add <2 x i32> %934, %935
  %937 = extractelement <2 x i32> %936, i64 0
  %938 = and i32 %937, %863
  %939 = xor i32 %937, %863
  %940 = and i32 %939, %833
  %941 = extractelement <2 x i32> %936, i64 1
  %942 = tail call i32 @llvm.fshl.i32(i32 %941, i32 %941, i32 26)
  %943 = tail call i32 @llvm.fshl.i32(i32 %941, i32 %941, i32 21)
  %944 = xor i32 %942, %943
  %945 = tail call i32 @llvm.fshl.i32(i32 %941, i32 %941, i32 7)
  %946 = xor i32 %944, %945
  %947 = xor i32 %883, %852
  %948 = and i32 %941, %947
  %949 = xor i32 %948, %852
  %950 = tail call i32 @llvm.fshl.i32(i32 %878, i32 %878, i32 15)
  %951 = tail call i32 @llvm.fshl.i32(i32 %878, i32 %878, i32 13)
  %952 = xor i32 %950, %951
  %953 = lshr i32 %878, 10
  %954 = xor i32 %952, %953
  %955 = add i32 %528, %677
  %956 = add i32 %955, %954
  %957 = add i32 %956, %522
  %958 = add i32 %957, %831
  %959 = add i32 %958, %949
  %960 = add i32 %959, %946
  %961 = add i32 %960, %833
  %962 = tail call i32 @llvm.fshl.i32(i32 %961, i32 %961, i32 26)
  %963 = tail call i32 @llvm.fshl.i32(i32 %961, i32 %961, i32 21)
  %964 = xor i32 %962, %963
  %965 = tail call i32 @llvm.fshl.i32(i32 %961, i32 %961, i32 7)
  %966 = xor i32 %964, %965
  %967 = xor i32 %941, %883
  %968 = and i32 %961, %967
  %969 = xor i32 %968, %883
  %970 = add i32 %918, %530
  %971 = add i32 %970, %852
  %972 = add i32 %971, %969
  %973 = add i32 %972, %966
  %974 = add i32 %973, %863
  %975 = insertelement <2 x i32> %936, i32 %974, i64 1
  %976 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %975, <2 x i32> %975, <2 x i32> <i32 30, i32 26>)
  %977 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %975, <2 x i32> %975, <2 x i32> <i32 19, i32 21>)
  %978 = xor <2 x i32> %976, %977
  %979 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %975, <2 x i32> %975, <2 x i32> <i32 10, i32 7>)
  %980 = xor <2 x i32> %978, %979
  %981 = xor i32 %961, %941
  %982 = and i32 %974, %981
  %983 = xor i32 %982, %941
  %984 = tail call i32 @llvm.fshl.i32(i32 %956, i32 %956, i32 15)
  %985 = tail call i32 @llvm.fshl.i32(i32 %956, i32 %956, i32 13)
  %986 = xor i32 %984, %985
  %987 = lshr i32 %956, 10
  %988 = xor i32 %986, %987
  %989 = add i32 %544, %688
  %990 = add i32 %989, %988
  %991 = add i32 %990, %538
  %992 = add i32 %991, %883
  %993 = insertelement <2 x i32> poison, i32 %938, i64 0
  %994 = insertelement <2 x i32> %993, i32 %992, i64 1
  %995 = insertelement <2 x i32> poison, i32 %940, i64 0
  %996 = insertelement <2 x i32> %995, i32 %983, i64 1
  %997 = add <2 x i32> %994, %996
  %998 = xor <2 x i32> %994, %996
  %999 = shufflevector <2 x i32> %998, <2 x i32> %997, <2 x i32> <i32 0, i32 3>
  %1000 = add <2 x i32> %999, %980
  %1001 = add <2 x i32> %1000, %932
  %1002 = insertelement <2 x i32> %1000, i32 %546, i64 1
  %1003 = add <2 x i32> %930, %1002
  %1004 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %1001, <2 x i32> %1001, <2 x i32> <i32 30, i32 26>)
  %1005 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %1001, <2 x i32> %1001, <2 x i32> <i32 19, i32 21>)
  %1006 = xor <2 x i32> %1004, %1005
  %1007 = tail call <2 x i32> @llvm.fshl.v2i32(<2 x i32> %1001, <2 x i32> %1001, <2 x i32> <i32 10, i32 7>)
  %1008 = xor <2 x i32> %1006, %1007
  %1009 = xor i32 %974, %961
  %1010 = insertelement <2 x i32> %936, i32 %1009, i64 1
  %1011 = and <2 x i32> %1001, %1010
  %1012 = xor <2 x i32> %1001, %1010
  %1013 = shufflevector <2 x i32> %1012, <2 x i32> %1011, <2 x i32> <i32 0, i32 3>
  %1014 = insertelement <2 x i32> poison, i32 %863, i64 0
  %1015 = insertelement <2 x i32> %1014, i32 %961, i64 1
  %1016 = xor <2 x i32> %1013, %1015
  %1017 = and <2 x i32> %1013, %1015
  %1018 = shufflevector <2 x i32> %1017, <2 x i32> %1016, <2 x i32> <i32 0, i32 3>
  %1019 = add <2 x i32> %1003, %936
  %1020 = and <2 x i32> %1003, %936
  %1021 = shufflevector <2 x i32> %1020, <2 x i32> %1019, <2 x i32> <i32 0, i32 3>
  %1022 = add <2 x i32> %1021, %1018
  %1023 = xor <2 x i32> %1021, %1018
  %1024 = shufflevector <2 x i32> %1023, <2 x i32> %1022, <2 x i32> <i32 0, i32 3>
  %1025 = add <2 x i32> %1024, %1008
  %1026 = insertelement <2 x i32> poison, i32 %960, i64 0
  %1027 = shufflevector <2 x i32> %1026, <2 x i32> %1003, <2 x i32> <i32 0, i32 2>
  %1028 = add <2 x i32> %1025, %1027
  %1029 = extractelement <2 x i32> %1028, i64 0
  %1030 = tail call i32 @llvm.fshl.i32(i32 %1029, i32 %1029, i32 30)
  %1031 = tail call i32 @llvm.fshl.i32(i32 %1029, i32 %1029, i32 19)
  %1032 = xor i32 %1030, %1031
  %1033 = tail call i32 @llvm.fshl.i32(i32 %1029, i32 %1029, i32 10)
  %1034 = xor i32 %1032, %1033
  %1035 = extractelement <2 x i32> %1003, i64 0
  %1036 = and i32 %1029, %1035
  %1037 = xor i32 %1029, %1035
  %1038 = and i32 %1037, %937
  %1039 = xor i32 %1038, %1036
  %1040 = add i32 %1034, %1039
  %1041 = add i32 %1040, %973
  %1042 = tail call i32 @llvm.fshl.i32(i32 %1041, i32 %1041, i32 30)
  %1043 = tail call i32 @llvm.fshl.i32(i32 %1041, i32 %1041, i32 19)
  %1044 = xor i32 %1042, %1043
  %1045 = tail call i32 @llvm.fshl.i32(i32 %1041, i32 %1041, i32 10)
  %1046 = xor i32 %1044, %1045
  %1047 = and i32 %1041, %1029
  %1048 = xor i32 %1041, %1029
  %1049 = and i32 %1048, %1035
  %1050 = xor i32 %1049, %1047
  %1051 = add i32 %1046, %1050
  %1052 = extractelement <2 x i32> %1000, i64 1
  %1053 = add i32 %1051, %1052
  %1054 = tail call i32 @llvm.fshl.i32(i32 %1053, i32 %1053, i32 30)
  %1055 = tail call i32 @llvm.fshl.i32(i32 %1053, i32 %1053, i32 19)
  %1056 = xor i32 %1054, %1055
  %1057 = tail call i32 @llvm.fshl.i32(i32 %1053, i32 %1053, i32 10)
  %1058 = xor i32 %1056, %1057
  %1059 = and i32 %1053, %1041
  %1060 = xor i32 %1053, %1041
  %1061 = and i32 %1060, %1029
  %1062 = xor i32 %1061, %1059
  %1063 = add i32 %1058, %1062
  %1064 = extractelement <2 x i32> %1025, i64 1
  %1065 = add i32 %1063, %1064
  %1066 = add nuw nsw i32 %407, 16
  %1067 = icmp samesign ult i32 %407, 48
  %1068 = shufflevector <2 x i32> %573, <2 x i32> %930, <2 x i32> <i32 0, i32 3>
  %1069 = insertelement <2 x i32> %665, i32 %878, i64 1
  %1070 = extractelement <2 x i32> %1001, i64 1
  br i1 %1067, label %395, label %1071, !llvm.loop !14

1071:                                             ; preds = %395
  %1072 = add i32 %1065, %99
  store i32 %1072, ptr %0, align 4, !tbaa !6
  %1073 = add i32 %1053, %101
  store i32 %1073, ptr %100, align 4, !tbaa !6
  %1074 = add i32 %1041, %103
  store i32 %1074, ptr %102, align 4, !tbaa !6
  %1075 = add i32 %1029, %105
  store i32 %1075, ptr %104, align 4, !tbaa !6
  %1076 = extractelement <2 x i32> %1028, i64 1
  %1077 = add i32 %1076, %107
  store i32 %1077, ptr %106, align 4, !tbaa !6
  %1078 = add i32 %1070, %109
  store i32 %1078, ptr %108, align 4, !tbaa !6
  %1079 = add i32 %974, %111
  store i32 %1079, ptr %110, align 4, !tbaa !6
  %1080 = add i32 %961, %113
  store i32 %1080, ptr %112, align 4, !tbaa !6
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #10
  ret void
}

; Function Attrs: nounwind
define dso_local void @sha256_init(ptr noundef %0) #2 {
  %2 = tail call ptr @memcpy(ptr noundef %0, ptr noundef nonnull @sha256_init.H0, i32 noundef 32) #11
  %3 = getelementptr inbounds nuw i8, ptr %0, i32 32
  store i64 0, ptr %3, align 8, !tbaa !15
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 104
  store i32 0, ptr %4, align 8, !tbaa !18
  ret void
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nounwind
define dso_local void @sha256_update(ptr noundef %0, i32 noundef %1, ptr noundef %2) #2 {
  %4 = getelementptr inbounds nuw i8, ptr %0, i32 104
  %5 = load i32, ptr %4, align 8, !tbaa !18
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %23, label %7

7:                                                ; preds = %3
  %8 = sub i32 64, %5
  %9 = icmp ult i32 %1, %8
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 40
  %11 = getelementptr inbounds nuw i8, ptr %10, i32 %5
  br i1 %9, label %19, label %12

12:                                               ; preds = %7
  %13 = tail call ptr @memcpy(ptr noundef nonnull %11, ptr noundef %2, i32 noundef %8) #11
  tail call void @_nettle_sha256_compress(ptr noundef nonnull %0, ptr noundef nonnull %10, ptr noundef nonnull @K) #12
  %14 = getelementptr inbounds nuw i8, ptr %0, i32 32
  %15 = load i64, ptr %14, align 8, !tbaa !15
  %16 = add i64 %15, 1
  store i64 %16, ptr %14, align 8, !tbaa !15
  %17 = getelementptr inbounds nuw i8, ptr %2, i32 %8
  %18 = sub nuw i32 %1, %8
  br label %23

19:                                               ; preds = %7
  %20 = tail call ptr @memcpy(ptr noundef nonnull %11, ptr noundef %2, i32 noundef %1) #11
  %21 = load i32, ptr %4, align 8, !tbaa !18
  %22 = add i32 %21, %1
  br label %42

23:                                               ; preds = %12, %3
  %24 = phi ptr [ %17, %12 ], [ %2, %3 ]
  %25 = phi i32 [ %18, %12 ], [ %1, %3 ]
  %26 = icmp ugt i32 %25, 63
  br i1 %26, label %27, label %37

27:                                               ; preds = %23
  %28 = getelementptr inbounds nuw i8, ptr %0, i32 32
  br label %29

29:                                               ; preds = %27, %29
  %30 = phi i32 [ %25, %27 ], [ %35, %29 ]
  %31 = phi ptr [ %24, %27 ], [ %34, %29 ]
  tail call void @_nettle_sha256_compress(ptr noundef nonnull %0, ptr noundef %31, ptr noundef nonnull @K) #12
  %32 = load i64, ptr %28, align 8, !tbaa !15
  %33 = add i64 %32, 1
  store i64 %33, ptr %28, align 8, !tbaa !15
  %34 = getelementptr inbounds nuw i8, ptr %31, i32 64
  %35 = add i32 %30, -64
  %36 = icmp ugt i32 %35, 63
  br i1 %36, label %29, label %37, !llvm.loop !19

37:                                               ; preds = %29, %23
  %38 = phi ptr [ %24, %23 ], [ %34, %29 ]
  %39 = phi i32 [ %25, %23 ], [ %35, %29 ]
  %40 = getelementptr inbounds nuw i8, ptr %0, i32 40
  %41 = tail call ptr @memcpy(ptr noundef nonnull %40, ptr noundef %38, i32 noundef %39) #11
  br label %42

42:                                               ; preds = %19, %37
  %43 = phi i32 [ %22, %19 ], [ %39, %37 ]
  store i32 %43, ptr %4, align 8, !tbaa !18
  ret void
}

; Function Attrs: nounwind
define dso_local void @sha256_digest(ptr noundef %0, i32 noundef %1, ptr noundef writeonly captures(none) %2) #2 {
  %4 = icmp ult i32 %1, 33
  br i1 %4, label %6, label %5

5:                                                ; preds = %3
  tail call void @exit(i32 noundef 1) #13
  unreachable

6:                                                ; preds = %3
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 104
  %8 = load i32, ptr %7, align 8, !tbaa !18
  %9 = icmp ult i32 %8, 64
  br i1 %9, label %11, label %10

10:                                               ; preds = %6
  tail call void @exit(i32 noundef 1) #13
  unreachable

11:                                               ; preds = %6
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 40
  %13 = add nuw nsw i32 %8, 1
  %14 = getelementptr inbounds nuw i8, ptr %12, i32 %8
  store i8 -128, ptr %14, align 1, !tbaa !10
  %15 = icmp samesign ugt i32 %8, 55
  br i1 %15, label %16, label %20

16:                                               ; preds = %11
  %17 = getelementptr inbounds nuw i8, ptr %12, i32 %13
  %18 = sub nuw nsw i32 63, %8
  %19 = tail call ptr @memset(ptr noundef nonnull %17, i32 noundef 0, i32 noundef %18) #11
  tail call void @_nettle_sha256_compress(ptr noundef nonnull %0, ptr noundef nonnull %12, ptr noundef nonnull @K) #12
  br label %20

20:                                               ; preds = %16, %11
  %21 = phi i32 [ 0, %16 ], [ %13, %11 ]
  %22 = getelementptr inbounds nuw i8, ptr %12, i32 %21
  %23 = sub nuw nsw i32 56, %21
  %24 = tail call ptr @memset(ptr noundef nonnull %22, i32 noundef 0, i32 noundef %23) #11
  %25 = getelementptr inbounds nuw i8, ptr %0, i32 32
  %26 = load i64, ptr %25, align 8, !tbaa !15
  %27 = shl i64 %26, 9
  %28 = load i32, ptr %7, align 8, !tbaa !18
  %29 = shl i32 %28, 3
  %30 = zext i32 %29 to i64
  %31 = or i64 %27, %30
  %32 = lshr i64 %27, 56
  %33 = trunc nuw i64 %32 to i8
  %34 = getelementptr inbounds nuw i8, ptr %0, i32 96
  store i8 %33, ptr %34, align 8, !tbaa !10
  %35 = lshr i64 %27, 48
  %36 = trunc i64 %35 to i8
  %37 = getelementptr inbounds nuw i8, ptr %0, i32 97
  store i8 %36, ptr %37, align 1, !tbaa !10
  %38 = lshr i64 %27, 40
  %39 = trunc i64 %38 to i8
  %40 = getelementptr inbounds nuw i8, ptr %0, i32 98
  store i8 %39, ptr %40, align 2, !tbaa !10
  %41 = lshr i64 %27, 32
  %42 = trunc i64 %41 to i8
  %43 = getelementptr inbounds nuw i8, ptr %0, i32 99
  store i8 %42, ptr %43, align 1, !tbaa !10
  %44 = lshr i64 %31, 24
  %45 = trunc i64 %44 to i8
  %46 = getelementptr inbounds nuw i8, ptr %0, i32 100
  store i8 %45, ptr %46, align 4, !tbaa !10
  %47 = lshr i64 %31, 16
  %48 = trunc i64 %47 to i8
  %49 = getelementptr inbounds nuw i8, ptr %0, i32 101
  store i8 %48, ptr %49, align 1, !tbaa !10
  %50 = lshr i64 %31, 8
  %51 = trunc i64 %50 to i8
  %52 = getelementptr inbounds nuw i8, ptr %0, i32 102
  store i8 %51, ptr %52, align 2, !tbaa !10
  %53 = trunc i32 %29 to i8
  %54 = getelementptr inbounds nuw i8, ptr %0, i32 103
  store i8 %53, ptr %54, align 1, !tbaa !10
  tail call void @_nettle_sha256_compress(ptr noundef nonnull %0, ptr noundef nonnull %12, ptr noundef nonnull @K) #12
  %55 = lshr i32 %1, 2
  %56 = and i32 %1, 3
  %57 = icmp eq i32 %55, 0
  br i1 %57, label %79, label %58

58:                                               ; preds = %20, %58
  %59 = phi ptr [ %77, %58 ], [ %2, %20 ]
  %60 = phi i32 [ %76, %58 ], [ 0, %20 ]
  %61 = getelementptr inbounds nuw i32, ptr %0, i32 %60
  %62 = load i32, ptr %61, align 4, !tbaa !6
  %63 = lshr i32 %62, 24
  %64 = trunc nuw i32 %63 to i8
  store i8 %64, ptr %59, align 1, !tbaa !10
  %65 = load i32, ptr %61, align 4, !tbaa !6
  %66 = lshr i32 %65, 16
  %67 = trunc i32 %66 to i8
  %68 = getelementptr inbounds nuw i8, ptr %59, i32 1
  store i8 %67, ptr %68, align 1, !tbaa !10
  %69 = load i32, ptr %61, align 4, !tbaa !6
  %70 = lshr i32 %69, 8
  %71 = trunc i32 %70 to i8
  %72 = getelementptr inbounds nuw i8, ptr %59, i32 2
  store i8 %71, ptr %72, align 1, !tbaa !10
  %73 = load i32, ptr %61, align 4, !tbaa !6
  %74 = trunc i32 %73 to i8
  %75 = getelementptr inbounds nuw i8, ptr %59, i32 3
  store i8 %74, ptr %75, align 1, !tbaa !10
  %76 = add nuw nsw i32 %60, 1
  %77 = getelementptr inbounds nuw i8, ptr %59, i32 4
  %78 = icmp eq i32 %76, %55
  br i1 %78, label %79, label %58, !llvm.loop !11

79:                                               ; preds = %58, %20
  %80 = phi ptr [ %2, %20 ], [ %77, %58 ]
  %81 = icmp eq i32 %56, 0
  br i1 %81, label %97, label %82

82:                                               ; preds = %79
  %83 = getelementptr inbounds nuw i32, ptr %0, i32 %55
  %84 = load i32, ptr %83, align 4, !tbaa !6
  switch i32 %56, label %85 [
    i32 3, label %86
    i32 2, label %90
    i32 1, label %94
  ]

85:                                               ; preds = %82
  unreachable

86:                                               ; preds = %82
  %87 = lshr i32 %84, 8
  %88 = trunc i32 %87 to i8
  %89 = getelementptr i8, ptr %80, i32 2
  store i8 %88, ptr %89, align 1, !tbaa !10
  br label %90

90:                                               ; preds = %86, %82
  %91 = lshr i32 %84, 16
  %92 = trunc i32 %91 to i8
  %93 = getelementptr inbounds nuw i8, ptr %80, i32 1
  store i8 %92, ptr %93, align 1, !tbaa !10
  br label %94

94:                                               ; preds = %90, %82
  %95 = lshr i32 %84, 24
  %96 = trunc nuw i32 %95 to i8
  store i8 %96, ptr %80, align 1, !tbaa !10
  br label %97

97:                                               ; preds = %79, %94
  %98 = tail call ptr @memcpy(ptr noundef nonnull %0, ptr noundef nonnull @sha256_init.H0, i32 noundef 32) #11
  store i64 0, ptr %25, align 8, !tbaa !15
  store i32 0, ptr %7, align 8, !tbaa !18
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @verify_benchmark(i32 noundef %0) local_unnamed_addr #4 {
  %2 = load <8 x i8>, ptr @hash, align 8, !tbaa !10
  %3 = load <8 x i8>, ptr @buffer, align 8, !tbaa !10
  %4 = icmp eq <8 x i8> %2, %3
  %5 = freeze <8 x i1> %4
  %6 = bitcast <8 x i1> %5 to i8
  %7 = icmp eq i8 %6, -1
  %8 = zext i1 %7 to i32
  ret i32 %8
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local void @initialise_benchmark() local_unnamed_addr #5 {
  ret void
}

; Function Attrs: nounwind
define dso_local void @warm_caches(i32 noundef %0) local_unnamed_addr #2 {
  tail call fastcc void @benchmark_body(i32 noundef %0) #12
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @benchmark_body(i32 noundef %0) unnamed_addr #6 {
  %2 = alloca %struct.sha256_ctx, align 8
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %4, label %13

4:                                                ; preds = %1
  %5 = getelementptr inbounds nuw i8, ptr %2, i32 32
  %6 = getelementptr inbounds nuw i8, ptr %2, i32 104
  br label %7

7:                                                ; preds = %4, %7
  %8 = phi i32 [ 0, %4 ], [ %11, %7 ]
  %9 = call ptr @memset(ptr noundef nonnull @buffer, i32 noundef 0, i32 noundef 32) #11
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #10
  %10 = call ptr @memcpy(ptr noundef nonnull %2, ptr noundef nonnull @sha256_init.H0, i32 noundef 32) #11
  store i64 0, ptr %5, align 8, !tbaa !15
  store i32 0, ptr %6, align 8, !tbaa !18
  call void @sha256_update(ptr noundef nonnull %2, i32 noundef 56, ptr noundef nonnull @msg) #12
  call void @sha256_digest(ptr noundef nonnull %2, i32 noundef 32, ptr noundef nonnull @buffer) #12
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #10
  %11 = add nuw nsw i32 %8, 1
  %12 = icmp eq i32 %11, %0
  br i1 %12, label %13, label %7, !llvm.loop !20

13:                                               ; preds = %7, %1
  ret void
}

; Function Attrs: noinline nounwind
define dso_local noundef i32 @benchmark() local_unnamed_addr #6 {
  tail call fastcc void @benchmark_body(i32 noundef 475) #12
  ret i32 0
}

; Function Attrs: noreturn
declare dso_local void @exit(i32 noundef) local_unnamed_addr #7

declare dso_local ptr @memset(ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.fshl.v2i32(<2 x i32>, <2 x i32>, <2 x i32>) #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.or.v4i32(<4 x i32>) #9

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #6 = { noinline nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #7 = { noreturn "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #8 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #9 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #10 = { nounwind }
attributes #11 = { nobuiltin nounwind "no-builtins" }
attributes #12 = { nobuiltin "no-builtins" }
attributes #13 = { nobuiltin noreturn nounwind "no-builtins" }

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
!10 = !{!8, !8, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = !{!16, !17, i64 32}
!16 = !{!"sha256_ctx", !8, i64 0, !17, i64 32, !8, i64 40, !7, i64 104}
!17 = !{!"long long", !8, i64 0}
!18 = !{!16, !7, i64 104}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !12}
