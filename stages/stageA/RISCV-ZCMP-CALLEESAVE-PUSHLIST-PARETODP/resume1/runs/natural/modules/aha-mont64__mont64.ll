; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1\resources\corpus\embench\src\aha-mont64\mont64.c'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\\resume1\\resources\\corpus\\embench\\src\\aha-mont64\\mont64.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

@in_m = internal unnamed_addr global i1 false, align 8
@in_b = internal unnamed_addr global i1 false, align 8
@in_a = internal unnamed_addr global i1 false, align 8

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define dso_local void @mulul64(i64 noundef %0, i64 noundef %1, ptr noundef writeonly captures(none) initializes((0, 8)) %2, ptr noundef writeonly captures(none) initializes((0, 8)) %3) local_unnamed_addr #0 {
  %5 = lshr i64 %0, 32
  %6 = and i64 %0, 4294967295
  %7 = lshr i64 %1, 32
  %8 = and i64 %1, 4294967295
  %9 = mul nuw i64 %8, %6
  %10 = and i64 %9, 4294967295
  %11 = lshr i64 %9, 32
  %12 = mul nuw i64 %8, %5
  %13 = add nuw i64 %11, %12
  %14 = and i64 %13, 4294967295
  %15 = lshr i64 %13, 32
  %16 = mul nuw i64 %7, %6
  %17 = add nuw i64 %14, %16
  %18 = lshr i64 %17, 32
  %19 = shl i64 %17, 32
  %20 = or disjoint i64 %19, %10
  store i64 %20, ptr %3, align 8, !tbaa !10
  %21 = mul nuw i64 %7, %5
  %22 = add nuw i64 %15, %21
  %23 = add nuw i64 %22, %18
  store i64 %23, ptr %2, align 8, !tbaa !10
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nofree norecurse nosync nounwind memory(none)
define dso_local i64 @modul64(i64 noundef %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #2 {
  br label %4

4:                                                ; preds = %3, %4
  %5 = phi i64 [ %0, %3 ], [ %16, %4 ]
  %6 = phi i64 [ 1, %3 ], [ %17, %4 ]
  %7 = phi i64 [ %1, %3 ], [ %14, %4 ]
  %8 = ashr i64 %5, 63
  %9 = tail call i64 @llvm.fshl.i64(i64 %5, i64 %7, i64 1)
  %10 = shl i64 %7, 1
  %11 = or i64 %9, %8
  %12 = icmp uge i64 %11, %2
  %13 = zext i1 %12 to i64
  %14 = or disjoint i64 %10, %13
  %15 = select i1 %12, i64 %2, i64 0
  %16 = sub i64 %9, %15
  %17 = add nuw nsw i64 %6, 1
  %18 = icmp samesign ult i64 %6, 64
  br i1 %18, label %4, label %19, !llvm.loop !12

19:                                               ; preds = %4
  ret i64 %16
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local i64 @montmul(i64 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3) local_unnamed_addr #3 {
  %5 = lshr i64 %0, 32
  %6 = and i64 %0, 4294967295
  %7 = lshr i64 %1, 32
  %8 = and i64 %1, 4294967295
  %9 = mul nuw i64 %8, %6
  %10 = and i64 %9, 4294967295
  %11 = lshr i64 %9, 32
  %12 = mul nuw i64 %8, %5
  %13 = add nuw i64 %11, %12
  %14 = and i64 %13, 4294967295
  %15 = lshr i64 %13, 32
  %16 = mul nuw i64 %7, %6
  %17 = add nuw i64 %14, %16
  %18 = lshr i64 %17, 32
  %19 = shl i64 %17, 32
  %20 = or disjoint i64 %19, %10
  %21 = mul nuw i64 %7, %5
  %22 = add nuw i64 %15, %21
  %23 = mul i64 %20, %3
  %24 = lshr i64 %23, 32
  %25 = and i64 %23, 4294967295
  %26 = lshr i64 %2, 32
  %27 = and i64 %2, 4294967295
  %28 = mul nuw i64 %25, %27
  %29 = and i64 %28, 4294967295
  %30 = lshr i64 %28, 32
  %31 = mul nuw i64 %24, %27
  %32 = mul nuw i64 %25, %26
  %33 = mul nuw i64 %24, %26
  %34 = xor i64 %20, -1
  %35 = add nuw i64 %22, %18
  %36 = add nuw i64 %30, %31
  %37 = and i64 %36, 4294967295
  %38 = add nuw i64 %37, %32
  %39 = shl i64 %38, 32
  %40 = or disjoint i64 %39, %29
  %41 = icmp ugt i64 %40, %34
  %42 = zext i1 %41 to i64
  %43 = insertelement <4 x i64> poison, i64 %36, i64 0
  %44 = insertelement <4 x i64> %43, i64 %38, i64 1
  %45 = insertelement <4 x i64> %44, i64 %42, i64 2
  %46 = insertelement <4 x i64> %45, i64 %35, i64 3
  %47 = lshr <4 x i64> %46, <i64 32, i64 32, i64 0, i64 0>
  %48 = tail call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %47)
  %49 = add i64 %48, %33
  %50 = icmp ult i64 %49, %35
  %51 = icmp eq i64 %49, %35
  %52 = and i1 %41, %51
  %53 = or i1 %50, %52
  %54 = icmp uge i64 %49, %2
  %55 = or i1 %54, %53
  %56 = select i1 %55, i64 %2, i64 0
  %57 = sub i64 %49, %56
  ret i64 %57
}

