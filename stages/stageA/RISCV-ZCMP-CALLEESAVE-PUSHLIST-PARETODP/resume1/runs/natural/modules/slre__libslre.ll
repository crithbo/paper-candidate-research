; ModuleID = 'D:\project\writing\reserch\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1\resources\corpus\embench\src\slre\libslre.c'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\\resume1\\resources\\corpus\\embench\\src\\slre\\libslre.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

%struct.regex_info = type { [100 x %struct.bracket_pair], i32, [100 x %struct.branch], i32, ptr, i32, i32 }
%struct.bracket_pair = type { ptr, i32, i32, i32 }
%struct.branch = type { i32, ptr }
%struct.slre_cap = type { ptr, i32 }

@.str = private unnamed_addr constant [5 x i8] c"(?i)\00", align 1
@text = dso_local global [46 x i8] c"abbbababaabccababcacbcbcbabbabcbabcabcbbcbbac\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"(ab)+\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"(b.+)+\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"a[ab]*\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"([ab^c][ab^c])+\00", align 1
@regexes = dso_local local_unnamed_addr global [4 x ptr] [ptr @.str.1, ptr @.str.2, ptr @.str.3, ptr @.str.4], align 4
@.str.5 = private unnamed_addr constant [16 x i8] c"^$().[]*+?|\\Ssd\00", align 1

