; ModuleID = 'D:\project\writing\reserch\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1\resources\corpus\embench\src\qrduino\qrencode.c'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\\resume1\\resources\\corpus\\embench\\src\\qrduino\\qrencode.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

@strinbuf = external dso_local local_unnamed_addr global ptr, align 4
@qrframe = external dso_local local_unnamed_addr global ptr, align 4
@WD = external dso_local local_unnamed_addr global i8, align 1
@WDB = external dso_local local_unnamed_addr global i8, align 1
@datablkw = external dso_local local_unnamed_addr global i8, align 1
@neccblk1 = external dso_local local_unnamed_addr global i8, align 1
@neccblk2 = external dso_local local_unnamed_addr global i8, align 1
@VERSION = external dso_local local_unnamed_addr global i8, align 1
@eccblkwid = external dso_local local_unnamed_addr global i8, align 1
@g0exp = internal unnamed_addr constant [256 x i8] c"\01\02\04\08\10 @\80\1D:t\E8\CD\87\13&L\98-Z\B4u\EA\C9\8F\03\06\0C\180`\C0\9D'N\9C%J\945j\D4\B5w\EE\C1\9F#F\8C\05\0A\14(P\A0]\BAi\D2\B9o\DE\A1_\BEa\C2\99/^\BCe\CA\89\0F\1E<x\F0\FD\E7\D3\BBk\D6\B1\7F\FE\E1\DF\A3[\B6q\E2\D9\AFC\86\11\22D\88\0D\1A4h\D0\BDg\CE\81\1F>|\F8\ED\C7\93;v\EC\C5\973f\CC\85\17.\\\B8m\DA\A9O\9E!B\84\15*T\A8M\9A)R\A4U\AAI\929r\E4\D5\B7s\E6\D1\BFc\C6\91?~\FC\E5\D7\B3{\F6\F1\FF\E3\DB\ABK\961b\C4\957n\DC\A5W\AEA\82\192d\C8\8D\07\0E\1C8p\E0\DD\A7S\A6Q\A2Y\B2y\F2\F9\EF\C3\9B+V\ACE\8A\09\12$H\90=z\F4\F5\F7\F3\FB\EB\CB\8B\0B\16,X\B0}\FA\E9\CF\83\1B6l\D8\ADG\8E\00", align 1
@g0log = internal unnamed_addr constant [256 x i8] c"\FF\00\01\19\022\1A\C6\03\DF3\EE\1Bh\C7K\04d\E0\0E4\8D\EF\81\1C\C1i\F8\C8\08Lq\05\8Ae/\E1$\0F!5\93\8E\DA\F0\12\82E\1D\B5\C2}j'\F9\B9\C9\9A\09xM\E4r\A6\06\BF\8Bbf\DD0\FD\E2\98%\B3\10\91\22\886\D0\94\CE\8F\96\DB\BD\F1\D2\13\\\838F@\1EB\B6\A3\C3H~nk:(T\FA\85\BA=\CA^\9B\9F\0A\15y+N\D4\E5\ACs\F3\A7W\07p\C0\F7\8C\80c\0DgJ\DE\ED1\C5\FE\18\E3\A5\99w&\B8\B4|\11D\92\D9# \89.7?\D1[\95\BC\CF\CD\90\87\97\B2\DC\FC\BEa\F2V\D3\AB\14*]\9E\84<9SGmA\A2\1F-C\D8\B7{\A4v\C4\17I\EC\7F\0Co\F6l\A1;R)\9DU\AA\FB`\86\B1\BB\CC>Z\CBY_\B0\9C\A9\A0Q\0B\F5\16\EBzu,\D7O\AE\D5\E9\E6\E7\AD\E8t\D6\F4\EA\A8PX\AF", align 1
@framebase = external dso_local local_unnamed_addr global ptr, align 4
@framask = external dso_local local_unnamed_addr global ptr, align 4
@rlens = external dso_local local_unnamed_addr global ptr, align 4
@ECCLEVEL = external dso_local local_unnamed_addr global i8, align 1
@fmtword = internal unnamed_addr constant [32 x i32] [i32 30660, i32 29427, i32 32170, i32 30877, i32 26159, i32 25368, i32 27713, i32 26998, i32 21522, i32 20773, i32 24188, i32 23371, i32 17913, i32 16590, i32 20375, i32 19104, i32 13663, i32 12392, i32 16177, i32 14854, i32 9396, i32 8579, i32 11994, i32 11245, i32 5769, i32 5054, i32 7399, i32 6608, i32 1890, i32 597, i32 3340, i32 2107], align 4

; Function Attrs: nounwind
define dso_local void @qrencode() local_unnamed_addr #0 {
  %1 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %2 = tail call i32 @strlen(ptr noundef %1) #6
  %3 = load i8, ptr @datablkw, align 1, !tbaa !13
  %4 = zext i8 %3 to i32
  %5 = load i8, ptr @neccblk1, align 1, !tbaa !13
  %6 = zext i8 %5 to i32
  %7 = load i8, ptr @neccblk2, align 1, !tbaa !13
  %8 = zext i8 %7 to i32
  %9 = add nuw nsw i32 %8, %6
  %10 = mul nuw nsw i32 %9, %4
  %11 = add nuw nsw i32 %10, %8
  %12 = add nsw i32 %11, -2
  %13 = icmp ult i32 %2, %12
  %14 = load i8, ptr @VERSION, align 1
  %15 = icmp ugt i8 %14, 9
  %16 = add nsw i32 %11, -3
  %17 = select i1 %15, i32 %16, i32 %12
  %18 = select i1 %13, i32 %2, i32 %17
  %19 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %20 = getelementptr i8, ptr %19, i32 %18
  %21 = icmp eq i32 %18, 0
  br i1 %15, label %22, label %53

22:                                               ; preds = %0
  %23 = getelementptr i8, ptr %20, i32 2
  store i8 0, ptr %23, align 1, !tbaa !13
  br i1 %21, label %42, label %24

24:                                               ; preds = %22, %24
  %25 = phi i32 [ %26, %24 ], [ %18, %22 ]
  %26 = add i32 %25, -1
  %27 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %28 = getelementptr inbounds nuw i8, ptr %27, i32 %26
  %29 = load i8, ptr %28, align 1, !tbaa !13
  %30 = shl i8 %29, 4
  %31 = getelementptr i8, ptr %27, i32 %25
  %32 = getelementptr i8, ptr %31, i32 2
  %33 = load i8, ptr %32, align 1, !tbaa !13
  %34 = or i8 %30, %33
  store i8 %34, ptr %32, align 1, !tbaa !13
  %35 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %36 = getelementptr inbounds nuw i8, ptr %35, i32 %26
  %37 = load i8, ptr %36, align 1, !tbaa !13
  %38 = lshr i8 %37, 4
  %39 = getelementptr i8, ptr %35, i32 %25
  %40 = getelementptr i8, ptr %39, i32 1
  store i8 %38, ptr %40, align 1, !tbaa !13
  %41 = icmp eq i32 %26, 0
  br i1 %41, label %42, label %24, !llvm.loop !14

42:                                               ; preds = %24, %22
  %43 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %44 = getelementptr inbounds nuw i8, ptr %43, i32 2
  %45 = load i8, ptr %44, align 1, !tbaa !13
  %46 = trunc i32 %18 to i8
  %47 = shl i8 %46, 4
  %48 = or i8 %45, %47
  store i8 %48, ptr %44, align 1, !tbaa !13
  %49 = lshr i32 %18, 4
  %50 = trunc i32 %49 to i8
  %51 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %52 = getelementptr inbounds nuw i8, ptr %51, i32 1
  store i8 %50, ptr %52, align 1, !tbaa !13
  br label %79

53:                                               ; preds = %0
  %54 = getelementptr i8, ptr %20, i32 1
  store i8 0, ptr %54, align 1, !tbaa !13
  br i1 %21, label %72, label %55

55:                                               ; preds = %53, %55
  %56 = phi i32 [ %57, %55 ], [ %18, %53 ]
  %57 = add i32 %56, -1
  %58 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %59 = getelementptr inbounds nuw i8, ptr %58, i32 %57
  %60 = load i8, ptr %59, align 1, !tbaa !13
  %61 = shl i8 %60, 4
  %62 = getelementptr i8, ptr %58, i32 %56
  %63 = getelementptr i8, ptr %62, i32 1
  %64 = load i8, ptr %63, align 1, !tbaa !13
  %65 = or i8 %61, %64
  store i8 %65, ptr %63, align 1, !tbaa !13
  %66 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %67 = getelementptr inbounds nuw i8, ptr %66, i32 %57
  %68 = load i8, ptr %67, align 1, !tbaa !13
  %69 = lshr i8 %68, 4
  %70 = getelementptr inbounds nuw i8, ptr %66, i32 %56
  store i8 %69, ptr %70, align 1, !tbaa !13
  %71 = icmp eq i32 %57, 0
  br i1 %71, label %72, label %55, !llvm.loop !16

72:                                               ; preds = %55, %53
  %73 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %74 = getelementptr inbounds nuw i8, ptr %73, i32 1
  %75 = load i8, ptr %74, align 1, !tbaa !13
  %76 = trunc i32 %18 to i8
  %77 = shl i8 %76, 4
  %78 = or i8 %75, %77
  store i8 %78, ptr %74, align 1, !tbaa !13
  br label %79

79:                                               ; preds = %72, %42
  %80 = phi i32 [ 4, %72 ], [ 12, %42 ]
  %81 = lshr i32 %18, %80
  %82 = trunc i32 %81 to i8
  %83 = or i8 %82, 64
  %84 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  store i8 %83, ptr %84, align 1, !tbaa !13
  %85 = add i32 %18, 3
  %86 = load i8, ptr @VERSION, align 1, !tbaa !13
  %87 = icmp ult i8 %86, 10
  %88 = sext i1 %87 to i32
  %89 = add i32 %85, %88
  %90 = icmp ult i32 %89, %11
  br i1 %90, label %91, label %100

91:                                               ; preds = %79, %91
  %92 = phi i32 [ %96, %91 ], [ %89, %79 ]
  %93 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %94 = getelementptr inbounds nuw i8, ptr %93, i32 %92
  store i8 -20, ptr %94, align 1, !tbaa !13
  %95 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %96 = add nuw nsw i32 %92, 2
  %97 = getelementptr inbounds nuw i8, ptr %95, i32 %92
  %98 = getelementptr inbounds nuw i8, ptr %97, i32 1
  store i8 17, ptr %98, align 1, !tbaa !13
  %99 = icmp samesign ult i32 %96, %11
  br i1 %99, label %91, label %100, !llvm.loop !17

100:                                              ; preds = %91, %79
  %101 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %102 = getelementptr inbounds nuw i8, ptr %101, i32 %11
  %103 = load i8, ptr @eccblkwid, align 1, !tbaa !13
  %104 = load ptr, ptr @qrframe, align 4, !tbaa !10
  store i8 1, ptr %104, align 1, !tbaa !13
  %105 = icmp eq i8 %103, 0
  br i1 %105, label %108, label %106

106:                                              ; preds = %100
  %107 = zext i8 %103 to i32
  br label %142

108:                                              ; preds = %178, %100
  %109 = add i8 %103, 1
  %110 = tail call i8 @llvm.umax.i8(i8 %109, i8 1)
  %111 = zext i8 %110 to i32
  %112 = icmp ult i8 %109, 4
  br i1 %112, label %140, label %113

113:                                              ; preds = %108
  %114 = and i32 %111, 252
  br label %115

115:                                              ; preds = %115, %113
  %116 = phi i32 [ 0, %113 ], [ %136, %115 ]
  %117 = getelementptr inbounds nuw i8, ptr %104, i32 %116
  %118 = load <4 x i8>, ptr %117, align 1, !tbaa !13
  %119 = zext <4 x i8> %118 to <4 x i32>
  %120 = extractelement <4 x i32> %119, i64 0
  %121 = extractelement <4 x i32> %119, i64 1
  %122 = extractelement <4 x i32> %119, i64 2
  %123 = extractelement <4 x i32> %119, i64 3
  %124 = getelementptr inbounds nuw i8, ptr @g0log, i32 %120
  %125 = getelementptr inbounds nuw i8, ptr @g0log, i32 %121
  %126 = getelementptr inbounds nuw i8, ptr @g0log, i32 %122
  %127 = getelementptr inbounds nuw i8, ptr @g0log, i32 %123
  %128 = load i8, ptr %124, align 1, !tbaa !13
  %129 = load i8, ptr %125, align 1, !tbaa !13
  %130 = load i8, ptr %126, align 1, !tbaa !13
  %131 = load i8, ptr %127, align 1, !tbaa !13
  %132 = insertelement <4 x i8> poison, i8 %128, i64 0
  %133 = insertelement <4 x i8> %132, i8 %129, i64 1
  %134 = insertelement <4 x i8> %133, i8 %130, i64 2
  %135 = insertelement <4 x i8> %134, i8 %131, i64 3
  store <4 x i8> %135, ptr %117, align 1, !tbaa !13
  %136 = add nuw i32 %116, 4
  %137 = icmp eq i32 %136, %114
  br i1 %137, label %138, label %115, !llvm.loop !18

138:                                              ; preds = %115
  %139 = icmp eq i32 %114, %111
  br i1 %139, label %200, label %140

140:                                              ; preds = %108, %138
  %141 = phi i32 [ 0, %108 ], [ %114, %138 ]
  br label %191

142:                                              ; preds = %178, %106
  %143 = phi i32 [ 0, %106 ], [ %189, %178 ]
  %144 = phi i8 [ 1, %106 ], [ %188, %178 ]
  %145 = getelementptr inbounds nuw i8, ptr %104, i32 %143
  %146 = getelementptr inbounds nuw i8, ptr %145, i32 1
  store i8 1, ptr %146, align 1, !tbaa !13
  %147 = icmp eq i32 %143, 0
  br i1 %147, label %178, label %148