; Function Attrs: nofree norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define dso_local void @xbinGCD(i64 noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3) local_unnamed_addr #4 {
  %5 = icmp eq i64 %0, 0
  br i1 %5, label %27, label %6

6:                                                ; preds = %4, %23
  %7 = phi i64 [ %25, %23 ], [ 0, %4 ]
  %8 = phi i64 [ %24, %23 ], [ 1, %4 ]
  %9 = phi i64 [ %10, %23 ], [ %0, %4 ]
  %10 = lshr i64 %9, 1
  %11 = and i64 %8, 1
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %6
  %14 = lshr exact i64 %8, 1
  %15 = lshr i64 %7, 1
  br label %23

16:                                               ; preds = %6
  %17 = xor i64 %8, %1
  %18 = lshr i64 %17, 1
  %19 = and i64 %8, %1
  %20 = add i64 %18, %19
  %21 = lshr i64 %7, 1
  %22 = add i64 %21, %0
  br label %23

23:                                               ; preds = %16, %13
  %24 = phi i64 [ %14, %13 ], [ %20, %16 ]
  %25 = phi i64 [ %15, %13 ], [ %22, %16 ]
  %26 = icmp eq i64 %10, 0
  br i1 %26, label %27, label %6, !llvm.loop !14

27:                                               ; preds = %23, %4
  %28 = phi i64 [ 1, %4 ], [ %24, %23 ]
  %29 = phi i64 [ 0, %4 ], [ %25, %23 ]
  store volatile i64 %28, ptr %2, align 8, !tbaa !10
  store volatile i64 %29, ptr %3, align 8, !tbaa !10
  ret void
}

; Function Attrs: nofree norecurse nounwind memory(read, inaccessiblemem: readwrite, target_mem0: none, target_mem1: none)
define dso_local void @warm_caches(i32 noundef %0) local_unnamed_addr #5 {
  %2 = tail call fastcc i32 @benchmark_body(i32 noundef %0) #11
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind memory(read, argmem: none, inaccessiblemem: readwrite, target_mem0: none, target_mem1: none)
define internal fastcc i32 @benchmark_body(i32 noundef %0) unnamed_addr #6 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %5, label %364