; Function Attrs: nounwind
define dso_local i32 @slre_match(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = alloca %struct.regex_info, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #6
  %7 = getelementptr inbounds nuw i8, ptr %6, i32 2404
  store i32 0, ptr %7, align 4, !tbaa !10
  %8 = getelementptr inbounds nuw i8, ptr %6, i32 1600
  %9 = getelementptr inbounds nuw i8, ptr %6, i32 2416
  store i32 0, ptr %9, align 4, !tbaa !14
  %10 = getelementptr inbounds nuw i8, ptr %6, i32 2412
  store i32 %4, ptr %10, align 4, !tbaa !15
  %11 = getelementptr inbounds nuw i8, ptr %6, i32 2408
  store ptr %3, ptr %11, align 4, !tbaa !16
  %12 = tail call i32 @memcmp(ptr noundef %0, ptr noundef nonnull @.str, i32 noundef 4) #7
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

14:                                               ; preds = %5
  store i32 1, ptr %9, align 4, !tbaa !14
  %15 = getelementptr inbounds nuw i8, ptr %0, i32 4
  br label %16

16:                                               ; preds = %14, %5
  %17 = phi ptr [ %15, %14 ], [ %0, %5 ]
  %18 = tail call i32 @strlen(ptr noundef %17) #7
  store ptr %17, ptr %6, align 4, !tbaa !17
  %19 = getelementptr inbounds nuw i8, ptr %6, i32 4
  store i32 %18, ptr %19, align 4, !tbaa !20
  store i32 1, ptr %8, align 4, !tbaa !21
  %20 = icmp sgt i32 %18, 0
  br i1 %20, label %21, label %150

21:                                               ; preds = %16
  %22 = add nsw i32 %18, -1
  %23 = add nsw i32 %18, -3
  %24 = getelementptr inbounds nuw i8, ptr %6, i32 1604
  %25 = icmp sgt i32 %4, 0
  br label %26

26:                                               ; preds = %131, %21
  %27 = phi i32 [ 0, %21 ], [ %132, %131 ]
  %28 = phi i32 [ 1, %21 ], [ %133, %131 ]
  %29 = phi i32 [ 0, %21 ], [ %135, %131 ]
  %30 = phi i32 [ 0, %21 ], [ %136, %131 ]
  %31 = getelementptr inbounds i8, ptr %17, i32 %30
  %32 = sub nsw i32 %18, %30
  %33 = load i8, ptr %31, align 1, !tbaa !22
  switch i8 %33, label %61 [
    i8 91, label %34
    i8 92, label %56
  ]

34:                                               ; preds = %26
  %35 = getelementptr inbounds nuw i8, ptr %31, i32 1
  %36 = add nsw i32 %32, -1
  %37 = icmp sgt i32 %32, 1
  br i1 %37, label %38, label %51

38:                                               ; preds = %34, %47
  %39 = phi i32 [ %49, %47 ], [ 0, %34 ]
  %40 = getelementptr inbounds nuw i8, ptr %35, i32 %39
  %41 = load i8, ptr %40, align 1, !tbaa !22
  switch i8 %41, label %47 [
    i8 93, label %51
    i8 92, label %42
  ]

42:                                               ; preds = %38
  %43 = getelementptr inbounds nuw i8, ptr %40, i32 1
  %44 = load i8, ptr %43, align 1, !tbaa !22
  %45 = icmp eq i8 %44, 120
  %46 = select i1 %45, i32 4, i32 2
  br label %47

47:                                               ; preds = %42, %38
  %48 = phi i32 [ %46, %42 ], [ 1, %38 ]
  %49 = add nuw nsw i32 %48, %39
  %50 = icmp slt i32 %49, %36
  br i1 %50, label %38, label %51, !llvm.loop !23

51:                                               ; preds = %47, %38, %34
  %52 = phi i32 [ 0, %34 ], [ %49, %47 ], [ %39, %38 ]
  %53 = icmp slt i32 %52, %32
  %54 = add nsw i32 %52, 2
  %55 = select i1 %53, i32 %54, i32 0
  br label %61

56:                                               ; preds = %26
  %57 = getelementptr inbounds nuw i8, ptr %31, i32 1
  %58 = load i8, ptr %57, align 1, !tbaa !22
  %59 = icmp eq i8 %58, 120
  %60 = select i1 %59, i32 4, i32 2
  br label %75

61:                                               ; preds = %51, %26
  %62 = phi i32 [ %55, %51 ], [ 1, %26 ]
  switch i8 %33, label %131 [
    i8 124, label %63
    i8 92, label %75
    i8 40, label %100
    i8 41, label %110
  ]

63:                                               ; preds = %61
  %64 = icmp sgt i32 %27, 99
  br i1 %64, label %278, label %65

65:                                               ; preds = %63
  %66 = add nsw i32 %28, -1
  %67 = getelementptr inbounds %struct.bracket_pair, ptr %6, i32 %66
  %68 = getelementptr inbounds nuw i8, ptr %67, i32 4
  %69 = load i32, ptr %68, align 4, !tbaa !20
  %70 = icmp eq i32 %69, -1
  %71 = select i1 %70, i32 %66, i32 %29
  %72 = getelementptr inbounds %struct.branch, ptr %24, i32 %27
  store i32 %71, ptr %72, align 4, !tbaa !25
  %73 = getelementptr inbounds nuw i8, ptr %72, i32 4
  store ptr %31, ptr %73, align 4, !tbaa !27
  %74 = add nsw i32 %27, 1
  br label %131

75:                                               ; preds = %61, %56
  %76 = phi i32 [ %60, %56 ], [ %62, %61 ]
  %77 = icmp slt i32 %30, %22
  br i1 %77, label %78, label %278

78:                                               ; preds = %75
  %79 = getelementptr i8, ptr %31, i32 1
  %80 = load i8, ptr %79, align 1, !tbaa !22
  %81 = icmp eq i8 %80, 120
  br i1 %81, label %82, label %96

82:                                               ; preds = %78
  %83 = icmp slt i32 %30, %23
  br i1 %83, label %84, label %278

84:                                               ; preds = %82
  %85 = getelementptr i8, ptr %31, i32 2
  %86 = load i8, ptr %85, align 1, !tbaa !22
  %87 = zext i8 %86 to i32
  %88 = tail call i32 @isxdigit(i32 noundef %87) #7
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %278, label %90

90:                                               ; preds = %84
  %91 = getelementptr i8, ptr %31, i32 3
  %92 = load i8, ptr %91, align 1, !tbaa !22
  %93 = zext i8 %92 to i32
  %94 = tail call i32 @isxdigit(i32 noundef %93) #7
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %278, label %131

96:                                               ; preds = %78
  %97 = zext i8 %80 to i32
  %98 = tail call ptr @strchr(ptr noundef nonnull @.str.5, i32 noundef %97) #7
  %99 = icmp eq ptr %98, null
  br i1 %99, label %278, label %131

100:                                              ; preds = %61
  %101 = icmp sgt i32 %28, 99
  br i1 %101, label %278, label %102

102:                                              ; preds = %100
  %103 = add nsw i32 %29, 1
  %104 = getelementptr inbounds nuw i8, ptr %31, i32 1
  %105 = getelementptr inbounds %struct.bracket_pair, ptr %6, i32 %28
  store ptr %104, ptr %105, align 4, !tbaa !17
  %106 = getelementptr inbounds nuw i8, ptr %105, i32 4
  store i32 -1, ptr %106, align 4, !tbaa !20
  %107 = add nsw i32 %28, 1
  %108 = icmp sgt i32 %28, %4
  %109 = and i1 %25, %108
  br i1 %109, label %278, label %131

110:                                              ; preds = %61
  %111 = add nsw i32 %28, -1
  %112 = getelementptr inbounds %struct.bracket_pair, ptr %6, i32 %111
  %113 = getelementptr inbounds nuw i8, ptr %112, i32 4
  %114 = load i32, ptr %113, align 4, !tbaa !20
  %115 = icmp eq i32 %114, -1
  %116 = select i1 %115, i32 %111, i32 %29
  %117 = getelementptr inbounds %struct.bracket_pair, ptr %6, i32 %116
  %118 = load ptr, ptr %117, align 4, !tbaa !17
  %119 = ptrtoint ptr %31 to i32
  %120 = ptrtoint ptr %118 to i32
  %121 = sub i32 %119, %120
  %122 = getelementptr inbounds nuw i8, ptr %117, i32 4
  store i32 %121, ptr %122, align 4, !tbaa !20
  %123 = add nsw i32 %29, -1
  %124 = icmp slt i32 %29, 1
  br i1 %124, label %278, label %125

125:                                              ; preds = %110
  %126 = icmp sgt i32 %30, 0
  br i1 %126, label %127, label %131

127:                                              ; preds = %125
  %128 = getelementptr i8, ptr %31, i32 -1
  %129 = load i8, ptr %128, align 1, !tbaa !22
  %130 = icmp eq i8 %129, 40
  br i1 %130, label %278, label %131

131:                                              ; preds = %127, %125, %102, %96, %90, %65, %61
  %132 = phi i32 [ %74, %65 ], [ %27, %90 ], [ %27, %102 ], [ %27, %96 ], [ %27, %61 ], [ %27, %125 ], [ %27, %127 ]
  %133 = phi i32 [ %28, %65 ], [ %28, %90 ], [ %107, %102 ], [ %28, %96 ], [ %28, %61 ], [ %28, %125 ], [ %28, %127 ]
  %134 = phi i32 [ %62, %65 ], [ %76, %90 ], [ %62, %102 ], [ %76, %96 ], [ %62, %61 ], [ %62, %125 ], [ %62, %127 ]
  %135 = phi i32 [ %29, %65 ], [ %29, %90 ], [ %103, %102 ], [ %29, %96 ], [ %29, %61 ], [ %123, %125 ], [ %123, %127 ]
  %136 = add nsw i32 %134, %30
  %137 = icmp slt i32 %136, %18
  br i1 %137, label %26, label %138, !llvm.loop !28

138:                                              ; preds = %131
  store i32 %133, ptr %8, align 4
  store i32 %132, ptr %7, align 4
  %139 = icmp eq i32 %135, 0
  br i1 %139, label %140, label %278

140:                                              ; preds = %138
  %141 = icmp sgt i32 %132, 0
  br i1 %141, label %142, label %147

142:                                              ; preds = %140
  %143 = getelementptr inbounds nuw i8, ptr %6, i32 1604
  br label %154

144:                                              ; preds = %173, %154
  %145 = phi i32 [ %155, %154 ], [ %174, %173 ]
  %146 = icmp slt i32 %157, %145
  br i1 %146, label %154, label %147, !llvm.loop !29

147:                                              ; preds = %144, %140
  %148 = phi i32 [ %132, %140 ], [ %145, %144 ]
  %149 = icmp sgt i32 %133, 0
  br i1 %149, label %150, label %199

150:                                              ; preds = %16, %147
  %151 = phi i32 [ %148, %147 ], [ 0, %16 ]
  %152 = phi i32 [ %133, %147 ], [ 1, %16 ]
  %153 = getelementptr inbounds nuw i8, ptr %6, i32 1604
  br label %178

154:                                              ; preds = %144, %142
  %155 = phi i32 [ %132, %142 ], [ %145, %144 ]
  %156 = phi i32 [ 0, %142 ], [ %157, %144 ]
  %157 = add nuw nsw i32 %156, 1
  %158 = icmp slt i32 %157, %155
  br i1 %158, label %159, label %144

159:                                              ; preds = %154
  %160 = getelementptr inbounds nuw %struct.branch, ptr %143, i32 %156
  br label %161

161:                                              ; preds = %173, %159
  %162 = phi i32 [ %155, %159 ], [ %174, %173 ]
  %163 = phi i32 [ %155, %159 ], [ %175, %173 ]
  %164 = phi i32 [ %157, %159 ], [ %176, %173 ]
  %165 = load i32, ptr %160, align 4, !tbaa !25
  %166 = getelementptr inbounds nuw %struct.branch, ptr %143, i32 %164
  %167 = load i32, ptr %166, align 4, !tbaa !25
  %168 = icmp sgt i32 %165, %167
  br i1 %168, label %169, label %173

169:                                              ; preds = %161
  %170 = load i64, ptr %160, align 4
  %171 = load i64, ptr %166, align 4
  store i64 %171, ptr %160, align 4
  store i64 %170, ptr %166, align 4
  %172 = load i32, ptr %7, align 4, !tbaa !10
  br label %173

173:                                              ; preds = %169, %161
  %174 = phi i32 [ %162, %161 ], [ %172, %169 ]
  %175 = phi i32 [ %163, %161 ], [ %172, %169 ]
  %176 = add nuw nsw i32 %164, 1
  %177 = icmp slt i32 %176, %175
  br i1 %177, label %161, label %144, !llvm.loop !30

178:                                              ; preds = %195, %150
  %179 = phi i32 [ 0, %150 ], [ %196, %195 ]
  %180 = phi i32 [ 0, %150 ], [ %197, %195 ]
  %181 = getelementptr inbounds nuw %struct.bracket_pair, ptr %6, i32 %180
  %182 = getelementptr inbounds nuw i8, ptr %181, i32 12
  store i32 0, ptr %182, align 4, !tbaa !31
  %183 = getelementptr inbounds nuw i8, ptr %181, i32 8
  store i32 %179, ptr %183, align 4, !tbaa !32
  %184 = icmp slt i32 %179, %151
  br i1 %184, label %185, label %195

185:                                              ; preds = %178, %191
  %186 = phi i32 [ %192, %191 ], [ 0, %178 ]
  %187 = phi i32 [ %193, %191 ], [ %179, %178 ]
  %188 = getelementptr inbounds %struct.branch, ptr %153, i32 %187
  %189 = load i32, ptr %188, align 4, !tbaa !25
  %190 = icmp eq i32 %189, %180
  br i1 %190, label %191, label %195

191:                                              ; preds = %185
  %192 = add nuw nsw i32 %186, 1
  store i32 %192, ptr %182, align 4, !tbaa !31
  %193 = add i32 %187, 1
  %194 = icmp eq i32 %193, %151
  br i1 %194, label %195, label %185, !llvm.loop !33

195:                                              ; preds = %191, %185, %178
  %196 = phi i32 [ %179, %178 ], [ %187, %185 ], [ %151, %191 ]
  %197 = add nuw nsw i32 %180, 1
  %198 = icmp eq i32 %197, %152
  br i1 %198, label %199, label %178, !llvm.loop !34

199:                                              ; preds = %195, %147
  %200 = load ptr, ptr %6, align 4, !tbaa !17
  %201 = load i8, ptr %200, align 1, !tbaa !22
  %202 = icmp eq i8 %201, 94
  %203 = icmp slt i32 %2, 0
  br i1 %203, label %278, label %204

204:                                              ; preds = %199
  %205 = getelementptr inbounds nuw i8, ptr %6, i32 12
  %206 = getelementptr inbounds nuw i8, ptr %6, i32 8
  %207 = load i32, ptr %205, align 4, !tbaa !31
  br label %208

208:                                              ; preds = %274, %204
  %209 = phi i32 [ %207, %204 ], [ %268, %274 ]
  %210 = phi i32 [ 0, %204 ], [ %275, %274 ]
  %211 = getelementptr inbounds nuw i8, ptr %1, i32 %210
  %212 = sub nsw i32 %2, %210
  %213 = load ptr, ptr %6, align 4, !tbaa !17
  %214 = icmp eq i32 %209, 0
  br i1 %214, label %223, label %215

215:                                              ; preds = %208
  %216 = load i32, ptr %206, align 4, !tbaa !32
  %217 = getelementptr %struct.branch, ptr %6, i32 %216
  %218 = getelementptr i8, ptr %217, i32 1608
  %219 = load ptr, ptr %218, align 4, !tbaa !27
  %220 = ptrtoint ptr %219 to i32
  %221 = ptrtoint ptr %213 to i32
  %222 = sub i32 %220, %221
  br label %225

223:                                              ; preds = %208
  %224 = load i32, ptr %19, align 4, !tbaa !20
  br label %225

225:                                              ; preds = %223, %215
  %226 = phi i32 [ %224, %223 ], [ %222, %215 ]
  %227 = call fastcc i32 @bar(ptr noundef %213, i32 noundef %226, ptr noundef %211, i32 noundef %212, ptr noundef nonnull %6, i32 noundef 0) #8
  %228 = icmp slt i32 %227, 1
  br i1 %228, label %229, label %271

229:                                              ; preds = %225
  %230 = load i32, ptr %205, align 4, !tbaa !31
  %231 = icmp sgt i32 %230, 0
  br i1 %231, label %232, label %267

232:                                              ; preds = %229, %263
  %233 = phi i32 [ %265, %263 ], [ %230, %229 ]
  %234 = phi i32 [ %264, %263 ], [ 1, %229 ]
  %235 = load i32, ptr %206, align 4, !tbaa !32
  %236 = getelementptr %struct.branch, ptr %6, i32 %235
  %237 = getelementptr %struct.branch, ptr %236, i32 %234
  %238 = getelementptr i8, ptr %237, i32 1600
  %239 = load ptr, ptr %238, align 4, !tbaa !27
  %240 = getelementptr inbounds nuw i8, ptr %239, i32 1
  %241 = icmp eq i32 %233, 0
  br i1 %241, label %242, label %244

242:                                              ; preds = %232
  %243 = load i32, ptr %19, align 4, !tbaa !20
  br label %259

244:                                              ; preds = %232
  %245 = icmp eq i32 %234, %233
  br i1 %245, label %246, label %253

246:                                              ; preds = %244
  %247 = load ptr, ptr %6, align 4, !tbaa !17
  %248 = load i32, ptr %19, align 4, !tbaa !20
  %249 = getelementptr inbounds i8, ptr %247, i32 %248
  %250 = ptrtoint ptr %249 to i32
  %251 = ptrtoint ptr %240 to i32
  %252 = sub i32 %250, %251
  br label %259

253:                                              ; preds = %244
  %254 = getelementptr i8, ptr %237, i32 1608
  %255 = load ptr, ptr %254, align 4, !tbaa !27
  %256 = ptrtoint ptr %255 to i32
  %257 = ptrtoint ptr %240 to i32
  %258 = sub i32 %256, %257
  br label %259

259:                                              ; preds = %253, %246, %242
  %260 = phi i32 [ %243, %242 ], [ %252, %246 ], [ %258, %253 ]
  %261 = call fastcc i32 @bar(ptr noundef nonnull %240, i32 noundef %260, ptr noundef %211, i32 noundef %212, ptr noundef nonnull %6, i32 noundef 0) #8
  %262 = icmp slt i32 %261, 1
  br i1 %262, label %263, label %271

263:                                              ; preds = %259
  %264 = add nuw nsw i32 %234, 1
  %265 = load i32, ptr %205, align 4, !tbaa !31
  %266 = icmp slt i32 %234, %265
  br i1 %266, label %232, label %267, !llvm.loop !35

267:                                              ; preds = %263, %229
  %268 = phi i32 [ %230, %229 ], [ %265, %263 ]
  %269 = phi i32 [ %227, %229 ], [ %261, %263 ]
  %270 = icmp sgt i32 %269, -1
  br i1 %270, label %271, label %274

271:                                              ; preds = %267, %225, %259
  %272 = phi i32 [ %261, %259 ], [ %227, %225 ], [ 0, %267 ]
  %273 = add nuw nsw i32 %272, %210
  br label %278

274:                                              ; preds = %267
  %275 = add nuw nsw i32 %210, 1
  %276 = icmp sge i32 %210, %2
  %277 = select i1 %202, i1 true, i1 %276
  br i1 %277, label %278, label %208, !llvm.loop !37

278:                                              ; preds = %63, %75, %82, %84, %90, %96, %100, %102, %110, %127, %274, %138, %199, %271
  %279 = phi i32 [ -3, %138 ], [ %273, %271 ], [ -1, %199 ], [ %269, %274 ], [ -6, %75 ], [ -6, %82 ], [ -6, %84 ], [ -6, %96 ], [ -9, %100 ], [ -3, %110 ], [ -7, %102 ], [ -6, %90 ], [ -1, %127 ], [ -8, %63 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #6
  ret i32 %279
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #2

declare dso_local i32 @strlen(ptr noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local void @initialise_benchmark() local_unnamed_addr #3 {
  ret void
}

; Function Attrs: nounwind
define dso_local void @warm_caches(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call fastcc i32 @benchmark_body(i32 noundef %0) #8
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc i32 @benchmark_body(i32 noundef %0) unnamed_addr #4 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.slre_cap, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %5, label %26

5:                                                ; preds = %1, %5
  %6 = phi i32 [ %24, %5 ], [ 0, %1 ]
  %7 = call i32 @strlen(ptr noundef nonnull @text) #7
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #6
  store volatile i32 0, ptr %2, align 4, !tbaa !6
  %8 = load ptr, ptr @regexes, align 4, !tbaa !38
  %9 = call i32 @slre_match(ptr noundef %8, ptr noundef nonnull @text, i32 noundef %7, ptr noundef nonnull %3, i32 noundef 1) #8
  %10 = load volatile i32, ptr %2, align 4, !tbaa !6
  %11 = add nsw i32 %10, %9
  store volatile i32 %11, ptr %2, align 4, !tbaa !6
  %12 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @regexes, i32 4), align 4, !tbaa !38
  %13 = call i32 @slre_match(ptr noundef %12, ptr noundef nonnull @text, i32 noundef %7, ptr noundef nonnull %3, i32 noundef 1) #8
  %14 = load volatile i32, ptr %2, align 4, !tbaa !6
  %15 = add nsw i32 %14, %13
  store volatile i32 %15, ptr %2, align 4, !tbaa !6
  %16 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @regexes, i32 8), align 4, !tbaa !38
  %17 = call i32 @slre_match(ptr noundef %16, ptr noundef nonnull @text, i32 noundef %7, ptr noundef nonnull %3, i32 noundef 1) #8
  %18 = load volatile i32, ptr %2, align 4, !tbaa !6
  %19 = add nsw i32 %18, %17
  store volatile i32 %19, ptr %2, align 4, !tbaa !6
  %20 = load ptr, ptr getelementptr inbounds nuw (i8, ptr @regexes, i32 12), align 4, !tbaa !38
  %21 = call i32 @slre_match(ptr noundef %20, ptr noundef nonnull @text, i32 noundef %7, ptr noundef nonnull %3, i32 noundef 1) #8
  %22 = load volatile i32, ptr %2, align 4, !tbaa !6
  %23 = add nsw i32 %22, %21
  store volatile i32 %23, ptr %2, align 4, !tbaa !6
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #6
  %24 = add nuw nsw i32 %6, 1
  %25 = icmp eq i32 %24, %0
  br i1 %25, label %26, label %5, !llvm.loop !39

26:                                               ; preds = %5, %1
  %27 = load volatile i32, ptr %2, align 4, !tbaa !6
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret i32 %27
}