148:                                              ; preds = %142
  %149 = trunc nuw i32 %143 to i8
  br label %150

150:                                              ; preds = %173, %148
  %151 = phi i32 [ %143, %148 ], [ %177, %173 ]
  %152 = phi i8 [ %149, %148 ], [ %175, %173 ]
  %153 = getelementptr inbounds nuw i8, ptr %104, i32 %151
  %154 = load i8, ptr %153, align 1, !tbaa !13
  %155 = icmp eq i8 %154, 0
  br i1 %155, label %170, label %156

156:                                              ; preds = %150
  %157 = zext i8 %154 to i32
  %158 = getelementptr i8, ptr %153, i32 -1
  %159 = load i8, ptr %158, align 1, !tbaa !13
  %160 = getelementptr inbounds nuw i8, ptr @g0log, i32 %157
  %161 = load i8, ptr %160, align 1, !tbaa !13
  %162 = zext i8 %161 to i32
  %163 = add nuw nsw i32 %143, %162
  %164 = add nsw i32 %163, -255
  %165 = icmp samesign ult i32 %163, 255
  %166 = select i1 %165, i32 %163, i32 %164
  %167 = getelementptr inbounds nuw i8, ptr @g0exp, i32 %166
  %168 = load i8, ptr %167, align 1, !tbaa !13
  %169 = xor i8 %168, %159
  br label %173

170:                                              ; preds = %150
  %171 = getelementptr i8, ptr %153, i32 -1
  %172 = load i8, ptr %171, align 1, !tbaa !13
  br label %173

173:                                              ; preds = %170, %156
  %174 = phi i8 [ %169, %156 ], [ %172, %170 ]
  store i8 %174, ptr %153, align 1, !tbaa !13
  %175 = add i8 %152, -1
  %176 = icmp eq i8 %175, 0
  %177 = add nsw i32 %151, -1
  br i1 %176, label %178, label %150, !llvm.loop !21

178:                                              ; preds = %173, %142
  %179 = zext i8 %144 to i32
  %180 = getelementptr inbounds nuw i8, ptr @g0log, i32 %179
  %181 = load i8, ptr %180, align 1, !tbaa !13
  %182 = zext i8 %181 to i32
  %183 = add nuw nsw i32 %143, %182
  %184 = add nsw i32 %183, -255
  %185 = icmp samesign ult i32 %183, 255
  %186 = select i1 %185, i32 %183, i32 %184
  %187 = getelementptr inbounds nuw i8, ptr @g0exp, i32 %186
  %188 = load i8, ptr %187, align 1, !tbaa !13
  store i8 %188, ptr %104, align 1, !tbaa !13
  %189 = add nuw nsw i32 %143, 1
  %190 = icmp eq i32 %189, %107
  br i1 %190, label %108, label %142, !llvm.loop !22

191:                                              ; preds = %140, %191
  %192 = phi i32 [ %198, %191 ], [ %141, %140 ]
  %193 = getelementptr inbounds nuw i8, ptr %104, i32 %192
  %194 = load i8, ptr %193, align 1, !tbaa !13
  %195 = zext i8 %194 to i32
  %196 = getelementptr inbounds nuw i8, ptr @g0log, i32 %195
  %197 = load i8, ptr %196, align 1, !tbaa !13
  store i8 %197, ptr %193, align 1, !tbaa !13
  %198 = add nuw nsw i32 %192, 1
  %199 = icmp eq i32 %198, %111
  br i1 %199, label %200, label %191, !llvm.loop !23

200:                                              ; preds = %191, %138
  %201 = load i8, ptr @neccblk1, align 1, !tbaa !13
  %202 = icmp eq i8 %201, 0
  %203 = load i8, ptr @datablkw, align 1, !tbaa !13
  br i1 %202, label %206, label %204

204:                                              ; preds = %200
  %205 = load i8, ptr @eccblkwid, align 1, !tbaa !13
  br label %214

206:                                              ; preds = %214, %200
  %207 = phi i8 [ %203, %200 ], [ %221, %214 ]
  %208 = phi ptr [ %102, %200 ], [ %226, %214 ]
  %209 = phi ptr [ %101, %200 ], [ %223, %214 ]
  %210 = load i8, ptr @neccblk2, align 1, !tbaa !13
  %211 = icmp eq i8 %210, 0
  br i1 %211, label %250, label %212

212:                                              ; preds = %206
  %213 = load i8, ptr @eccblkwid, align 1, !tbaa !13
  br label %231

214:                                              ; preds = %214, %204
  %215 = phi i8 [ %224, %214 ], [ %205, %204 ]
  %216 = phi i8 [ %221, %214 ], [ %203, %204 ]
  %217 = phi ptr [ %223, %214 ], [ %101, %204 ]
  %218 = phi ptr [ %226, %214 ], [ %102, %204 ]
  %219 = phi i32 [ %227, %214 ], [ 0, %204 ]
  %220 = load ptr, ptr @qrframe, align 4, !tbaa !10
  tail call fastcc void @appendrs(ptr noundef %217, i8 noundef zeroext %216, ptr noundef %218, i8 noundef zeroext %215, ptr noundef %220) #7
  %221 = load i8, ptr @datablkw, align 1, !tbaa !13
  %222 = zext i8 %221 to i32
  %223 = getelementptr inbounds nuw i8, ptr %217, i32 %222
  %224 = load i8, ptr @eccblkwid, align 1, !tbaa !13
  %225 = zext i8 %224 to i32
  %226 = getelementptr inbounds nuw i8, ptr %218, i32 %225
  %227 = add nuw nsw i32 %219, 1
  %228 = load i8, ptr @neccblk1, align 1, !tbaa !13
  %229 = zext i8 %228 to i32
  %230 = icmp samesign ult i32 %227, %229
  br i1 %230, label %214, label %206, !llvm.loop !24

231:                                              ; preds = %231, %212
  %232 = phi i8 [ %243, %231 ], [ %213, %212 ]
  %233 = phi i8 [ %239, %231 ], [ %207, %212 ]
  %234 = phi ptr [ %242, %231 ], [ %209, %212 ]
  %235 = phi ptr [ %245, %231 ], [ %208, %212 ]
  %236 = phi i32 [ %246, %231 ], [ 0, %212 ]
  %237 = add i8 %233, 1
  %238 = load ptr, ptr @qrframe, align 4, !tbaa !10
  tail call fastcc void @appendrs(ptr noundef %234, i8 noundef zeroext %237, ptr noundef %235, i8 noundef zeroext %232, ptr noundef %238) #7
  %239 = load i8, ptr @datablkw, align 1, !tbaa !13
  %240 = zext i8 %239 to i32
  %241 = getelementptr inbounds nuw i8, ptr %234, i32 %240
  %242 = getelementptr inbounds nuw i8, ptr %241, i32 1
  %243 = load i8, ptr @eccblkwid, align 1, !tbaa !13
  %244 = zext i8 %243 to i32
  %245 = getelementptr inbounds nuw i8, ptr %235, i32 %244
  %246 = add nuw nsw i32 %236, 1
  %247 = load i8, ptr @neccblk2, align 1, !tbaa !13
  %248 = zext i8 %247 to i32
  %249 = icmp samesign ult i32 %246, %248
  br i1 %249, label %231, label %250, !llvm.loop !25

250:                                              ; preds = %231, %206
  %251 = phi i8 [ 0, %206 ], [ %247, %231 ]
  %252 = phi i8 [ %207, %206 ], [ %239, %231 ]
  %253 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %254 = icmp eq i8 %252, 0
  br i1 %254, label %262, label %255

255:                                              ; preds = %250, %309
  %256 = phi i8 [ %310, %309 ], [ %251, %250 ]
  %257 = phi i8 [ %311, %309 ], [ %251, %250 ]
  %258 = phi ptr [ %312, %309 ], [ %253, %250 ]
  %259 = phi i32 [ %313, %309 ], [ 0, %250 ]
  %260 = load i8, ptr @neccblk1, align 1, !tbaa !13
  %261 = icmp eq i8 %260, 0
  br i1 %261, label %269, label %274

262:                                              ; preds = %309, %250
  %263 = phi i8 [ %251, %250 ], [ %310, %309 ]
  %264 = phi i32 [ 0, %250 ], [ %313, %309 ]
  %265 = phi ptr [ %253, %250 ], [ %312, %309 ]
  %266 = icmp eq i8 %263, 0
  br i1 %266, label %317, label %323

267:                                              ; preds = %274
  %268 = load i8, ptr @neccblk2, align 1, !tbaa !13
  br label %269

269:                                              ; preds = %267, %255
  %270 = phi i8 [ %256, %255 ], [ %268, %267 ]
  %271 = phi i8 [ %257, %255 ], [ %268, %267 ]
  %272 = phi ptr [ %258, %255 ], [ %284, %267 ]
  %273 = icmp eq i8 %271, 0
  br i1 %273, label %309, label %289

274:                                              ; preds = %255, %274
  %275 = phi i32 [ %285, %274 ], [ 0, %255 ]
  %276 = phi ptr [ %284, %274 ], [ %258, %255 ]
  %277 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %278 = load i8, ptr @datablkw, align 1, !tbaa !13
  %279 = zext i8 %278 to i32
  %280 = mul nuw nsw i32 %275, %279
  %281 = getelementptr inbounds nuw i8, ptr %277, i32 %259
  %282 = getelementptr inbounds nuw i8, ptr %281, i32 %280
  %283 = load i8, ptr %282, align 1, !tbaa !13
  %284 = getelementptr inbounds nuw i8, ptr %276, i32 1
  store i8 %283, ptr %276, align 1, !tbaa !13
  %285 = add nuw nsw i32 %275, 1
  %286 = load i8, ptr @neccblk1, align 1, !tbaa !13
  %287 = zext i8 %286 to i32
  %288 = icmp samesign ult i32 %285, %287
  br i1 %288, label %274, label %267, !llvm.loop !26

289:                                              ; preds = %269, %289
  %290 = phi i32 [ %305, %289 ], [ 0, %269 ]
  %291 = phi ptr [ %304, %289 ], [ %272, %269 ]
  %292 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %293 = load i8, ptr @neccblk1, align 1, !tbaa !13
  %294 = zext i8 %293 to i32
  %295 = load i8, ptr @datablkw, align 1, !tbaa !13
  %296 = zext i8 %295 to i32
  %297 = mul nuw nsw i32 %296, %294
  %298 = add nuw nsw i32 %296, 1
  %299 = mul nuw nsw i32 %298, %290
  %300 = getelementptr inbounds nuw i8, ptr %292, i32 %297
  %301 = getelementptr inbounds nuw i8, ptr %300, i32 %259
  %302 = getelementptr inbounds nuw i8, ptr %301, i32 %299
  %303 = load i8, ptr %302, align 1, !tbaa !13
  %304 = getelementptr inbounds nuw i8, ptr %291, i32 1
  store i8 %303, ptr %291, align 1, !tbaa !13
  %305 = add nuw nsw i32 %290, 1
  %306 = load i8, ptr @neccblk2, align 1, !tbaa !13
  %307 = zext i8 %306 to i32
  %308 = icmp samesign ult i32 %305, %307
  br i1 %308, label %289, label %309, !llvm.loop !27

309:                                              ; preds = %289, %269
  %310 = phi i8 [ %270, %269 ], [ %306, %289 ]
  %311 = phi i8 [ 0, %269 ], [ %306, %289 ]
  %312 = phi ptr [ %272, %269 ], [ %304, %289 ]
  %313 = add nuw nsw i32 %259, 1
  %314 = load i8, ptr @datablkw, align 1, !tbaa !13
  %315 = zext i8 %314 to i32
  %316 = icmp samesign ult i32 %313, %315
  br i1 %316, label %255, label %262, !llvm.loop !28

317:                                              ; preds = %323, %262
  %318 = phi i8 [ 0, %262 ], [ %340, %323 ]
  %319 = phi ptr [ %265, %262 ], [ %338, %323 ]
  %320 = load i8, ptr @eccblkwid, align 1, !tbaa !13
  %321 = icmp eq i8 %320, 0
  %322 = load i8, ptr @neccblk1, align 1, !tbaa !13
  br i1 %321, label %380, label %343

323:                                              ; preds = %262, %323
  %324 = phi i32 [ %339, %323 ], [ 0, %262 ]
  %325 = phi ptr [ %338, %323 ], [ %265, %262 ]
  %326 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %327 = load i8, ptr @neccblk1, align 1, !tbaa !13
  %328 = zext i8 %327 to i32
  %329 = load i8, ptr @datablkw, align 1, !tbaa !13
  %330 = zext i8 %329 to i32
  %331 = mul nuw nsw i32 %330, %328
  %332 = add nuw nsw i32 %330, 1
  %333 = mul nuw nsw i32 %332, %324
  %334 = getelementptr i8, ptr %326, i32 %331
  %335 = getelementptr i8, ptr %334, i32 %264
  %336 = getelementptr i8, ptr %335, i32 %333
  %337 = load i8, ptr %336, align 1, !tbaa !13
  %338 = getelementptr inbounds nuw i8, ptr %325, i32 1
  store i8 %337, ptr %325, align 1, !tbaa !13
  %339 = add nuw nsw i32 %324, 1
  %340 = load i8, ptr @neccblk2, align 1, !tbaa !13
  %341 = zext i8 %340 to i32
  %342 = icmp samesign ult i32 %339, %341
  br i1 %342, label %323, label %317, !llvm.loop !29

343:                                              ; preds = %317, %372
  %344 = phi i8 [ %373, %372 ], [ %320, %317 ]
  %345 = phi i8 [ %374, %372 ], [ %318, %317 ]
  %346 = phi i8 [ %375, %372 ], [ %322, %317 ]
  %347 = phi ptr [ %376, %372 ], [ %319, %317 ]
  %348 = phi i32 [ %377, %372 ], [ 0, %317 ]
  %349 = or i8 %346, %345
  %350 = icmp eq i8 %349, 0
  br i1 %350, label %372, label %351