5:                                                ; preds = %1
  %6 = load i1, ptr @in_m, align 8
  %7 = select i1 %6, i64 -366962936819156833, i64 0
  %8 = load i1, ptr @in_b, align 8
  %9 = select i1 %8, i64 1473642379452024179, i64 0
  %10 = load i1, ptr @in_a, align 8
  %11 = select i1 %10, i64 380896260630216687, i64 0
  %12 = lshr i64 %11, 32
  %13 = and i64 %11, 2267250671
  %14 = lshr i64 %9, 32
  %15 = and i64 %9, 3107128691
  %16 = mul nuw nsw i64 %13, %15
  %17 = and i64 %16, 4294967295
  %18 = lshr i64 %16, 32
  %19 = mul nuw nsw i64 %12, %15
  %20 = add nuw nsw i64 %18, %19
  %21 = and i64 %20, 4294967295
  %22 = lshr i64 %20, 32
  %23 = mul nuw nsw i64 %13, %14
  %24 = add nuw nsw i64 %21, %23
  %25 = lshr i64 %24, 32
  %26 = shl i64 %24, 32
  %27 = or disjoint i64 %26, %17
  %28 = mul nuw nsw i64 %12, %14
  %29 = add nuw nsw i64 %22, %28
  %30 = add nuw nsw i64 %29, %25
  %31 = lshr i64 %7, 32
  %32 = and i64 %7, 958986399
  br label %33

33:                                               ; preds = %5, %354
  %34 = phi i32 [ 0, %5 ], [ %355, %354 ]
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  br label %35

35:                                               ; preds = %35, %33
  %36 = phi i64 [ %30, %33 ], [ %47, %35 ]
  %37 = phi i64 [ 1, %33 ], [ %48, %35 ]
  %38 = phi i64 [ %27, %33 ], [ %45, %35 ]
  %39 = ashr i64 %36, 63
  %40 = tail call i64 @llvm.fshl.i64(i64 %36, i64 %38, i64 1)
  %41 = shl i64 %38, 1
  %42 = or i64 %40, %39
  %43 = icmp uge i64 %42, %7
  %44 = zext i1 %43 to i64
  %45 = or disjoint i64 %41, %44
  %46 = select i1 %43, i64 %7, i64 0
  %47 = sub i64 %40, %46
  %48 = add nuw nsw i64 %37, 1
  %49 = icmp samesign ult i64 %37, 64
  br i1 %49, label %35, label %50, !llvm.loop !12

50:                                               ; preds = %35
  %51 = lshr i64 %47, 32
  %52 = and i64 %47, 4294967295
  %53 = mul nuw i64 %52, %52
  %54 = and i64 %53, 4294967295
  %55 = lshr i64 %53, 32
  %56 = mul nuw i64 %52, %51
  %57 = add nuw i64 %55, %56
  %58 = and i64 %57, 4294967295
  %59 = lshr i64 %57, 32
  %60 = add nuw i64 %58, %56
  %61 = lshr i64 %60, 32
  %62 = shl i64 %60, 32
  %63 = or disjoint i64 %62, %54
  %64 = mul nuw i64 %51, %51
  %65 = add nuw i64 %59, %64
  %66 = add nuw i64 %65, %61
  br label %67

67:                                               ; preds = %67, %50
  %68 = phi i64 [ %66, %50 ], [ %79, %67 ]
  %69 = phi i64 [ 1, %50 ], [ %80, %67 ]
  %70 = phi i64 [ %63, %50 ], [ %77, %67 ]
  %71 = ashr i64 %68, 63
  %72 = tail call i64 @llvm.fshl.i64(i64 %68, i64 %70, i64 1)
  %73 = shl i64 %70, 1
  %74 = or i64 %72, %71
  %75 = icmp uge i64 %74, %7
  %76 = zext i1 %75 to i64
  %77 = or disjoint i64 %73, %76
  %78 = select i1 %75, i64 %7, i64 0
  %79 = sub i64 %72, %78
  %80 = add nuw nsw i64 %69, 1
  %81 = icmp samesign ult i64 %69, 64
  br i1 %81, label %67, label %82, !llvm.loop !12