; Function Attrs: noinline nounwind
define dso_local i32 @benchmark() local_unnamed_addr #4 {
  %1 = tail call fastcc i32 @benchmark_body(i32 noundef 110) #8
  ret i32 %1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local range(i32 0, 2) i32 @verify_benchmark(i32 noundef %0) local_unnamed_addr #3 {
  %2 = icmp eq i32 %0, 102
  %3 = zext i1 %2 to i32
  ret i32 %3
}

declare dso_local i32 @isxdigit(i32 noundef) local_unnamed_addr #2

declare dso_local ptr @strchr(ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind
define internal fastcc i32 @bar(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, ptr noundef nonnull %4, i32 noundef %5) unnamed_addr #0 {
  %7 = icmp sgt i32 %1, 0
  %8 = icmp sgt i32 %3, -1
  %9 = and i1 %7, %8
  br i1 %9, label %10, label %418

10:                                               ; preds = %6
  %11 = getelementptr inbounds nuw i8, ptr %4, i32 1600
  %12 = getelementptr inbounds nuw i8, ptr %4, i32 2408
  %13 = add nsw i32 %1, -2
  %14 = getelementptr inbounds nuw i8, ptr %4, i32 2416
  %15 = add nuw i32 %3, 1
  br label %16

16:                                               ; preds = %10, %410
  %17 = phi i32 [ 0, %10 ], [ %414, %410 ]
  %18 = phi i32 [ %5, %10 ], [ %413, %410 ]
  %19 = phi i32 [ 0, %10 ], [ %411, %410 ]
  %20 = phi i32 [ 0, %10 ], [ %412, %410 ]
  %21 = getelementptr inbounds nuw i8, ptr %0, i32 %19
  %22 = load i8, ptr %21, align 1, !tbaa !22
  %23 = icmp eq i8 %22, 40
  br i1 %23, label %24, label %29

24:                                               ; preds = %16
  %25 = getelementptr %struct.bracket_pair, ptr %4, i32 %18
  %26 = getelementptr i8, ptr %25, i32 20
  %27 = load i32, ptr %26, align 4, !tbaa !20
  %28 = add nsw i32 %27, 2
  br label %60

29:                                               ; preds = %16
  %30 = sub nsw i32 %1, %19
  switch i8 %22, label %58 [
    i8 91, label %31
    i8 92, label %53
  ]

31:                                               ; preds = %29
  %32 = getelementptr inbounds nuw i8, ptr %21, i32 1
  %33 = add nsw i32 %30, -1
  %34 = icmp sgt i32 %30, 1
  br i1 %34, label %35, label %48

35:                                               ; preds = %31, %44
  %36 = phi i32 [ %46, %44 ], [ 0, %31 ]
  %37 = getelementptr inbounds nuw i8, ptr %32, i32 %36
  %38 = load i8, ptr %37, align 1, !tbaa !22
  switch i8 %38, label %44 [
    i8 93, label %48
    i8 92, label %39
  ]

39:                                               ; preds = %35
  %40 = getelementptr inbounds nuw i8, ptr %37, i32 1
  %41 = load i8, ptr %40, align 1, !tbaa !22
  %42 = icmp eq i8 %41, 120
  %43 = select i1 %42, i32 4, i32 2
  br label %44

44:                                               ; preds = %39, %35
  %45 = phi i32 [ %43, %39 ], [ 1, %35 ]
  %46 = add nuw nsw i32 %45, %36
  %47 = icmp slt i32 %46, %33
  br i1 %47, label %35, label %48, !llvm.loop !23

48:                                               ; preds = %44, %35, %31
  %49 = phi i32 [ 0, %31 ], [ %36, %35 ], [ %46, %44 ]
  %50 = icmp slt i32 %49, %30
  %51 = add nsw i32 %49, 2
  %52 = select i1 %50, i32 %51, i32 0
  br label %58

53:                                               ; preds = %29
  %54 = getelementptr inbounds nuw i8, ptr %21, i32 1
  %55 = load i8, ptr %54, align 1, !tbaa !22
  %56 = icmp eq i8 %55, 120
  %57 = select i1 %56, i32 4, i32 2
  br label %63

58:                                               ; preds = %48, %29
  %59 = phi i32 [ 1, %29 ], [ %52, %48 ]
  switch i8 %22, label %60 [
    i8 63, label %418
    i8 43, label %418
    i8 42, label %418
  ]

60:                                               ; preds = %24, %58
  %61 = phi i32 [ %59, %58 ], [ %28, %24 ]
  %62 = icmp slt i32 %61, 1
  br i1 %62, label %418, label %63

63:                                               ; preds = %53, %60
  %64 = phi i32 [ %57, %53 ], [ %61, %60 ]
  %65 = add nuw nsw i32 %64, %19
  %66 = icmp slt i32 %65, %1
  br i1 %66, label %67, label %149

67:                                               ; preds = %63
  %68 = getelementptr inbounds nuw i8, ptr %21, i32 %64
  %69 = load i8, ptr %68, align 1, !tbaa !22
  switch i8 %69, label %149 [
    i8 63, label %70
    i8 43, label %70
    i8 42, label %70
  ]

70:                                               ; preds = %67, %67, %67
  %71 = getelementptr inbounds nuw i8, ptr %0, i32 %65
  %72 = load i8, ptr %71, align 1, !tbaa !22
  switch i8 %72, label %410 [
    i8 63, label %73
    i8 43, label %81
    i8 42, label %81
  ]

73:                                               ; preds = %70
  %74 = getelementptr inbounds i8, ptr %2, i32 %20
  %75 = sub nsw i32 %3, %20
  %76 = tail call fastcc i32 @bar(ptr noundef nonnull %21, i32 noundef %64, ptr noundef %74, i32 noundef %75, ptr noundef %4, i32 noundef %18) #8
  %77 = tail call i32 @llvm.smax.i32(i32 %76, i32 0)
  %78 = add nsw i32 %77, %20
  %79 = add nuw nsw i32 %19, 1
  %80 = add nuw nsw i32 %79, %64
  br label %410

81:                                               ; preds = %70, %70
  %82 = getelementptr inbounds nuw i8, ptr %0, i32 %65
  %83 = add nuw nsw i32 %65, 1
  %84 = icmp slt i32 %83, %1
  br i1 %84, label %85, label %91

85:                                               ; preds = %81
  %86 = getelementptr inbounds nuw i8, ptr %0, i32 %83
  %87 = load i8, ptr %86, align 1, !tbaa !22
  %88 = icmp ne i8 %87, 63
  %89 = add nuw nsw i32 %65, 2
  %90 = select i1 %88, i32 %83, i32 %89
  br label %91

91:                                               ; preds = %85, %81
  %92 = phi i32 [ %83, %81 ], [ %90, %85 ]
  %93 = phi i1 [ true, %81 ], [ %88, %85 ]
  %94 = icmp slt i32 %92, %1
  %95 = getelementptr inbounds nuw i8, ptr %0, i32 %92
  %96 = sub nsw i32 %1, %92
  br label %97

97:                                               ; preds = %119, %91
  %98 = phi i32 [ %20, %91 ], [ %106, %119 ]
  %99 = phi i32 [ %20, %91 ], [ %120, %119 ]
  %100 = phi i32 [ -1, %91 ], [ %121, %119 ]
  %101 = getelementptr inbounds i8, ptr %2, i32 %98
  %102 = sub nsw i32 %3, %98
  %103 = tail call fastcc i32 @bar(ptr noundef nonnull %21, i32 noundef %64, ptr noundef %101, i32 noundef %102, ptr noundef %4, i32 noundef %18) #8
  %104 = icmp sgt i32 %103, 0
  %105 = tail call i32 @llvm.smax.i32(i32 %103, i32 0)
  %106 = add nsw i32 %105, %98
  %107 = load i8, ptr %82, align 1, !tbaa !22
  %108 = icmp eq i8 %107, 43
  %109 = icmp slt i32 %103, 0
  %110 = and i1 %109, %108
  br i1 %110, label %137, label %111

111:                                              ; preds = %97
  br i1 %94, label %112, label %119

112:                                              ; preds = %111
  %113 = getelementptr inbounds i8, ptr %2, i32 %106
  %114 = sub nsw i32 %3, %106
  %115 = tail call fastcc i32 @bar(ptr noundef nonnull %95, i32 noundef %96, ptr noundef %113, i32 noundef %114, ptr noundef %4, i32 noundef %18) #8
  %116 = add nsw i32 %115, %106
  %117 = icmp slt i32 %115, 0
  %118 = select i1 %117, i32 %99, i32 %116
  br label %119

119:                                              ; preds = %112, %111
  %120 = phi i32 [ %118, %112 ], [ %106, %111 ]
  %121 = phi i32 [ %115, %112 ], [ %100, %111 ]
  %122 = icmp sle i32 %120, %20
  %123 = or i1 %93, %122
  %124 = and i1 %104, %123
  br i1 %124, label %97, label %125, !llvm.loop !40

125:                                              ; preds = %119
  %126 = load i8, ptr %82, align 1, !tbaa !22
  %127 = icmp eq i8 %126, 42
  %128 = select i1 %109, i1 %127, i1 false
  br i1 %128, label %129, label %137

129:                                              ; preds = %125
  %130 = getelementptr inbounds i8, ptr %2, i32 %20
  %131 = sub nsw i32 %3, %20
  %132 = tail call fastcc i32 @bar(ptr noundef nonnull %95, i32 noundef %96, ptr noundef %130, i32 noundef %131, ptr noundef %4, i32 noundef %18) #8
  %133 = icmp sgt i32 %132, 0
  %134 = add nsw i32 %132, %20
  %135 = select i1 %133, i32 %134, i32 %120
  %136 = load i8, ptr %82, align 1, !tbaa !22
  br label %137

137:                                              ; preds = %97, %129, %125
  %138 = phi i8 [ %126, %125 ], [ %136, %129 ], [ 43, %97 ]
  %139 = phi i32 [ %120, %125 ], [ %135, %129 ], [ %99, %97 ]
  %140 = phi i32 [ %121, %125 ], [ %132, %129 ], [ %100, %97 ]
  %141 = icmp eq i8 %138, 43
  %142 = icmp eq i32 %139, %20
  %143 = select i1 %141, i1 %142, i1 false
  br i1 %143, label %418, label %144

144:                                              ; preds = %137
  %145 = icmp slt i32 %140, 0
  %146 = select i1 %142, i1 %94, i1 false
  %147 = select i1 %146, i1 %145, i1 false
  %148 = select i1 %147, i32 -1, i32 %139
  br label %418

149:                                              ; preds = %67, %63
  switch i8 %22, label %402 [
    i8 91, label %150
    i8 40, label %228
    i8 94, label %398
    i8 36, label %400
  ]

150:                                              ; preds = %149
  %151 = getelementptr inbounds nuw i8, ptr %21, i32 1
  %152 = getelementptr inbounds i8, ptr %2, i32 %20
  %153 = load i8, ptr %151, align 1, !tbaa !22
  %154 = icmp eq i8 %153, 94
  %155 = sext i1 %154 to i32
  %156 = sub nsw i32 %13, %19
  %157 = add nsw i32 %156, %155
  %158 = zext i1 %154 to i32
  %159 = getelementptr inbounds nuw i8, ptr %151, i32 %158
  %160 = icmp slt i32 %157, 0
  br i1 %160, label %161, label %162

161:                                              ; preds = %150
  br i1 %154, label %226, label %418

162:                                              ; preds = %150, %218
  %163 = phi i32 [ %220, %218 ], [ -1, %150 ]
  %164 = phi i32 [ %219, %218 ], [ 0, %150 ]
  %165 = getelementptr inbounds i8, ptr %159, i32 %164
  %166 = load i8, ptr %165, align 1, !tbaa !22
  %167 = icmp ne i8 %166, 93
  %168 = icmp slt i32 %163, 1
  %169 = select i1 %167, i1 %168, i1 false
  br i1 %169, label %170, label %222

170:                                              ; preds = %162
  %171 = icmp eq i8 %166, 45
  br i1 %171, label %206, label %172

172:                                              ; preds = %170
  %173 = getelementptr i8, ptr %165, i32 1
  %174 = load i8, ptr %173, align 1, !tbaa !22
  %175 = icmp eq i8 %174, 45
  br i1 %175, label %176, label %206

176:                                              ; preds = %172
  %177 = getelementptr i8, ptr %165, i32 2
  %178 = load i8, ptr %177, align 1, !tbaa !22
  switch i8 %178, label %179 [
    i8 93, label %206
    i8 0, label %206
  ]

179:                                              ; preds = %176
  %180 = load i32, ptr %14, align 4, !tbaa !14
  %181 = icmp eq i32 %180, 0
  %182 = load i8, ptr %152, align 1, !tbaa !22
  br i1 %181, label %187, label %183

183:                                              ; preds = %179
  %184 = icmp uge i8 %182, %166
  %185 = icmp ule i8 %182, %178
  %186 = and i1 %184, %185
  br label %202

187:                                              ; preds = %179
  %188 = zext i8 %182 to i32
  %189 = tail call i32 @tolower(i32 noundef %188) #7
  %190 = load i8, ptr %165, align 1, !tbaa !22
  %191 = zext i8 %190 to i32
  %192 = tail call i32 @tolower(i32 noundef %191) #7
  %193 = icmp slt i32 %189, %192
  br i1 %193, label %202, label %194

194:                                              ; preds = %187
  %195 = load i8, ptr %152, align 1, !tbaa !22
  %196 = zext i8 %195 to i32
  %197 = tail call i32 @tolower(i32 noundef %196) #7
  %198 = load i8, ptr %177, align 1, !tbaa !22
  %199 = zext i8 %198 to i32
  %200 = tail call i32 @tolower(i32 noundef %199) #7
  %201 = icmp sle i32 %197, %200
  br label %202

202:                                              ; preds = %194, %187, %183
  %203 = phi i1 [ %186, %183 ], [ false, %187 ], [ %201, %194 ]
  %204 = zext i1 %203 to i32
  %205 = add nsw i32 %164, 3
  br label %218

206:                                              ; preds = %176, %176, %172, %170
  %207 = tail call fastcc i32 @match_op(ptr noundef nonnull readonly %165, ptr noundef readonly %152, ptr noundef nonnull readonly %4) #8
  %208 = load i8, ptr %165, align 1, !tbaa !22
  %209 = icmp eq i8 %208, 92
  br i1 %209, label %210, label %215

210:                                              ; preds = %206
  %211 = getelementptr inbounds nuw i8, ptr %165, i32 1
  %212 = load i8, ptr %211, align 1, !tbaa !22
  %213 = icmp eq i8 %212, 120
  %214 = select i1 %213, i32 4, i32 2
  br label %215

215:                                              ; preds = %210, %206
  %216 = phi i32 [ %214, %210 ], [ 1, %206 ]
  %217 = add nsw i32 %216, %164
  br label %218

218:                                              ; preds = %215, %202
  %219 = phi i32 [ %205, %202 ], [ %217, %215 ]
  %220 = phi i32 [ %204, %202 ], [ %207, %215 ]
  %221 = icmp sgt i32 %219, %157
  br i1 %221, label %222, label %162, !llvm.loop !41

222:                                              ; preds = %162, %218
  %223 = phi i32 [ %220, %218 ], [ %163, %162 ]
  %224 = icmp slt i32 %223, 1
  %225 = xor i1 %154, %224
  br i1 %225, label %418, label %226

226:                                              ; preds = %161, %222
  %227 = add nsw i32 %20, 1
  br label %410

228:                                              ; preds = %149
  %229 = add nsw i32 %18, 1
  %230 = load i32, ptr %11, align 4, !tbaa !21
  %231 = icmp slt i32 %229, %230
  br i1 %231, label %232, label %418

232:                                              ; preds = %228
  %233 = sub nsw i32 %1, %65
  %234 = icmp slt i32 %233, 1
  br i1 %234, label %246, label %235

235:                                              ; preds = %232
  %236 = icmp slt i32 %3, %20
  br i1 %236, label %418, label %237

237:                                              ; preds = %235
  %238 = getelementptr inbounds i8, ptr %2, i32 %20
  %239 = add i32 %17, %3
  %240 = getelementptr inbounds %struct.bracket_pair, ptr %4, i32 %229
  %241 = getelementptr inbounds nuw i8, ptr %240, i32 12
  %242 = getelementptr inbounds nuw i8, ptr %240, i32 8
  %243 = getelementptr inbounds nuw i8, ptr %240, i32 4
  %244 = getelementptr inbounds nuw i8, ptr %21, i32 %64
  %245 = sub i32 %15, %20
  br label %311

246:                                              ; preds = %232
  %247 = getelementptr inbounds i8, ptr %2, i32 %20
  %248 = sub nsw i32 %3, %20
  %249 = getelementptr inbounds %struct.bracket_pair, ptr %4, i32 %229
  %250 = getelementptr inbounds nuw i8, ptr %249, i32 12
  %251 = getelementptr inbounds nuw i8, ptr %249, i32 8
  %252 = getelementptr inbounds nuw i8, ptr %249, i32 4
  %253 = load ptr, ptr %249, align 4, !tbaa !17
  %254 = load i32, ptr %250, align 4, !tbaa !31
  %255 = icmp eq i32 %254, 0
  br i1 %255, label %264, label %256

256:                                              ; preds = %246
  %257 = load i32, ptr %251, align 4, !tbaa !32
  %258 = getelementptr %struct.branch, ptr %4, i32 %257
  %259 = getelementptr i8, ptr %258, i32 1608
  %260 = load ptr, ptr %259, align 4, !tbaa !27
  %261 = ptrtoint ptr %260 to i32
  %262 = ptrtoint ptr %253 to i32
  %263 = sub i32 %261, %262
  br label %266

264:                                              ; preds = %246
  %265 = load i32, ptr %252, align 4, !tbaa !20
  br label %266

266:                                              ; preds = %264, %256
  %267 = phi i32 [ %265, %264 ], [ %263, %256 ]
  %268 = tail call fastcc i32 @bar(ptr noundef %253, i32 noundef %267, ptr noundef %247, i32 noundef %248, ptr noundef nonnull %4, i32 noundef range(i32 -2147483647, -2147483648) %229) #8
  %269 = icmp slt i32 %268, 1
  br i1 %269, label %270, label %388

270:                                              ; preds = %266
  %271 = load i32, ptr %250, align 4, !tbaa !31
  %272 = icmp sgt i32 %271, 0
  br i1 %272, label %273, label %385

273:                                              ; preds = %270, %307
  %274 = phi i32 [ %309, %307 ], [ %271, %270 ]
  %275 = phi i32 [ %308, %307 ], [ 1, %270 ]
  %276 = load i32, ptr %251, align 4, !tbaa !32
  %277 = getelementptr %struct.branch, ptr %4, i32 %276
  %278 = getelementptr %struct.branch, ptr %277, i32 %275
  %279 = getelementptr i8, ptr %278, i32 1600
  %280 = load ptr, ptr %279, align 4, !tbaa !27
  %281 = getelementptr inbounds nuw i8, ptr %280, i32 1
  %282 = icmp eq i32 %274, 0
  br i1 %282, label %283, label %285

283:                                              ; preds = %273
  %284 = load i32, ptr %252, align 4, !tbaa !20
  br label %303

285:                                              ; preds = %273
  %286 = icmp eq i32 %275, %274
  br i1 %286, label %287, label %294

287:                                              ; preds = %285
  %288 = load ptr, ptr %249, align 4, !tbaa !17
  %289 = load i32, ptr %252, align 4, !tbaa !20
  %290 = getelementptr inbounds i8, ptr %288, i32 %289
  %291 = ptrtoint ptr %290 to i32
  %292 = ptrtoint ptr %281 to i32
  %293 = sub i32 %291, %292
  br label %303

294:                                              ; preds = %285
  %295 = load i32, ptr %251, align 4, !tbaa !32
  %296 = getelementptr %struct.branch, ptr %4, i32 %295
  %297 = getelementptr %struct.branch, ptr %296, i32 %275
  %298 = getelementptr i8, ptr %297, i32 1608
  %299 = load ptr, ptr %298, align 4, !tbaa !27
  %300 = ptrtoint ptr %299 to i32
  %301 = ptrtoint ptr %281 to i32
  %302 = sub i32 %300, %301
  br label %303

303:                                              ; preds = %294, %287, %283
  %304 = phi i32 [ %284, %283 ], [ %293, %287 ], [ %302, %294 ]
  %305 = tail call fastcc i32 @bar(ptr noundef nonnull %281, i32 noundef %304, ptr noundef %247, i32 noundef %248, ptr noundef nonnull %4, i32 noundef range(i32 -2147483647, -2147483648) %229) #8
  %306 = icmp slt i32 %305, 1
  br i1 %306, label %307, label %388

307:                                              ; preds = %303
  %308 = add nuw nsw i32 %275, 1
  %309 = load i32, ptr %250, align 4, !tbaa !31
  %310 = icmp slt i32 %275, %309
  br i1 %310, label %273, label %385, !llvm.loop !42

311:                                              ; preds = %237, %381
  %312 = phi i32 [ 0, %237 ], [ %383, %381 ]
  %313 = sub i32 %239, %312
  %314 = load ptr, ptr %240, align 4, !tbaa !17
  %315 = load i32, ptr %241, align 4, !tbaa !31
  %316 = icmp eq i32 %315, 0
  br i1 %316, label %325, label %317

317:                                              ; preds = %311
  %318 = load i32, ptr %242, align 4, !tbaa !32
  %319 = getelementptr %struct.branch, ptr %4, i32 %318
  %320 = getelementptr i8, ptr %319, i32 1608
  %321 = load ptr, ptr %320, align 4, !tbaa !27
  %322 = ptrtoint ptr %321 to i32
  %323 = ptrtoint ptr %314 to i32
  %324 = sub i32 %322, %323
  br label %327

325:                                              ; preds = %311
  %326 = load i32, ptr %243, align 4, !tbaa !20
  br label %327

327:                                              ; preds = %325, %317
  %328 = phi i32 [ %326, %325 ], [ %324, %317 ]
  %329 = tail call fastcc i32 @bar(ptr noundef %314, i32 noundef %328, ptr noundef %238, i32 noundef %313, ptr noundef nonnull %4, i32 noundef range(i32 -2147483647, -2147483648) %229) #8
  %330 = icmp slt i32 %329, 1
  br i1 %330, label %331, label %375

331:                                              ; preds = %327
  %332 = load i32, ptr %241, align 4, !tbaa !31
  %333 = icmp sgt i32 %332, 0
  br i1 %333, label %334, label %372

334:                                              ; preds = %331, %368
  %335 = phi i32 [ %370, %368 ], [ %332, %331 ]
  %336 = phi i32 [ %369, %368 ], [ 1, %331 ]
  %337 = load i32, ptr %242, align 4, !tbaa !32
  %338 = getelementptr %struct.branch, ptr %4, i32 %337
  %339 = getelementptr %struct.branch, ptr %338, i32 %336
  %340 = getelementptr i8, ptr %339, i32 1600
  %341 = load ptr, ptr %340, align 4, !tbaa !27
  %342 = getelementptr inbounds nuw i8, ptr %341, i32 1
  %343 = icmp eq i32 %335, 0
  br i1 %343, label %344, label %346

344:                                              ; preds = %334
  %345 = load i32, ptr %243, align 4, !tbaa !20
  br label %364

346:                                              ; preds = %334
  %347 = icmp eq i32 %336, %335
  br i1 %347, label %348, label %355

348:                                              ; preds = %346
  %349 = load ptr, ptr %240, align 4, !tbaa !17
  %350 = load i32, ptr %243, align 4, !tbaa !20
  %351 = getelementptr inbounds i8, ptr %349, i32 %350
  %352 = ptrtoint ptr %351 to i32
  %353 = ptrtoint ptr %342 to i32
  %354 = sub i32 %352, %353
  br label %364

355:                                              ; preds = %346
  %356 = load i32, ptr %242, align 4, !tbaa !32
  %357 = getelementptr %struct.branch, ptr %4, i32 %356
  %358 = getelementptr %struct.branch, ptr %357, i32 %336
  %359 = getelementptr i8, ptr %358, i32 1608
  %360 = load ptr, ptr %359, align 4, !tbaa !27
  %361 = ptrtoint ptr %360 to i32
  %362 = ptrtoint ptr %342 to i32
  %363 = sub i32 %361, %362
  br label %364

364:                                              ; preds = %355, %348, %344
  %365 = phi i32 [ %345, %344 ], [ %354, %348 ], [ %363, %355 ]
  %366 = tail call fastcc i32 @bar(ptr noundef nonnull %342, i32 noundef %365, ptr noundef %238, i32 noundef %313, ptr noundef nonnull %4, i32 noundef range(i32 -2147483647, -2147483648) %229) #8
  %367 = icmp slt i32 %366, 1
  br i1 %367, label %368, label %375

368:                                              ; preds = %364
  %369 = add nuw nsw i32 %336, 1
  %370 = load i32, ptr %241, align 4, !tbaa !31
  %371 = icmp slt i32 %336, %370
  br i1 %371, label %334, label %372, !llvm.loop !43

372:                                              ; preds = %368, %331
  %373 = phi i32 [ %329, %331 ], [ %366, %368 ]
  %374 = icmp sgt i32 %373, -1
  br i1 %374, label %375, label %381

375:                                              ; preds = %364, %327, %372
  %376 = phi i32 [ 0, %372 ], [ %329, %327 ], [ %366, %364 ]
  %377 = getelementptr inbounds nuw i8, ptr %238, i32 %376
  %378 = sub i32 %239, %376
  %379 = tail call fastcc i32 @bar(ptr noundef nonnull %244, i32 noundef %233, ptr noundef %377, i32 noundef %378, ptr noundef %4, i32 noundef %229) #8
  %380 = icmp sgt i32 %379, -1
  br i1 %380, label %388, label %381

381:                                              ; preds = %372, %375
  %382 = phi i32 [ %373, %372 ], [ %376, %375 ]
  %383 = add nuw i32 %312, 1
  %384 = icmp eq i32 %383, %245
  br i1 %384, label %385, label %311, !llvm.loop !44

385:                                              ; preds = %381, %307, %270
  %386 = phi i32 [ %268, %270 ], [ %305, %307 ], [ %382, %381 ]
  %387 = icmp slt i32 %386, 0
  br i1 %387, label %418, label %388

388:                                              ; preds = %375, %303, %266, %385
  %389 = phi i32 [ %386, %385 ], [ %305, %303 ], [ %268, %266 ], [ %376, %375 ]
  %390 = load ptr, ptr %12, align 4, !tbaa !16
  %391 = icmp eq ptr %390, null
  br i1 %391, label %396, label %392

392:                                              ; preds = %388
  %393 = getelementptr inbounds i8, ptr %2, i32 %20
  %394 = getelementptr inbounds %struct.slre_cap, ptr %390, i32 %18
  store ptr %393, ptr %394, align 4, !tbaa !45
  %395 = getelementptr inbounds nuw i8, ptr %394, i32 4
  store i32 %389, ptr %395, align 4, !tbaa !47
  br label %396

396:                                              ; preds = %392, %388
  %397 = add nsw i32 %389, %20
  br label %410

398:                                              ; preds = %149
  %399 = icmp eq i32 %20, 0
  br i1 %399, label %410, label %418

400:                                              ; preds = %149
  %401 = icmp eq i32 %20, %3
  br i1 %401, label %410, label %418

402:                                              ; preds = %149
  %403 = icmp slt i32 %20, %3
  br i1 %403, label %404, label %418

404:                                              ; preds = %402
  %405 = getelementptr inbounds i8, ptr %2, i32 %20
  %406 = tail call fastcc i32 @match_op(ptr noundef nonnull %21, ptr noundef %405, ptr noundef %4) #8
  %407 = icmp slt i32 %406, 1
  br i1 %407, label %418, label %408

408:                                              ; preds = %404
  %409 = add nsw i32 %20, 1
  br label %410

410:                                              ; preds = %70, %226, %398, %400, %408, %396, %73
  %411 = phi i32 [ %65, %70 ], [ %65, %226 ], [ %65, %398 ], [ %65, %400 ], [ %65, %408 ], [ %65, %396 ], [ %80, %73 ]
  %412 = phi i32 [ %20, %70 ], [ %227, %226 ], [ 0, %398 ], [ %3, %400 ], [ %409, %408 ], [ %397, %396 ], [ %78, %73 ]
  %413 = phi i32 [ %18, %70 ], [ %18, %226 ], [ %18, %398 ], [ %18, %400 ], [ %18, %408 ], [ %229, %396 ], [ %18, %73 ]
  %414 = sub i32 0, %412
  %415 = icmp slt i32 %411, %1
  %416 = icmp sle i32 %412, %3
  %417 = select i1 %415, i1 %416, i1 false
  br i1 %417, label %16, label %418, !llvm.loop !48

418:                                              ; preds = %235, %60, %222, %228, %385, %398, %400, %402, %404, %410, %58, %58, %58, %161, %144, %6, %137
  %419 = phi i32 [ %148, %144 ], [ 0, %6 ], [ -1, %137 ], [ -2, %58 ], [ -1, %235 ], [ -1, %161 ], [ %412, %410 ], [ -2, %58 ], [ %406, %404 ], [ -1, %400 ], [ -1, %398 ], [ %386, %385 ], [ -4, %228 ], [ -1, %222 ], [ -5, %60 ], [ -2, %58 ], [ -1, %402 ]
  ret i32 %419
}