351:                                              ; preds = %343, %351
  %352 = phi i32 [ %363, %351 ], [ 0, %343 ]
  %353 = phi ptr [ %362, %351 ], [ %347, %343 ]
  %354 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %355 = load i8, ptr @eccblkwid, align 1, !tbaa !13
  %356 = zext i8 %355 to i32
  %357 = mul nuw nsw i32 %352, %356
  %358 = getelementptr inbounds nuw i8, ptr %354, i32 %11
  %359 = getelementptr inbounds nuw i8, ptr %358, i32 %348
  %360 = getelementptr inbounds nuw i8, ptr %359, i32 %357
  %361 = load i8, ptr %360, align 1, !tbaa !13
  %362 = getelementptr inbounds nuw i8, ptr %353, i32 1
  store i8 %361, ptr %353, align 1, !tbaa !13
  %363 = add nuw nsw i32 %352, 1
  %364 = load i8, ptr @neccblk1, align 1, !tbaa !13
  %365 = zext i8 %364 to i32
  %366 = load i8, ptr @neccblk2, align 1, !tbaa !13
  %367 = zext i8 %366 to i32
  %368 = add nuw nsw i32 %367, %365
  %369 = icmp samesign ult i32 %363, %368
  br i1 %369, label %351, label %370, !llvm.loop !30

370:                                              ; preds = %351
  %371 = load i8, ptr @eccblkwid, align 1, !tbaa !13
  br label %372

372:                                              ; preds = %370, %343
  %373 = phi i8 [ %344, %343 ], [ %371, %370 ]
  %374 = phi i8 [ %345, %343 ], [ %366, %370 ]
  %375 = phi i8 [ %346, %343 ], [ %364, %370 ]
  %376 = phi ptr [ %347, %343 ], [ %362, %370 ]
  %377 = add nuw nsw i32 %348, 1
  %378 = zext i8 %373 to i32
  %379 = icmp samesign ult i32 %377, %378
  br i1 %379, label %343, label %380, !llvm.loop !31

380:                                              ; preds = %372, %317
  %381 = phi i8 [ %318, %317 ], [ %374, %372 ]
  %382 = phi i8 [ %322, %317 ], [ %375, %372 ]
  %383 = phi i32 [ 0, %317 ], [ %378, %372 ]
  %384 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %385 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %386 = zext i8 %382 to i32
  %387 = zext i8 %381 to i32
  %388 = add nuw nsw i32 %386, %387
  %389 = mul nuw nsw i32 %388, %383
  %390 = add nuw nsw i32 %389, %11
  %391 = tail call ptr @memcpy(ptr noundef %384, ptr noundef %385, i32 noundef %390) #6
  %392 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %393 = load ptr, ptr @framebase, align 4, !tbaa !10
  %394 = load i8, ptr @WDB, align 1, !tbaa !13
  %395 = zext i8 %394 to i32
  %396 = load i8, ptr @WD, align 1, !tbaa !13
  %397 = zext i8 %396 to i32
  %398 = mul nuw nsw i32 %397, %395
  %399 = tail call ptr @memcpy(ptr noundef %392, ptr noundef %393, i32 noundef %398) #6
  %400 = load i8, ptr @datablkw, align 1, !tbaa !13
  %401 = zext i8 %400 to i32
  %402 = load i8, ptr @eccblkwid, align 1, !tbaa !13
  %403 = zext i8 %402 to i32
  %404 = add nuw nsw i32 %403, %401
  %405 = load i8, ptr @neccblk1, align 1, !tbaa !13
  %406 = zext i8 %405 to i32
  %407 = load i8, ptr @neccblk2, align 1, !tbaa !13
  %408 = zext i8 %407 to i32
  %409 = add nuw nsw i32 %408, %406
  %410 = mul nuw nsw i32 %409, %404
  %411 = or i32 %410, %408
  %412 = icmp eq i32 %411, 0
  %413 = load i8, ptr @WD, align 1, !tbaa !13
  br i1 %412, label %414, label %416

414:                                              ; preds = %380
  %415 = zext i8 %413 to i32
  br label %530

416:                                              ; preds = %380
  %417 = add i8 %413, -1
  br label %418

418:                                              ; preds = %515, %416
  %419 = phi i8 [ %453, %515 ], [ %413, %416 ]
  %420 = phi i8 [ %493, %515 ], [ 1, %416 ]
  %421 = phi i8 [ %492, %515 ], [ 1, %416 ]
  %422 = phi i8 [ %491, %515 ], [ %417, %416 ]
  %423 = phi i8 [ %490, %515 ], [ %417, %416 ]
  %424 = phi i32 [ %516, %515 ], [ 0, %416 ]
  %425 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %426 = getelementptr inbounds nuw i8, ptr %425, i32 %424
  %427 = load i8, ptr %426, align 1, !tbaa !13
  br label %428

428:                                              ; preds = %511, %418
  %429 = phi i8 [ %419, %418 ], [ %453, %511 ]
  %430 = phi i8 [ %420, %418 ], [ %493, %511 ]
  %431 = phi i8 [ %421, %418 ], [ %492, %511 ]
  %432 = phi i8 [ %422, %418 ], [ %491, %511 ]
  %433 = phi i8 [ %423, %418 ], [ %490, %511 ]
  %434 = phi i8 [ 0, %418 ], [ %512, %511 ]
  %435 = phi i8 [ %427, %418 ], [ %513, %511 ]
  %436 = icmp sgt i8 %435, -1
  br i1 %436, label %452, label %437

437:                                              ; preds = %428
  %438 = and i8 %433, 7
  %439 = lshr exact i8 -128, %438
  %440 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %441 = lshr i8 %433, 3
  %442 = zext nneg i8 %441 to i32
  %443 = zext i8 %432 to i32
  %444 = load i8, ptr @WDB, align 1, !tbaa !13
  %445 = zext i8 %444 to i32
  %446 = mul nuw nsw i32 %445, %443
  %447 = getelementptr inbounds nuw i8, ptr %440, i32 %442
  %448 = getelementptr inbounds nuw i8, ptr %447, i32 %446
  %449 = load i8, ptr %448, align 1, !tbaa !13
  %450 = or i8 %449, %439
  store i8 %450, ptr %448, align 1, !tbaa !13
  %451 = load i8, ptr @WD, align 1
  br label %452

452:                                              ; preds = %437, %428
  %453 = phi i8 [ %451, %437 ], [ %429, %428 ]
  %454 = load ptr, ptr @framask, align 4, !tbaa !10
  %455 = zext i8 %453 to i32
  %456 = add nsw i32 %455, -1
  br label %457

457:                                              ; preds = %489, %452
  %458 = phi i8 [ %433, %452 ], [ %490, %489 ]
  %459 = phi i8 [ %432, %452 ], [ %491, %489 ]
  %460 = phi i8 [ %431, %452 ], [ %492, %489 ]
  %461 = phi i8 [ %430, %452 ], [ %493, %489 ]
  %462 = icmp eq i8 %461, 0
  br i1 %462, label %465, label %463

463:                                              ; preds = %457
  %464 = add i8 %458, -1
  br label %489

465:                                              ; preds = %457
  %466 = add i8 %458, 1
  %467 = icmp eq i8 %460, 0
  br i1 %467, label %478, label %468

468:                                              ; preds = %465
  %469 = icmp eq i8 %459, 0
  br i1 %469, label %472, label %470

470:                                              ; preds = %468
  %471 = add i8 %459, -1
  br label %489

472:                                              ; preds = %468
  %473 = add i8 %458, -1
  %474 = icmp eq i8 %473, 6
  %475 = add i8 %458, -2
  %476 = select i1 %474, i8 %475, i8 %473
  %477 = select i1 %474, i8 9, i8 0
  br label %489

478:                                              ; preds = %465
  %479 = zext i8 %459 to i32
  %480 = icmp eq i32 %456, %479
  br i1 %480, label %483, label %481

481:                                              ; preds = %478
  %482 = add i8 %459, 1
  br label %489

483:                                              ; preds = %478
  %484 = add i8 %458, -1
  %485 = icmp eq i8 %484, 6
  %486 = add i8 %459, -8
  %487 = select i1 %485, i8 5, i8 %484
  %488 = select i1 %485, i8 %486, i8 %459
  br label %489

489:                                              ; preds = %483, %481, %472, %470, %463
  %490 = phi i8 [ %464, %463 ], [ %466, %470 ], [ %487, %483 ], [ %476, %472 ], [ %466, %481 ]
  %491 = phi i8 [ %459, %463 ], [ %471, %470 ], [ %488, %483 ], [ %477, %472 ], [ %482, %481 ]
  %492 = phi i8 [ %460, %463 ], [ 1, %470 ], [ 1, %483 ], [ 0, %472 ], [ 0, %481 ]
  %493 = zext i1 %462 to i8
  %494 = tail call i8 @llvm.umin.i8(i8 %490, i8 %491)
  %495 = tail call i8 @llvm.umax.i8(i8 %490, i8 %491)
  %496 = zext i8 %495 to i32
  %497 = add nuw nsw i32 %496, 1
  %498 = mul nuw nsw i32 %497, %496
  %499 = lshr i32 %498, 1
  %500 = zext i8 %494 to i32
  %501 = add nuw nsw i32 %499, %500
  %502 = lshr i32 %501, 3
  %503 = getelementptr inbounds nuw i8, ptr %454, i32 %502
  %504 = load i8, ptr %503, align 1, !tbaa !13
  %505 = zext i8 %504 to i32
  %506 = and i32 %501, 7
  %507 = xor i32 %506, 7
  %508 = shl nuw nsw i32 1, %507
  %509 = and i32 %508, %505
  %510 = icmp eq i32 %509, 0
  br i1 %510, label %511, label %457, !llvm.loop !32

511:                                              ; preds = %489
  %512 = add nuw nsw i8 %434, 1
  %513 = shl i8 %435, 1
  %514 = icmp samesign ult i8 %434, 7
  br i1 %514, label %428, label %515, !llvm.loop !33

515:                                              ; preds = %511
  %516 = add nuw nsw i32 %424, 1
  %517 = load i8, ptr @datablkw, align 1, !tbaa !13
  %518 = zext i8 %517 to i32
  %519 = load i8, ptr @eccblkwid, align 1, !tbaa !13
  %520 = zext i8 %519 to i32
  %521 = add nuw nsw i32 %520, %518
  %522 = load i8, ptr @neccblk1, align 1, !tbaa !13
  %523 = zext i8 %522 to i32
  %524 = load i8, ptr @neccblk2, align 1, !tbaa !13
  %525 = zext i8 %524 to i32
  %526 = add nuw nsw i32 %525, %523
  %527 = mul nuw nsw i32 %526, %521
  %528 = add nuw nsw i32 %527, %525
  %529 = icmp samesign ult i32 %516, %528
  br i1 %529, label %418, label %530, !llvm.loop !34

530:                                              ; preds = %515, %414
  %531 = phi i32 [ %415, %414 ], [ %455, %515 ]
  %532 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %533 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %534 = load i8, ptr @WDB, align 1, !tbaa !13
  %535 = zext i8 %534 to i32
  %536 = mul nuw nsw i32 %531, %535
  %537 = tail call ptr @memcpy(ptr noundef %532, ptr noundef %533, i32 noundef %536) #6
  br label %538

538:                                              ; preds = %530, %748
  %539 = phi i32 [ 30000, %530 ], [ %749, %748 ]
  %540 = phi i8 [ 0, %530 ], [ %756, %748 ]
  %541 = phi i8 [ 0, %530 ], [ %746, %748 ]
  tail call fastcc void @applymask(i8 noundef zeroext %540) #7
  %542 = load i8, ptr @WD, align 1, !tbaa !13
  %543 = zext i8 %542 to i32
  %544 = add nsw i32 %543, -1
  %545 = icmp ugt i8 %542, 1
  br i1 %545, label %546, label %557

546:                                              ; preds = %538
  %547 = load ptr, ptr @qrframe, align 4
  %548 = load i8, ptr @WDB, align 1
  %549 = zext i8 %548 to i32
  %550 = and i32 %544, 255
  br label %551

551:                                              ; preds = %620, %546
  %552 = phi i32 [ 0, %546 ], [ %555, %620 ]
  %553 = phi i32 [ 0, %546 ], [ %618, %620 ]
  %554 = mul nuw nsw i32 %552, %549
  %555 = add nuw nsw i32 %552, 1
  %556 = mul nuw nsw i32 %555, %549
  br label %560

557:                                              ; preds = %620, %538
  %558 = phi i32 [ 0, %538 ], [ %618, %620 ]
  %559 = icmp eq i8 %542, 0
  br i1 %559, label %742, label %622

560:                                              ; preds = %617, %551
  %561 = phi i32 [ %567, %617 ], [ 0, %551 ]
  %562 = phi i32 [ %618, %617 ], [ %553, %551 ]
  %563 = lshr i32 %561, 3
  %564 = getelementptr inbounds nuw i8, ptr %547, i32 %563
  %565 = getelementptr inbounds nuw i8, ptr %564, i32 %554
  %566 = load i8, ptr %565, align 1, !tbaa !13
  %567 = add nuw nsw i32 %561, 1
  %568 = lshr i32 %567, 3
  %569 = getelementptr inbounds nuw i8, ptr %547, i32 %568
  %570 = getelementptr inbounds nuw i8, ptr %569, i32 %554
  %571 = load i8, ptr %570, align 1, !tbaa !13
  %572 = insertelement <2 x i8> poison, i8 %571, i64 0
  %573 = insertelement <2 x i8> %572, i8 %566, i64 1
  %574 = zext <2 x i8> %573 to <2 x i32>
  %575 = insertelement <2 x i32> poison, i32 %567, i64 0
  %576 = insertelement <2 x i32> %575, i32 %561, i64 1
  %577 = and <2 x i32> %576, splat (i32 7)
  %578 = xor <2 x i32> %577, splat (i32 7)
  %579 = shl nuw nsw <2 x i32> splat (i32 1), %578
  %580 = and <2 x i32> %579, %574
  %581 = icmp eq <2 x i32> %580, zeroinitializer
  %582 = extractelement <2 x i1> %581, i64 1
  br i1 %582, label %599, label %583