82:                                               ; preds = %67
  %83 = lshr i64 %79, 32
  %84 = and i64 %79, 4294967295
  %85 = mul nuw i64 %84, %84
  %86 = and i64 %85, 4294967295
  %87 = lshr i64 %85, 32
  %88 = mul nuw i64 %84, %83
  %89 = add nuw i64 %87, %88
  %90 = and i64 %89, 4294967295
  %91 = lshr i64 %89, 32
  %92 = add nuw i64 %90, %88
  %93 = lshr i64 %92, 32
  %94 = shl i64 %92, 32
  %95 = or disjoint i64 %94, %86
  %96 = mul nuw i64 %83, %83
  %97 = add nuw i64 %91, %96
  %98 = add nuw i64 %97, %93
  br label %99

99:                                               ; preds = %99, %82
  %100 = phi i64 [ %98, %82 ], [ %111, %99 ]
  %101 = phi i64 [ 1, %82 ], [ %112, %99 ]
  %102 = phi i64 [ %95, %82 ], [ %109, %99 ]
  %103 = ashr i64 %100, 63
  %104 = tail call i64 @llvm.fshl.i64(i64 %100, i64 %102, i64 1)
  %105 = shl i64 %102, 1
  %106 = or i64 %104, %103
  %107 = icmp uge i64 %106, %7
  %108 = zext i1 %107 to i64
  %109 = or disjoint i64 %105, %108
  %110 = select i1 %107, i64 %7, i64 0
  %111 = sub i64 %104, %110
  %112 = add nuw nsw i64 %101, 1
  %113 = icmp samesign ult i64 %101, 64
  br i1 %113, label %99, label %114, !llvm.loop !12

114:                                              ; preds = %99, %131
  %115 = phi i64 [ %133, %131 ], [ 0, %99 ]
  %116 = phi i64 [ %132, %131 ], [ 1, %99 ]
  %117 = phi i64 [ %118, %131 ], [ -9223372036854775808, %99 ]
  %118 = lshr i64 %117, 1
  %119 = and i64 %116, 1
  %120 = icmp eq i64 %119, 0
  br i1 %120, label %121, label %124

121:                                              ; preds = %114
  %122 = lshr exact i64 %116, 1
  %123 = lshr i64 %115, 1
  br label %131

124:                                              ; preds = %114
  %125 = xor i64 %116, %7
  %126 = lshr i64 %125, 1
  %127 = and i64 %116, %7
  %128 = add i64 %126, %127
  %129 = lshr i64 %115, 1
  %130 = or disjoint i64 %129, -9223372036854775808
  br label %131

131:                                              ; preds = %124, %121
  %132 = phi i64 [ %122, %121 ], [ %128, %124 ]
  %133 = phi i64 [ %123, %121 ], [ %130, %124 ]
  %134 = icmp eq i64 %118, 0
  br i1 %134, label %135, label %114, !llvm.loop !14

135:                                              ; preds = %131
  store volatile i64 %132, ptr %2, align 8, !tbaa !10
  store volatile i64 %133, ptr %3, align 8, !tbaa !10
  %136 = load volatile i64, ptr %2, align 8, !tbaa !10
  %137 = load volatile i64, ptr %3, align 8, !tbaa !10
  br label %138

138:                                              ; preds = %138, %135
  %139 = phi i64 [ %11, %135 ], [ %150, %138 ]
  %140 = phi i64 [ 1, %135 ], [ %151, %138 ]
  %141 = phi i64 [ 0, %135 ], [ %148, %138 ]
  %142 = ashr i64 %139, 63
  %143 = tail call i64 @llvm.fshl.i64(i64 %139, i64 %141, i64 1)
  %144 = shl i64 %141, 1
  %145 = or i64 %143, %142
  %146 = icmp uge i64 %145, %7
  %147 = zext i1 %146 to i64
  %148 = or disjoint i64 %144, %147
  %149 = select i1 %146, i64 %7, i64 0
  %150 = sub i64 %143, %149
  %151 = add nuw nsw i64 %140, 1
  %152 = icmp samesign ult i64 %140, 64
  br i1 %152, label %138, label %153, !llvm.loop !12