; Function Attrs: nounwind
define internal fastcc range(i32 -4, 2) i32 @match_op(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef nonnull readonly captures(none) %2) unnamed_addr #0 {
  %4 = load i8, ptr %0, align 1, !tbaa !22
  %5 = zext i8 %4 to i32
  switch i8 %4, label %53 [
    i8 92, label %6
    i8 124, label %68
    i8 36, label %52
    i8 46, label %67
  ]

6:                                                ; preds = %3
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 1
  %8 = load i8, ptr %7, align 1, !tbaa !22
  switch i8 %8, label %49 [
    i8 83, label %9
    i8 115, label %14
    i8 100, label %19
    i8 120, label %24
  ]

9:                                                ; preds = %6
  %10 = load i8, ptr %1, align 1, !tbaa !22
  %11 = zext i8 %10 to i32
  %12 = tail call i32 @isspace(i32 noundef %11) #7
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %67, label %68

14:                                               ; preds = %6
  %15 = load i8, ptr %1, align 1, !tbaa !22
  %16 = zext i8 %15 to i32
  %17 = tail call i32 @isspace(i32 noundef %16) #7
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %68, label %67

19:                                               ; preds = %6
  %20 = load i8, ptr %1, align 1, !tbaa !22
  %21 = zext i8 %20 to i32
  %22 = tail call i32 @isdigit(i32 noundef %21) #7
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %68, label %67