583:                                              ; preds = %560
  %584 = extractelement <2 x i1> %581, i64 0
  br i1 %584, label %617, label %585

585:                                              ; preds = %583
  %586 = getelementptr inbounds nuw i8, ptr %564, i32 %556
  %587 = load i8, ptr %586, align 1, !tbaa !13
  %588 = zext i8 %587 to i32
  %589 = extractelement <2 x i32> %579, i64 1
  %590 = and i32 %589, %588
  %591 = icmp eq i32 %590, 0
  br i1 %591, label %617, label %592

592:                                              ; preds = %585
  %593 = getelementptr inbounds nuw i8, ptr %569, i32 %556
  %594 = load i8, ptr %593, align 1, !tbaa !13
  %595 = zext i8 %594 to i32
  %596 = extractelement <2 x i32> %579, i64 0
  %597 = and i32 %596, %595
  %598 = icmp eq i32 %597, 0
  br i1 %598, label %617, label %615

599:                                              ; preds = %560
  %600 = extractelement <2 x i1> %581, i64 0
  br i1 %600, label %601, label %617

601:                                              ; preds = %599
  %602 = getelementptr inbounds nuw i8, ptr %564, i32 %556
  %603 = load i8, ptr %602, align 1, !tbaa !13
  %604 = zext i8 %603 to i32
  %605 = extractelement <2 x i32> %579, i64 1
  %606 = and i32 %605, %604
  %607 = icmp eq i32 %606, 0
  br i1 %607, label %608, label %617

608:                                              ; preds = %601
  %609 = getelementptr inbounds nuw i8, ptr %569, i32 %556
  %610 = load i8, ptr %609, align 1, !tbaa !13
  %611 = zext i8 %610 to i32
  %612 = extractelement <2 x i32> %579, i64 0
  %613 = and i32 %612, %611
  %614 = icmp eq i32 %613, 0
  br i1 %614, label %615, label %617

615:                                              ; preds = %608, %592
  %616 = add i32 %562, 3
  br label %617

617:                                              ; preds = %615, %608, %601, %599, %592, %585, %583
  %618 = phi i32 [ %616, %615 ], [ %562, %608 ], [ %562, %599 ], [ %562, %601 ], [ %562, %592 ], [ %562, %585 ], [ %562, %583 ]
  %619 = icmp eq i32 %567, %550
  br i1 %619, label %620, label %560, !llvm.loop !35

620:                                              ; preds = %617
  %621 = icmp eq i32 %555, %544
  br i1 %621, label %557, label %551, !llvm.loop !36

622:                                              ; preds = %557, %666
  %623 = phi i32 [ %672, %666 ], [ 0, %557 ]
  %624 = phi i32 [ %669, %666 ], [ 0, %557 ]
  %625 = phi i32 [ %671, %666 ], [ %558, %557 ]
  %626 = load ptr, ptr @rlens, align 4, !tbaa !10
  store i8 0, ptr %626, align 1, !tbaa !13
  %627 = load i8, ptr @WD, align 1, !tbaa !13
  %628 = icmp eq i8 %627, 0
  br i1 %628, label %666, label %629

629:                                              ; preds = %622, %658
  %630 = phi i32 [ %662, %658 ], [ %624, %622 ]
  %631 = phi i8 [ %646, %658 ], [ 0, %622 ]
  %632 = phi i8 [ %659, %658 ], [ 0, %622 ]
  %633 = phi i8 [ %663, %658 ], [ 0, %622 ]
  %634 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %635 = lshr i8 %633, 3
  %636 = zext nneg i8 %635 to i32
  %637 = load i8, ptr @WDB, align 1, !tbaa !13
  %638 = zext i8 %637 to i32
  %639 = mul nuw nsw i32 %623, %638
  %640 = getelementptr inbounds nuw i8, ptr %634, i32 %636
  %641 = getelementptr inbounds nuw i8, ptr %640, i32 %639
  %642 = load i8, ptr %641, align 1, !tbaa !13
  %643 = and i8 %633, 7
  %644 = xor i8 %643, 7
  %645 = lshr i8 %642, %644
  %646 = and i8 %645, 1
  %647 = icmp eq i8 %646, %631
  %648 = load ptr, ptr @rlens, align 4, !tbaa !10
  br i1 %647, label %649, label %654

649:                                              ; preds = %629
  %650 = zext i8 %632 to i32
  %651 = getelementptr inbounds nuw i8, ptr %648, i32 %650
  %652 = load i8, ptr %651, align 1, !tbaa !13
  %653 = add i8 %652, 1
  store i8 %653, ptr %651, align 1, !tbaa !13
  br label %658

654:                                              ; preds = %629
  %655 = add i8 %632, 1
  %656 = zext i8 %655 to i32
  %657 = getelementptr inbounds nuw i8, ptr %648, i32 %656
  store i8 1, ptr %657, align 1, !tbaa !13
  br label %658

658:                                              ; preds = %654, %649
  %659 = phi i8 [ %632, %649 ], [ %655, %654 ]
  %660 = icmp eq i8 %646, 0
  %661 = select i1 %660, i32 -1, i32 1
  %662 = add nsw i32 %661, %630
  %663 = add nuw i8 %633, 1
  %664 = load i8, ptr @WD, align 1, !tbaa !13
  %665 = icmp ult i8 %663, %664
  br i1 %665, label %629, label %666, !llvm.loop !37

666:                                              ; preds = %658, %622
  %667 = phi i8 [ 0, %622 ], [ %664, %658 ]
  %668 = phi i8 [ 0, %622 ], [ %659, %658 ]
  %669 = phi i32 [ %624, %622 ], [ %662, %658 ]
  %670 = tail call fastcc i32 @badruns(i8 noundef zeroext %668) #7
  %671 = add i32 %670, %625
  %672 = add nuw nsw i32 %623, 1
  %673 = zext i8 %667 to i32
  %674 = icmp samesign ult i32 %672, %673
  br i1 %674, label %622, label %675, !llvm.loop !38

675:                                              ; preds = %666
  %676 = tail call i32 @llvm.abs.i32(i32 %669, i1 true)
  %677 = mul i32 %676, 10
  %678 = mul nuw nsw i32 %673, %673
  %679 = icmp ugt i32 %677, %678
  br i1 %679, label %680, label %688

680:                                              ; preds = %675, %680
  %681 = phi i32 [ %684, %680 ], [ 0, %675 ]
  %682 = phi i32 [ %683, %680 ], [ %677, %675 ]
  %683 = sub nuw i32 %682, %678
  %684 = add i32 %681, 1
  %685 = icmp ugt i32 %683, %678
  br i1 %685, label %680, label %686, !llvm.loop !39

686:                                              ; preds = %680
  %687 = mul i32 %684, 10
  br label %688

688:                                              ; preds = %686, %675
  %689 = phi i32 [ 0, %675 ], [ %687, %686 ]
  %690 = add i32 %689, %671
  %691 = icmp eq i8 %667, 0
  br i1 %691, label %742, label %692

692:                                              ; preds = %688, %733
  %693 = phi i32 [ %737, %733 ], [ %690, %688 ]
  %694 = phi i8 [ %738, %733 ], [ 0, %688 ]
  %695 = load ptr, ptr @rlens, align 4, !tbaa !10
  store i8 0, ptr %695, align 1, !tbaa !13
  %696 = load i8, ptr @WD, align 1, !tbaa !13
  %697 = icmp eq i8 %696, 0
  br i1 %697, label %733, label %698

698:                                              ; preds = %692
  %699 = lshr i8 %694, 3
  %700 = zext nneg i8 %699 to i32
  %701 = and i8 %694, 7
  %702 = xor i8 %701, 7
  br label %703

703:                                              ; preds = %727, %698
  %704 = phi i32 [ 0, %698 ], [ %729, %727 ]
  %705 = phi i8 [ 0, %698 ], [ %715, %727 ]
  %706 = phi i8 [ 0, %698 ], [ %728, %727 ]
  %707 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %708 = load i8, ptr @WDB, align 1, !tbaa !13
  %709 = zext i8 %708 to i32
  %710 = mul nuw nsw i32 %704, %709
  %711 = getelementptr inbounds nuw i8, ptr %707, i32 %700
  %712 = getelementptr inbounds nuw i8, ptr %711, i32 %710
  %713 = load i8, ptr %712, align 1, !tbaa !13
  %714 = lshr i8 %713, %702
  %715 = and i8 %714, 1
  %716 = icmp eq i8 %715, %705
  %717 = load ptr, ptr @rlens, align 4, !tbaa !10
  br i1 %716, label %718, label %723

718:                                              ; preds = %703
  %719 = zext i8 %706 to i32
  %720 = getelementptr inbounds nuw i8, ptr %717, i32 %719
  %721 = load i8, ptr %720, align 1, !tbaa !13
  %722 = add i8 %721, 1
  store i8 %722, ptr %720, align 1, !tbaa !13
  br label %727

723:                                              ; preds = %703
  %724 = add i8 %706, 1
  %725 = zext i8 %724 to i32
  %726 = getelementptr inbounds nuw i8, ptr %717, i32 %725
  store i8 1, ptr %726, align 1, !tbaa !13
  br label %727

727:                                              ; preds = %723, %718
  %728 = phi i8 [ %706, %718 ], [ %724, %723 ]
  %729 = add nuw nsw i32 %704, 1
  %730 = load i8, ptr @WD, align 1, !tbaa !13
  %731 = zext i8 %730 to i32
  %732 = icmp samesign ult i32 %729, %731
  br i1 %732, label %703, label %733, !llvm.loop !40

733:                                              ; preds = %727, %692
  %734 = phi i8 [ 0, %692 ], [ %730, %727 ]
  %735 = phi i8 [ 0, %692 ], [ %728, %727 ]
  %736 = tail call fastcc i32 @badruns(i8 noundef zeroext %735) #7
  %737 = add i32 %736, %693
  %738 = add nuw i8 %694, 1
  %739 = icmp ult i8 %738, %734
  br i1 %739, label %692, label %740, !llvm.loop !41

740:                                              ; preds = %733
  %741 = zext i8 %734 to i32
  br label %742

742:                                              ; preds = %740, %557, %688
  %743 = phi i32 [ 0, %688 ], [ 0, %557 ], [ %741, %740 ]
  %744 = phi i32 [ %690, %688 ], [ %558, %557 ], [ %737, %740 ]
  %745 = icmp ult i32 %744, %539
  %746 = select i1 %745, i8 %540, i8 %541
  %747 = icmp eq i8 %746, 7
  br i1 %747, label %758, label %748

748:                                              ; preds = %742
  %749 = tail call i32 @llvm.umin.i32(i32 %744, i32 %539)
  %750 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %751 = load ptr, ptr @strinbuf, align 4, !tbaa !10
  %752 = load i8, ptr @WDB, align 1, !tbaa !13
  %753 = zext i8 %752 to i32
  %754 = mul nuw nsw i32 %743, %753
  %755 = tail call ptr @memcpy(ptr noundef %750, ptr noundef %751, i32 noundef %754) #6
  %756 = add nuw nsw i8 %540, 1
  %757 = icmp samesign ult i8 %540, 7
  br i1 %757, label %538, label %758, !llvm.loop !42

758:                                              ; preds = %742, %748
  %759 = phi i8 [ %540, %742 ], [ 8, %748 ]
  %760 = icmp eq i8 %746, %759
  br i1 %760, label %762, label %761

761:                                              ; preds = %758
  tail call fastcc void @applymask(i8 noundef zeroext %746) #7
  br label %762

762:                                              ; preds = %761, %758
  %763 = load i8, ptr @ECCLEVEL, align 1, !tbaa !13
  %764 = add i8 %763, -1
  %765 = zext nneg i8 %746 to i32
  %766 = zext i8 %764 to i32
  %767 = shl nuw nsw i32 %766, 5
  %768 = getelementptr inbounds nuw i8, ptr @fmtword, i32 %767
  %769 = getelementptr inbounds nuw i32, ptr %768, i32 %765
  %770 = load i32, ptr %769, align 4, !tbaa !6
  br label %771

771:                                              ; preds = %804, %762
  %772 = phi i32 [ 0, %762 ], [ %805, %804 ]
  %773 = phi i32 [ %770, %762 ], [ %806, %804 ]
  %774 = and i32 %773, 1
  %775 = icmp eq i32 %774, 0
  br i1 %775, label %804, label %776

776:                                              ; preds = %771
  %777 = load i8, ptr @WD, align 1, !tbaa !13
  %778 = zext i8 %777 to i32
  %779 = xor i32 %772, -1
  %780 = add nsw i32 %778, %779
  %781 = and i32 %780, 7
  %782 = lshr exact i32 128, %781
  %783 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %784 = ashr i32 %780, 3
  %785 = load i8, ptr @WDB, align 1, !tbaa !13
  %786 = zext i8 %785 to i32
  %787 = shl nuw nsw i32 %786, 3
  %788 = getelementptr i8, ptr %783, i32 %784
  %789 = getelementptr i8, ptr %788, i32 %787
  %790 = load i8, ptr %789, align 1, !tbaa !13
  %791 = trunc nuw i32 %782 to i8
  %792 = or i8 %790, %791
  store i8 %792, ptr %789, align 1, !tbaa !13
  %793 = icmp samesign ugt i32 %772, 5
  %794 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %795 = zext i1 %793 to i32
  %796 = add nuw nsw i32 %772, %795
  %797 = load i8, ptr @WDB, align 1, !tbaa !13
  %798 = zext i8 %797 to i32
  %799 = mul nuw nsw i32 %796, %798
  %800 = getelementptr inbounds nuw i8, ptr %794, i32 %799
  %801 = getelementptr inbounds nuw i8, ptr %800, i32 1
  %802 = load i8, ptr %801, align 1, !tbaa !13
  %803 = or i8 %802, -128
  store i8 %803, ptr %801, align 1, !tbaa !13
  br label %804