153:                                              ; preds = %138, %153
  %154 = phi i64 [ %165, %153 ], [ %9, %138 ]
  %155 = phi i64 [ %166, %153 ], [ 1, %138 ]
  %156 = phi i64 [ %163, %153 ], [ 0, %138 ]
  %157 = ashr i64 %154, 63
  %158 = tail call i64 @llvm.fshl.i64(i64 %154, i64 %156, i64 1)
  %159 = shl i64 %156, 1
  %160 = or i64 %158, %157
  %161 = icmp uge i64 %160, %7
  %162 = zext i1 %161 to i64
  %163 = or disjoint i64 %159, %162
  %164 = select i1 %161, i64 %7, i64 0
  %165 = sub i64 %158, %164
  %166 = add nuw nsw i64 %155, 1
  %167 = icmp samesign ult i64 %155, 64
  br i1 %167, label %153, label %168, !llvm.loop !12

168:                                              ; preds = %153
  %169 = load volatile i64, ptr %3, align 8, !tbaa !10
  %170 = lshr i64 %150, 32
  %171 = and i64 %150, 4294967295
  %172 = lshr i64 %165, 32
  %173 = and i64 %165, 4294967295
  %174 = mul nuw i64 %173, %171
  %175 = and i64 %174, 4294967295
  %176 = lshr i64 %174, 32
  %177 = mul nuw i64 %173, %170
  %178 = add nuw i64 %176, %177
  %179 = and i64 %178, 4294967295
  %180 = lshr i64 %178, 32
  %181 = mul nuw i64 %172, %171
  %182 = add nuw i64 %179, %181
  %183 = lshr i64 %182, 32
  %184 = shl i64 %182, 32
  %185 = or disjoint i64 %184, %175
  %186 = mul nuw i64 %172, %170
  %187 = add nuw i64 %180, %186
  %188 = mul i64 %169, %185
  %189 = lshr i64 %188, 32
  %190 = and i64 %188, 4294967295
  %191 = mul nuw nsw i64 %190, %32
  %192 = and i64 %191, 4294967295
  %193 = lshr i64 %191, 32
  %194 = mul nuw nsw i64 %189, %32
  %195 = mul nuw i64 %190, %31
  %196 = mul nuw i64 %189, %31
  %197 = xor i64 %185, -1
  %198 = add nuw i64 %187, %183
  %199 = add nuw nsw i64 %193, %194
  %200 = and i64 %199, 4294967295
  %201 = add nuw i64 %200, %195
  %202 = shl i64 %201, 32
  %203 = or disjoint i64 %202, %192
  %204 = icmp ugt i64 %203, %197
  %205 = zext i1 %204 to i64
  %206 = insertelement <4 x i64> poison, i64 %199, i64 0
  %207 = insertelement <4 x i64> %206, i64 %201, i64 1
  %208 = insertelement <4 x i64> %207, i64 %205, i64 2
  %209 = insertelement <4 x i64> %208, i64 %198, i64 3
  %210 = lshr <4 x i64> %209, <i64 32, i64 32, i64 0, i64 0>
  %211 = tail call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %210)
  %212 = add i64 %211, %196
  %213 = icmp ult i64 %212, %198
  %214 = icmp eq i64 %212, %198
  %215 = and i1 %204, %214
  %216 = or i1 %213, %215
  %217 = icmp uge i64 %212, %7
  %218 = or i1 %217, %216
  %219 = select i1 %218, i64 %7, i64 0
  %220 = sub i64 %212, %219
  %221 = load volatile i64, ptr %3, align 8, !tbaa !10
  %222 = lshr i64 %220, 32
  %223 = and i64 %220, 4294967295
  %224 = mul nuw i64 %223, %223
  %225 = and i64 %224, 4294967295
  %226 = lshr i64 %224, 32
  %227 = mul nuw i64 %223, %222
  %228 = add nuw i64 %226, %227
  %229 = and i64 %228, 4294967295
  %230 = lshr i64 %228, 32
  %231 = add nuw i64 %229, %227
  %232 = lshr i64 %231, 32
  %233 = shl i64 %231, 32
  %234 = or disjoint i64 %233, %225
  %235 = mul nuw i64 %222, %222
  %236 = add nuw i64 %230, %235
  %237 = mul i64 %234, %221
  %238 = lshr i64 %237, 32
  %239 = and i64 %237, 4294967295
  %240 = mul nuw nsw i64 %239, %32
  %241 = and i64 %240, 4294967295
  %242 = lshr i64 %240, 32
  %243 = mul nuw nsw i64 %238, %32
  %244 = mul nuw i64 %239, %31
  %245 = mul nuw i64 %238, %31
  %246 = xor i64 %234, -1
  %247 = add nuw i64 %236, %232
  %248 = add nuw nsw i64 %242, %243
  %249 = and i64 %248, 4294967295
  %250 = add nuw i64 %249, %244
  %251 = shl i64 %250, 32
  %252 = or disjoint i64 %251, %241
  %253 = icmp ugt i64 %252, %246
  %254 = zext i1 %253 to i64
  %255 = insertelement <4 x i64> poison, i64 %248, i64 0
  %256 = insertelement <4 x i64> %255, i64 %250, i64 1
  %257 = insertelement <4 x i64> %256, i64 %254, i64 2
  %258 = insertelement <4 x i64> %257, i64 %247, i64 3
  %259 = lshr <4 x i64> %258, <i64 32, i64 32, i64 0, i64 0>
  %260 = tail call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %259)
  %261 = add i64 %260, %245
  %262 = icmp ult i64 %261, %247
  %263 = icmp eq i64 %261, %247
  %264 = and i1 %253, %263
  %265 = or i1 %262, %264
  %266 = icmp uge i64 %261, %7
  %267 = or i1 %266, %265
  %268 = select i1 %267, i64 %7, i64 0
  %269 = sub i64 %261, %268
  %270 = load volatile i64, ptr %3, align 8, !tbaa !10
  %271 = lshr i64 %269, 32
  %272 = and i64 %269, 4294967295
  %273 = mul nuw i64 %272, %272
  %274 = and i64 %273, 4294967295
  %275 = lshr i64 %273, 32
  %276 = mul nuw i64 %272, %271
  %277 = add nuw i64 %275, %276
  %278 = and i64 %277, 4294967295
  %279 = lshr i64 %277, 32
  %280 = add nuw i64 %278, %276
  %281 = lshr i64 %280, 32
  %282 = shl i64 %280, 32
  %283 = or disjoint i64 %282, %274
  %284 = mul nuw i64 %271, %271
  %285 = add nuw i64 %279, %284
  %286 = mul i64 %283, %270
  %287 = lshr i64 %286, 32
  %288 = and i64 %286, 4294967295
  %289 = mul nuw nsw i64 %288, %32
  %290 = and i64 %289, 4294967295
  %291 = lshr i64 %289, 32
  %292 = mul nuw nsw i64 %287, %32
  %293 = mul nuw i64 %288, %31
  %294 = mul nuw i64 %287, %31
  %295 = xor i64 %283, -1
  %296 = add nuw i64 %285, %281
  %297 = add nuw nsw i64 %291, %292
  %298 = and i64 %297, 4294967295
  %299 = add nuw i64 %298, %293
  %300 = shl i64 %299, 32
  %301 = or disjoint i64 %300, %290
  %302 = icmp ugt i64 %301, %295
  %303 = zext i1 %302 to i64
  %304 = insertelement <4 x i64> poison, i64 %297, i64 0
  %305 = insertelement <4 x i64> %304, i64 %299, i64 1
  %306 = insertelement <4 x i64> %305, i64 %303, i64 2
  %307 = insertelement <4 x i64> %306, i64 %296, i64 3
  %308 = lshr <4 x i64> %307, <i64 32, i64 32, i64 0, i64 0>
  %309 = tail call i64 @llvm.vector.reduce.add.v4i64(<4 x i64> %308)
  %310 = add i64 %309, %294
  %311 = icmp ult i64 %310, %296
  %312 = icmp eq i64 %310, %296
  %313 = and i1 %302, %312
  %314 = or i1 %311, %313
  %315 = icmp uge i64 %310, %7
  %316 = or i1 %315, %314
  %317 = select i1 %316, i64 %7, i64 0
  %318 = sub i64 %310, %317
  %319 = load volatile i64, ptr %2, align 8, !tbaa !10
  %320 = lshr i64 %318, 32
  %321 = and i64 %318, 4294967295
  %322 = lshr i64 %319, 32
  %323 = and i64 %319, 4294967295
  %324 = mul nuw i64 %321, %323
  %325 = and i64 %324, 4294967295
  %326 = lshr i64 %324, 32
  %327 = mul nuw i64 %320, %323
  %328 = add nuw i64 %326, %327
  %329 = and i64 %328, 4294967295
  %330 = lshr i64 %328, 32
  %331 = mul nuw i64 %321, %322
  %332 = add nuw i64 %329, %331
  %333 = lshr i64 %332, 32
  %334 = shl i64 %332, 32
  %335 = or disjoint i64 %334, %325
  %336 = mul nuw i64 %320, %322
  %337 = add nuw i64 %330, %336
  %338 = add nuw i64 %337, %333
  br label %339

