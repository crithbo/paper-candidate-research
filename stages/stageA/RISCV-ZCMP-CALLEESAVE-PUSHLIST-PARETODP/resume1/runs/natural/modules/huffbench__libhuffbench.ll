; ModuleID = 'D:\project\writing\reserch\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1\resources\corpus\embench\src\huffbench\libhuffbench.c'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\\resume1\\resources\\corpus\\embench\\src\\huffbench\\libhuffbench.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

@test_data = internal global [500 x i8] zeroinitializer, align 1
@orig_data = internal constant [500 x i8] c"J2OZF50FYLD5UTVYYRMT0VXO01VC5FNIB1CG12MTIPT2CIV00BOUWFDRAYTA3AI42KFXHRKPA3LCGA3ABLUYQXJRQ2RN2ZMYERPLC00CXFE3GB3HMS53JIOZE5HBYTZ2EJHGDBI0HMYNOVU0HUXR2FKBERC3E1ZIEBOHCWCJD0WRPLLX5DI1IS2NE4KI0DR4E5GHWIQZCHKRSVIRYQMBDJOHHYPB1AAAAGHWOXPQ4ZBQOKBH0OI3XWE4OUAJUAJUGQKUIZEGSFXBPYIKGQH3GM2UA23U2HJCXTW5N0G553APVIZ2YAZ4MVSMRQBNXKPO3FOK5UK5RKOGTHCLH2KUR2ADMBQDLASJFATFU3EFISL1ZOGAKQU1NV4ZWP3CPPLUP4ZD23IEPT5IBFJLW3HDSF2JUZLDIWYXUR0QPCU4WTHXZQDPNKSAPOJEIUHQK5I4RCPAFD41XFSQVV5D5RDP5MTHA0YK0AILCXLH1JCSPVCEKBHKSKZR", align 1
@heap = internal global [8192 x i8] zeroinitializer, align 1