804:                                              ; preds = %776, %771
  %805 = add nuw nsw i32 %772, 1
  %806 = lshr i32 %773, 1
  %807 = icmp eq i32 %805, 8
  br i1 %807, label %808, label %771, !llvm.loop !43

808:                                              ; preds = %804
  %809 = and i32 %773, 2
  %810 = icmp eq i32 %809, 0
  br i1 %810, label %830, label %811

811:                                              ; preds = %808
  %812 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %813 = load i8, ptr @WD, align 1, !tbaa !13
  %814 = zext i8 %813 to i32
  %815 = add nsw i32 %814, -7
  %816 = load i8, ptr @WDB, align 1, !tbaa !13
  %817 = zext i8 %816 to i32
  %818 = mul nsw i32 %815, %817
  %819 = getelementptr i8, ptr %812, i32 %818
  %820 = getelementptr i8, ptr %819, i32 1
  %821 = load i8, ptr %820, align 1, !tbaa !13
  %822 = or i8 %821, -128
  store i8 %822, ptr %820, align 1, !tbaa !13
  %823 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %824 = load i8, ptr @WDB, align 1, !tbaa !13
  %825 = zext i8 %824 to i32
  %826 = shl nuw nsw i32 %825, 3
  %827 = getelementptr inbounds nuw i8, ptr %823, i32 %826
  %828 = load i8, ptr %827, align 1, !tbaa !13
  %829 = or i8 %828, 1
  store i8 %829, ptr %827, align 1, !tbaa !13
  br label %830

830:                                              ; preds = %811, %808
  %831 = and i32 %773, 4
  %832 = icmp eq i32 %831, 0
  br i1 %832, label %852, label %833

833:                                              ; preds = %830
  %834 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %835 = load i8, ptr @WD, align 1, !tbaa !13
  %836 = zext i8 %835 to i32
  %837 = add nsw i32 %836, -6
  %838 = load i8, ptr @WDB, align 1, !tbaa !13
  %839 = zext i8 %838 to i32
  %840 = mul nsw i32 %837, %839
  %841 = getelementptr i8, ptr %834, i32 %840
  %842 = getelementptr i8, ptr %841, i32 1
  %843 = load i8, ptr %842, align 1, !tbaa !13
  %844 = or i8 %843, -128
  store i8 %844, ptr %842, align 1, !tbaa !13
  %845 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %846 = load i8, ptr @WDB, align 1, !tbaa !13
  %847 = zext i8 %846 to i32
  %848 = shl nuw nsw i32 %847, 3
  %849 = getelementptr inbounds nuw i8, ptr %845, i32 %848
  %850 = load i8, ptr %849, align 1, !tbaa !13
  %851 = or i8 %850, 4
  store i8 %851, ptr %849, align 1, !tbaa !13
  br label %852

852:                                              ; preds = %833, %830
  %853 = and i32 %773, 8
  %854 = icmp eq i32 %853, 0
  br i1 %854, label %874, label %855

855:                                              ; preds = %852
  %856 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %857 = load i8, ptr @WD, align 1, !tbaa !13
  %858 = zext i8 %857 to i32
  %859 = add nsw i32 %858, -5
  %860 = load i8, ptr @WDB, align 1, !tbaa !13
  %861 = zext i8 %860 to i32
  %862 = mul nsw i32 %859, %861
  %863 = getelementptr i8, ptr %856, i32 %862
  %864 = getelementptr i8, ptr %863, i32 1
  %865 = load i8, ptr %864, align 1, !tbaa !13
  %866 = or i8 %865, -128
  store i8 %866, ptr %864, align 1, !tbaa !13
  %867 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %868 = load i8, ptr @WDB, align 1, !tbaa !13
  %869 = zext i8 %868 to i32
  %870 = shl nuw nsw i32 %869, 3
  %871 = getelementptr inbounds nuw i8, ptr %867, i32 %870
  %872 = load i8, ptr %871, align 1, !tbaa !13
  %873 = or i8 %872, 8
  store i8 %873, ptr %871, align 1, !tbaa !13
  br label %874

874:                                              ; preds = %855, %852
  %875 = and i32 %773, 16
  %876 = icmp eq i32 %875, 0
  br i1 %876, label %896, label %877

877:                                              ; preds = %874
  %878 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %879 = load i8, ptr @WD, align 1, !tbaa !13
  %880 = zext i8 %879 to i32
  %881 = add nsw i32 %880, -4
  %882 = load i8, ptr @WDB, align 1, !tbaa !13
  %883 = zext i8 %882 to i32
  %884 = mul nsw i32 %881, %883
  %885 = getelementptr i8, ptr %878, i32 %884
  %886 = getelementptr i8, ptr %885, i32 1
  %887 = load i8, ptr %886, align 1, !tbaa !13
  %888 = or i8 %887, -128
  store i8 %888, ptr %886, align 1, !tbaa !13
  %889 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %890 = load i8, ptr @WDB, align 1, !tbaa !13
  %891 = zext i8 %890 to i32
  %892 = shl nuw nsw i32 %891, 3
  %893 = getelementptr inbounds nuw i8, ptr %889, i32 %892
  %894 = load i8, ptr %893, align 1, !tbaa !13
  %895 = or i8 %894, 16
  store i8 %895, ptr %893, align 1, !tbaa !13
  br label %896

896:                                              ; preds = %877, %874
  %897 = and i32 %773, 32
  %898 = icmp eq i32 %897, 0
  br i1 %898, label %918, label %899

899:                                              ; preds = %896
  %900 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %901 = load i8, ptr @WD, align 1, !tbaa !13
  %902 = zext i8 %901 to i32
  %903 = add nsw i32 %902, -3
  %904 = load i8, ptr @WDB, align 1, !tbaa !13
  %905 = zext i8 %904 to i32
  %906 = mul nsw i32 %903, %905
  %907 = getelementptr i8, ptr %900, i32 %906
  %908 = getelementptr i8, ptr %907, i32 1
  %909 = load i8, ptr %908, align 1, !tbaa !13
  %910 = or i8 %909, -128
  store i8 %910, ptr %908, align 1, !tbaa !13
  %911 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %912 = load i8, ptr @WDB, align 1, !tbaa !13
  %913 = zext i8 %912 to i32
  %914 = shl nuw nsw i32 %913, 3
  %915 = getelementptr inbounds nuw i8, ptr %911, i32 %914
  %916 = load i8, ptr %915, align 1, !tbaa !13
  %917 = or i8 %916, 32
  store i8 %917, ptr %915, align 1, !tbaa !13
  br label %918

918:                                              ; preds = %899, %896
  %919 = and i32 %773, 64
  %920 = icmp eq i32 %919, 0
  br i1 %920, label %940, label %921

921:                                              ; preds = %918
  %922 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %923 = load i8, ptr @WD, align 1, !tbaa !13
  %924 = zext i8 %923 to i32
  %925 = add nsw i32 %924, -2
  %926 = load i8, ptr @WDB, align 1, !tbaa !13
  %927 = zext i8 %926 to i32
  %928 = mul nsw i32 %925, %927
  %929 = getelementptr i8, ptr %922, i32 %928
  %930 = getelementptr i8, ptr %929, i32 1
  %931 = load i8, ptr %930, align 1, !tbaa !13
  %932 = or i8 %931, -128
  store i8 %932, ptr %930, align 1, !tbaa !13
  %933 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %934 = load i8, ptr @WDB, align 1, !tbaa !13
  %935 = zext i8 %934 to i32
  %936 = shl nuw nsw i32 %935, 3
  %937 = getelementptr inbounds nuw i8, ptr %933, i32 %936
  %938 = load i8, ptr %937, align 1, !tbaa !13
  %939 = or i8 %938, 64
  store i8 %939, ptr %937, align 1, !tbaa !13
  br label %940

940:                                              ; preds = %921, %918
  %941 = and i32 %773, 128
  %942 = icmp eq i32 %941, 0
  br i1 %942, label %962, label %943

943:                                              ; preds = %940
  %944 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %945 = load i8, ptr @WD, align 1, !tbaa !13
  %946 = zext i8 %945 to i32
  %947 = add nsw i32 %946, -1
  %948 = load i8, ptr @WDB, align 1, !tbaa !13
  %949 = zext i8 %948 to i32
  %950 = mul nsw i32 %947, %949
  %951 = getelementptr i8, ptr %944, i32 %950
  %952 = getelementptr i8, ptr %951, i32 1
  %953 = load i8, ptr %952, align 1, !tbaa !13
  %954 = or i8 %953, -128
  store i8 %954, ptr %952, align 1, !tbaa !13
  %955 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %956 = load i8, ptr @WDB, align 1, !tbaa !13
  %957 = zext i8 %956 to i32
  %958 = shl nuw nsw i32 %957, 3
  %959 = getelementptr inbounds nuw i8, ptr %955, i32 %958
  %960 = load i8, ptr %959, align 1, !tbaa !13
  %961 = or i8 %960, -128
  store i8 %961, ptr %959, align 1, !tbaa !13
  br label %962

962:                                              ; preds = %940, %943
  ret void
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define internal fastcc void @applymask(i8 noundef zeroext %0) unnamed_addr #2 {
  switch i8 %0, label %527 [
    i8 0, label %23
    i8 1, label %20
    i8 2, label %17
    i8 3, label %14
    i8 4, label %11
    i8 5, label %8
    i8 6, label %5
    i8 7, label %2
  ]

2:                                                ; preds = %1
  %3 = load i8, ptr @WD, align 1, !tbaa !13
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %527, label %459

5:                                                ; preds = %1
  %6 = load i8, ptr @WD, align 1, !tbaa !13
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %527, label %391

8:                                                ; preds = %1
  %9 = load i8, ptr @WD, align 1, !tbaa !13
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %527, label %321

11:                                               ; preds = %1
  %12 = load i8, ptr @WD, align 1, !tbaa !13
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %527, label %258

14:                                               ; preds = %1
  %15 = load i8, ptr @WD, align 1, !tbaa !13
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %527, label %196

17:                                               ; preds = %1
  %18 = load i8, ptr @WD, align 1, !tbaa !13
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %527, label %138

20:                                               ; preds = %1
  %21 = load i8, ptr @WD, align 1, !tbaa !13
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %527, label %83

23:                                               ; preds = %1
  %24 = load i8, ptr @WD, align 1, !tbaa !13
  %25 = icmp eq i8 %24, 0
  br i1 %25, label %527, label %26

26:                                               ; preds = %23, %78
  %27 = phi i8 [ %79, %78 ], [ %24, %23 ]
  %28 = phi i32 [ %80, %78 ], [ 0, %23 ]
  %29 = icmp eq i8 %27, 0
  br i1 %29, label %78, label %30

30:                                               ; preds = %26
  %31 = trunc nuw i32 %28 to i8
  br label %32

32:                                               ; preds = %30, %72
  %33 = phi i8 [ %27, %30 ], [ %73, %72 ]
  %34 = phi i8 [ %27, %30 ], [ %74, %72 ]
  %35 = phi i32 [ 0, %30 ], [ %75, %72 ]
  %36 = add nuw nsw i32 %35, %28
  %37 = and i32 %36, 1
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %72

39:                                               ; preds = %32
  %40 = trunc nuw i32 %35 to i8
  %41 = tail call i8 @llvm.umin.i8(i8 %40, i8 %31)
  %42 = tail call i8 @llvm.umax.i8(i8 %40, i8 %31)
  %43 = zext i8 %42 to i32
  %44 = add nuw nsw i32 %43, 1
  %45 = mul nuw nsw i32 %44, %43
  %46 = lshr i32 %45, 1
  %47 = zext i8 %41 to i32
  %48 = add nuw nsw i32 %46, %47
  %49 = load ptr, ptr @framask, align 4, !tbaa !10
  %50 = lshr i32 %48, 3
  %51 = getelementptr inbounds nuw i8, ptr %49, i32 %50
  %52 = load i8, ptr %51, align 1, !tbaa !13
  %53 = zext i8 %52 to i32
  %54 = and i32 %48, 7
  %55 = xor i32 %54, 7
  %56 = shl nuw nsw i32 1, %55
  %57 = and i32 %56, %53
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %59, label %72

59:                                               ; preds = %39
  %60 = and i8 %40, 7
  %61 = lshr exact i8 -128, %60
  %62 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %63 = lshr i32 %35, 3
  %64 = load i8, ptr @WDB, align 1, !tbaa !13
  %65 = zext i8 %64 to i32
  %66 = mul nuw nsw i32 %28, %65
  %67 = getelementptr inbounds nuw i8, ptr %62, i32 %63
  %68 = getelementptr inbounds nuw i8, ptr %67, i32 %66
  %69 = load i8, ptr %68, align 1, !tbaa !13
  %70 = xor i8 %69, %61
  store i8 %70, ptr %68, align 1, !tbaa !13
  %71 = load i8, ptr @WD, align 1, !tbaa !13
  br label %72

72:                                               ; preds = %32, %39, %59
  %73 = phi i8 [ %33, %32 ], [ %33, %39 ], [ %71, %59 ]
  %74 = phi i8 [ %34, %32 ], [ %34, %39 ], [ %71, %59 ]
  %75 = add nuw nsw i32 %35, 1
  %76 = zext i8 %74 to i32
  %77 = icmp samesign ult i32 %75, %76
  br i1 %77, label %32, label %78, !llvm.loop !44