339:                                              ; preds = %339, %168
  %340 = phi i64 [ %338, %168 ], [ %351, %339 ]
  %341 = phi i64 [ 1, %168 ], [ %352, %339 ]
  %342 = phi i64 [ %335, %168 ], [ %349, %339 ]
  %343 = ashr i64 %340, 63
  %344 = tail call i64 @llvm.fshl.i64(i64 %340, i64 %342, i64 1)
  %345 = shl i64 %342, 1
  %346 = or i64 %344, %343
  %347 = icmp uge i64 %346, %7
  %348 = zext i1 %347 to i64
  %349 = or disjoint i64 %345, %348
  %350 = select i1 %347, i64 %7, i64 0
  %351 = sub i64 %344, %350
  %352 = add nuw nsw i64 %341, 1
  %353 = icmp samesign ult i64 %341, 64
  br i1 %353, label %339, label %354, !llvm.loop !12

354:                                              ; preds = %339
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %355 = add nuw nsw i32 %34, 1
  %356 = icmp eq i32 %355, %0
  br i1 %356, label %357, label %33, !llvm.loop !15

357:                                              ; preds = %354
  %358 = select i1 %6, i64 366962936819156833, i64 0
  %359 = mul i64 %137, %358
  %360 = icmp ne i64 %359, 1
  %361 = icmp ne i64 %351, %111
  %362 = select i1 %361, i1 true, i1 %360
  %363 = zext i1 %362 to i32
  br label %364