24:                                               ; preds = %6
  %25 = getelementptr inbounds nuw i8, ptr %0, i32 2
  %26 = load i8, ptr %25, align 1, !tbaa !22
  %27 = zext i8 %26 to i32
  %28 = tail call i32 @tolower(i32 noundef %27) #7
  %29 = tail call i32 @isdigit(i32 noundef %28) #7
  %30 = getelementptr inbounds nuw i8, ptr %0, i32 3
  %31 = load i8, ptr %30, align 1, !tbaa !22
  %32 = zext i8 %31 to i32
  %33 = tail call i32 @tolower(i32 noundef %32) #7
  %34 = tail call i32 @isdigit(i32 noundef %33) #7
  %35 = insertelement <2 x i32> poison, i32 %34, i64 0
  %36 = insertelement <2 x i32> %35, i32 %29, i64 1
  %37 = icmp eq <2 x i32> %36, zeroinitializer
  %38 = select <2 x i1> %37, <2 x i32> <i32 -87, i32 268435369>, <2 x i32> <i32 -48, i32 268435408>
  %39 = insertelement <2 x i32> poison, i32 %33, i64 0
  %40 = insertelement <2 x i32> %39, i32 %28, i64 1
  %41 = add <2 x i32> %38, %40
  %42 = extractelement <2 x i32> %41, i64 1
  %43 = shl i32 %42, 4
  %44 = extractelement <2 x i32> %41, i64 0
  %45 = or i32 %44, %43
  %46 = load i8, ptr %1, align 1, !tbaa !22
  %47 = zext i8 %46 to i32
  %48 = icmp eq i32 %45, %47
  br i1 %48, label %67, label %68