78:                                               ; preds = %72, %26
  %79 = phi i8 [ 0, %26 ], [ %73, %72 ]
  %80 = add nuw nsw i32 %28, 1
  %81 = zext i8 %79 to i32
  %82 = icmp samesign ult i32 %80, %81
  br i1 %82, label %26, label %527, !llvm.loop !45

83:                                               ; preds = %20, %133
  %84 = phi i8 [ %134, %133 ], [ %21, %20 ]
  %85 = phi i32 [ %135, %133 ], [ 0, %20 ]
  %86 = icmp eq i8 %84, 0
  br i1 %86, label %133, label %87

87:                                               ; preds = %83
  %88 = and i32 %85, 1
  %89 = icmp eq i32 %88, 0
  %90 = trunc nuw i32 %85 to i8
  br label %91

91:                                               ; preds = %87, %128
  %92 = phi i8 [ %84, %87 ], [ %129, %128 ]
  %93 = phi i8 [ %84, %87 ], [ %130, %128 ]
  %94 = phi i8 [ 0, %87 ], [ %131, %128 ]
  br i1 %89, label %95, label %128

95:                                               ; preds = %91
  %96 = tail call i8 @llvm.umin.i8(i8 %94, i8 %90)
  %97 = tail call i8 @llvm.umax.i8(i8 %94, i8 %90)
  %98 = zext i8 %97 to i32
  %99 = add nuw nsw i32 %98, 1
  %100 = mul nuw nsw i32 %99, %98
  %101 = lshr i32 %100, 1
  %102 = zext i8 %96 to i32
  %103 = add nuw nsw i32 %101, %102
  %104 = load ptr, ptr @framask, align 4, !tbaa !10
  %105 = lshr i32 %103, 3
  %106 = getelementptr inbounds nuw i8, ptr %104, i32 %105
  %107 = load i8, ptr %106, align 1, !tbaa !13
  %108 = zext i8 %107 to i32
  %109 = and i32 %103, 7
  %110 = xor i32 %109, 7
  %111 = shl nuw nsw i32 1, %110
  %112 = and i32 %111, %108
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %114, label %128

114:                                              ; preds = %95
  %115 = and i8 %94, 7
  %116 = lshr exact i8 -128, %115
  %117 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %118 = lshr i8 %94, 3
  %119 = zext nneg i8 %118 to i32
  %120 = load i8, ptr @WDB, align 1, !tbaa !13
  %121 = zext i8 %120 to i32
  %122 = mul nuw nsw i32 %85, %121
  %123 = getelementptr inbounds nuw i8, ptr %117, i32 %119
  %124 = getelementptr inbounds nuw i8, ptr %123, i32 %122
  %125 = load i8, ptr %124, align 1, !tbaa !13
  %126 = xor i8 %125, %116
  store i8 %126, ptr %124, align 1, !tbaa !13
  %127 = load i8, ptr @WD, align 1, !tbaa !13
  br label %128

128:                                              ; preds = %91, %95, %114
  %129 = phi i8 [ %92, %91 ], [ %92, %95 ], [ %127, %114 ]
  %130 = phi i8 [ %93, %91 ], [ %93, %95 ], [ %127, %114 ]
  %131 = add nuw i8 %94, 1
  %132 = icmp ult i8 %131, %130
  br i1 %132, label %91, label %133, !llvm.loop !46

133:                                              ; preds = %128, %83
  %134 = phi i8 [ 0, %83 ], [ %129, %128 ]
  %135 = add nuw nsw i32 %85, 1
  %136 = zext i8 %134 to i32
  %137 = icmp samesign ult i32 %135, %136
  br i1 %137, label %83, label %527, !llvm.loop !47

138:                                              ; preds = %17, %191
  %139 = phi i8 [ %192, %191 ], [ %18, %17 ]
  %140 = phi i32 [ %193, %191 ], [ 0, %17 ]
  %141 = icmp eq i8 %139, 0
  br i1 %141, label %191, label %142

142:                                              ; preds = %138
  %143 = trunc nuw i32 %140 to i8
  br label %144

144:                                              ; preds = %142, %185
  %145 = phi i8 [ %186, %185 ], [ %139, %142 ]
  %146 = phi i8 [ %187, %185 ], [ %139, %142 ]
  %147 = phi i8 [ %189, %185 ], [ 0, %142 ]
  %148 = phi i8 [ %188, %185 ], [ 0, %142 ]
  %149 = icmp eq i8 %147, 3
  %150 = select i1 %149, i8 0, i8 %147
  %151 = icmp eq i8 %150, 0
  br i1 %151, label %152, label %185

152:                                              ; preds = %144
  %153 = tail call i8 @llvm.umin.i8(i8 %148, i8 %143)
  %154 = tail call i8 @llvm.umax.i8(i8 %148, i8 %143)
  %155 = zext i8 %154 to i32
  %156 = add nuw nsw i32 %155, 1
  %157 = mul nuw nsw i32 %156, %155
  %158 = lshr i32 %157, 1
  %159 = zext i8 %153 to i32
  %160 = add nuw nsw i32 %158, %159
  %161 = load ptr, ptr @framask, align 4, !tbaa !10
  %162 = lshr i32 %160, 3
  %163 = getelementptr inbounds nuw i8, ptr %161, i32 %162
  %164 = load i8, ptr %163, align 1, !tbaa !13
  %165 = zext i8 %164 to i32
  %166 = and i32 %160, 7
  %167 = xor i32 %166, 7
  %168 = shl nuw nsw i32 1, %167
  %169 = and i32 %168, %165
  %170 = icmp eq i32 %169, 0
  br i1 %170, label %171, label %185

171:                                              ; preds = %152
  %172 = and i8 %148, 7
  %173 = lshr exact i8 -128, %172
  %174 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %175 = lshr i8 %148, 3
  %176 = zext nneg i8 %175 to i32
  %177 = load i8, ptr @WDB, align 1, !tbaa !13
  %178 = zext i8 %177 to i32
  %179 = mul nuw nsw i32 %140, %178
  %180 = getelementptr inbounds nuw i8, ptr %174, i32 %176
  %181 = getelementptr inbounds nuw i8, ptr %180, i32 %179
  %182 = load i8, ptr %181, align 1, !tbaa !13
  %183 = xor i8 %182, %173
  store i8 %183, ptr %181, align 1, !tbaa !13
  %184 = load i8, ptr @WD, align 1, !tbaa !13
  br label %185

185:                                              ; preds = %144, %152, %171
  %186 = phi i8 [ %145, %144 ], [ %145, %152 ], [ %184, %171 ]
  %187 = phi i8 [ %146, %144 ], [ %146, %152 ], [ %184, %171 ]
  %188 = add nuw i8 %148, 1
  %189 = add i8 %150, 1
  %190 = icmp ult i8 %188, %187
  br i1 %190, label %144, label %191, !llvm.loop !48

191:                                              ; preds = %185, %138
  %192 = phi i8 [ 0, %138 ], [ %186, %185 ]
  %193 = add nuw nsw i32 %140, 1
  %194 = zext i8 %192 to i32
  %195 = icmp samesign ult i32 %193, %194
  br i1 %195, label %138, label %527, !llvm.loop !49

196:                                              ; preds = %14, %252
  %197 = phi i8 [ %253, %252 ], [ %15, %14 ]
  %198 = phi i32 [ %254, %252 ], [ 0, %14 ]
  %199 = phi i8 [ %255, %252 ], [ 0, %14 ]
  %200 = icmp eq i8 %199, 3
  %201 = select i1 %200, i8 0, i8 %199
  %202 = icmp eq i8 %197, 0
  br i1 %202, label %252, label %203

203:                                              ; preds = %196
  %204 = trunc nuw i32 %198 to i8
  br label %205

205:                                              ; preds = %203, %246
  %206 = phi i8 [ %247, %246 ], [ %197, %203 ]
  %207 = phi i8 [ %248, %246 ], [ %197, %203 ]
  %208 = phi i8 [ %250, %246 ], [ %201, %203 ]
  %209 = phi i8 [ %249, %246 ], [ 0, %203 ]
  %210 = icmp eq i8 %208, 3
  %211 = select i1 %210, i8 0, i8 %208
  %212 = icmp eq i8 %211, 0
  br i1 %212, label %213, label %246

213:                                              ; preds = %205
  %214 = tail call i8 @llvm.umin.i8(i8 %209, i8 %204)
  %215 = tail call i8 @llvm.umax.i8(i8 %209, i8 %204)
  %216 = zext i8 %215 to i32
  %217 = add nuw nsw i32 %216, 1
  %218 = mul nuw nsw i32 %217, %216
  %219 = lshr i32 %218, 1
  %220 = zext i8 %214 to i32
  %221 = add nuw nsw i32 %219, %220
  %222 = load ptr, ptr @framask, align 4, !tbaa !10
  %223 = lshr i32 %221, 3
  %224 = getelementptr inbounds nuw i8, ptr %222, i32 %223
  %225 = load i8, ptr %224, align 1, !tbaa !13
  %226 = zext i8 %225 to i32
  %227 = and i32 %221, 7
  %228 = xor i32 %227, 7
  %229 = shl nuw nsw i32 1, %228
  %230 = and i32 %229, %226
  %231 = icmp eq i32 %230, 0
  br i1 %231, label %232, label %246

232:                                              ; preds = %213
  %233 = and i8 %209, 7
  %234 = lshr exact i8 -128, %233
  %235 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %236 = lshr i8 %209, 3
  %237 = zext nneg i8 %236 to i32
  %238 = load i8, ptr @WDB, align 1, !tbaa !13
  %239 = zext i8 %238 to i32
  %240 = mul nuw nsw i32 %198, %239
  %241 = getelementptr inbounds nuw i8, ptr %235, i32 %237
  %242 = getelementptr inbounds nuw i8, ptr %241, i32 %240
  %243 = load i8, ptr %242, align 1, !tbaa !13
  %244 = xor i8 %243, %234
  store i8 %244, ptr %242, align 1, !tbaa !13
  %245 = load i8, ptr @WD, align 1, !tbaa !13
  br label %246

246:                                              ; preds = %205, %213, %232
  %247 = phi i8 [ %206, %205 ], [ %206, %213 ], [ %245, %232 ]
  %248 = phi i8 [ %207, %205 ], [ %207, %213 ], [ %245, %232 ]
  %249 = add nuw i8 %209, 1
  %250 = add i8 %211, 1
  %251 = icmp ult i8 %249, %248
  br i1 %251, label %205, label %252, !llvm.loop !50

252:                                              ; preds = %246, %196
  %253 = phi i8 [ 0, %196 ], [ %247, %246 ]
  %254 = add nuw nsw i32 %198, 1
  %255 = add i8 %201, 1
  %256 = zext i8 %253 to i32
  %257 = icmp samesign ult i32 %254, %256
  br i1 %257, label %196, label %527, !llvm.loop !51

258:                                              ; preds = %11, %316
  %259 = phi i8 [ %317, %316 ], [ %12, %11 ]
  %260 = phi i32 [ %318, %316 ], [ 0, %11 ]
  %261 = trunc nuw i32 %260 to i8
  %262 = icmp eq i8 %259, 0
  br i1 %262, label %316, label %263

263:                                              ; preds = %258
  %264 = lshr i8 %261, 1
  %265 = and i8 %264, 1
  br label %266

266:                                              ; preds = %263, %309
  %267 = phi i8 [ %310, %309 ], [ %259, %263 ]
  %268 = phi i8 [ %311, %309 ], [ %259, %263 ]
  %269 = phi i8 [ %274, %309 ], [ %265, %263 ]
  %270 = phi i8 [ %314, %309 ], [ 0, %263 ]
  %271 = phi i8 [ %312, %309 ], [ 0, %263 ]
  %272 = icmp eq i8 %270, 3
  %273 = zext i1 %272 to i8
  %274 = xor i8 %269, %273
  %275 = icmp eq i8 %269, %273
  br i1 %275, label %276, label %309

276:                                              ; preds = %266
  %277 = tail call i8 @llvm.umin.i8(i8 %271, i8 %261)
  %278 = tail call i8 @llvm.umax.i8(i8 %271, i8 %261)
  %279 = zext i8 %278 to i32
  %280 = add nuw nsw i32 %279, 1
  %281 = mul nuw nsw i32 %280, %279
  %282 = lshr i32 %281, 1
  %283 = zext i8 %277 to i32
  %284 = add nuw nsw i32 %282, %283
  %285 = load ptr, ptr @framask, align 4, !tbaa !10
  %286 = lshr i32 %284, 3
  %287 = getelementptr inbounds nuw i8, ptr %285, i32 %286
  %288 = load i8, ptr %287, align 1, !tbaa !13
  %289 = zext i8 %288 to i32
  %290 = and i32 %284, 7
  %291 = xor i32 %290, 7
  %292 = shl nuw nsw i32 1, %291
  %293 = and i32 %292, %289
  %294 = icmp eq i32 %293, 0
  br i1 %294, label %295, label %309

295:                                              ; preds = %276
  %296 = and i8 %271, 7
  %297 = lshr exact i8 -128, %296
  %298 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %299 = lshr i8 %271, 3
  %300 = zext nneg i8 %299 to i32
  %301 = load i8, ptr @WDB, align 1, !tbaa !13
  %302 = zext i8 %301 to i32
  %303 = mul nuw nsw i32 %260, %302
  %304 = getelementptr inbounds nuw i8, ptr %298, i32 %300
  %305 = getelementptr inbounds nuw i8, ptr %304, i32 %303
  %306 = load i8, ptr %305, align 1, !tbaa !13
  %307 = xor i8 %306, %297
  store i8 %307, ptr %305, align 1, !tbaa !13
  %308 = load i8, ptr @WD, align 1, !tbaa !13
  br label %309