; Function Attrs: nounwind
define dso_local void @compdecomp(ptr noundef captures(none) %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca [512 x i32], align 4
  %4 = alloca [256 x i32], align 4
  %5 = alloca [512 x i32], align 4
  %6 = alloca [256 x i32], align 4
  %7 = alloca [256 x i8], align 1
  %8 = alloca [256 x i32], align 4
  %9 = alloca [256 x i8], align 1
  %10 = add i32 %1, 1
  %11 = tail call ptr @malloc_beebs(i32 noundef %10) #7
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #8
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #8
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #8
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #8
  call void @llvm.lifetime.start.p0(ptr nonnull %7) #8
  %12 = tail call ptr @memset(ptr noundef %11, i32 noundef 0, i32 noundef %10) #7
  %13 = call ptr @memset(ptr noundef nonnull %3, i32 noundef 0, i32 noundef 2048) #7
  %14 = call ptr @memset(ptr noundef nonnull %4, i32 noundef 0, i32 noundef 1024) #7
  %15 = call ptr @memset(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 2048) #7
  %16 = call ptr @memset(ptr noundef nonnull %6, i32 noundef 0, i32 noundef 1024) #7
  %17 = call ptr @memset(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 256) #7
  %18 = icmp eq i32 %1, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %20, %2
  br label %36

20:                                               ; preds = %2, %20
  %21 = phi i32 [ %29, %20 ], [ 0, %2 ]
  %22 = phi ptr [ %28, %20 ], [ %0, %2 ]
  %23 = load i8, ptr %22, align 1, !tbaa !10
  %24 = zext i8 %23 to i32
  %25 = getelementptr inbounds nuw i32, ptr %3, i32 %24
  %26 = load i32, ptr %25, align 4, !tbaa !6
  %27 = add i32 %26, 1
  store i32 %27, ptr %25, align 4, !tbaa !6
  %28 = getelementptr inbounds nuw i8, ptr %22, i32 1
  %29 = add nuw i32 %21, 1
  %30 = icmp eq i32 %29, %1
  br i1 %30, label %19, label %20, !llvm.loop !11

31:                                               ; preds = %45
  %32 = icmp eq i32 %46, 0
  br i1 %32, label %173, label %33

33:                                               ; preds = %31
  %34 = getelementptr inbounds i8, ptr %4, i32 -4
  %35 = sdiv i32 %46, 2
  br label %53

36:                                               ; preds = %19, %45
  %37 = phi i32 [ %47, %45 ], [ 0, %19 ]
  %38 = phi i32 [ %46, %45 ], [ 0, %19 ]
  %39 = getelementptr inbounds nuw i32, ptr %3, i32 %37
  %40 = load i32, ptr %39, align 4, !tbaa !6
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %45, label %42

42:                                               ; preds = %36
  %43 = getelementptr inbounds nuw i32, ptr %4, i32 %38
  store i32 %37, ptr %43, align 4, !tbaa !6
  %44 = add i32 %38, 1
  br label %45

45:                                               ; preds = %36, %42
  %46 = phi i32 [ %44, %42 ], [ %38, %36 ]
  %47 = add nuw nsw i32 %37, 1
  %48 = icmp eq i32 %47, 256
  br i1 %48, label %31, label %36, !llvm.loop !13

49:                                               ; preds = %87
  %50 = icmp eq i32 %46, 1
  br i1 %50, label %173, label %51

51:                                               ; preds = %49
  %52 = getelementptr inbounds i8, ptr %4, i32 -4
  br label %92

53:                                               ; preds = %33, %87
  %54 = phi i32 [ %46, %33 ], [ %90, %87 ]
  %55 = getelementptr inbounds i32, ptr %34, i32 %54
  %56 = load i32, ptr %55, align 4, !tbaa !6
  %57 = icmp sgt i32 %54, %35
  br i1 %57, label %87, label %58

58:                                               ; preds = %53
  %59 = getelementptr inbounds i32, ptr %3, i32 %56
  %60 = load i32, ptr %59, align 4, !tbaa !6
  br label %61

61:                                               ; preds = %84, %58
  %62 = phi i32 [ %54, %58 ], [ %78, %84 ]
  %63 = shl nsw i32 %62, 1
  %64 = icmp slt i32 %63, %46
  br i1 %64, label %65, label %77

65:                                               ; preds = %61
  %66 = getelementptr inbounds i32, ptr %34, i32 %63
  %67 = load i32, ptr %66, align 4, !tbaa !6
  %68 = getelementptr inbounds nuw i32, ptr %3, i32 %67
  %69 = load i32, ptr %68, align 4, !tbaa !6
  %70 = getelementptr i32, ptr %4, i32 %63
  %71 = load i32, ptr %70, align 4, !tbaa !6
  %72 = getelementptr inbounds nuw i32, ptr %3, i32 %71
  %73 = load i32, ptr %72, align 4, !tbaa !6
  %74 = icmp ugt i32 %69, %73
  %75 = zext i1 %74 to i32
  %76 = or disjoint i32 %63, %75
  br label %77

77:                                               ; preds = %65, %61
  %78 = phi i32 [ %63, %61 ], [ %76, %65 ]
  %79 = getelementptr inbounds i32, ptr %34, i32 %78
  %80 = load i32, ptr %79, align 4, !tbaa !6
  %81 = getelementptr inbounds nuw i32, ptr %3, i32 %80
  %82 = load i32, ptr %81, align 4, !tbaa !6
  %83 = icmp ult i32 %60, %82
  br i1 %83, label %87, label %84

84:                                               ; preds = %77
  %85 = getelementptr inbounds i32, ptr %34, i32 %62
  store i32 %80, ptr %85, align 4, !tbaa !6
  %86 = icmp sgt i32 %78, %35
  br i1 %86, label %87, label %61, !llvm.loop !14

87:                                               ; preds = %77, %84, %53
  %88 = phi i32 [ %54, %53 ], [ %78, %84 ], [ %62, %77 ]
  %89 = getelementptr inbounds i32, ptr %34, i32 %88
  store i32 %56, ptr %89, align 4, !tbaa !6
  %90 = add i32 %54, -1
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %49, label %53, !llvm.loop !15

92:                                               ; preds = %51, %169
  %93 = phi i32 [ %46, %51 ], [ %94, %169 ]
  %94 = add i32 %93, -1
  %95 = load i32, ptr %4, align 4, !tbaa !6
  %96 = getelementptr inbounds nuw i32, ptr %4, i32 %94
  %97 = load i32, ptr %96, align 4, !tbaa !6
  store i32 %97, ptr %4, align 4, !tbaa !6
  %98 = sdiv i32 %94, 2
  %99 = icmp slt i32 %94, 2
  br i1 %99, label %129, label %100

100:                                              ; preds = %92
  %101 = getelementptr inbounds i32, ptr %3, i32 %97
  %102 = load i32, ptr %101, align 4, !tbaa !6
  br label %103

103:                                              ; preds = %126, %100
  %104 = phi i32 [ 1, %100 ], [ %120, %126 ]
  %105 = shl nsw i32 %104, 1
  %106 = icmp slt i32 %105, %94
  br i1 %106, label %107, label %119

107:                                              ; preds = %103
  %108 = getelementptr inbounds i32, ptr %52, i32 %105
  %109 = load i32, ptr %108, align 4, !tbaa !6
  %110 = getelementptr inbounds nuw i32, ptr %3, i32 %109
  %111 = load i32, ptr %110, align 4, !tbaa !6
  %112 = getelementptr i32, ptr %4, i32 %105
  %113 = load i32, ptr %112, align 4, !tbaa !6
  %114 = getelementptr inbounds nuw i32, ptr %3, i32 %113
  %115 = load i32, ptr %114, align 4, !tbaa !6
  %116 = icmp ugt i32 %111, %115
  %117 = zext i1 %116 to i32
  %118 = or disjoint i32 %105, %117
  br label %119

119:                                              ; preds = %107, %103
  %120 = phi i32 [ %105, %103 ], [ %118, %107 ]
  %121 = getelementptr inbounds i32, ptr %52, i32 %120
  %122 = load i32, ptr %121, align 4, !tbaa !6
  %123 = getelementptr inbounds nuw i32, ptr %3, i32 %122
  %124 = load i32, ptr %123, align 4, !tbaa !6
  %125 = icmp ult i32 %102, %124
  br i1 %125, label %129, label %126

126:                                              ; preds = %119
  %127 = getelementptr inbounds i32, ptr %52, i32 %104
  store i32 %122, ptr %127, align 4, !tbaa !6
  %128 = icmp sgt i32 %120, %98
  br i1 %128, label %129, label %103, !llvm.loop !14

129:                                              ; preds = %119, %126, %92
  %130 = phi i32 [ 1, %92 ], [ %120, %126 ], [ %104, %119 ]
  %131 = getelementptr inbounds i32, ptr %52, i32 %130
  store i32 %97, ptr %131, align 4, !tbaa !6
  %132 = load i32, ptr %4, align 4, !tbaa !6
  %133 = getelementptr inbounds nuw i32, ptr %3, i32 %132
  %134 = load i32, ptr %133, align 4, !tbaa !6
  %135 = getelementptr inbounds nuw i32, ptr %3, i32 %95
  %136 = load i32, ptr %135, align 4, !tbaa !6
  %137 = add i32 %136, %134
  %138 = add i32 %93, 255
  %139 = getelementptr inbounds i32, ptr %3, i32 %138
  store i32 %137, ptr %139, align 4, !tbaa !6
  %140 = getelementptr inbounds nuw i32, ptr %5, i32 %95
  store i32 %138, ptr %140, align 4, !tbaa !6
  %141 = sub i32 -255, %93
  %142 = getelementptr inbounds nuw i32, ptr %5, i32 %132
  store i32 %141, ptr %142, align 4, !tbaa !6
  store i32 %138, ptr %4, align 4, !tbaa !6
  br i1 %99, label %169, label %143

143:                                              ; preds = %129, %166
  %144 = phi i32 [ %160, %166 ], [ 1, %129 ]
  %145 = shl nsw i32 %144, 1
  %146 = icmp slt i32 %145, %94
  br i1 %146, label %147, label %159

147:                                              ; preds = %143
  %148 = getelementptr inbounds i32, ptr %52, i32 %145
  %149 = load i32, ptr %148, align 4, !tbaa !6
  %150 = getelementptr inbounds nuw i32, ptr %3, i32 %149
  %151 = load i32, ptr %150, align 4, !tbaa !6
  %152 = getelementptr i32, ptr %4, i32 %145
  %153 = load i32, ptr %152, align 4, !tbaa !6
  %154 = getelementptr inbounds nuw i32, ptr %3, i32 %153
  %155 = load i32, ptr %154, align 4, !tbaa !6
  %156 = icmp ugt i32 %151, %155
  %157 = zext i1 %156 to i32
  %158 = or disjoint i32 %145, %157
  br label %159

159:                                              ; preds = %147, %143
  %160 = phi i32 [ %145, %143 ], [ %158, %147 ]
  %161 = getelementptr inbounds i32, ptr %52, i32 %160
  %162 = load i32, ptr %161, align 4, !tbaa !6
  %163 = getelementptr inbounds nuw i32, ptr %3, i32 %162
  %164 = load i32, ptr %163, align 4, !tbaa !6
  %165 = icmp ult i32 %137, %164
  br i1 %165, label %169, label %166

166:                                              ; preds = %159
  %167 = getelementptr inbounds i32, ptr %52, i32 %144
  store i32 %162, ptr %167, align 4, !tbaa !6
  %168 = icmp sgt i32 %160, %98
  br i1 %168, label %169, label %143, !llvm.loop !14

169:                                              ; preds = %159, %166, %129
  %170 = phi i32 [ 1, %129 ], [ %160, %166 ], [ %144, %159 ]
  %171 = getelementptr inbounds i32, ptr %52, i32 %170
  store i32 %138, ptr %171, align 4, !tbaa !6
  %172 = icmp ugt i32 %94, 1
  br i1 %172, label %92, label %173, !llvm.loop !16

173:                                              ; preds = %169, %31, %49
  %174 = phi i32 [ %46, %49 ], [ 0, %31 ], [ 1, %169 ]
  %175 = getelementptr inbounds nuw i32, ptr %5, i32 %174
  %176 = getelementptr inbounds nuw i8, ptr %175, i32 1024
  store i32 0, ptr %176, align 4, !tbaa !6
  br label %177

177:                                              ; preds = %173, %213
  %178 = phi i32 [ 0, %173 ], [ %215, %213 ]
  %179 = phi i32 [ 0, %173 ], [ %214, %213 ]
  %180 = phi i32 [ 0, %173 ], [ %216, %213 ]
  %181 = getelementptr inbounds nuw i32, ptr %3, i32 %180
  %182 = load i32, ptr %181, align 4, !tbaa !6
  %183 = icmp eq i32 %182, 0
  br i1 %183, label %188, label %184

184:                                              ; preds = %177
  %185 = getelementptr inbounds nuw i32, ptr %5, i32 %180
  %186 = load i32, ptr %185, align 4, !tbaa !6
  %187 = icmp eq i32 %186, 0
  br i1 %187, label %205, label %191

188:                                              ; preds = %177
  %189 = getelementptr inbounds nuw i32, ptr %6, i32 %180
  store i32 0, ptr %189, align 4, !tbaa !17
  %190 = getelementptr inbounds nuw i8, ptr %7, i32 %180
  store i8 0, ptr %190, align 1, !tbaa !10
  br label %213

191:                                              ; preds = %184, %191
  %192 = phi i32 [ %203, %191 ], [ %186, %184 ]
  %193 = phi i32 [ %198, %191 ], [ 0, %184 ]
  %194 = phi i32 [ %201, %191 ], [ 0, %184 ]
  %195 = phi i32 [ %200, %191 ], [ 1, %184 ]
  %196 = icmp slt i32 %192, 0
  %197 = select i1 %196, i32 %195, i32 0
  %198 = add i32 %197, %193
  %199 = call i32 @llvm.abs.i32(i32 %192, i1 true)
  %200 = shl i32 %195, 1
  %201 = add i32 %194, 1
  %202 = getelementptr inbounds nuw i32, ptr %5, i32 %199
  %203 = load i32, ptr %202, align 4, !tbaa !6
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %205, label %191, !llvm.loop !19

205:                                              ; preds = %191, %184
  %206 = phi i32 [ 0, %184 ], [ %201, %191 ]
  %207 = phi i32 [ 0, %184 ], [ %198, %191 ]
  %208 = getelementptr inbounds nuw i32, ptr %6, i32 %180
  store i32 %207, ptr %208, align 4, !tbaa !17
  %209 = trunc i32 %206 to i8
  %210 = getelementptr inbounds nuw i8, ptr %7, i32 %180
  store i8 %209, ptr %210, align 1, !tbaa !10
  %211 = call i32 @llvm.umax.i32(i32 %207, i32 %179)
  %212 = call i32 @llvm.umax.i32(i32 %206, i32 %178)
  br label %213

213:                                              ; preds = %205, %188
  %214 = phi i32 [ %179, %188 ], [ %211, %205 ]
  %215 = phi i32 [ %178, %188 ], [ %212, %205 ]
  %216 = add nuw nsw i32 %180, 1
  %217 = icmp eq i32 %216, 256
  br i1 %217, label %218, label %177, !llvm.loop !20

218:                                              ; preds = %213
  %219 = icmp ugt i32 %215, 32
  %220 = icmp eq i32 %214, 0
  %221 = select i1 %219, i1 true, i1 %220
  br i1 %221, label %397, label %222

222:                                              ; preds = %218
  br i1 %18, label %285, label %223

223:                                              ; preds = %222, %273
  %224 = phi i32 [ %276, %273 ], [ -1, %222 ]
  %225 = phi i8 [ %275, %273 ], [ 0, %222 ]
  %226 = phi i32 [ %274, %273 ], [ 0, %222 ]
  %227 = phi i32 [ %278, %273 ], [ 0, %222 ]
  %228 = phi ptr [ %277, %273 ], [ %0, %222 ]
  %229 = load i8, ptr %228, align 1, !tbaa !10
  %230 = zext i8 %229 to i32
  %231 = getelementptr inbounds nuw i8, ptr %7, i32 %230
  %232 = load i8, ptr %231, align 1, !tbaa !10
  %233 = icmp eq i8 %232, 0
  br i1 %233, label %273, label %234

234:                                              ; preds = %223
  %235 = zext i8 %232 to i32
  %236 = add nsw i32 %235, -1
  %237 = shl nuw i32 1, %236
  br label %238

238:                                              ; preds = %234, %255
  %239 = phi i8 [ %256, %255 ], [ %229, %234 ]
  %240 = phi i32 [ %259, %255 ], [ %224, %234 ]
  %241 = phi i8 [ %266, %255 ], [ %225, %234 ]
  %242 = phi i32 [ %257, %255 ], [ %226, %234 ]
  %243 = phi i32 [ %268, %255 ], [ 0, %234 ]
  %244 = phi i32 [ %267, %255 ], [ %237, %234 ]
  %245 = icmp eq i32 %240, 7
  br i1 %245, label %246, label %252

246:                                              ; preds = %238
  %247 = getelementptr inbounds nuw i8, ptr %11, i32 %242
  store i8 %241, ptr %247, align 1, !tbaa !10
  %248 = add i32 %242, 1
  %249 = icmp eq i32 %248, %1
  br i1 %249, label %397, label %250

250:                                              ; preds = %246
  %251 = load i8, ptr %228, align 1, !tbaa !10
  br label %255

252:                                              ; preds = %238
  %253 = add nsw i32 %240, 1
  %254 = shl i8 %241, 1
  br label %255

255:                                              ; preds = %250, %252
  %256 = phi i8 [ %239, %252 ], [ %251, %250 ]
  %257 = phi i32 [ %242, %252 ], [ %248, %250 ]
  %258 = phi i8 [ %254, %252 ], [ 0, %250 ]
  %259 = phi i32 [ %253, %252 ], [ 0, %250 ]
  %260 = zext i8 %256 to i32
  %261 = getelementptr inbounds nuw i32, ptr %6, i32 %260
  %262 = load i32, ptr %261, align 4, !tbaa !17
  %263 = and i32 %262, %244
  %264 = icmp ne i32 %263, 0
  %265 = zext i1 %264 to i8
  %266 = or disjoint i8 %258, %265
  %267 = lshr i32 %244, 1
  %268 = add nuw nsw i32 %243, 1
  %269 = getelementptr inbounds nuw i8, ptr %7, i32 %260
  %270 = load i8, ptr %269, align 1, !tbaa !10
  %271 = zext i8 %270 to i32
  %272 = icmp samesign ult i32 %268, %271
  br i1 %272, label %238, label %273, !llvm.loop !21

273:                                              ; preds = %255, %223
  %274 = phi i32 [ %226, %223 ], [ %257, %255 ]
  %275 = phi i8 [ %225, %223 ], [ %266, %255 ]
  %276 = phi i32 [ %224, %223 ], [ %259, %255 ]
  %277 = getelementptr inbounds nuw i8, ptr %228, i32 1
  %278 = add nuw i32 %227, 1
  %279 = icmp eq i32 %278, %1
  br i1 %279, label %280, label %223, !llvm.loop !22

280:                                              ; preds = %273
  %281 = sub nsw i32 7, %276
  %282 = zext i8 %275 to i32
  %283 = shl i32 %282, %281
  %284 = trunc i32 %283 to i8
  br label %285

285:                                              ; preds = %280, %222
  %286 = phi i32 [ 0, %222 ], [ %274, %280 ]
  %287 = phi i8 [ 0, %222 ], [ %284, %280 ]
  %288 = getelementptr inbounds nuw i8, ptr %11, i32 %286
  store i8 %287, ptr %288, align 1, !tbaa !10
  call void @llvm.lifetime.start.p0(ptr nonnull %8) #8
  call void @llvm.lifetime.start.p0(ptr nonnull %9) #8
  %289 = call ptr @memset(ptr noundef nonnull %8, i32 noundef 0, i32 noundef 1024) #7
  br label %290

290:                                              ; preds = %285, %323
  %291 = phi ptr [ %9, %285 ], [ %294, %323 ]
  %292 = phi i32 [ 0, %285 ], [ %324, %323 ]
  %293 = trunc nuw i32 %292 to i8
  store i8 %293, ptr %291, align 1, !tbaa !10
  %294 = getelementptr inbounds nuw i8, ptr %291, i32 1
  %295 = getelementptr inbounds nuw i32, ptr %6, i32 %292
  %296 = load i32, ptr %295, align 4, !tbaa !17
  %297 = getelementptr inbounds nuw i8, ptr %7, i32 %292
  %298 = load i8, ptr %297, align 1, !tbaa !10
  %299 = zext i8 %298 to i32
  %300 = or i32 %296, %299
  %301 = icmp eq i32 %300, 0
  br i1 %301, label %323, label %302

302:                                              ; preds = %290
  %303 = icmp eq i8 %298, 0
  br i1 %303, label %320, label %304

304:                                              ; preds = %302
  %305 = add nsw i32 %299, -1
  %306 = shl nuw i32 1, %305
  br label %307

307:                                              ; preds = %304, %307
  %308 = phi i32 [ %318, %307 ], [ 0, %304 ]
  %309 = phi i32 [ %317, %307 ], [ %306, %304 ]
  %310 = phi i32 [ %316, %307 ], [ 0, %304 ]
  %311 = shl i32 %310, 1
  %312 = or disjoint i32 %311, 1
  %313 = and i32 %309, %296
  %314 = icmp eq i32 %313, 0
  %315 = add i32 %311, 2
  %316 = select i1 %314, i32 %312, i32 %315
  %317 = lshr i32 %309, 1
  %318 = add nuw nsw i32 %308, 1
  %319 = icmp eq i32 %318, %299
  br i1 %319, label %320, label %307, !llvm.loop !23

320:                                              ; preds = %307, %302
  %321 = phi i32 [ 0, %302 ], [ %316, %307 ]
  %322 = getelementptr inbounds nuw i32, ptr %8, i32 %292
  store i32 %321, ptr %322, align 4, !tbaa !17
  br label %323

323:                                              ; preds = %290, %320
  %324 = add nuw nsw i32 %292, 1
  %325 = icmp eq i32 %324, 256
  br i1 %325, label %326, label %290, !llvm.loop !24

326:                                              ; preds = %323, %344
  %327 = phi i32 [ %348, %344 ], [ 1, %323 ]
  %328 = getelementptr inbounds nuw i32, ptr %8, i32 %327
  %329 = load i32, ptr %328, align 4, !tbaa !17
  %330 = getelementptr inbounds nuw i8, ptr %9, i32 %327
  %331 = load i8, ptr %330, align 1, !tbaa !10
  br label %332

332:                                              ; preds = %326, %338
  %333 = phi i32 [ %327, %326 ], [ %334, %338 ]
  %334 = add nsw i32 %333, -1
  %335 = getelementptr inbounds nuw i32, ptr %8, i32 %334
  %336 = load i32, ptr %335, align 4, !tbaa !17
  %337 = icmp ugt i32 %336, %329
  br i1 %337, label %338, label %344

338:                                              ; preds = %332
  %339 = getelementptr inbounds nuw i32, ptr %8, i32 %333
  store i32 %336, ptr %339, align 4, !tbaa !17
  %340 = getelementptr inbounds nuw i8, ptr %9, i32 %334
  %341 = load i8, ptr %340, align 1, !tbaa !10
  %342 = getelementptr inbounds nuw i8, ptr %9, i32 %333
  store i8 %341, ptr %342, align 1, !tbaa !10
  %343 = icmp eq i32 %334, 0
  br i1 %343, label %344, label %332, !llvm.loop !25

344:                                              ; preds = %338, %332
  %345 = phi i32 [ 0, %338 ], [ %333, %332 ]
  %346 = getelementptr inbounds nuw i32, ptr %8, i32 %345
  store i32 %329, ptr %346, align 4, !tbaa !17
  %347 = getelementptr inbounds nuw i8, ptr %9, i32 %345
  store i8 %331, ptr %347, align 1, !tbaa !10
  %348 = add nuw nsw i32 %327, 1
  %349 = icmp eq i32 %348, 256
  br i1 %349, label %350, label %326, !llvm.loop !26

350:                                              ; preds = %344, %350
  %351 = phi i32 [ %355, %350 ], [ 0, %344 ]
  %352 = getelementptr inbounds nuw i32, ptr %8, i32 %351
  %353 = load i32, ptr %352, align 4, !tbaa !17
  %354 = icmp eq i32 %353, 0
  %355 = add i32 %351, 1
  br i1 %354, label %350, label %356, !llvm.loop !27

356:                                              ; preds = %350
  br i1 %18, label %396, label %357

357:                                              ; preds = %356, %385
  %358 = phi i32 [ %389, %385 ], [ %351, %356 ]
  %359 = phi ptr [ %388, %385 ], [ %0, %356 ]
  %360 = phi ptr [ %394, %385 ], [ %11, %356 ]
  %361 = phi i32 [ %387, %385 ], [ 0, %356 ]
  %362 = phi i32 [ %392, %385 ], [ 128, %356 ]
  %363 = phi i32 [ %386, %385 ], [ 0, %356 ]
  %364 = shl i32 %363, 1
  %365 = or disjoint i32 %364, 1
  %366 = load i8, ptr %360, align 1, !tbaa !10
  %367 = zext i8 %366 to i32
  %368 = and i32 %362, %367
  %369 = icmp eq i32 %368, 0
  %370 = add i32 %364, 2
  %371 = select i1 %369, i32 %365, i32 %370
  br label %372

372:                                              ; preds = %372, %357
  %373 = phi i32 [ %358, %357 ], [ %377, %372 ]
  %374 = getelementptr inbounds nuw i32, ptr %8, i32 %373
  %375 = load i32, ptr %374, align 4, !tbaa !17
  %376 = icmp ult i32 %375, %371
  %377 = add i32 %373, 1
  br i1 %376, label %372, label %378, !llvm.loop !28

378:                                              ; preds = %372
  %379 = icmp eq i32 %371, %375
  br i1 %379, label %380, label %385

380:                                              ; preds = %378
  %381 = getelementptr inbounds nuw i8, ptr %9, i32 %373
  %382 = load i8, ptr %381, align 1, !tbaa !10
  store i8 %382, ptr %359, align 1, !tbaa !10
  %383 = getelementptr inbounds nuw i8, ptr %359, i32 1
  %384 = add nuw i32 %361, 1
  br label %385

385:                                              ; preds = %380, %378
  %386 = phi i32 [ 0, %380 ], [ %371, %378 ]
  %387 = phi i32 [ %384, %380 ], [ %361, %378 ]
  %388 = phi ptr [ %383, %380 ], [ %359, %378 ]
  %389 = phi i32 [ %351, %380 ], [ %373, %378 ]
  %390 = icmp samesign ult i32 %362, 2
  %391 = lshr i32 %362, 1
  %392 = select i1 %390, i32 128, i32 %391
  %393 = zext i1 %390 to i32
  %394 = getelementptr inbounds nuw i8, ptr %360, i32 %393
  %395 = icmp ult i32 %387, %1
  br i1 %395, label %357, label %396, !llvm.loop !29

396:                                              ; preds = %385, %356
  call void @free_beebs(ptr noundef %11) #7
  call void @llvm.lifetime.end.p0(ptr nonnull %9) #8
  call void @llvm.lifetime.end.p0(ptr nonnull %8) #8
  br label %397

397:                                              ; preds = %246, %396, %218
  call void @llvm.lifetime.end.p0(ptr nonnull %7) #8
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #8
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #8
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #8
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

declare dso_local ptr @malloc_beebs(i32 noundef) local_unnamed_addr #2

declare dso_local ptr @memset(ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

declare dso_local void @free_beebs(ptr noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @verify_benchmark(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @memcmp(ptr noundef nonnull @test_data, ptr noundef nonnull @orig_data, i32 noundef 500) #7
  %3 = icmp eq i32 %2, 0
  %4 = zext i1 %3 to i32
  ret i32 %4
}

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local void @initialise_benchmark() local_unnamed_addr #3 {
  ret void
}

; Function Attrs: nounwind
define dso_local void @warm_caches(i32 noundef %0) local_unnamed_addr #0 {
  tail call fastcc void @benchmark_body(i32 noundef %0) #9
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @benchmark_body(i32 noundef %0) unnamed_addr #4 {
  %2 = icmp sgt i32 %0, 0
  br i1 %2, label %3, label %8

3:                                                ; preds = %1, %3
  %4 = phi i32 [ %6, %3 ], [ 0, %1 ]
  tail call void @init_heap_beebs(ptr noundef nonnull @heap, i32 noundef 8192) #7
  %5 = tail call ptr @memcpy(ptr noundef nonnull @test_data, ptr noundef nonnull @orig_data, i32 noundef 500) #7
  tail call void @compdecomp(ptr noundef nonnull @test_data, i32 noundef 500) #9
  %6 = add nuw nsw i32 %4, 1
  %7 = icmp eq i32 %6, %0
  br i1 %7, label %8, label %3, !llvm.loop !30

8:                                                ; preds = %3, %1
  ret void
}

; Function Attrs: noinline nounwind
define dso_local noundef i32 @benchmark() local_unnamed_addr #4 {
  tail call fastcc void @benchmark_body(i32 noundef 11) #9
  ret i32 0
}

declare dso_local void @init_heap_beebs(ptr noundef, i32 noundef) local_unnamed_addr #2

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #5

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #6

attributes #0 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { noinline nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { nobuiltin nounwind "no-builtins" }
attributes #8 = { nounwind }
attributes #9 = { nobuiltin "no-builtins" }

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
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = !{!18, !18, i64 0}
!18 = !{!"long", !8, i64 0}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !12}
!21 = distinct !{!21, !12}
!22 = distinct !{!22, !12}
!23 = distinct !{!23, !12}
!24 = distinct !{!24, !12}
!25 = distinct !{!25, !12}
!26 = distinct !{!26, !12}
!27 = distinct !{!27, !12}
!28 = distinct !{!28, !12}
!29 = distinct !{!29, !12}
!30 = distinct !{!30, !12}