364:                                              ; preds = %357, %1
  %365 = phi i32 [ %363, %357 ], [ undef, %1 ]
  ret i32 %365
}

; Function Attrs: nofree noinline norecurse nounwind memory(read, inaccessiblemem: readwrite, target_mem0: none, target_mem1: none)
define dso_local i32 @benchmark() local_unnamed_addr #7 {
  %1 = tail call fastcc i32 @benchmark_body(i32 noundef 423) #11
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define dso_local void @initialise_benchmark() local_unnamed_addr #8 {
  store i1 true, ptr @in_m, align 8
  store i1 true, ptr @in_b, align 8
  store i1 true, ptr @in_a, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @verify_benchmark(i32 noundef %0) local_unnamed_addr #3 {
  %2 = icmp eq i32 %0, 0
  %3 = zext i1 %2 to i32
  ret i32 %3
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fshl.i64(i64, i64, i64) #9

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.add.v4i64(<4 x i64>) #10

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree norecurse nosync nounwind memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { nofree norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #5 = { nofree norecurse nounwind memory(read, inaccessiblemem: readwrite, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #6 = { nofree noinline norecurse nounwind memory(read, argmem: none, inaccessiblemem: readwrite, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #7 = { nofree noinline norecurse nounwind memory(read, inaccessiblemem: readwrite, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #8 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #9 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #10 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #11 = { nobuiltin "no-builtins" }

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
!11 = !{!"long long", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
!15 = distinct !{!15, !13}