309:                                              ; preds = %266, %276, %295
  %310 = phi i8 [ %267, %266 ], [ %267, %276 ], [ %308, %295 ]
  %311 = phi i8 [ %268, %266 ], [ %268, %276 ], [ %308, %295 ]
  %312 = add nuw i8 %271, 1
  %313 = add i8 %270, 1
  %314 = select i1 %272, i8 1, i8 %313
  %315 = icmp ult i8 %312, %311
  br i1 %315, label %266, label %316, !llvm.loop !52

316:                                              ; preds = %309, %258
  %317 = phi i8 [ 0, %258 ], [ %310, %309 ]
  %318 = add nuw nsw i32 %260, 1
  %319 = zext i8 %317 to i32
  %320 = icmp samesign ult i32 %318, %319
  br i1 %320, label %258, label %527, !llvm.loop !53

321:                                              ; preds = %8, %385
  %322 = phi i8 [ %386, %385 ], [ %9, %8 ]
  %323 = phi i32 [ %387, %385 ], [ 0, %8 ]
  %324 = phi i8 [ %388, %385 ], [ 0, %8 ]
  %325 = icmp eq i8 %324, 3
  %326 = select i1 %325, i8 0, i8 %324
  %327 = icmp eq i8 %322, 0
  br i1 %327, label %385, label %328

328:                                              ; preds = %321
  %329 = and i32 %323, 1
  %330 = icmp ne i8 %326, 0
  %331 = trunc nuw i32 %323 to i8
  br label %332

332:                                              ; preds = %328, %378
  %333 = phi i8 [ %322, %328 ], [ %379, %378 ]
  %334 = phi i8 [ %322, %328 ], [ %380, %378 ]
  %335 = phi i32 [ 0, %328 ], [ %381, %378 ]
  %336 = phi i8 [ 0, %328 ], [ %382, %378 ]
  %337 = icmp eq i8 %336, 3
  %338 = select i1 %337, i8 0, i8 %336
  %339 = and i32 %329, %335
  %340 = icmp ne i8 %338, 0
  %341 = and i1 %330, %340
  %342 = zext i1 %341 to i32
  %343 = or i32 %339, %342
  %344 = icmp eq i32 %343, 0
  br i1 %344, label %345, label %378

345:                                              ; preds = %332
  %346 = trunc nuw i32 %335 to i8
  %347 = tail call i8 @llvm.umin.i8(i8 %346, i8 %331)
  %348 = tail call i8 @llvm.umax.i8(i8 %346, i8 %331)
  %349 = zext i8 %348 to i32
  %350 = add nuw nsw i32 %349, 1
  %351 = mul nuw nsw i32 %350, %349
  %352 = lshr i32 %351, 1
  %353 = zext i8 %347 to i32
  %354 = add nuw nsw i32 %352, %353
  %355 = load ptr, ptr @framask, align 4, !tbaa !10
  %356 = lshr i32 %354, 3
  %357 = getelementptr inbounds nuw i8, ptr %355, i32 %356
  %358 = load i8, ptr %357, align 1, !tbaa !13
  %359 = zext i8 %358 to i32
  %360 = and i32 %354, 7
  %361 = xor i32 %360, 7
  %362 = shl nuw nsw i32 1, %361
  %363 = and i32 %362, %359
  %364 = icmp eq i32 %363, 0
  br i1 %364, label %365, label %378

365:                                              ; preds = %345
  %366 = and i8 %346, 7
  %367 = lshr exact i8 -128, %366
  %368 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %369 = lshr i32 %335, 3
  %370 = load i8, ptr @WDB, align 1, !tbaa !13
  %371 = zext i8 %370 to i32
  %372 = mul nuw nsw i32 %323, %371
  %373 = getelementptr inbounds nuw i8, ptr %368, i32 %369
  %374 = getelementptr inbounds nuw i8, ptr %373, i32 %372
  %375 = load i8, ptr %374, align 1, !tbaa !13
  %376 = xor i8 %375, %367
  store i8 %376, ptr %374, align 1, !tbaa !13
  %377 = load i8, ptr @WD, align 1, !tbaa !13
  br label %378

378:                                              ; preds = %332, %345, %365
  %379 = phi i8 [ %333, %332 ], [ %333, %345 ], [ %377, %365 ]
  %380 = phi i8 [ %334, %332 ], [ %334, %345 ], [ %377, %365 ]
  %381 = add nuw nsw i32 %335, 1
  %382 = add i8 %338, 1
  %383 = zext i8 %380 to i32
  %384 = icmp samesign ult i32 %381, %383
  br i1 %384, label %332, label %385, !llvm.loop !54

385:                                              ; preds = %378, %321
  %386 = phi i8 [ 0, %321 ], [ %379, %378 ]
  %387 = add nuw nsw i32 %323, 1
  %388 = add i8 %326, 1
  %389 = zext i8 %386 to i32
  %390 = icmp samesign ult i32 %387, %389
  br i1 %390, label %321, label %527, !llvm.loop !55

391:                                              ; preds = %5, %453
  %392 = phi i8 [ %454, %453 ], [ %6, %5 ]
  %393 = phi i32 [ %455, %453 ], [ 0, %5 ]
  %394 = phi i8 [ %456, %453 ], [ 0, %5 ]
  %395 = icmp eq i8 %394, 3
  %396 = select i1 %395, i8 0, i8 %394
  %397 = icmp eq i8 %392, 0
  br i1 %397, label %453, label %398

398:                                              ; preds = %391
  %399 = trunc nuw i32 %393 to i8
  br label %400

400:                                              ; preds = %398, %446
  %401 = phi i8 [ %392, %398 ], [ %447, %446 ]
  %402 = phi i8 [ %392, %398 ], [ %448, %446 ]
  %403 = phi i32 [ 0, %398 ], [ %449, %446 ]
  %404 = phi i8 [ 0, %398 ], [ %450, %446 ]
  %405 = icmp eq i8 %404, 3
  %406 = select i1 %405, i8 0, i8 %404
  %407 = and i32 %403, %393
  %408 = trunc i32 %407 to i1
  %409 = icmp eq i8 %406, 0
  %410 = icmp ne i8 %406, %396
  %411 = select i1 %409, i1 true, i1 %410
  %412 = xor i1 %411, %408
  br i1 %412, label %413, label %446

413:                                              ; preds = %400
  %414 = trunc nuw i32 %403 to i8
  %415 = tail call i8 @llvm.umin.i8(i8 %414, i8 %399)
  %416 = tail call i8 @llvm.umax.i8(i8 %414, i8 %399)
  %417 = zext i8 %416 to i32
  %418 = add nuw nsw i32 %417, 1
  %419 = mul nuw nsw i32 %418, %417
  %420 = lshr i32 %419, 1
  %421 = zext i8 %415 to i32
  %422 = add nuw nsw i32 %420, %421
  %423 = load ptr, ptr @framask, align 4, !tbaa !10
  %424 = lshr i32 %422, 3
  %425 = getelementptr inbounds nuw i8, ptr %423, i32 %424
  %426 = load i8, ptr %425, align 1, !tbaa !13
  %427 = zext i8 %426 to i32
  %428 = and i32 %422, 7
  %429 = xor i32 %428, 7
  %430 = shl nuw nsw i32 1, %429
  %431 = and i32 %430, %427
  %432 = icmp eq i32 %431, 0
  br i1 %432, label %433, label %446

433:                                              ; preds = %413
  %434 = and i8 %414, 7
  %435 = lshr exact i8 -128, %434
  %436 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %437 = lshr i32 %403, 3
  %438 = load i8, ptr @WDB, align 1, !tbaa !13
  %439 = zext i8 %438 to i32
  %440 = mul nuw nsw i32 %393, %439
  %441 = getelementptr inbounds nuw i8, ptr %436, i32 %437
  %442 = getelementptr inbounds nuw i8, ptr %441, i32 %440
  %443 = load i8, ptr %442, align 1, !tbaa !13
  %444 = xor i8 %443, %435
  store i8 %444, ptr %442, align 1, !tbaa !13
  %445 = load i8, ptr @WD, align 1, !tbaa !13
  br label %446

446:                                              ; preds = %400, %413, %433
  %447 = phi i8 [ %401, %400 ], [ %401, %413 ], [ %445, %433 ]
  %448 = phi i8 [ %402, %400 ], [ %402, %413 ], [ %445, %433 ]
  %449 = add nuw nsw i32 %403, 1
  %450 = add i8 %406, 1
  %451 = zext i8 %448 to i32
  %452 = icmp samesign ult i32 %449, %451
  br i1 %452, label %400, label %453, !llvm.loop !56

453:                                              ; preds = %446, %391
  %454 = phi i8 [ 0, %391 ], [ %447, %446 ]
  %455 = add nuw nsw i32 %393, 1
  %456 = add i8 %396, 1
  %457 = zext i8 %454 to i32
  %458 = icmp samesign ult i32 %455, %457
  br i1 %458, label %391, label %527, !llvm.loop !57

459:                                              ; preds = %2, %521
  %460 = phi i8 [ %522, %521 ], [ %3, %2 ]
  %461 = phi i32 [ %523, %521 ], [ 0, %2 ]
  %462 = phi i8 [ %524, %521 ], [ 0, %2 ]
  %463 = icmp eq i8 %462, 3
  %464 = select i1 %463, i8 0, i8 %462
  %465 = icmp eq i8 %460, 0
  br i1 %465, label %521, label %466

466:                                              ; preds = %459
  %467 = trunc nuw i32 %461 to i8
  br label %468

468:                                              ; preds = %466, %514
  %469 = phi i8 [ %460, %466 ], [ %515, %514 ]
  %470 = phi i8 [ %460, %466 ], [ %516, %514 ]
  %471 = phi i32 [ 0, %466 ], [ %517, %514 ]
  %472 = phi i8 [ 0, %466 ], [ %518, %514 ]
  %473 = icmp eq i8 %472, 3
  %474 = select i1 %473, i8 0, i8 %472
  %475 = add nuw nsw i32 %471, %461
  %476 = trunc i32 %475 to i1
  %477 = icmp eq i8 %474, 0
  %478 = icmp ne i8 %474, %464
  %479 = select i1 %477, i1 true, i1 %478
  %480 = xor i1 %479, %476
  br i1 %480, label %481, label %514

481:                                              ; preds = %468
  %482 = trunc nuw i32 %471 to i8
  %483 = tail call i8 @llvm.umin.i8(i8 %482, i8 %467)
  %484 = tail call i8 @llvm.umax.i8(i8 %482, i8 %467)
  %485 = zext i8 %484 to i32
  %486 = add nuw nsw i32 %485, 1
  %487 = mul nuw nsw i32 %486, %485
  %488 = lshr i32 %487, 1
  %489 = zext i8 %483 to i32
  %490 = add nuw nsw i32 %488, %489
  %491 = load ptr, ptr @framask, align 4, !tbaa !10
  %492 = lshr i32 %490, 3
  %493 = getelementptr inbounds nuw i8, ptr %491, i32 %492
  %494 = load i8, ptr %493, align 1, !tbaa !13
  %495 = zext i8 %494 to i32
  %496 = and i32 %490, 7
  %497 = xor i32 %496, 7
  %498 = shl nuw nsw i32 1, %497
  %499 = and i32 %498, %495
  %500 = icmp eq i32 %499, 0
  br i1 %500, label %501, label %514

501:                                              ; preds = %481
  %502 = and i8 %482, 7
  %503 = lshr exact i8 -128, %502
  %504 = load ptr, ptr @qrframe, align 4, !tbaa !10
  %505 = lshr i32 %471, 3
  %506 = load i8, ptr @WDB, align 1, !tbaa !13
  %507 = zext i8 %506 to i32
  %508 = mul nuw nsw i32 %461, %507
  %509 = getelementptr inbounds nuw i8, ptr %504, i32 %505
  %510 = getelementptr inbounds nuw i8, ptr %509, i32 %508
  %511 = load i8, ptr %510, align 1, !tbaa !13
  %512 = xor i8 %511, %503
  store i8 %512, ptr %510, align 1, !tbaa !13
  %513 = load i8, ptr @WD, align 1, !tbaa !13
  br label %514

514:                                              ; preds = %468, %481, %501
  %515 = phi i8 [ %469, %468 ], [ %469, %481 ], [ %513, %501 ]
  %516 = phi i8 [ %470, %468 ], [ %470, %481 ], [ %513, %501 ]
  %517 = add nuw nsw i32 %471, 1
  %518 = add i8 %474, 1
  %519 = zext i8 %516 to i32
  %520 = icmp samesign ult i32 %517, %519
  br i1 %520, label %468, label %521, !llvm.loop !58

521:                                              ; preds = %514, %459
  %522 = phi i8 [ 0, %459 ], [ %515, %514 ]
  %523 = add nuw nsw i32 %461, 1
  %524 = add i8 %464, 1
  %525 = zext i8 %522 to i32
  %526 = icmp samesign ult i32 %523, %525
  br i1 %526, label %459, label %527, !llvm.loop !59

527:                                              ; preds = %521, %453, %385, %316, %252, %191, %133, %78, %2, %5, %8, %11, %14, %17, %20, %23, %1
  ret void
}

declare dso_local i32 @strlen(ptr noundef) local_unnamed_addr #1

; Function Attrs: nounwind
define internal fastcc void @appendrs(ptr noundef readonly captures(none) %0, i8 noundef zeroext %1, ptr noundef %2, i8 noundef zeroext %3, ptr noundef readonly captures(none) %4) unnamed_addr #0 {
  %6 = zext i8 %3 to i32
  %7 = tail call ptr @memset(ptr noundef %2, i32 noundef 0, i32 noundef %6) #6
  %8 = icmp eq i8 %1, 0
  br i1 %8, label %114, label %9