49:                                               ; preds = %6
  %50 = load i8, ptr %1, align 1, !tbaa !22
  %51 = icmp eq i8 %8, %50
  br i1 %51, label %67, label %68

52:                                               ; preds = %3
  br label %68

53:                                               ; preds = %3
  %54 = getelementptr inbounds nuw i8, ptr %2, i32 2416
  %55 = load i32, ptr %54, align 4, !tbaa !14
  %56 = and i32 %55, 1
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %64, label %58

58:                                               ; preds = %53
  %59 = tail call i32 @tolower(i32 noundef %5) #7
  %60 = load i8, ptr %1, align 1, !tbaa !22
  %61 = zext i8 %60 to i32
  %62 = tail call i32 @tolower(i32 noundef %61) #7
  %63 = icmp eq i32 %59, %62
  br i1 %63, label %67, label %68

64:                                               ; preds = %53
  %65 = load i8, ptr %1, align 1, !tbaa !22
  %66 = icmp eq i8 %4, %65
  br i1 %66, label %67, label %68

67:                                               ; preds = %58, %64, %3, %49, %24, %19, %14, %9
  br label %68

68:                                               ; preds = %64, %58, %3, %49, %24, %19, %14, %9, %67, %52
  %69 = phi i32 [ -4, %3 ], [ 1, %67 ], [ -1, %58 ], [ -1, %24 ], [ -1, %52 ], [ -1, %9 ], [ -1, %14 ], [ -1, %19 ], [ -1, %49 ], [ -1, %64 ]
  ret i32 %69
}