9:                                                ; preds = %5
  %10 = icmp ugt i8 %3, 1
  %11 = getelementptr inbounds nuw i8, ptr %2, i32 1
  %12 = add nsw i32 %6, -1
  %13 = getelementptr i8, ptr %2, i32 %6
  %14 = getelementptr i8, ptr %13, i32 -1
  %15 = zext i8 %1 to i32
  %16 = getelementptr i8, ptr %4, i32 1
  %17 = getelementptr i8, ptr %4, i32 %6
  %18 = add nsw i32 %6, -1
  %19 = icmp ult i8 %3, 5
  %20 = icmp ult ptr %2, %17
  %21 = icmp ult ptr %16, %13
  %22 = and i1 %20, %21
  %23 = and i32 %18, -4
  %24 = or disjoint i32 %23, 1
  %25 = icmp eq i32 %18, %23
  br label %26

26:                                               ; preds = %9, %110
  %27 = phi i32 [ 0, %9 ], [ %112, %110 ]
  %28 = getelementptr inbounds nuw i8, ptr %0, i32 %27
  %29 = load i8, ptr %28, align 1, !tbaa !13
  %30 = load i8, ptr %2, align 1, !tbaa !13
  %31 = xor i8 %30, %29
  %32 = zext i8 %31 to i32
  %33 = getelementptr inbounds nuw i8, ptr @g0log, i32 %32
  %34 = load i8, ptr %33, align 1, !tbaa !13
  %35 = zext i8 %34 to i32
  %36 = icmp eq i8 %29, %30
  br i1 %36, label %99, label %37

37:                                               ; preds = %26
  br i1 %10, label %38, label %101

38:                                               ; preds = %37
  %39 = or i1 %19, %22
  br i1 %39, label %79, label %40

40:                                               ; preds = %38
  %41 = insertelement <4 x i32> poison, i32 %35, i64 0
  %42 = shufflevector <4 x i32> %41, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %43

43:                                               ; preds = %43, %40
  %44 = phi i32 [ 0, %40 ], [ %76, %43 ]
  %45 = or disjoint i32 %44, 1
  %46 = getelementptr inbounds nuw i8, ptr %2, i32 %45
  %47 = load <4 x i8>, ptr %46, align 1, !tbaa !13, !alias.scope !60, !noalias !63
  %48 = sub nsw i32 %6, %45
  %49 = getelementptr inbounds i8, ptr %4, i32 %48
  %50 = getelementptr inbounds i8, ptr %49, i32 -3
  %51 = load <4 x i8>, ptr %50, align 1, !tbaa !13, !alias.scope !63
  %52 = shufflevector <4 x i8> %51, <4 x i8> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %53 = zext <4 x i8> %52 to <4 x i32>
  %54 = add nuw nsw <4 x i32> %42, %53
  %55 = add nsw <4 x i32> %54, splat (i32 -255)
  %56 = icmp samesign ult <4 x i32> %54, splat (i32 255)
  %57 = select <4 x i1> %56, <4 x i32> %54, <4 x i32> %55
  %58 = extractelement <4 x i32> %57, i64 0
  %59 = extractelement <4 x i32> %57, i64 1
  %60 = extractelement <4 x i32> %57, i64 2
  %61 = extractelement <4 x i32> %57, i64 3
  %62 = getelementptr inbounds nuw i8, ptr @g0exp, i32 %58
  %63 = getelementptr inbounds nuw i8, ptr @g0exp, i32 %59
  %64 = getelementptr inbounds nuw i8, ptr @g0exp, i32 %60
  %65 = getelementptr inbounds nuw i8, ptr @g0exp, i32 %61
  %66 = load i8, ptr %62, align 1, !tbaa !13
  %67 = load i8, ptr %63, align 1, !tbaa !13
  %68 = load i8, ptr %64, align 1, !tbaa !13
  %69 = load i8, ptr %65, align 1, !tbaa !13
  %70 = insertelement <4 x i8> poison, i8 %66, i64 0
  %71 = insertelement <4 x i8> %70, i8 %67, i64 1
  %72 = insertelement <4 x i8> %71, i8 %68, i64 2
  %73 = insertelement <4 x i8> %72, i8 %69, i64 3
  %74 = xor <4 x i8> %73, %47
  %75 = getelementptr i8, ptr %46, i32 -1
  store <4 x i8> %74, ptr %75, align 1, !tbaa !13, !alias.scope !60, !noalias !63
  %76 = add nuw i32 %44, 4
  %77 = icmp eq i32 %76, %23
  br i1 %77, label %78, label %43, !llvm.loop !65

78:                                               ; preds = %43
  br i1 %25, label %101, label %79

79:                                               ; preds = %38, %78
  %80 = phi i32 [ %24, %78 ], [ 1, %38 ]
  br label %81

81:                                               ; preds = %79, %81
  %82 = phi i32 [ %97, %81 ], [ %80, %79 ]
  %83 = getelementptr inbounds nuw i8, ptr %2, i32 %82
  %84 = load i8, ptr %83, align 1, !tbaa !13
  %85 = sub nsw i32 %6, %82
  %86 = getelementptr inbounds i8, ptr %4, i32 %85
  %87 = load i8, ptr %86, align 1, !tbaa !13
  %88 = zext i8 %87 to i32
  %89 = add nuw nsw i32 %88, %35
  %90 = add nsw i32 %89, -255
  %91 = icmp samesign ult i32 %89, 255
  %92 = select i1 %91, i32 %89, i32 %90
  %93 = getelementptr inbounds nuw i8, ptr @g0exp, i32 %92
  %94 = load i8, ptr %93, align 1, !tbaa !13
  %95 = xor i8 %94, %84
  %96 = getelementptr i8, ptr %83, i32 -1
  store i8 %95, ptr %96, align 1, !tbaa !13
  %97 = add nuw nsw i32 %82, 1
  %98 = icmp eq i32 %97, %6
  br i1 %98, label %101, label %81, !llvm.loop !66

99:                                               ; preds = %26
  %100 = tail call ptr @memmove(ptr noundef nonnull %2, ptr noundef nonnull %11, i32 noundef %12) #6
  br label %110

101:                                              ; preds = %81, %78, %37
  %102 = load i8, ptr %4, align 1, !tbaa !13
  %103 = zext i8 %102 to i32
  %104 = add nuw nsw i32 %103, %35
  %105 = add nsw i32 %104, -255
  %106 = icmp samesign ult i32 %104, 255
  %107 = select i1 %106, i32 %104, i32 %105
  %108 = getelementptr inbounds nuw i8, ptr @g0exp, i32 %107
  %109 = load i8, ptr %108, align 1, !tbaa !13
  br label %110

110:                                              ; preds = %99, %101
  %111 = phi i8 [ %109, %101 ], [ 0, %99 ]
  store i8 %111, ptr %14, align 1, !tbaa !13
  %112 = add nuw nsw i32 %27, 1
  %113 = icmp eq i32 %112, %15
  br i1 %113, label %114, label %26, !llvm.loop !67

114:                                              ; preds = %110, %5
  ret void
}

declare dso_local ptr @memset(ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

declare dso_local ptr @memmove(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define internal fastcc i32 @badruns(i8 noundef zeroext %0) unnamed_addr #3 {
  %2 = load ptr, ptr @rlens, align 4, !tbaa !10
  %3 = add i8 %0, 1
  %4 = tail call i8 @llvm.umax.i8(i8 %3, i8 1)
  %5 = zext i8 %4 to i32
  br label %10

6:                                                ; preds = %10
  %7 = zext i8 %0 to i32
  %8 = add nsw i32 %7, -1
  %9 = icmp ugt i8 %0, 4
  br i1 %9, label %22, label %70

10:                                               ; preds = %1, %10
  %11 = phi i32 [ 0, %1 ], [ %20, %10 ]
  %12 = phi i32 [ 0, %1 ], [ %19, %10 ]
  %13 = getelementptr inbounds nuw i8, ptr %2, i32 %11
  %14 = load i8, ptr %13, align 1, !tbaa !13
  %15 = icmp ugt i8 %14, 4
  %16 = zext i8 %14 to i32
  %17 = add nsw i32 %16, -2
  %18 = select i1 %15, i32 %17, i32 0
  %19 = add i32 %18, %12
  %20 = add nuw nsw i32 %11, 1
  %21 = icmp eq i32 %20, %5
  br i1 %21, label %6, label %10, !llvm.loop !68

22:                                               ; preds = %6, %66
  %23 = phi i32 [ %68, %66 ], [ 3, %6 ]
  %24 = phi i32 [ %67, %66 ], [ %19, %6 ]
  %25 = getelementptr i8, ptr %2, i32 %23
  %26 = getelementptr i8, ptr %25, i32 -2
  %27 = load i8, ptr %26, align 1, !tbaa !13
  %28 = add nuw nsw i32 %23, 2
  %29 = getelementptr inbounds nuw i8, ptr %2, i32 %28
  %30 = load i8, ptr %29, align 1, !tbaa !13
  %31 = icmp eq i8 %27, %30
  br i1 %31, label %32, label %66

32:                                               ; preds = %22
  %33 = getelementptr i8, ptr %25, i32 -1
  %34 = load i8, ptr %33, align 1, !tbaa !13
  %35 = zext i8 %34 to i32
  %36 = icmp eq i8 %27, %34
  br i1 %36, label %37, label %66

37:                                               ; preds = %32
  %38 = getelementptr inbounds nuw i8, ptr %25, i32 1
  %39 = load i8, ptr %38, align 1, !tbaa !13
  %40 = icmp eq i8 %27, %39
  br i1 %40, label %41, label %66

41:                                               ; preds = %37
  %42 = mul nuw nsw i32 %35, 3
  %43 = load i8, ptr %25, align 1, !tbaa !13
  %44 = zext i8 %43 to i32
  %45 = icmp eq i32 %42, %44
  br i1 %45, label %46, label %66

46:                                               ; preds = %41
  %47 = getelementptr i8, ptr %25, i32 -3
  %48 = load i8, ptr %47, align 1, !tbaa !13
  %49 = zext i8 %48 to i32
  %50 = icmp eq i8 %48, 0
  br i1 %50, label %64, label %51

51:                                               ; preds = %46
  %52 = add nuw nsw i32 %23, 3
  %53 = icmp samesign ugt i32 %52, %7
  br i1 %53, label %64, label %54

54:                                               ; preds = %51
  %55 = mul nuw nsw i32 %49, 3
  %56 = mul nuw nsw i32 %35, 12
  %57 = icmp samesign ult i32 %55, %56
  br i1 %57, label %58, label %64

58:                                               ; preds = %54
  %59 = getelementptr inbounds nuw i8, ptr %2, i32 %52
  %60 = load i8, ptr %59, align 1, !tbaa !13
  %61 = zext i8 %60 to i32
  %62 = mul nuw nsw i32 %61, 3
  %63 = icmp samesign ult i32 %62, %56
  br i1 %63, label %66, label %64

64:                                               ; preds = %58, %54, %51, %46
  %65 = add i32 %24, 40
  br label %66

66:                                               ; preds = %22, %32, %37, %41, %58, %64
  %67 = phi i32 [ %65, %64 ], [ %24, %58 ], [ %24, %41 ], [ %24, %37 ], [ %24, %32 ], [ %24, %22 ]
  %68 = and i32 %28, 255
  %69 = icmp slt i32 %68, %8
  br i1 %69, label %22, label %70, !llvm.loop !69

70:                                               ; preds = %66, %6
  %71 = phi i32 [ %19, %6 ], [ %67, %66 ]
  ret i32 %71
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.umax.i8(i8, i8) #4

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.umin.i8(i8, i8) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #5

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #4

attributes #0 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { nofree norecurse nosync nounwind memory(read, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
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
!11 = !{!"p1 omnipotent char", !12, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!8, !8, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !15}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !15, !19, !20}
!19 = !{!"llvm.loop.isvectorized", i32 1}
!20 = !{!"llvm.loop.unroll.runtime.disable"}
!21 = distinct !{!21, !15}
!22 = distinct !{!22, !15}
!23 = distinct !{!23, !15, !20, !19}
!24 = distinct !{!24, !15}
!25 = distinct !{!25, !15}
!26 = distinct !{!26, !15}
!27 = distinct !{!27, !15}
!28 = distinct !{!28, !15}
!29 = distinct !{!29, !15}
!30 = distinct !{!30, !15}
!31 = distinct !{!31, !15}
!32 = distinct !{!32, !15}
!33 = distinct !{!33, !15}
!34 = distinct !{!34, !15}
!35 = distinct !{!35, !15}
!36 = distinct !{!36, !15}
!37 = distinct !{!37, !15}
!38 = distinct !{!38, !15}
!39 = distinct !{!39, !15}
!40 = distinct !{!40, !15}
!41 = distinct !{!41, !15}
!42 = distinct !{!42, !15}
!43 = distinct !{!43, !15}
!44 = distinct !{!44, !15}
!45 = distinct !{!45, !15}
!46 = distinct !{!46, !15}
!47 = distinct !{!47, !15}
!48 = distinct !{!48, !15}
!49 = distinct !{!49, !15}
!50 = distinct !{!50, !15}
!51 = distinct !{!51, !15}
!52 = distinct !{!52, !15}
!53 = distinct !{!53, !15}
!54 = distinct !{!54, !15}
!55 = distinct !{!55, !15}
!56 = distinct !{!56, !15}
!57 = distinct !{!57, !15}
!58 = distinct !{!58, !15}
!59 = distinct !{!59, !15}
!60 = !{!61}
!61 = distinct !{!61, !62}
!62 = distinct !{!62, !"LVerDomain"}
!63 = !{!64}
!64 = distinct !{!64, !62}
!65 = distinct !{!65, !15, !19, !20}
!66 = distinct !{!66, !15, !19}
!67 = distinct !{!67, !15}
!68 = distinct !{!68, !15}
!69 = distinct !{!69, !15}