declare dso_local i32 @tolower(i32 noundef) local_unnamed_addr #2

declare dso_local i32 @isspace(i32 noundef) local_unnamed_addr #2

declare dso_local i32 @isdigit(i32 noundef) local_unnamed_addr #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #5

attributes #0 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { noinline nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #5 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nounwind }
attributes #7 = { nobuiltin nounwind "no-builtins" }
attributes #8 = { nobuiltin "no-builtins" }

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
!10 = !{!11, !7, i64 2404}
!11 = !{!"regex_info", !8, i64 0, !7, i64 1600, !8, i64 1604, !7, i64 2404, !12, i64 2408, !7, i64 2412, !7, i64 2416}
!12 = !{!"p1 _ZTS8slre_cap", !13, i64 0}
!13 = !{!"any pointer", !8, i64 0}
!14 = !{!11, !7, i64 2416}
!15 = !{!11, !7, i64 2412}
!16 = !{!11, !12, i64 2408}
!17 = !{!18, !19, i64 0}
!18 = !{!"bracket_pair", !19, i64 0, !7, i64 4, !7, i64 8, !7, i64 12}
!19 = !{!"p1 omnipotent char", !13, i64 0}
!20 = !{!18, !7, i64 4}
!21 = !{!11, !7, i64 1600}
!22 = !{!8, !8, i64 0}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
!25 = !{!26, !7, i64 0}
!26 = !{!"branch", !7, i64 0, !19, i64 4}
!27 = !{!26, !19, i64 4}
!28 = distinct !{!28, !24}
!29 = distinct !{!29, !24}
!30 = distinct !{!30, !24}
!31 = !{!18, !7, i64 12}
!32 = !{!18, !7, i64 8}
!33 = distinct !{!33, !24}
!34 = distinct !{!34, !24}
!35 = distinct !{!35, !24, !36}
!36 = !{!"llvm.loop.peeled.count", i32 1}
!37 = distinct !{!37, !24}
!38 = !{!19, !19, i64 0}
!39 = distinct !{!39, !24}
!40 = distinct !{!40, !24}
!41 = distinct !{!41, !24}
!42 = distinct !{!42, !24, !36}
!43 = distinct !{!43, !24, !36}
!44 = distinct !{!44, !24}
!45 = !{!46, !19, i64 0}
!46 = !{!"slre_cap", !19, i64 0, !7, i64 4}
!47 = !{!46, !7, i64 4}
!48 = distinct !{!48, !24}
