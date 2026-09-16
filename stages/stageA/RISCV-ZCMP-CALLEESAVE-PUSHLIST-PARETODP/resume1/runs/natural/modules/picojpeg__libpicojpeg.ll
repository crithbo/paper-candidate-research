; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1\resources\corpus\embench\src\picojpeg\libpicojpeg.c'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\\resume1\\resources\\corpus\\embench\\src\\picojpeg\\libpicojpeg.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

%struct.HuffTableT = type { [16 x i16], [16 x i16], [16 x i8] }

@gWinogradQuant = dso_local local_unnamed_addr constant [64 x i8] c"\80\B2\B2\A7\F6\A7\97\E8\E8\97\80\D1\DB\D1\80e\B2\C5\C5\B2eE\8B\A7\B1\A7\8BE#`\83\97\97\83`#1[v\80v[1.QeeQ.*EOE*#66#\1C%\1C\13\13\0A", align 1
@gCallbackStatus = internal unnamed_addr global i8 0, align 1
@gNumMCUSRemaining = internal unnamed_addr global i16 0, align 2
@g_pNeedBytesCallback = internal unnamed_addr global ptr null, align 4
@g_pCallback_data = internal unnamed_addr global ptr null, align 4
@gReduce = internal unnamed_addr global i8 0, align 1
@gImageXSize = internal unnamed_addr global i16 0, align 2
@gImageYSize = internal unnamed_addr global i16 0, align 2
@gCompsInFrame = internal unnamed_addr global i8 0, align 1
@gScanType = internal unnamed_addr global i32 0, align 4
@gMaxMCUSPerRow = internal unnamed_addr global i16 0, align 2
@gMaxMCUSPerCol = internal unnamed_addr global i16 0, align 2
@gMaxMCUXSize = internal unnamed_addr global i8 0, align 1
@gMaxMCUYSize = internal unnamed_addr global i8 0, align 1
@gMCUBufR = internal global [256 x i8] zeroinitializer, align 1
@gMCUBufG = internal global [256 x i8] zeroinitializer, align 1
@gMCUBufB = internal global [256 x i8] zeroinitializer, align 1
@spectral_start = dso_local global i8 0, align 1
@spectral_end = dso_local global i8 0, align 1
@successive_high = dso_local global i8 0, align 1
@successive_low = dso_local global i8 0, align 1
@gRestartInterval = internal unnamed_addr global i16 0, align 2
@gRestartsLeft = internal unnamed_addr global i16 0, align 2
@gMaxBlocksPerMCU = internal unnamed_addr global i8 0, align 1
@gMCUOrg = internal unnamed_addr global [6 x i8] zeroinitializer, align 1
@gCompQuant = internal unnamed_addr global [3 x i8] zeroinitializer, align 1
@gCompDCTab = internal unnamed_addr global [3 x i8] zeroinitializer, align 1
@gQuant1 = internal unnamed_addr global [64 x i16] zeroinitializer, align 2
@gQuant0 = internal unnamed_addr global [64 x i16] zeroinitializer, align 2
@gHuffTab1 = internal global %struct.HuffTableT zeroinitializer, align 2
@gHuffTab0 = internal global %struct.HuffTableT zeroinitializer, align 2
@gHuffVal1 = internal global [16 x i8] zeroinitializer, align 1
@gHuffVal0 = internal global [16 x i8] zeroinitializer, align 1
@gLastDC = internal unnamed_addr global [3 x i16] zeroinitializer, align 2
@gCoeffBuf = internal unnamed_addr global [64 x i16] zeroinitializer, align 2
@gCompACTab = internal unnamed_addr global [3 x i8] zeroinitializer, align 1
@gHuffTab3 = internal global %struct.HuffTableT zeroinitializer, align 2
@gHuffTab2 = internal global %struct.HuffTableT zeroinitializer, align 2
@gHuffVal3 = internal global [256 x i8] zeroinitializer, align 1
@gHuffVal2 = internal global [256 x i8] zeroinitializer, align 1
@ZAG = internal unnamed_addr constant [64 x i8] c"\00\01\08\10\09\02\03\0A\11\18 \19\12\0B\04\05\0C\13\1A!(0)\22\1B\14\0D\06\07\0E\15\1C#*1892+$\1D\16\0F\17\1E%,3:;4-&\1F'.5<=6/7>?", align 1
@gNextRestartNum = internal unnamed_addr global i16 0, align 2
@gBitsLeft = internal unnamed_addr global i8 0, align 1
@gInBufLeft = internal global i8 0, align 1
@gTemFlag = internal unnamed_addr global i8 0, align 1
@gInBuf = internal global [256 x i8] zeroinitializer, align 1
@gInBufOfs = internal unnamed_addr global i8 0, align 1
@gBitBuf = internal unnamed_addr global i16 0, align 2
@gCompsInScan = internal unnamed_addr global i8 0, align 1
@gValidHuffTables = internal unnamed_addr global i8 0, align 1
@gValidQuantTables = internal unnamed_addr global i8 0, align 1
@gCompIdent = internal unnamed_addr global [3 x i8] zeroinitializer, align 1
@gCompHSamp = internal unnamed_addr global [3 x i8] zeroinitializer, align 1
@gCompVSamp = internal unnamed_addr global [3 x i8] zeroinitializer, align 1
@gCompList = internal unnamed_addr global [3 x i8] zeroinitializer, align 1
@switch.table.huffExtend = private unnamed_addr constant [15 x i16] [i16 1, i16 2, i16 4, i16 8, i16 16, i16 32, i16 64, i16 128, i16 256, i16 512, i16 1024, i16 2048, i16 4096, i16 8192, i16 16384], align 2
@switch.table.huffExtend.1 = private unnamed_addr constant [15 x i16] [i16 -1, i16 -3, i16 -7, i16 -15, i16 -31, i16 -63, i16 -127, i16 -255, i16 -511, i16 -1023, i16 -2047, i16 -4095, i16 -8191, i16 -16383, i16 -32767], align 2

; Function Attrs: nounwind
define dso_local zeroext i8 @pjpeg_decode_mcu() local_unnamed_addr #0 {
  %1 = load i8, ptr @gCallbackStatus, align 1, !tbaa !10
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %3, label %1728

3:                                                ; preds = %0
  %4 = load i16, ptr @gNumMCUSRemaining, align 2, !tbaa !11
  %5 = icmp eq i16 %4, 0
  br i1 %5, label %1728, label %6

6:                                                ; preds = %3
  %7 = load i16, ptr @gRestartInterval, align 2, !tbaa !11
  %8 = icmp eq i16 %7, 0
  br i1 %8, label %103, label %9

9:                                                ; preds = %6
  %10 = load i16, ptr @gRestartsLeft, align 2, !tbaa !11
  %11 = icmp eq i16 %10, 0
  br i1 %11, label %12, label %100

12:                                               ; preds = %9
  %13 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  br label %14

14:                                               ; preds = %42, %12
  %15 = phi i8 [ %13, %12 ], [ %43, %42 ]
  %16 = phi i16 [ 1536, %12 ], [ %44, %42 ]
  %17 = icmp eq i8 %15, 0
  br i1 %17, label %18, label %33

18:                                               ; preds = %14
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %19 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %20 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %21 = tail call zeroext i8 %19(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %20) #6
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %24, label %23

23:                                               ; preds = %18
  store i8 %21, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %24

24:                                               ; preds = %23, %18
  %25 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %27, label %33

27:                                               ; preds = %24
  %28 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %29 = xor i8 %28, -1
  store i8 %29, ptr @gTemFlag, align 1, !tbaa !10
  %30 = icmp eq i8 %28, -1
  br i1 %30, label %42, label %31

31:                                               ; preds = %33, %27
  %32 = phi i8 [ %35, %33 ], [ 0, %27 ]
  br label %46

33:                                               ; preds = %24, %14
  %34 = phi i8 [ %25, %24 ], [ %15, %14 ]
  %35 = add i8 %34, -1
  store i8 %35, ptr @gInBufLeft, align 1, !tbaa !10
  %36 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %37 = add i8 %36, 1
  store i8 %37, ptr @gInBufOfs, align 1, !tbaa !10
  %38 = zext i8 %36 to i32
  %39 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %38
  %40 = load i8, ptr %39, align 1, !tbaa !10
  %41 = icmp eq i8 %40, -1
  br i1 %41, label %31, label %42

42:                                               ; preds = %33, %27
  %43 = phi i8 [ 0, %27 ], [ %35, %33 ]
  %44 = add nsw i16 %16, -1
  %45 = icmp eq i16 %44, 0
  br i1 %45, label %1717, label %14, !llvm.loop !15

46:                                               ; preds = %31, %72
  %47 = phi i8 [ %73, %72 ], [ %32, %31 ]
  %48 = phi i16 [ %74, %72 ], [ %16, %31 ]
  %49 = icmp eq i8 %47, 0
  br i1 %49, label %50, label %63

50:                                               ; preds = %46
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %51 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %52 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %53 = tail call zeroext i8 %51(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %52) #6
  %54 = icmp eq i8 %53, 0
  br i1 %54, label %56, label %55

55:                                               ; preds = %50
  store i8 %53, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %56

56:                                               ; preds = %55, %50
  %57 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %58 = icmp eq i8 %57, 0
  br i1 %58, label %59, label %63

59:                                               ; preds = %56
  %60 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %61 = xor i8 %60, -1
  store i8 %61, ptr @gTemFlag, align 1, !tbaa !10
  %62 = icmp eq i8 %60, -1
  br i1 %62, label %76, label %72

63:                                               ; preds = %56, %46
  %64 = phi i8 [ %57, %56 ], [ %47, %46 ]
  %65 = add i8 %64, -1
  store i8 %65, ptr @gInBufLeft, align 1, !tbaa !10
  %66 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %67 = add i8 %66, 1
  store i8 %67, ptr @gInBufOfs, align 1, !tbaa !10
  %68 = zext i8 %66 to i32
  %69 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %68
  %70 = load i8, ptr %69, align 1, !tbaa !10
  %71 = icmp eq i8 %70, -1
  br i1 %71, label %72, label %76

72:                                               ; preds = %63, %59
  %73 = phi i8 [ 0, %59 ], [ %65, %63 ]
  %74 = add nsw i16 %48, -1
  %75 = icmp eq i16 %74, 0
  br i1 %75, label %1717, label %46, !llvm.loop !17

76:                                               ; preds = %63, %59
  %77 = phi i8 [ %70, %63 ], [ -39, %59 ]
  %78 = zext i8 %77 to i32
  %79 = load i16, ptr @gNextRestartNum, align 2, !tbaa !11
  %80 = zext nneg i16 %79 to i32
  %81 = add nuw nsw i32 %80, 208
  %82 = icmp eq i32 %81, %78
  br i1 %82, label %83, label %1717

83:                                               ; preds = %76
  store i16 0, ptr @gLastDC, align 2, !tbaa !11
  store i16 0, ptr getelementptr inbounds nuw (i8, ptr @gLastDC, i32 2), align 2, !tbaa !11
  store i16 0, ptr getelementptr inbounds nuw (i8, ptr @gLastDC, i32 4), align 2, !tbaa !11
  %84 = load i16, ptr @gRestartInterval, align 2, !tbaa !11
  store i16 %84, ptr @gRestartsLeft, align 2, !tbaa !11
  %85 = add i16 %79, 1
  %86 = and i16 %85, 7
  store i16 %86, ptr @gNextRestartNum, align 2, !tbaa !11
  %87 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %88 = shl i16 %87, 8
  store i8 0, ptr @gBitsLeft, align 1, !tbaa !10
  store i16 %88, ptr @gBitBuf, align 2, !tbaa !11
  %89 = tail call fastcc zeroext i8 @getOctet(i8 noundef zeroext 1) #7
  %90 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %91 = zext i8 %89 to i16
  %92 = or i16 %90, %91
  %93 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %94 = zext i8 %93 to i32
  %95 = sub nsw i32 8, %94
  %96 = zext i16 %92 to i32
  %97 = shl nuw nsw i32 %96, %95
  %98 = trunc i32 %97 to i16
  store i16 %98, ptr @gBitBuf, align 2, !tbaa !11
  %99 = load i16, ptr @gRestartsLeft, align 2, !tbaa !11
  br label %100

100:                                              ; preds = %83, %9
  %101 = phi i16 [ %99, %83 ], [ %10, %9 ]
  %102 = add i16 %101, -1
  store i16 %102, ptr @gRestartsLeft, align 2, !tbaa !11
  br label %103

103:                                              ; preds = %100, %6
  %104 = load i8, ptr @gMaxBlocksPerMCU, align 1, !tbaa !10
  %105 = icmp eq i8 %104, 0
  br i1 %105, label %1722, label %106

106:                                              ; preds = %103, %1712
  %107 = phi i32 [ %1713, %1712 ], [ 0, %103 ]
  %108 = getelementptr inbounds nuw i8, ptr @gMCUOrg, i32 %107
  %109 = load i8, ptr %108, align 1, !tbaa !10
  %110 = zext i8 %109 to i32
  %111 = getelementptr inbounds nuw i8, ptr @gCompQuant, i32 %110
  %112 = load i8, ptr %111, align 1, !tbaa !10
  %113 = getelementptr inbounds nuw i8, ptr @gCompDCTab, i32 %110
  %114 = load i8, ptr %113, align 1, !tbaa !10
  %115 = icmp eq i8 %112, 0
  %116 = select i1 %115, ptr @gQuant0, ptr @gQuant1
  %117 = icmp eq i8 %114, 0
  %118 = select i1 %117, ptr @gHuffTab0, ptr @gHuffTab1
  %119 = select i1 %117, ptr @gHuffVal0, ptr @gHuffVal1
  %120 = tail call fastcc zeroext i8 @huffDecode(ptr noundef nonnull %118, ptr noundef nonnull %119) #7
  %121 = and i8 %120, 15
  %122 = icmp eq i8 %121, 0
  br i1 %122, label %125, label %123

123:                                              ; preds = %106
  %124 = tail call fastcc zeroext i16 @getBits(i8 noundef zeroext range(i8 1, 0) %121, i8 noundef zeroext 1) #7
  br label %125

125:                                              ; preds = %123, %106
  %126 = phi i16 [ %124, %123 ], [ 0, %106 ]
  %127 = tail call fastcc signext i16 @huffExtend(i16 noundef zeroext %126, i8 noundef zeroext %120) #7
  %128 = getelementptr inbounds nuw i16, ptr @gLastDC, i32 %110
  %129 = load i16, ptr %128, align 2, !tbaa !11
  %130 = add i16 %129, %127
  store i16 %130, ptr %128, align 2, !tbaa !11
  %131 = load i16, ptr %116, align 2, !tbaa !11
  %132 = mul i16 %131, %130
  store i16 %132, ptr @gCoeffBuf, align 2, !tbaa !11
  %133 = getelementptr inbounds nuw i8, ptr @gCompACTab, i32 %110
  %134 = load i8, ptr %133, align 1, !tbaa !10
  %135 = load i8, ptr @gReduce, align 1, !tbaa !10
  %136 = icmp eq i8 %135, 0
  %137 = icmp eq i8 %134, 0
  %138 = select i1 %137, ptr @gHuffTab2, ptr @gHuffTab3
  %139 = select i1 %137, ptr @gHuffVal2, ptr @gHuffVal3
  br i1 %136, label %570, label %140

140:                                              ; preds = %125, %158
  %141 = phi i8 [ %160, %158 ], [ 1, %125 ]
  %142 = tail call fastcc zeroext i8 @huffDecode(ptr noundef nonnull %138, ptr noundef nonnull %139) #7
  %143 = and i8 %142, 15
  %144 = icmp eq i8 %143, 0
  br i1 %144, label %152, label %145

145:                                              ; preds = %140
  %146 = tail call fastcc zeroext i16 @getBits(i8 noundef zeroext range(i8 1, 0) %143, i8 noundef zeroext 1) #7
  %147 = lshr i8 %142, 4
  %148 = icmp eq i8 %147, 0
  br i1 %148, label %158, label %149

149:                                              ; preds = %145
  %150 = add nuw nsw i8 %147, %141
  %151 = icmp samesign ugt i8 %150, 63
  br i1 %151, label %1717, label %158

152:                                              ; preds = %140
  %153 = icmp eq i8 %142, -16
  br i1 %153, label %154, label %162

154:                                              ; preds = %152
  %155 = icmp samesign ugt i8 %141, 48
  br i1 %155, label %1717, label %156

156:                                              ; preds = %154
  %157 = add nuw nsw i8 %141, 15
  br label %158

158:                                              ; preds = %156, %149, %145
  %159 = phi i8 [ %157, %156 ], [ %141, %145 ], [ %150, %149 ]
  %160 = add nuw nsw i8 %159, 1
  %161 = icmp ult i8 %159, 63
  br i1 %161, label %140, label %162, !llvm.loop !18

162:                                              ; preds = %158, %152
  %163 = load i16, ptr @gCoeffBuf, align 2, !tbaa !11
  %164 = sext i16 %163 to i32
  %165 = add nsw i32 %164, 64
  %166 = lshr i32 %165, 7
  %167 = trunc i32 %166 to i16
  %168 = add i16 %167, 128
  %169 = icmp ugt i16 %168, 255
  %170 = trunc nuw i16 %168 to i8
  %171 = icmp sgt i16 %168, -1
  %172 = sext i1 %171 to i8
  %173 = select i1 %169, i8 %172, i8 %170
  %174 = load i32, ptr @gScanType, align 4, !tbaa !6
  switch i32 %174, label %569 [
    i32 0, label %175
    i32 1, label %176
    i32 3, label %233
    i32 2, label %323
    i32 4, label %413
  ]

175:                                              ; preds = %162
  store i8 %173, ptr @gMCUBufR, align 1, !tbaa !10
  br label %1712

176:                                              ; preds = %162
  %177 = trunc nuw i32 %107 to i8
  switch i8 %177, label %1712 [
    i8 0, label %178
    i8 1, label %179
    i8 2, label %206
  ]

178:                                              ; preds = %176
  store i8 %173, ptr @gMCUBufR, align 1, !tbaa !10
  store i8 %173, ptr @gMCUBufG, align 1, !tbaa !10
  store i8 %173, ptr @gMCUBufB, align 1, !tbaa !10
  br label %1712

179:                                              ; preds = %176
  %180 = zext i8 %173 to i32
  %181 = mul nuw nsw i32 %180, 88
  %182 = lshr i32 %181, 8
  %183 = trunc nuw nsw i32 %182 to i16
  %184 = load i8, ptr @gMCUBufG, align 1, !tbaa !10
  %185 = zext i8 %184 to i16
  %186 = sub nsw i16 %185, %183
  %187 = add nsw i16 %186, 44
  %188 = icmp ugt i16 %187, 255
  %189 = trunc nuw i16 %187 to i8
  %190 = icmp sgt i16 %186, -45
  %191 = sext i1 %190 to i8
  %192 = select i1 %188, i8 %191, i8 %189
  store i8 %192, ptr @gMCUBufG, align 1, !tbaa !10
  %193 = mul nuw nsw i32 %180, 198
  %194 = lshr i32 %193, 8
  %195 = add nuw nsw i32 %194, %180
  %196 = trunc nuw nsw i32 %195 to i16
  %197 = add nsw i16 %196, -227
  %198 = load i8, ptr @gMCUBufB, align 1, !tbaa !10
  %199 = zext i8 %198 to i16
  %200 = add nsw i16 %197, %199
  %201 = icmp ugt i16 %200, 255
  %202 = trunc nuw i16 %200 to i8
  %203 = icmp sgt i16 %200, -1
  %204 = sext i1 %203 to i8
  %205 = select i1 %201, i8 %204, i8 %202
  store i8 %205, ptr @gMCUBufB, align 1, !tbaa !10
  br label %1712

206:                                              ; preds = %176
  %207 = zext i8 %173 to i32
  %208 = mul nuw nsw i32 %207, 103
  %209 = lshr i32 %208, 8
  %210 = add nuw nsw i32 %209, %207
  %211 = trunc nuw nsw i32 %210 to i16
  %212 = add nsw i16 %211, -179
  %213 = load i8, ptr @gMCUBufR, align 1, !tbaa !10
  %214 = zext i8 %213 to i16
  %215 = add nsw i16 %212, %214
  %216 = icmp ugt i16 %215, 255
  %217 = trunc nuw i16 %215 to i8
  %218 = icmp sgt i16 %215, -1
  %219 = sext i1 %218 to i8
  %220 = select i1 %216, i8 %219, i8 %217
  store i8 %220, ptr @gMCUBufR, align 1, !tbaa !10
  %221 = mul nuw nsw i32 %207, 183
  %222 = lshr i32 %221, 8
  %223 = trunc nuw nsw i32 %222 to i16
  %224 = load i8, ptr @gMCUBufG, align 1, !tbaa !10
  %225 = zext i8 %224 to i16
  %226 = sub nsw i16 %225, %223
  %227 = add nsw i16 %226, 91
  %228 = icmp ugt i16 %227, 255
  %229 = trunc nuw i16 %227 to i8
  %230 = icmp sgt i16 %226, -92
  %231 = sext i1 %230 to i8
  %232 = select i1 %228, i8 %231, i8 %229
  store i8 %232, ptr @gMCUBufG, align 1, !tbaa !10
  br label %1712

233:                                              ; preds = %162
  %234 = trunc nuw i32 %107 to i8
  switch i8 %234, label %1712 [
    i8 0, label %235
    i8 1, label %236
    i8 2, label %237
    i8 3, label %280
  ]

235:                                              ; preds = %233
  store i8 %173, ptr @gMCUBufR, align 1, !tbaa !10
  store i8 %173, ptr @gMCUBufG, align 1, !tbaa !10
  store i8 %173, ptr @gMCUBufB, align 1, !tbaa !10
  br label %1712

236:                                              ; preds = %233
  store i8 %173, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 128), align 1, !tbaa !10
  store i8 %173, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 128), align 1, !tbaa !10
  store i8 %173, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 128), align 1, !tbaa !10
  br label %1712

237:                                              ; preds = %233
  %238 = zext i8 %173 to i32
  %239 = mul nuw nsw i32 %238, 88
  %240 = lshr i32 %239, 8
  %241 = trunc nuw nsw i32 %240 to i16
  %242 = add nsw i16 %241, -44
  %243 = load i8, ptr @gMCUBufG, align 1, !tbaa !10
  %244 = zext i8 %243 to i16
  %245 = sub nsw i16 %244, %242
  %246 = icmp ugt i16 %245, 255
  %247 = trunc nuw i16 %245 to i8
  %248 = icmp sgt i16 %245, -1
  %249 = sext i1 %248 to i8
  %250 = select i1 %246, i8 %249, i8 %247
  store i8 %250, ptr @gMCUBufG, align 1, !tbaa !10
  %251 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 128), align 1, !tbaa !10
  %252 = zext i8 %251 to i16
  %253 = sub nsw i16 %252, %242
  %254 = icmp ugt i16 %253, 255
  %255 = trunc nuw i16 %253 to i8
  %256 = icmp sgt i16 %253, -1
  %257 = sext i1 %256 to i8
  %258 = select i1 %254, i8 %257, i8 %255
  store i8 %258, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 128), align 1, !tbaa !10
  %259 = mul nuw nsw i32 %238, 198
  %260 = lshr i32 %259, 8
  %261 = add nuw nsw i32 %260, %238
  %262 = trunc nuw nsw i32 %261 to i16
  %263 = add nsw i16 %262, -227
  %264 = load i8, ptr @gMCUBufB, align 1, !tbaa !10
  %265 = zext i8 %264 to i16
  %266 = add nsw i16 %263, %265
  %267 = icmp ugt i16 %266, 255
  %268 = trunc nuw i16 %266 to i8
  %269 = icmp sgt i16 %266, -1
  %270 = sext i1 %269 to i8
  %271 = select i1 %267, i8 %270, i8 %268
  store i8 %271, ptr @gMCUBufB, align 1, !tbaa !10
  %272 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 128), align 1, !tbaa !10
  %273 = zext i8 %272 to i16
  %274 = add nsw i16 %263, %273
  %275 = icmp ugt i16 %274, 255
  %276 = trunc nuw i16 %274 to i8
  %277 = icmp sgt i16 %274, -1
  %278 = sext i1 %277 to i8
  %279 = select i1 %275, i8 %278, i8 %276
  store i8 %279, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 128), align 1, !tbaa !10
  br label %1712

280:                                              ; preds = %233
  %281 = zext i8 %173 to i32
  %282 = mul nuw nsw i32 %281, 103
  %283 = lshr i32 %282, 8
  %284 = add nuw nsw i32 %283, %281
  %285 = trunc nuw nsw i32 %284 to i16
  %286 = add nsw i16 %285, -179
  %287 = load i8, ptr @gMCUBufR, align 1, !tbaa !10
  %288 = zext i8 %287 to i16
  %289 = add nsw i16 %286, %288
  %290 = icmp ugt i16 %289, 255
  %291 = trunc nuw i16 %289 to i8
  %292 = icmp sgt i16 %289, -1
  %293 = sext i1 %292 to i8
  %294 = select i1 %290, i8 %293, i8 %291
  store i8 %294, ptr @gMCUBufR, align 1, !tbaa !10
  %295 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 128), align 1, !tbaa !10
  %296 = zext i8 %295 to i16
  %297 = add nsw i16 %286, %296
  %298 = icmp ugt i16 %297, 255
  %299 = trunc nuw i16 %297 to i8
  %300 = icmp sgt i16 %297, -1
  %301 = sext i1 %300 to i8
  %302 = select i1 %298, i8 %301, i8 %299
  store i8 %302, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 128), align 1, !tbaa !10
  %303 = mul nuw nsw i32 %281, 183
  %304 = lshr i32 %303, 8
  %305 = trunc nuw nsw i32 %304 to i16
  %306 = add nsw i16 %305, -91
  %307 = load i8, ptr @gMCUBufG, align 1, !tbaa !10
  %308 = zext i8 %307 to i16
  %309 = sub nsw i16 %308, %306
  %310 = icmp ugt i16 %309, 255
  %311 = trunc nuw i16 %309 to i8
  %312 = icmp sgt i16 %309, -1
  %313 = sext i1 %312 to i8
  %314 = select i1 %310, i8 %313, i8 %311
  store i8 %314, ptr @gMCUBufG, align 1, !tbaa !10
  %315 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 128), align 1, !tbaa !10
  %316 = zext i8 %315 to i16
  %317 = sub nsw i16 %316, %306
  %318 = icmp ugt i16 %317, 255
  %319 = trunc nuw i16 %317 to i8
  %320 = icmp sgt i16 %317, -1
  %321 = sext i1 %320 to i8
  %322 = select i1 %318, i8 %321, i8 %319
  store i8 %322, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 128), align 1, !tbaa !10
  br label %1712

323:                                              ; preds = %162
  %324 = trunc nuw i32 %107 to i8
  switch i8 %324, label %1712 [
    i8 0, label %325
    i8 1, label %326
    i8 2, label %327
    i8 3, label %370
  ]

325:                                              ; preds = %323
  store i8 %173, ptr @gMCUBufR, align 1, !tbaa !10
  store i8 %173, ptr @gMCUBufG, align 1, !tbaa !10
  store i8 %173, ptr @gMCUBufB, align 1, !tbaa !10
  br label %1712

326:                                              ; preds = %323
  store i8 %173, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 64), align 1, !tbaa !10
  store i8 %173, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 64), align 1, !tbaa !10
  store i8 %173, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 64), align 1, !tbaa !10
  br label %1712

327:                                              ; preds = %323
  %328 = zext i8 %173 to i32
  %329 = mul nuw nsw i32 %328, 88
  %330 = lshr i32 %329, 8
  %331 = trunc nuw nsw i32 %330 to i16
  %332 = add nsw i16 %331, -44
  %333 = load i8, ptr @gMCUBufG, align 1, !tbaa !10
  %334 = zext i8 %333 to i16
  %335 = sub nsw i16 %334, %332
  %336 = icmp ugt i16 %335, 255
  %337 = trunc nuw i16 %335 to i8
  %338 = icmp sgt i16 %335, -1
  %339 = sext i1 %338 to i8
  %340 = select i1 %336, i8 %339, i8 %337
  store i8 %340, ptr @gMCUBufG, align 1, !tbaa !10
  %341 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 64), align 1, !tbaa !10
  %342 = zext i8 %341 to i16
  %343 = sub nsw i16 %342, %332
  %344 = icmp ugt i16 %343, 255
  %345 = trunc nuw i16 %343 to i8
  %346 = icmp sgt i16 %343, -1
  %347 = sext i1 %346 to i8
  %348 = select i1 %344, i8 %347, i8 %345
  store i8 %348, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 64), align 1, !tbaa !10
  %349 = mul nuw nsw i32 %328, 198
  %350 = lshr i32 %349, 8
  %351 = add nuw nsw i32 %350, %328
  %352 = trunc nuw nsw i32 %351 to i16
  %353 = add nsw i16 %352, -227
  %354 = load i8, ptr @gMCUBufB, align 1, !tbaa !10
  %355 = zext i8 %354 to i16
  %356 = add nsw i16 %353, %355
  %357 = icmp ugt i16 %356, 255
  %358 = trunc nuw i16 %356 to i8
  %359 = icmp sgt i16 %356, -1
  %360 = sext i1 %359 to i8
  %361 = select i1 %357, i8 %360, i8 %358
  store i8 %361, ptr @gMCUBufB, align 1, !tbaa !10
  %362 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 64), align 1, !tbaa !10
  %363 = zext i8 %362 to i16
  %364 = add nsw i16 %353, %363
  %365 = icmp ugt i16 %364, 255
  %366 = trunc nuw i16 %364 to i8
  %367 = icmp sgt i16 %364, -1
  %368 = sext i1 %367 to i8
  %369 = select i1 %365, i8 %368, i8 %366
  store i8 %369, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 64), align 1, !tbaa !10
  br label %1712

370:                                              ; preds = %323
  %371 = zext i8 %173 to i32
  %372 = mul nuw nsw i32 %371, 103
  %373 = lshr i32 %372, 8
  %374 = add nuw nsw i32 %373, %371
  %375 = trunc nuw nsw i32 %374 to i16
  %376 = add nsw i16 %375, -179
  %377 = load i8, ptr @gMCUBufR, align 1, !tbaa !10
  %378 = zext i8 %377 to i16
  %379 = add nsw i16 %376, %378
  %380 = icmp ugt i16 %379, 255
  %381 = trunc nuw i16 %379 to i8
  %382 = icmp sgt i16 %379, -1
  %383 = sext i1 %382 to i8
  %384 = select i1 %380, i8 %383, i8 %381
  store i8 %384, ptr @gMCUBufR, align 1, !tbaa !10
  %385 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 64), align 1, !tbaa !10
  %386 = zext i8 %385 to i16
  %387 = add nsw i16 %376, %386
  %388 = icmp ugt i16 %387, 255
  %389 = trunc nuw i16 %387 to i8
  %390 = icmp sgt i16 %387, -1
  %391 = sext i1 %390 to i8
  %392 = select i1 %388, i8 %391, i8 %389
  store i8 %392, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 64), align 1, !tbaa !10
  %393 = mul nuw nsw i32 %371, 183
  %394 = lshr i32 %393, 8
  %395 = trunc nuw nsw i32 %394 to i16
  %396 = add nsw i16 %395, -91
  %397 = load i8, ptr @gMCUBufG, align 1, !tbaa !10
  %398 = zext i8 %397 to i16
  %399 = sub nsw i16 %398, %396
  %400 = icmp ugt i16 %399, 255
  %401 = trunc nuw i16 %399 to i8
  %402 = icmp sgt i16 %399, -1
  %403 = sext i1 %402 to i8
  %404 = select i1 %400, i8 %403, i8 %401
  store i8 %404, ptr @gMCUBufG, align 1, !tbaa !10
  %405 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 64), align 1, !tbaa !10
  %406 = zext i8 %405 to i16
  %407 = sub nsw i16 %406, %396
  %408 = icmp ugt i16 %407, 255
  %409 = trunc nuw i16 %407 to i8
  %410 = icmp sgt i16 %407, -1
  %411 = sext i1 %410 to i8
  %412 = select i1 %408, i8 %411, i8 %409
  store i8 %412, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 64), align 1, !tbaa !10
  br label %1712

413:                                              ; preds = %162
  %414 = trunc nuw i32 %107 to i8
  switch i8 %414, label %1712 [
    i8 0, label %415
    i8 1, label %416
    i8 2, label %417
    i8 3, label %418
    i8 4, label %419
    i8 5, label %494
  ]

415:                                              ; preds = %413
  store i8 %173, ptr @gMCUBufR, align 1, !tbaa !10
  store i8 %173, ptr @gMCUBufG, align 1, !tbaa !10
  store i8 %173, ptr @gMCUBufB, align 1, !tbaa !10
  br label %1712

416:                                              ; preds = %413
  store i8 %173, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 64), align 1, !tbaa !10
  store i8 %173, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 64), align 1, !tbaa !10
  store i8 %173, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 64), align 1, !tbaa !10
  br label %1712

417:                                              ; preds = %413
  store i8 %173, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 128), align 1, !tbaa !10
  store i8 %173, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 128), align 1, !tbaa !10
  store i8 %173, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 128), align 1, !tbaa !10
  br label %1712

418:                                              ; preds = %413
  store i8 %173, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 192), align 1, !tbaa !10
  store i8 %173, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 192), align 1, !tbaa !10
  store i8 %173, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 192), align 1, !tbaa !10
  br label %1712

419:                                              ; preds = %413
  %420 = zext i8 %173 to i32
  %421 = mul nuw nsw i32 %420, 88
  %422 = lshr i32 %421, 8
  %423 = trunc nuw nsw i32 %422 to i16
  %424 = add nsw i16 %423, -44
  %425 = load i8, ptr @gMCUBufG, align 1, !tbaa !10
  %426 = zext i8 %425 to i16
  %427 = sub nsw i16 %426, %424
  %428 = icmp ugt i16 %427, 255
  %429 = trunc nuw i16 %427 to i8
  %430 = icmp sgt i16 %427, -1
  %431 = sext i1 %430 to i8
  %432 = select i1 %428, i8 %431, i8 %429
  store i8 %432, ptr @gMCUBufG, align 1, !tbaa !10
  %433 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 64), align 1, !tbaa !10
  %434 = zext i8 %433 to i16
  %435 = sub nsw i16 %434, %424
  %436 = icmp ugt i16 %435, 255
  %437 = trunc nuw i16 %435 to i8
  %438 = icmp sgt i16 %435, -1
  %439 = sext i1 %438 to i8
  %440 = select i1 %436, i8 %439, i8 %437
  store i8 %440, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 64), align 1, !tbaa !10
  %441 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 128), align 1, !tbaa !10
  %442 = zext i8 %441 to i16
  %443 = sub nsw i16 %442, %424
  %444 = icmp ugt i16 %443, 255
  %445 = trunc nuw i16 %443 to i8
  %446 = icmp sgt i16 %443, -1
  %447 = sext i1 %446 to i8
  %448 = select i1 %444, i8 %447, i8 %445
  store i8 %448, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 128), align 1, !tbaa !10
  %449 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 192), align 1, !tbaa !10
  %450 = zext i8 %449 to i16
  %451 = sub nsw i16 %450, %424
  %452 = icmp ugt i16 %451, 255
  %453 = trunc nuw i16 %451 to i8
  %454 = icmp sgt i16 %451, -1
  %455 = sext i1 %454 to i8
  %456 = select i1 %452, i8 %455, i8 %453
  store i8 %456, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 192), align 1, !tbaa !10
  %457 = mul nuw nsw i32 %420, 198
  %458 = lshr i32 %457, 8
  %459 = add nuw nsw i32 %458, %420
  %460 = trunc nuw nsw i32 %459 to i16
  %461 = add nsw i16 %460, -227
  %462 = load i8, ptr @gMCUBufB, align 1, !tbaa !10
  %463 = zext i8 %462 to i16
  %464 = add nsw i16 %461, %463
  %465 = icmp ugt i16 %464, 255
  %466 = trunc nuw i16 %464 to i8
  %467 = icmp sgt i16 %464, -1
  %468 = sext i1 %467 to i8
  %469 = select i1 %465, i8 %468, i8 %466
  store i8 %469, ptr @gMCUBufB, align 1, !tbaa !10
  %470 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 64), align 1, !tbaa !10
  %471 = zext i8 %470 to i16
  %472 = add nsw i16 %461, %471
  %473 = icmp ugt i16 %472, 255
  %474 = trunc nuw i16 %472 to i8
  %475 = icmp sgt i16 %472, -1
  %476 = sext i1 %475 to i8
  %477 = select i1 %473, i8 %476, i8 %474
  store i8 %477, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 64), align 1, !tbaa !10
  %478 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 128), align 1, !tbaa !10
  %479 = zext i8 %478 to i16
  %480 = add nsw i16 %461, %479
  %481 = icmp ugt i16 %480, 255
  %482 = trunc nuw i16 %480 to i8
  %483 = icmp sgt i16 %480, -1
  %484 = sext i1 %483 to i8
  %485 = select i1 %481, i8 %484, i8 %482
  store i8 %485, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 128), align 1, !tbaa !10
  %486 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 192), align 1, !tbaa !10
  %487 = zext i8 %486 to i16
  %488 = add nsw i16 %461, %487
  %489 = icmp ugt i16 %488, 255
  %490 = trunc nuw i16 %488 to i8
  %491 = icmp sgt i16 %488, -1
  %492 = sext i1 %491 to i8
  %493 = select i1 %489, i8 %492, i8 %490
  store i8 %493, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 192), align 1, !tbaa !10
  br label %1712

494:                                              ; preds = %413
  %495 = zext i8 %173 to i32
  %496 = mul nuw nsw i32 %495, 103
  %497 = lshr i32 %496, 8
  %498 = add nuw nsw i32 %497, %495
  %499 = trunc nuw nsw i32 %498 to i16
  %500 = add nsw i16 %499, -179
  %501 = load i8, ptr @gMCUBufR, align 1, !tbaa !10
  %502 = zext i8 %501 to i16
  %503 = add nsw i16 %500, %502
  %504 = icmp ugt i16 %503, 255
  %505 = trunc nuw i16 %503 to i8
  %506 = icmp sgt i16 %503, -1
  %507 = sext i1 %506 to i8
  %508 = select i1 %504, i8 %507, i8 %505
  store i8 %508, ptr @gMCUBufR, align 1, !tbaa !10
  %509 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 64), align 1, !tbaa !10
  %510 = zext i8 %509 to i16
  %511 = add nsw i16 %500, %510
  %512 = icmp ugt i16 %511, 255
  %513 = trunc nuw i16 %511 to i8
  %514 = icmp sgt i16 %511, -1
  %515 = sext i1 %514 to i8
  %516 = select i1 %512, i8 %515, i8 %513
  store i8 %516, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 64), align 1, !tbaa !10
  %517 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 128), align 1, !tbaa !10
  %518 = zext i8 %517 to i16
  %519 = add nsw i16 %500, %518
  %520 = icmp ugt i16 %519, 255
  %521 = trunc nuw i16 %519 to i8
  %522 = icmp sgt i16 %519, -1
  %523 = sext i1 %522 to i8
  %524 = select i1 %520, i8 %523, i8 %521
  store i8 %524, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 128), align 1, !tbaa !10
  %525 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 192), align 1, !tbaa !10
  %526 = zext i8 %525 to i16
  %527 = add nsw i16 %500, %526
  %528 = icmp ugt i16 %527, 255
  %529 = trunc nuw i16 %527 to i8
  %530 = icmp sgt i16 %527, -1
  %531 = sext i1 %530 to i8
  %532 = select i1 %528, i8 %531, i8 %529
  store i8 %532, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 192), align 1, !tbaa !10
  %533 = mul nuw nsw i32 %495, 183
  %534 = lshr i32 %533, 8
  %535 = trunc nuw nsw i32 %534 to i16
  %536 = add nsw i16 %535, -91
  %537 = load i8, ptr @gMCUBufG, align 1, !tbaa !10
  %538 = zext i8 %537 to i16
  %539 = sub nsw i16 %538, %536
  %540 = icmp ugt i16 %539, 255
  %541 = trunc nuw i16 %539 to i8
  %542 = icmp sgt i16 %539, -1
  %543 = sext i1 %542 to i8
  %544 = select i1 %540, i8 %543, i8 %541
  store i8 %544, ptr @gMCUBufG, align 1, !tbaa !10
  %545 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 64), align 1, !tbaa !10
  %546 = zext i8 %545 to i16
  %547 = sub nsw i16 %546, %536
  %548 = icmp ugt i16 %547, 255
  %549 = trunc nuw i16 %547 to i8
  %550 = icmp sgt i16 %547, -1
  %551 = sext i1 %550 to i8
  %552 = select i1 %548, i8 %551, i8 %549
  store i8 %552, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 64), align 1, !tbaa !10
  %553 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 128), align 1, !tbaa !10
  %554 = zext i8 %553 to i16
  %555 = sub nsw i16 %554, %536
  %556 = icmp ugt i16 %555, 255
  %557 = trunc nuw i16 %555 to i8
  %558 = icmp sgt i16 %555, -1
  %559 = sext i1 %558 to i8
  %560 = select i1 %556, i8 %559, i8 %557
  store i8 %560, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 128), align 1, !tbaa !10
  %561 = load i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 192), align 1, !tbaa !10
  %562 = zext i8 %561 to i16
  %563 = sub nsw i16 %562, %536
  %564 = icmp ugt i16 %563, 255
  %565 = trunc nuw i16 %563 to i8
  %566 = icmp sgt i16 %563, -1
  %567 = sext i1 %566 to i8
  %568 = select i1 %564, i8 %567, i8 %565
  store i8 %568, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 192), align 1, !tbaa !10
  br label %1712

569:                                              ; preds = %162
  unreachable

570:                                              ; preds = %125, %672
  %571 = phi i8 [ %673, %672 ], [ 1, %125 ]
  %572 = tail call fastcc zeroext i8 @huffDecode(ptr noundef nonnull %138, ptr noundef nonnull %139) #7
  %573 = and i8 %572, 15
  %574 = icmp eq i8 %573, 0
  br i1 %574, label %609, label %575

575:                                              ; preds = %570
  %576 = tail call fastcc zeroext i16 @getBits(i8 noundef zeroext range(i8 1, 0) %573, i8 noundef zeroext 1) #7
  %577 = lshr i8 %572, 4
  %578 = icmp eq i8 %577, 0
  br i1 %578, label %597, label %579

579:                                              ; preds = %575
  %580 = add nuw nsw i8 %577, %571
  %581 = icmp samesign ugt i8 %580, 63
  br i1 %581, label %1717, label %582

582:                                              ; preds = %579
  %583 = zext nneg i8 %577 to i16
  %584 = zext nneg i8 %571 to i32
  br label %585

585:                                              ; preds = %585, %582
  %586 = phi i32 [ %584, %582 ], [ %588, %585 ]
  %587 = phi i16 [ %583, %582 ], [ %593, %585 ]
  %588 = add nuw nsw i32 %586, 1
  %589 = getelementptr inbounds nuw i8, ptr @ZAG, i32 %586
  %590 = load i8, ptr %589, align 1, !tbaa !10
  %591 = sext i8 %590 to i32
  %592 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %591
  store i16 0, ptr %592, align 2, !tbaa !11
  %593 = add nsw i16 %587, -1
  %594 = icmp eq i16 %593, 0
  br i1 %594, label %595, label %585, !llvm.loop !19

595:                                              ; preds = %585
  %596 = trunc nuw nsw i32 %588 to i8
  br label %597

597:                                              ; preds = %595, %575
  %598 = phi i8 [ %571, %575 ], [ %596, %595 ]
  %599 = tail call fastcc signext i16 @huffExtend(i16 noundef zeroext %576, i8 noundef zeroext %573) #7
  %600 = zext i8 %598 to i32
  %601 = getelementptr inbounds nuw i16, ptr %116, i32 %600
  %602 = load i16, ptr %601, align 2, !tbaa !11
  %603 = mul i16 %602, %599
  %604 = getelementptr inbounds nuw i8, ptr @ZAG, i32 %600
  %605 = load i8, ptr %604, align 1, !tbaa !10
  %606 = sext i8 %605 to i32
  %607 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %606
  store i16 %603, ptr %607, align 2, !tbaa !11
  %608 = add i8 %598, 1
  br label %672

609:                                              ; preds = %570
  %610 = icmp eq i8 %572, -16
  br i1 %610, label %611, label %675

611:                                              ; preds = %609
  %612 = icmp samesign ugt i8 %571, 48
  br i1 %612, label %1717, label %613

613:                                              ; preds = %611
  %614 = zext nneg i8 %571 to i32
  %615 = getelementptr inbounds nuw i8, ptr @ZAG, i32 %614
  %616 = load <4 x i8>, ptr %615, align 1, !tbaa !10
  %617 = extractelement <4 x i8> %616, i64 0
  %618 = sext i8 %617 to i32
  %619 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %618
  store i16 0, ptr %619, align 2, !tbaa !11
  %620 = extractelement <4 x i8> %616, i64 1
  %621 = sext i8 %620 to i32
  %622 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %621
  store i16 0, ptr %622, align 2, !tbaa !11
  %623 = extractelement <4 x i8> %616, i64 2
  %624 = sext i8 %623 to i32
  %625 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %624
  store i16 0, ptr %625, align 2, !tbaa !11
  %626 = extractelement <4 x i8> %616, i64 3
  %627 = sext i8 %626 to i32
  %628 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %627
  store i16 0, ptr %628, align 2, !tbaa !11
  %629 = getelementptr inbounds nuw i8, ptr %615, i32 4
  %630 = load <4 x i8>, ptr %629, align 1, !tbaa !10
  %631 = extractelement <4 x i8> %630, i64 0
  %632 = sext i8 %631 to i32
  %633 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %632
  store i16 0, ptr %633, align 2, !tbaa !11
  %634 = extractelement <4 x i8> %630, i64 1
  %635 = sext i8 %634 to i32
  %636 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %635
  store i16 0, ptr %636, align 2, !tbaa !11
  %637 = extractelement <4 x i8> %630, i64 2
  %638 = sext i8 %637 to i32
  %639 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %638
  store i16 0, ptr %639, align 2, !tbaa !11
  %640 = extractelement <4 x i8> %630, i64 3
  %641 = sext i8 %640 to i32
  %642 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %641
  store i16 0, ptr %642, align 2, !tbaa !11
  %643 = getelementptr inbounds nuw i8, ptr %615, i32 8
  %644 = load <4 x i8>, ptr %643, align 1, !tbaa !10
  %645 = extractelement <4 x i8> %644, i64 0
  %646 = sext i8 %645 to i32
  %647 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %646
  store i16 0, ptr %647, align 2, !tbaa !11
  %648 = extractelement <4 x i8> %644, i64 1
  %649 = sext i8 %648 to i32
  %650 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %649
  store i16 0, ptr %650, align 2, !tbaa !11
  %651 = extractelement <4 x i8> %644, i64 2
  %652 = sext i8 %651 to i32
  %653 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %652
  store i16 0, ptr %653, align 2, !tbaa !11
  %654 = extractelement <4 x i8> %644, i64 3
  %655 = sext i8 %654 to i32
  %656 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %655
  store i16 0, ptr %656, align 2, !tbaa !11
  %657 = getelementptr inbounds nuw i8, ptr %615, i32 12
  %658 = add nuw nsw i8 %571, 16
  %659 = load <4 x i8>, ptr %657, align 1, !tbaa !10
  %660 = extractelement <4 x i8> %659, i64 0
  %661 = sext i8 %660 to i32
  %662 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %661
  store i16 0, ptr %662, align 2, !tbaa !11
  %663 = extractelement <4 x i8> %659, i64 1
  %664 = sext i8 %663 to i32
  %665 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %664
  store i16 0, ptr %665, align 2, !tbaa !11
  %666 = extractelement <4 x i8> %659, i64 2
  %667 = sext i8 %666 to i32
  %668 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %667
  store i16 0, ptr %668, align 2, !tbaa !11
  %669 = extractelement <4 x i8> %659, i64 3
  %670 = sext i8 %669 to i32
  %671 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %670
  store i16 0, ptr %671, align 2, !tbaa !11
  br label %672

672:                                              ; preds = %613, %597
  %673 = phi i8 [ %608, %597 ], [ %658, %613 ]
  %674 = icmp ult i8 %673, 64
  br i1 %674, label %570, label %698, !llvm.loop !20

675:                                              ; preds = %609
  %676 = zext nneg i8 %571 to i32
  %677 = sub nuw nsw i32 64, %676
  %678 = icmp eq i8 %571, 63
  br i1 %678, label %696, label %679

679:                                              ; preds = %675
  %680 = and i32 %677, 126
  %681 = add nuw nsw i32 %680, %676
  %682 = getelementptr i8, ptr @ZAG, i32 %676
  br label %683

683:                                              ; preds = %683, %679
  %684 = phi i32 [ 0, %679 ], [ %692, %683 ]
  %685 = getelementptr i8, ptr %682, i32 %684
  %686 = load <2 x i8>, ptr %685, align 1, !tbaa !10
  %687 = sext <2 x i8> %686 to <2 x i32>
  %688 = extractelement <2 x i32> %687, i64 0
  %689 = extractelement <2 x i32> %687, i64 1
  %690 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %688
  %691 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %689
  store i16 0, ptr %690, align 2, !tbaa !11
  store i16 0, ptr %691, align 2, !tbaa !11
  %692 = add nuw i32 %684, 2
  %693 = icmp eq i32 %692, %680
  br i1 %693, label %694, label %683, !llvm.loop !21

694:                                              ; preds = %683
  %695 = icmp eq i32 %677, %680
  br i1 %695, label %698, label %696

696:                                              ; preds = %675, %694
  %697 = phi i32 [ %676, %675 ], [ %681, %694 ]
  br label %848

698:                                              ; preds = %672, %848, %694
  br label %699

699:                                              ; preds = %698, %813
  %700 = phi i32 [ %846, %813 ], [ 0, %698 ]
  %701 = shl i32 %700, 4
  %702 = getelementptr i8, ptr @gCoeffBuf, i32 %701
  %703 = getelementptr i8, ptr @gCoeffBuf, i32 %701
  %704 = getelementptr i8, ptr %703, i32 16
  %705 = getelementptr inbounds nuw i8, ptr %702, i32 2
  %706 = getelementptr i8, ptr %703, i32 18
  %707 = load i16, ptr %705, align 2, !tbaa !11
  %708 = load i16, ptr %706, align 2, !tbaa !11
  %709 = insertelement <2 x i16> poison, i16 %707, i64 0
  %710 = insertelement <2 x i16> %709, i16 %708, i64 1
  %711 = getelementptr inbounds nuw i8, ptr %702, i32 4
  %712 = getelementptr i8, ptr %703, i32 20
  %713 = load i16, ptr %711, align 2, !tbaa !11
  %714 = load i16, ptr %712, align 2, !tbaa !11
  %715 = insertelement <2 x i16> poison, i16 %713, i64 0
  %716 = insertelement <2 x i16> %715, i16 %714, i64 1
  %717 = getelementptr inbounds nuw i8, ptr %702, i32 6
  %718 = getelementptr i8, ptr %703, i32 22
  %719 = load i16, ptr %717, align 2, !tbaa !11
  %720 = load i16, ptr %718, align 2, !tbaa !11
  %721 = insertelement <2 x i16> poison, i16 %719, i64 0
  %722 = insertelement <2 x i16> %721, i16 %720, i64 1
  %723 = getelementptr inbounds nuw i8, ptr %702, i32 8
  %724 = getelementptr i8, ptr %703, i32 24
  %725 = load i16, ptr %723, align 2, !tbaa !11
  %726 = load i16, ptr %724, align 2, !tbaa !11
  %727 = insertelement <2 x i16> poison, i16 %725, i64 0
  %728 = insertelement <2 x i16> %727, i16 %726, i64 1
  %729 = getelementptr inbounds nuw i8, ptr %702, i32 10
  %730 = getelementptr i8, ptr %703, i32 26
  %731 = load i16, ptr %729, align 2, !tbaa !11
  %732 = load i16, ptr %730, align 2, !tbaa !11
  %733 = insertelement <2 x i16> poison, i16 %731, i64 0
  %734 = insertelement <2 x i16> %733, i16 %732, i64 1
  %735 = getelementptr inbounds nuw i8, ptr %702, i32 12
  %736 = getelementptr i8, ptr %703, i32 28
  %737 = load i16, ptr %735, align 2, !tbaa !11
  %738 = load i16, ptr %736, align 2, !tbaa !11
  %739 = insertelement <2 x i16> poison, i16 %737, i64 0
  %740 = insertelement <2 x i16> %739, i16 %738, i64 1
  %741 = getelementptr inbounds nuw i8, ptr %702, i32 14
  %742 = getelementptr i8, ptr %703, i32 30
  %743 = load i16, ptr %741, align 2, !tbaa !11
  %744 = load i16, ptr %742, align 2, !tbaa !11
  %745 = insertelement <2 x i16> poison, i16 %743, i64 0
  %746 = insertelement <2 x i16> %745, i16 %744, i64 1
  %747 = or <2 x i16> %716, %710
  %748 = or <2 x i16> %747, %722
  %749 = or <2 x i16> %748, %728
  %750 = or <2 x i16> %749, %734
  %751 = or <2 x i16> %750, %740
  %752 = or <2 x i16> %751, %746
  %753 = icmp ne <2 x i16> %752, zeroinitializer
  %754 = sub <2 x i16> %734, %722
  %755 = add <2 x i16> %734, %722
  %756 = add <2 x i16> %746, %710
  %757 = sub <2 x i16> %710, %746
  %758 = sub <2 x i16> %754, %757
  %759 = sext <2 x i16> %758 to <2 x i32>
  %760 = mul nsw <2 x i32> %759, splat (i32 196)
  %761 = add nsw <2 x i32> %760, splat (i32 128)
  %762 = lshr <2 x i32> %761, splat (i32 8)
  %763 = trunc <2 x i32> %762 to <2 x i16>
  %764 = sext <2 x i16> %757 to <2 x i32>
  %765 = mul nsw <2 x i32> %764, splat (i32 277)
  %766 = add nsw <2 x i32> %765, splat (i32 128)
  %767 = lshr <2 x i32> %766, splat (i32 8)
  %768 = trunc <2 x i32> %767 to <2 x i16>
  %769 = sext <2 x i16> %754 to <2 x i32>
  %770 = mul nsw <2 x i32> %769, splat (i32 669)
  %771 = add nsw <2 x i32> %770, splat (i32 128)
  %772 = lshr <2 x i32> %771, splat (i32 8)
  %773 = trunc <2 x i32> %772 to <2 x i16>
  %774 = sub <2 x i16> %763, %773
  %775 = sub <2 x i16> %756, %755
  %776 = add <2 x i16> %756, %755
  %777 = add <2 x i16> %776, %763
  %778 = sub <2 x i16> %768, %777
  %779 = sext <2 x i16> %775 to <2 x i32>
  %780 = mul nsw <2 x i32> %779, splat (i32 362)
  %781 = add nsw <2 x i32> %780, splat (i32 128)
  %782 = lshr <2 x i32> %781, splat (i32 8)
  %783 = trunc <2 x i32> %782 to <2 x i16>
  %784 = sub <2 x i16> %783, %778
  %785 = add <2 x i16> %784, %774
  %786 = load i16, ptr %702, align 2, !tbaa !11
  %787 = load i16, ptr %704, align 2, !tbaa !11
  %788 = insertelement <2 x i16> poison, i16 %786, i64 0
  %789 = insertelement <2 x i16> %788, i16 %787, i64 1
  %790 = add <2 x i16> %789, %728
  %791 = sub <2 x i16> %789, %728
  %792 = sub <2 x i16> %716, %740
  %793 = add <2 x i16> %740, %716
  %794 = sext <2 x i16> %792 to <2 x i32>
  %795 = mul nsw <2 x i32> %794, splat (i32 362)
  %796 = add nsw <2 x i32> %795, splat (i32 128)
  %797 = lshr <2 x i32> %796, splat (i32 8)
  %798 = trunc <2 x i32> %797 to <2 x i16>
  %799 = sub <2 x i16> %798, %793
  %800 = add <2 x i16> %790, %793
  %801 = sub <2 x i16> %790, %793
  %802 = add <2 x i16> %791, %799
  %803 = sub <2 x i16> %791, %799
  %804 = extractelement <2 x i1> %753, i64 0
  br i1 %804, label %805, label %808

805:                                              ; preds = %699
  %806 = add <2 x i16> %800, %776
  %807 = extractelement <2 x i16> %806, i64 0
  store i16 %807, ptr %702, align 2, !tbaa !11
  br label %808

808:                                              ; preds = %805, %699
  %809 = extractelement <2 x i1> %753, i64 1
  br i1 %809, label %810, label %813

810:                                              ; preds = %808
  %811 = add <2 x i16> %800, %776
  %812 = extractelement <2 x i16> %811, i64 1
  store i16 %812, ptr %704, align 2, !tbaa !11
  br label %813

813:                                              ; preds = %810, %808
  %814 = add <2 x i16> %802, %778
  %815 = add <2 x i16> %803, %784
  %816 = sub <2 x i16> %801, %785
  %817 = add <2 x i16> %801, %785
  %818 = sub <2 x i16> %803, %784
  %819 = sub <2 x i16> %802, %778
  %820 = sub <2 x i16> %800, %776
  %821 = load i16, ptr %702, align 2, !tbaa !11
  %822 = load i16, ptr %704, align 2, !tbaa !11
  %823 = insertelement <2 x i16> poison, i16 %821, i64 0
  %824 = insertelement <2 x i16> %823, i16 %822, i64 1
  %825 = select <2 x i1> %753, <2 x i16> %814, <2 x i16> %824
  %826 = extractelement <2 x i16> %825, i64 0
  %827 = extractelement <2 x i16> %825, i64 1
  %828 = select <2 x i1> %753, <2 x i16> %815, <2 x i16> %824
  %829 = extractelement <2 x i16> %828, i64 0
  %830 = extractelement <2 x i16> %828, i64 1
  %831 = select <2 x i1> %753, <2 x i16> %816, <2 x i16> %824
  %832 = extractelement <2 x i16> %831, i64 0
  %833 = extractelement <2 x i16> %831, i64 1
  %834 = select <2 x i1> %753, <2 x i16> %817, <2 x i16> %824
  %835 = extractelement <2 x i16> %834, i64 0
  %836 = extractelement <2 x i16> %834, i64 1
  %837 = select <2 x i1> %753, <2 x i16> %818, <2 x i16> %824
  %838 = extractelement <2 x i16> %837, i64 0
  %839 = extractelement <2 x i16> %837, i64 1
  %840 = select <2 x i1> %753, <2 x i16> %819, <2 x i16> %824
  %841 = extractelement <2 x i16> %840, i64 0
  %842 = extractelement <2 x i16> %840, i64 1
  %843 = select <2 x i1> %753, <2 x i16> %820, <2 x i16> %824
  %844 = extractelement <2 x i16> %843, i64 0
  %845 = extractelement <2 x i16> %843, i64 1
  store i16 %826, ptr %705, align 2, !tbaa !11
  store i16 %827, ptr %706, align 2, !tbaa !11
  store i16 %829, ptr %711, align 2, !tbaa !11
  store i16 %830, ptr %712, align 2, !tbaa !11
  store i16 %832, ptr %717, align 2, !tbaa !11
  store i16 %833, ptr %718, align 2, !tbaa !11
  store i16 %835, ptr %723, align 2, !tbaa !11
  store i16 %836, ptr %724, align 2, !tbaa !11
  store i16 %838, ptr %729, align 2, !tbaa !11
  store i16 %839, ptr %730, align 2, !tbaa !11
  store i16 %841, ptr %735, align 2, !tbaa !11
  store i16 %842, ptr %736, align 2, !tbaa !11
  store i16 %844, ptr %741, align 2, !tbaa !11
  store i16 %845, ptr %742, align 2, !tbaa !11
  %846 = add nuw i32 %700, 2
  %847 = icmp eq i32 %846, 8
  br i1 %847, label %856, label %699, !llvm.loop !24

848:                                              ; preds = %696, %848
  %849 = phi i32 [ %850, %848 ], [ %697, %696 ]
  %850 = add nuw nsw i32 %849, 1
  %851 = getelementptr inbounds nuw i8, ptr @ZAG, i32 %849
  %852 = load i8, ptr %851, align 1, !tbaa !10
  %853 = sext i8 %852 to i32
  %854 = getelementptr inbounds i16, ptr @gCoeffBuf, i32 %853
  store i16 0, ptr %854, align 2, !tbaa !11
  %855 = icmp eq i32 %850, 64
  br i1 %855, label %698, label %848, !llvm.loop !25

856:                                              ; preds = %813, %1018
  %857 = phi i8 [ %1025, %1018 ], [ 0, %813 ]
  %858 = phi ptr [ %1024, %1018 ], [ @gCoeffBuf, %813 ]
  %859 = getelementptr inbounds nuw i8, ptr %858, i32 16
  %860 = load i16, ptr %859, align 2, !tbaa !11
  %861 = getelementptr inbounds nuw i8, ptr %858, i32 32
  %862 = load i16, ptr %861, align 2, !tbaa !11
  %863 = getelementptr inbounds nuw i8, ptr %858, i32 48
  %864 = load i16, ptr %863, align 2, !tbaa !11
  %865 = getelementptr inbounds nuw i8, ptr %858, i32 64
  %866 = load i16, ptr %865, align 2, !tbaa !11
  %867 = getelementptr inbounds nuw i8, ptr %858, i32 80
  %868 = load i16, ptr %867, align 2, !tbaa !11
  %869 = getelementptr inbounds nuw i8, ptr %858, i32 96
  %870 = load i16, ptr %869, align 2, !tbaa !11
  %871 = getelementptr inbounds nuw i8, ptr %858, i32 112
  %872 = load i16, ptr %871, align 2, !tbaa !11
  %873 = insertelement <4 x i16> poison, i16 %862, i64 0
  %874 = insertelement <4 x i16> %873, i16 %860, i64 1
  %875 = insertelement <4 x i16> %874, i16 %864, i64 2
  %876 = insertelement <4 x i16> %875, i16 %866, i64 3
  %877 = tail call i16 @llvm.vector.reduce.or.v4i16(<4 x i16> %876)
  %878 = or i16 %872, %877
  %879 = or i16 %878, %870
  %880 = or i16 %879, %868
  %881 = icmp eq i16 %880, 0
  br i1 %881, label %882, label %895

882:                                              ; preds = %856
  %883 = load i16, ptr %858, align 2, !tbaa !11
  %884 = sext i16 %883 to i32
  %885 = add nsw i32 %884, 64
  %886 = lshr i32 %885, 7
  %887 = trunc i32 %886 to i16
  %888 = add i16 %887, 128
  %889 = icmp ugt i16 %888, 255
  %890 = trunc nuw i16 %888 to i8
  %891 = icmp sgt i16 %888, -1
  %892 = sext i1 %891 to i8
  %893 = select i1 %889, i8 %892, i8 %890
  %894 = zext i8 %893 to i16
  store i16 %894, ptr %858, align 2, !tbaa !11
  store i16 %894, ptr %859, align 2, !tbaa !11
  store i16 %894, ptr %861, align 2, !tbaa !11
  br label %1018

895:                                              ; preds = %856
  %896 = sub i16 %868, %864
  %897 = add i16 %868, %864
  %898 = add i16 %872, %860
  %899 = sub i16 %860, %872
  %900 = sext i16 %899 to i32
  %901 = mul nsw i32 %900, 277
  %902 = add nsw i32 %901, 128
  %903 = lshr i32 %902, 8
  %904 = trunc i32 %903 to i16
  %905 = sext i16 %896 to i32
  %906 = mul nsw i32 %905, 669
  %907 = add nsw i32 %906, 128
  %908 = lshr i32 %907, 8
  %909 = trunc i32 %908 to i16
  %910 = add i16 %898, %897
  %911 = insertelement <2 x i16> poison, i16 %896, i64 0
  %912 = insertelement <2 x i16> %911, i16 %898, i64 1
  %913 = insertelement <2 x i16> poison, i16 %899, i64 0
  %914 = insertelement <2 x i16> %913, i16 %897, i64 1
  %915 = sub <2 x i16> %912, %914
  %916 = sext <2 x i16> %915 to <2 x i32>
  %917 = mul nsw <2 x i32> %916, <i32 196, i32 362>
  %918 = add nsw <2 x i32> %917, splat (i32 128)
  %919 = lshr <2 x i32> %918, splat (i32 8)
  %920 = trunc <2 x i32> %919 to <2 x i16>
  %921 = extractelement <2 x i16> %920, i64 0
  %922 = add i16 %910, %921
  %923 = sub i16 %904, %922
  %924 = insertelement <2 x i16> poison, i16 %909, i64 0
  %925 = insertelement <2 x i16> %924, i16 %923, i64 1
  %926 = sub <2 x i16> %920, %925
  %927 = shufflevector <2 x i16> %926, <2 x i16> poison, <2 x i32> <i32 1, i32 poison>
  %928 = add <2 x i16> %926, %927
  %929 = load i16, ptr %858, align 2, !tbaa !11
  %930 = add i16 %929, %866
  %931 = sub i16 %929, %866
  %932 = sub i16 %862, %870
  %933 = add i16 %870, %862
  %934 = sext i16 %932 to i32
  %935 = mul nsw i32 %934, 362
  %936 = add nsw i32 %935, 128
  %937 = lshr i32 %936, 8
  %938 = trunc i32 %937 to i16
  %939 = sub i16 %938, %933
  %940 = add i16 %930, %933
  %941 = sub i16 %930, %933
  %942 = add i16 %931, %939
  %943 = sub i16 %931, %939
  %944 = shufflevector <2 x i16> %926, <2 x i16> poison, <8 x i32> <i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 1, i32 poison, i32 poison>
  %945 = insertelement <8 x i16> %944, i16 %940, i64 0
  %946 = insertelement <8 x i16> %945, i16 %942, i64 1
  %947 = insertelement <8 x i16> %946, i16 %943, i64 2
  %948 = shufflevector <2 x i16> %928, <2 x i16> poison, <8 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %949 = shufflevector <8 x i16> %947, <8 x i16> %948, <8 x i32> <i32 0, i32 1, i32 2, i32 8, i32 poison, i32 5, i32 poison, i32 poison>
  %950 = insertelement <8 x i16> %949, i16 %941, i64 4
  %951 = insertelement <8 x i16> %950, i16 %923, i64 6
  %952 = insertelement <8 x i16> %951, i16 %910, i64 7
  %953 = sext <8 x i16> %952 to <8 x i32>
  %954 = shufflevector <8 x i32> <i32 poison, i32 poison, i32 poison, i32 -64, i32 poison, i32 -64, i32 -64, i32 -64>, <8 x i32> %953, <8 x i32> <i32 15, i32 14, i32 13, i32 3, i32 11, i32 5, i32 6, i32 7>
  %955 = sub nsw <8 x i32> %953, %954
  %956 = shufflevector <8 x i32> <i32 64, i32 64, i32 64, i32 poison, i32 64, i32 poison, i32 poison, i32 poison>, <8 x i32> %953, <8 x i32> <i32 0, i32 1, i32 2, i32 12, i32 4, i32 10, i32 9, i32 8>
  %957 = add nsw <8 x i32> %955, %956
  %958 = lshr <8 x i32> %957, splat (i32 7)
  %959 = trunc <8 x i32> %958 to <8 x i16>
  %960 = add <8 x i16> %959, splat (i16 128)
  %961 = extractelement <8 x i16> %960, i64 7
  %962 = trunc nuw i16 %961 to i8
  %963 = icmp sgt i16 %961, -1
  %964 = sext i1 %963 to i8
  %965 = icmp ugt <8 x i16> %960, splat (i16 255)
  %966 = extractelement <8 x i1> %965, i64 7
  %967 = select i1 %966, i8 %964, i8 %962
  %968 = zext i8 %967 to i16
  store i16 %968, ptr %858, align 2, !tbaa !11
  %969 = extractelement <8 x i16> %960, i64 6
  %970 = trunc nuw i16 %969 to i8
  %971 = icmp sgt i16 %969, -1
  %972 = sext i1 %971 to i8
  %973 = extractelement <8 x i1> %965, i64 6
  %974 = select i1 %973, i8 %972, i8 %970
  %975 = zext i8 %974 to i16
  store i16 %975, ptr %859, align 2, !tbaa !11
  %976 = extractelement <8 x i16> %960, i64 5
  %977 = trunc nuw i16 %976 to i8
  %978 = icmp sgt i16 %976, -1
  %979 = sext i1 %978 to i8
  %980 = extractelement <8 x i1> %965, i64 5
  %981 = select i1 %980, i8 %979, i8 %977
  %982 = zext i8 %981 to i16
  store i16 %982, ptr %861, align 2, !tbaa !11
  %983 = extractelement <8 x i16> %960, i64 4
  %984 = trunc nuw i16 %983 to i8
  %985 = icmp sgt i16 %983, -1
  %986 = sext i1 %985 to i8
  %987 = extractelement <8 x i1> %965, i64 4
  %988 = select i1 %987, i8 %986, i8 %984
  %989 = zext i8 %988 to i16
  %990 = extractelement <8 x i16> %960, i64 3
  %991 = trunc nuw i16 %990 to i8
  %992 = icmp sgt i16 %990, -1
  %993 = sext i1 %992 to i8
  %994 = extractelement <8 x i1> %965, i64 3
  %995 = select i1 %994, i8 %993, i8 %991
  %996 = zext i8 %995 to i16
  %997 = extractelement <8 x i16> %960, i64 2
  %998 = trunc nuw i16 %997 to i8
  %999 = icmp sgt i16 %997, -1
  %1000 = sext i1 %999 to i8
  %1001 = extractelement <8 x i1> %965, i64 2
  %1002 = select i1 %1001, i8 %1000, i8 %998
  %1003 = zext i8 %1002 to i16
  %1004 = extractelement <8 x i16> %960, i64 1
  %1005 = trunc nuw i16 %1004 to i8
  %1006 = icmp sgt i16 %1004, -1
  %1007 = sext i1 %1006 to i8
  %1008 = extractelement <8 x i1> %965, i64 1
  %1009 = select i1 %1008, i8 %1007, i8 %1005
  %1010 = zext i8 %1009 to i16
  %1011 = extractelement <8 x i16> %960, i64 0
  %1012 = trunc nuw i16 %1011 to i8
  %1013 = icmp sgt i16 %1011, -1
  %1014 = sext i1 %1013 to i8
  %1015 = extractelement <8 x i1> %965, i64 0
  %1016 = select i1 %1015, i8 %1014, i8 %1012
  %1017 = zext i8 %1016 to i16
  br label %1018

1018:                                             ; preds = %895, %882
  %1019 = phi i16 [ %894, %882 ], [ %989, %895 ]
  %1020 = phi i16 [ %894, %882 ], [ %996, %895 ]
  %1021 = phi i16 [ %894, %882 ], [ %1003, %895 ]
  %1022 = phi i16 [ %894, %882 ], [ %1010, %895 ]
  %1023 = phi i16 [ %894, %882 ], [ %1017, %895 ]
  store i16 %1019, ptr %863, align 2, !tbaa !11
  store i16 %1020, ptr %865, align 2, !tbaa !11
  store i16 %1021, ptr %867, align 2, !tbaa !11
  store i16 %1022, ptr %869, align 2, !tbaa !11
  store i16 %1023, ptr %871, align 2, !tbaa !11
  %1024 = getelementptr inbounds nuw i8, ptr %858, i32 2
  %1025 = add nuw nsw i8 %857, 1
  %1026 = icmp samesign ult i8 %857, 7
  br i1 %1026, label %856, label %1027, !llvm.loop !26

1027:                                             ; preds = %1018
  %1028 = load i32, ptr @gScanType, align 4, !tbaa !6
  switch i32 %1028, label %1711 [
    i32 0, label %1029
    i32 1, label %1040
    i32 3, label %1119
    i32 2, label %1391
    i32 4, label %1663
  ]

1029:                                             ; preds = %1027, %1029
  %1030 = phi i32 [ %1038, %1029 ], [ %1028, %1027 ]
  %1031 = shl i32 %1030, 1
  %1032 = getelementptr i8, ptr @gCoeffBuf, i32 %1031
  %1033 = getelementptr i8, ptr @gMCUBufB, i32 %1030
  %1034 = getelementptr i8, ptr @gMCUBufG, i32 %1030
  %1035 = getelementptr i8, ptr @gMCUBufR, i32 %1030
  %1036 = load <2 x i16>, ptr %1032, align 2, !tbaa !11
  %1037 = trunc <2 x i16> %1036 to <2 x i8>
  store <2 x i8> %1037, ptr %1035, align 1, !tbaa !10
  store <2 x i8> %1037, ptr %1034, align 1, !tbaa !10
  store <2 x i8> %1037, ptr %1033, align 1, !tbaa !10
  %1038 = add nuw i32 %1030, 2
  %1039 = icmp eq i32 %1038, 64
  br i1 %1039, label %1712, label %1029, !llvm.loop !27

1040:                                             ; preds = %1027
  %1041 = trunc nuw i32 %107 to i8
  switch i8 %1041, label %1712 [
    i8 0, label %1108
    i8 1, label %1075
    i8 2, label %1042
  ]

1042:                                             ; preds = %1040, %1042
  %1043 = phi i32 [ %1073, %1042 ], [ 0, %1040 ]
  %1044 = getelementptr i8, ptr @gMCUBufR, i32 %1043
  %1045 = getelementptr i8, ptr @gMCUBufG, i32 %1043
  %1046 = shl i32 %1043, 1
  %1047 = getelementptr i8, ptr @gCoeffBuf, i32 %1046
  %1048 = load <2 x i16>, ptr %1047, align 2, !tbaa !11
  %1049 = and <2 x i16> %1048, splat (i16 255)
  %1050 = mul nuw nsw <2 x i16> %1049, splat (i16 103)
  %1051 = lshr <2 x i16> %1050, splat (i16 8)
  %1052 = load <2 x i8>, ptr %1044, align 1, !tbaa !10
  %1053 = zext <2 x i8> %1052 to <2 x i16>
  %1054 = add nsw <2 x i16> %1049, splat (i16 -179)
  %1055 = add nsw <2 x i16> %1054, %1053
  %1056 = add nsw <2 x i16> %1055, %1051
  %1057 = icmp ugt <2 x i16> %1056, splat (i16 255)
  %1058 = trunc nuw <2 x i16> %1056 to <2 x i8>
  %1059 = icmp sgt <2 x i16> %1056, splat (i16 -1)
  %1060 = sext <2 x i1> %1059 to <2 x i8>
  %1061 = select <2 x i1> %1057, <2 x i8> %1060, <2 x i8> %1058
  store <2 x i8> %1061, ptr %1044, align 1, !tbaa !10
  %1062 = mul nuw <2 x i16> %1049, splat (i16 183)
  %1063 = lshr <2 x i16> %1062, splat (i16 8)
  %1064 = load <2 x i8>, ptr %1045, align 1, !tbaa !10
  %1065 = zext <2 x i8> %1064 to <2 x i16>
  %1066 = sub nsw <2 x i16> %1065, %1063
  %1067 = add nsw <2 x i16> %1066, splat (i16 91)
  %1068 = icmp ugt <2 x i16> %1067, splat (i16 255)
  %1069 = trunc nuw <2 x i16> %1067 to <2 x i8>
  %1070 = icmp sgt <2 x i16> %1066, splat (i16 -92)
  %1071 = sext <2 x i1> %1070 to <2 x i8>
  %1072 = select <2 x i1> %1068, <2 x i8> %1071, <2 x i8> %1069
  store <2 x i8> %1072, ptr %1045, align 1, !tbaa !10
  %1073 = add nuw i32 %1043, 2
  %1074 = icmp eq i32 %1073, 64
  br i1 %1074, label %1712, label %1042, !llvm.loop !28

1075:                                             ; preds = %1040, %1075
  %1076 = phi i32 [ %1106, %1075 ], [ 0, %1040 ]
  %1077 = getelementptr i8, ptr @gMCUBufG, i32 %1076
  %1078 = getelementptr i8, ptr @gMCUBufB, i32 %1076
  %1079 = shl i32 %1076, 1
  %1080 = getelementptr i8, ptr @gCoeffBuf, i32 %1079
  %1081 = load <2 x i16>, ptr %1080, align 2, !tbaa !11
  %1082 = and <2 x i16> %1081, splat (i16 255)
  %1083 = mul nuw nsw <2 x i16> %1082, splat (i16 88)
  %1084 = lshr <2 x i16> %1083, splat (i16 8)
  %1085 = load <2 x i8>, ptr %1077, align 1, !tbaa !10
  %1086 = zext <2 x i8> %1085 to <2 x i16>
  %1087 = add nuw nsw <2 x i16> %1086, splat (i16 44)
  %1088 = sub nsw <2 x i16> %1087, %1084
  %1089 = icmp ugt <2 x i16> %1088, splat (i16 255)
  %1090 = trunc nuw <2 x i16> %1088 to <2 x i8>
  %1091 = icmp sgt <2 x i16> %1088, splat (i16 -1)
  %1092 = sext <2 x i1> %1091 to <2 x i8>
  %1093 = select <2 x i1> %1089, <2 x i8> %1092, <2 x i8> %1090
  store <2 x i8> %1093, ptr %1077, align 1, !tbaa !10
  %1094 = mul nuw <2 x i16> %1082, splat (i16 198)
  %1095 = lshr <2 x i16> %1094, splat (i16 8)
  %1096 = load <2 x i8>, ptr %1078, align 1, !tbaa !10
  %1097 = zext <2 x i8> %1096 to <2 x i16>
  %1098 = add nsw <2 x i16> %1082, splat (i16 -227)
  %1099 = add nsw <2 x i16> %1098, %1095
  %1100 = add nsw <2 x i16> %1099, %1097
  %1101 = icmp ugt <2 x i16> %1100, splat (i16 255)
  %1102 = trunc nuw <2 x i16> %1100 to <2 x i8>
  %1103 = icmp sgt <2 x i16> %1100, splat (i16 -1)
  %1104 = sext <2 x i1> %1103 to <2 x i8>
  %1105 = select <2 x i1> %1101, <2 x i8> %1104, <2 x i8> %1102
  store <2 x i8> %1105, ptr %1078, align 1, !tbaa !10
  %1106 = add nuw i32 %1076, 2
  %1107 = icmp eq i32 %1106, 64
  br i1 %1107, label %1712, label %1075, !llvm.loop !29

1108:                                             ; preds = %1040, %1108
  %1109 = phi i32 [ %1117, %1108 ], [ 0, %1040 ]
  %1110 = shl i32 %1109, 1
  %1111 = getelementptr i8, ptr @gCoeffBuf, i32 %1110
  %1112 = getelementptr i8, ptr @gMCUBufB, i32 %1109
  %1113 = getelementptr i8, ptr @gMCUBufG, i32 %1109
  %1114 = getelementptr i8, ptr @gMCUBufR, i32 %1109
  %1115 = load <2 x i16>, ptr %1111, align 2, !tbaa !11
  %1116 = trunc <2 x i16> %1115 to <2 x i8>
  store <2 x i8> %1116, ptr %1114, align 1, !tbaa !10
  store <2 x i8> %1116, ptr %1113, align 1, !tbaa !10
  store <2 x i8> %1116, ptr %1112, align 1, !tbaa !10
  %1117 = add nuw i32 %1109, 2
  %1118 = icmp eq i32 %1117, 64
  br i1 %1118, label %1712, label %1108, !llvm.loop !30

1119:                                             ; preds = %1027
  %1120 = trunc nuw i32 %107 to i8
  switch i8 %1120, label %1712 [
    i8 0, label %1132
    i8 1, label %1121
    i8 2, label %1143
    i8 3, label %1267
  ]

1121:                                             ; preds = %1119, %1121
  %1122 = phi i32 [ %1130, %1121 ], [ 0, %1119 ]
  %1123 = shl i32 %1122, 1
  %1124 = getelementptr i8, ptr @gCoeffBuf, i32 %1123
  %1125 = getelementptr i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 128), i32 %1122
  %1126 = getelementptr i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 128), i32 %1122
  %1127 = getelementptr i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 128), i32 %1122
  %1128 = load <2 x i16>, ptr %1124, align 2, !tbaa !11
  %1129 = trunc <2 x i16> %1128 to <2 x i8>
  store <2 x i8> %1129, ptr %1127, align 1, !tbaa !10
  store <2 x i8> %1129, ptr %1126, align 1, !tbaa !10
  store <2 x i8> %1129, ptr %1125, align 1, !tbaa !10
  %1130 = add nuw i32 %1122, 2
  %1131 = icmp eq i32 %1130, 64
  br i1 %1131, label %1712, label %1121, !llvm.loop !31

1132:                                             ; preds = %1119, %1132
  %1133 = phi i32 [ %1141, %1132 ], [ 0, %1119 ]
  %1134 = shl i32 %1133, 1
  %1135 = getelementptr i8, ptr @gCoeffBuf, i32 %1134
  %1136 = getelementptr i8, ptr @gMCUBufB, i32 %1133
  %1137 = getelementptr i8, ptr @gMCUBufG, i32 %1133
  %1138 = getelementptr i8, ptr @gMCUBufR, i32 %1133
  %1139 = load <2 x i16>, ptr %1135, align 2, !tbaa !11
  %1140 = trunc <2 x i16> %1139 to <2 x i8>
  store <2 x i8> %1140, ptr %1138, align 1, !tbaa !10
  store <2 x i8> %1140, ptr %1137, align 1, !tbaa !10
  store <2 x i8> %1140, ptr %1136, align 1, !tbaa !10
  %1141 = add nuw i32 %1133, 2
  %1142 = icmp eq i32 %1141, 64
  br i1 %1142, label %1712, label %1132, !llvm.loop !32

1143:                                             ; preds = %1119, %1200
  %1144 = phi i8 [ %1203, %1200 ], [ 0, %1119 ]
  %1145 = phi ptr [ %1153, %1200 ], [ @gCoeffBuf, %1119 ]
  %1146 = phi ptr [ %1202, %1200 ], [ @gMCUBufB, %1119 ]
  %1147 = phi ptr [ %1201, %1200 ], [ @gMCUBufG, %1119 ]
  %1148 = getelementptr i8, ptr %1146, i32 7
  br label %1149

1149:                                             ; preds = %1149, %1143
  %1150 = phi ptr [ %1145, %1143 ], [ %1153, %1149 ]
  %1151 = phi ptr [ %1146, %1143 ], [ %1198, %1149 ]
  %1152 = phi ptr [ %1147, %1143 ], [ %1197, %1149 ]
  %1153 = getelementptr inbounds nuw i8, ptr %1150, i32 2
  %1154 = load i16, ptr %1150, align 2, !tbaa !11
  %1155 = and i16 %1154, 255
  %1156 = mul nuw nsw i16 %1155, 88
  %1157 = lshr i16 %1156, 8
  %1158 = add nsw i16 %1157, -44
  %1159 = load i8, ptr %1152, align 1, !tbaa !10
  %1160 = zext i8 %1159 to i16
  %1161 = sub nsw i16 %1160, %1158
  %1162 = icmp ugt i16 %1161, 255
  %1163 = trunc nuw i16 %1161 to i8
  %1164 = icmp sgt i16 %1161, -1
  %1165 = sext i1 %1164 to i8
  %1166 = select i1 %1162, i8 %1165, i8 %1163
  store i8 %1166, ptr %1152, align 1, !tbaa !10
  %1167 = getelementptr inbounds nuw i8, ptr %1152, i32 8
  %1168 = load i8, ptr %1167, align 1, !tbaa !10
  %1169 = zext i8 %1168 to i16
  %1170 = sub nsw i16 %1169, %1158
  %1171 = icmp ugt i16 %1170, 255
  %1172 = trunc nuw i16 %1170 to i8
  %1173 = icmp sgt i16 %1170, -1
  %1174 = sext i1 %1173 to i8
  %1175 = select i1 %1171, i8 %1174, i8 %1172
  store i8 %1175, ptr %1167, align 1, !tbaa !10
  %1176 = mul nuw i16 %1155, 198
  %1177 = lshr i16 %1176, 8
  %1178 = add nsw i16 %1155, -227
  %1179 = add nsw i16 %1178, %1177
  %1180 = load i8, ptr %1151, align 1, !tbaa !10
  %1181 = zext i8 %1180 to i16
  %1182 = add nsw i16 %1179, %1181
  %1183 = icmp ugt i16 %1182, 255
  %1184 = trunc nuw i16 %1182 to i8
  %1185 = icmp sgt i16 %1182, -1
  %1186 = sext i1 %1185 to i8
  %1187 = select i1 %1183, i8 %1186, i8 %1184
  store i8 %1187, ptr %1151, align 1, !tbaa !10
  %1188 = getelementptr inbounds nuw i8, ptr %1151, i32 8
  %1189 = load i8, ptr %1188, align 1, !tbaa !10
  %1190 = zext i8 %1189 to i16
  %1191 = add nsw i16 %1179, %1190
  %1192 = icmp ugt i16 %1191, 255
  %1193 = trunc nuw i16 %1191 to i8
  %1194 = icmp sgt i16 %1191, -1
  %1195 = sext i1 %1194 to i8
  %1196 = select i1 %1192, i8 %1195, i8 %1193
  store i8 %1196, ptr %1188, align 1, !tbaa !10
  %1197 = getelementptr inbounds nuw i8, ptr %1152, i32 1
  %1198 = getelementptr inbounds nuw i8, ptr %1151, i32 1
  %1199 = icmp eq ptr %1151, %1148
  br i1 %1199, label %1200, label %1149, !llvm.loop !33

1200:                                             ; preds = %1149
  %1201 = getelementptr inbounds nuw i8, ptr %1152, i32 9
  %1202 = getelementptr i8, ptr %1146, i32 16
  %1203 = add nuw nsw i8 %1144, 1
  %1204 = icmp samesign ult i8 %1144, 3
  br i1 %1204, label %1143, label %1205, !llvm.loop !34

1205:                                             ; preds = %1200, %1262
  %1206 = phi i8 [ %1265, %1262 ], [ 0, %1200 ]
  %1207 = phi ptr [ %1215, %1262 ], [ getelementptr inbounds nuw (i8, ptr @gCoeffBuf, i32 64), %1200 ]
  %1208 = phi ptr [ %1264, %1262 ], [ getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 128), %1200 ]
  %1209 = phi ptr [ %1263, %1262 ], [ getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 128), %1200 ]
  %1210 = getelementptr i8, ptr %1208, i32 7
  br label %1211

1211:                                             ; preds = %1211, %1205
  %1212 = phi ptr [ %1207, %1205 ], [ %1215, %1211 ]
  %1213 = phi ptr [ %1208, %1205 ], [ %1260, %1211 ]
  %1214 = phi ptr [ %1209, %1205 ], [ %1259, %1211 ]
  %1215 = getelementptr inbounds nuw i8, ptr %1212, i32 2
  %1216 = load i16, ptr %1212, align 2, !tbaa !11
  %1217 = and i16 %1216, 255
  %1218 = mul nuw nsw i16 %1217, 88
  %1219 = lshr i16 %1218, 8
  %1220 = add nsw i16 %1219, -44
  %1221 = load i8, ptr %1214, align 1, !tbaa !10
  %1222 = zext i8 %1221 to i16
  %1223 = sub nsw i16 %1222, %1220
  %1224 = icmp ugt i16 %1223, 255
  %1225 = trunc nuw i16 %1223 to i8
  %1226 = icmp sgt i16 %1223, -1
  %1227 = sext i1 %1226 to i8
  %1228 = select i1 %1224, i8 %1227, i8 %1225
  store i8 %1228, ptr %1214, align 1, !tbaa !10
  %1229 = getelementptr inbounds nuw i8, ptr %1214, i32 8
  %1230 = load i8, ptr %1229, align 1, !tbaa !10
  %1231 = zext i8 %1230 to i16
  %1232 = sub nsw i16 %1231, %1220
  %1233 = icmp ugt i16 %1232, 255
  %1234 = trunc nuw i16 %1232 to i8
  %1235 = icmp sgt i16 %1232, -1
  %1236 = sext i1 %1235 to i8
  %1237 = select i1 %1233, i8 %1236, i8 %1234
  store i8 %1237, ptr %1229, align 1, !tbaa !10
  %1238 = mul nuw i16 %1217, 198
  %1239 = lshr i16 %1238, 8
  %1240 = add nsw i16 %1217, -227
  %1241 = add nsw i16 %1240, %1239
  %1242 = load i8, ptr %1213, align 1, !tbaa !10
  %1243 = zext i8 %1242 to i16
  %1244 = add nsw i16 %1241, %1243
  %1245 = icmp ugt i16 %1244, 255
  %1246 = trunc nuw i16 %1244 to i8
  %1247 = icmp sgt i16 %1244, -1
  %1248 = sext i1 %1247 to i8
  %1249 = select i1 %1245, i8 %1248, i8 %1246
  store i8 %1249, ptr %1213, align 1, !tbaa !10
  %1250 = getelementptr inbounds nuw i8, ptr %1213, i32 8
  %1251 = load i8, ptr %1250, align 1, !tbaa !10
  %1252 = zext i8 %1251 to i16
  %1253 = add nsw i16 %1241, %1252
  %1254 = icmp ugt i16 %1253, 255
  %1255 = trunc nuw i16 %1253 to i8
  %1256 = icmp sgt i16 %1253, -1
  %1257 = sext i1 %1256 to i8
  %1258 = select i1 %1254, i8 %1257, i8 %1255
  store i8 %1258, ptr %1250, align 1, !tbaa !10
  %1259 = getelementptr inbounds nuw i8, ptr %1214, i32 1
  %1260 = getelementptr inbounds nuw i8, ptr %1213, i32 1
  %1261 = icmp eq ptr %1213, %1210
  br i1 %1261, label %1262, label %1211, !llvm.loop !33

1262:                                             ; preds = %1211
  %1263 = getelementptr inbounds nuw i8, ptr %1214, i32 9
  %1264 = getelementptr i8, ptr %1208, i32 16
  %1265 = add nuw nsw i8 %1206, 1
  %1266 = icmp samesign ult i8 %1206, 3
  br i1 %1266, label %1205, label %1712, !llvm.loop !34

1267:                                             ; preds = %1119, %1324
  %1268 = phi i8 [ %1327, %1324 ], [ 0, %1119 ]
  %1269 = phi ptr [ %1277, %1324 ], [ @gCoeffBuf, %1119 ]
  %1270 = phi ptr [ %1326, %1324 ], [ @gMCUBufG, %1119 ]
  %1271 = phi ptr [ %1325, %1324 ], [ @gMCUBufR, %1119 ]
  %1272 = getelementptr i8, ptr %1270, i32 7
  br label %1273

1273:                                             ; preds = %1273, %1267
  %1274 = phi ptr [ %1269, %1267 ], [ %1277, %1273 ]
  %1275 = phi ptr [ %1270, %1267 ], [ %1322, %1273 ]
  %1276 = phi ptr [ %1271, %1267 ], [ %1321, %1273 ]
  %1277 = getelementptr inbounds nuw i8, ptr %1274, i32 2
  %1278 = load i16, ptr %1274, align 2, !tbaa !11
  %1279 = and i16 %1278, 255
  %1280 = mul nuw nsw i16 %1279, 103
  %1281 = lshr i16 %1280, 8
  %1282 = add nsw i16 %1279, -179
  %1283 = add nsw i16 %1282, %1281
  %1284 = load i8, ptr %1276, align 1, !tbaa !10
  %1285 = zext i8 %1284 to i16
  %1286 = add nsw i16 %1283, %1285
  %1287 = icmp ugt i16 %1286, 255
  %1288 = trunc nuw i16 %1286 to i8
  %1289 = icmp sgt i16 %1286, -1
  %1290 = sext i1 %1289 to i8
  %1291 = select i1 %1287, i8 %1290, i8 %1288
  store i8 %1291, ptr %1276, align 1, !tbaa !10
  %1292 = getelementptr inbounds nuw i8, ptr %1276, i32 8
  %1293 = load i8, ptr %1292, align 1, !tbaa !10
  %1294 = zext i8 %1293 to i16
  %1295 = add nsw i16 %1283, %1294
  %1296 = icmp ugt i16 %1295, 255
  %1297 = trunc nuw i16 %1295 to i8
  %1298 = icmp sgt i16 %1295, -1
  %1299 = sext i1 %1298 to i8
  %1300 = select i1 %1296, i8 %1299, i8 %1297
  store i8 %1300, ptr %1292, align 1, !tbaa !10
  %1301 = mul nuw i16 %1279, 183
  %1302 = lshr i16 %1301, 8
  %1303 = add nsw i16 %1302, -91
  %1304 = load i8, ptr %1275, align 1, !tbaa !10
  %1305 = zext i8 %1304 to i16
  %1306 = sub nsw i16 %1305, %1303
  %1307 = icmp ugt i16 %1306, 255
  %1308 = trunc nuw i16 %1306 to i8
  %1309 = icmp sgt i16 %1306, -1
  %1310 = sext i1 %1309 to i8
  %1311 = select i1 %1307, i8 %1310, i8 %1308
  store i8 %1311, ptr %1275, align 1, !tbaa !10
  %1312 = getelementptr inbounds nuw i8, ptr %1275, i32 8
  %1313 = load i8, ptr %1312, align 1, !tbaa !10
  %1314 = zext i8 %1313 to i16
  %1315 = sub nsw i16 %1314, %1303
  %1316 = icmp ugt i16 %1315, 255
  %1317 = trunc nuw i16 %1315 to i8
  %1318 = icmp sgt i16 %1315, -1
  %1319 = sext i1 %1318 to i8
  %1320 = select i1 %1316, i8 %1319, i8 %1317
  store i8 %1320, ptr %1312, align 1, !tbaa !10
  %1321 = getelementptr inbounds nuw i8, ptr %1276, i32 1
  %1322 = getelementptr inbounds nuw i8, ptr %1275, i32 1
  %1323 = icmp eq ptr %1275, %1272
  br i1 %1323, label %1324, label %1273, !llvm.loop !35

1324:                                             ; preds = %1273
  %1325 = getelementptr inbounds nuw i8, ptr %1276, i32 9
  %1326 = getelementptr i8, ptr %1270, i32 16
  %1327 = add nuw nsw i8 %1268, 1
  %1328 = icmp samesign ult i8 %1268, 3
  br i1 %1328, label %1267, label %1329, !llvm.loop !36

1329:                                             ; preds = %1324, %1386
  %1330 = phi i8 [ %1389, %1386 ], [ 0, %1324 ]
  %1331 = phi ptr [ %1339, %1386 ], [ getelementptr inbounds nuw (i8, ptr @gCoeffBuf, i32 64), %1324 ]
  %1332 = phi ptr [ %1388, %1386 ], [ getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 128), %1324 ]
  %1333 = phi ptr [ %1387, %1386 ], [ getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 128), %1324 ]
  %1334 = getelementptr i8, ptr %1332, i32 7
  br label %1335

1335:                                             ; preds = %1335, %1329
  %1336 = phi ptr [ %1331, %1329 ], [ %1339, %1335 ]
  %1337 = phi ptr [ %1332, %1329 ], [ %1384, %1335 ]
  %1338 = phi ptr [ %1333, %1329 ], [ %1383, %1335 ]
  %1339 = getelementptr inbounds nuw i8, ptr %1336, i32 2
  %1340 = load i16, ptr %1336, align 2, !tbaa !11
  %1341 = and i16 %1340, 255
  %1342 = mul nuw nsw i16 %1341, 103
  %1343 = lshr i16 %1342, 8
  %1344 = add nsw i16 %1341, -179
  %1345 = add nsw i16 %1344, %1343
  %1346 = load i8, ptr %1338, align 1, !tbaa !10
  %1347 = zext i8 %1346 to i16
  %1348 = add nsw i16 %1345, %1347
  %1349 = icmp ugt i16 %1348, 255
  %1350 = trunc nuw i16 %1348 to i8
  %1351 = icmp sgt i16 %1348, -1
  %1352 = sext i1 %1351 to i8
  %1353 = select i1 %1349, i8 %1352, i8 %1350
  store i8 %1353, ptr %1338, align 1, !tbaa !10
  %1354 = getelementptr inbounds nuw i8, ptr %1338, i32 8
  %1355 = load i8, ptr %1354, align 1, !tbaa !10
  %1356 = zext i8 %1355 to i16
  %1357 = add nsw i16 %1345, %1356
  %1358 = icmp ugt i16 %1357, 255
  %1359 = trunc nuw i16 %1357 to i8
  %1360 = icmp sgt i16 %1357, -1
  %1361 = sext i1 %1360 to i8
  %1362 = select i1 %1358, i8 %1361, i8 %1359
  store i8 %1362, ptr %1354, align 1, !tbaa !10
  %1363 = mul nuw i16 %1341, 183
  %1364 = lshr i16 %1363, 8
  %1365 = add nsw i16 %1364, -91
  %1366 = load i8, ptr %1337, align 1, !tbaa !10
  %1367 = zext i8 %1366 to i16
  %1368 = sub nsw i16 %1367, %1365
  %1369 = icmp ugt i16 %1368, 255
  %1370 = trunc nuw i16 %1368 to i8
  %1371 = icmp sgt i16 %1368, -1
  %1372 = sext i1 %1371 to i8
  %1373 = select i1 %1369, i8 %1372, i8 %1370
  store i8 %1373, ptr %1337, align 1, !tbaa !10
  %1374 = getelementptr inbounds nuw i8, ptr %1337, i32 8
  %1375 = load i8, ptr %1374, align 1, !tbaa !10
  %1376 = zext i8 %1375 to i16
  %1377 = sub nsw i16 %1376, %1365
  %1378 = icmp ugt i16 %1377, 255
  %1379 = trunc nuw i16 %1377 to i8
  %1380 = icmp sgt i16 %1377, -1
  %1381 = sext i1 %1380 to i8
  %1382 = select i1 %1378, i8 %1381, i8 %1379
  store i8 %1382, ptr %1374, align 1, !tbaa !10
  %1383 = getelementptr inbounds nuw i8, ptr %1338, i32 1
  %1384 = getelementptr inbounds nuw i8, ptr %1337, i32 1
  %1385 = icmp eq ptr %1337, %1334
  br i1 %1385, label %1386, label %1335, !llvm.loop !35

1386:                                             ; preds = %1335
  %1387 = getelementptr inbounds nuw i8, ptr %1338, i32 9
  %1388 = getelementptr i8, ptr %1332, i32 16
  %1389 = add nuw nsw i8 %1330, 1
  %1390 = icmp samesign ult i8 %1330, 3
  br i1 %1390, label %1329, label %1712, !llvm.loop !36

1391:                                             ; preds = %1027
  %1392 = trunc nuw i32 %107 to i8
  switch i8 %1392, label %1712 [
    i8 0, label %1404
    i8 1, label %1393
    i8 2, label %1415
    i8 3, label %1539
  ]

1393:                                             ; preds = %1391, %1393
  %1394 = phi i32 [ %1402, %1393 ], [ 0, %1391 ]
  %1395 = shl i32 %1394, 1
  %1396 = getelementptr i8, ptr @gCoeffBuf, i32 %1395
  %1397 = getelementptr i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 64), i32 %1394
  %1398 = getelementptr i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 64), i32 %1394
  %1399 = getelementptr i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 64), i32 %1394
  %1400 = load <2 x i16>, ptr %1396, align 2, !tbaa !11
  %1401 = trunc <2 x i16> %1400 to <2 x i8>
  store <2 x i8> %1401, ptr %1399, align 1, !tbaa !10
  store <2 x i8> %1401, ptr %1398, align 1, !tbaa !10
  store <2 x i8> %1401, ptr %1397, align 1, !tbaa !10
  %1402 = add nuw i32 %1394, 2
  %1403 = icmp eq i32 %1402, 64
  br i1 %1403, label %1712, label %1393, !llvm.loop !37

1404:                                             ; preds = %1391, %1404
  %1405 = phi i32 [ %1413, %1404 ], [ 0, %1391 ]
  %1406 = shl i32 %1405, 1
  %1407 = getelementptr i8, ptr @gCoeffBuf, i32 %1406
  %1408 = getelementptr i8, ptr @gMCUBufB, i32 %1405
  %1409 = getelementptr i8, ptr @gMCUBufG, i32 %1405
  %1410 = getelementptr i8, ptr @gMCUBufR, i32 %1405
  %1411 = load <2 x i16>, ptr %1407, align 2, !tbaa !11
  %1412 = trunc <2 x i16> %1411 to <2 x i8>
  store <2 x i8> %1412, ptr %1410, align 1, !tbaa !10
  store <2 x i8> %1412, ptr %1409, align 1, !tbaa !10
  store <2 x i8> %1412, ptr %1408, align 1, !tbaa !10
  %1413 = add nuw i32 %1405, 2
  %1414 = icmp eq i32 %1413, 64
  br i1 %1414, label %1712, label %1404, !llvm.loop !38

1415:                                             ; preds = %1391, %1473
  %1416 = phi i8 [ %1475, %1473 ], [ 0, %1391 ]
  %1417 = phi ptr [ %1474, %1473 ], [ @gCoeffBuf, %1391 ]
  %1418 = phi ptr [ %1470, %1473 ], [ @gMCUBufB, %1391 ]
  %1419 = phi ptr [ %1469, %1473 ], [ @gMCUBufG, %1391 ]
  br label %1420

1420:                                             ; preds = %1420, %1415
  %1421 = phi i8 [ 0, %1415 ], [ %1471, %1420 ]
  %1422 = phi ptr [ %1417, %1415 ], [ %1425, %1420 ]
  %1423 = phi ptr [ %1418, %1415 ], [ %1470, %1420 ]
  %1424 = phi ptr [ %1419, %1415 ], [ %1469, %1420 ]
  %1425 = getelementptr inbounds nuw i8, ptr %1422, i32 2
  %1426 = load i16, ptr %1422, align 2, !tbaa !11
  %1427 = and i16 %1426, 255
  %1428 = mul nuw nsw i16 %1427, 88
  %1429 = lshr i16 %1428, 8
  %1430 = add nsw i16 %1429, -44
  %1431 = load i8, ptr %1424, align 1, !tbaa !10
  %1432 = zext i8 %1431 to i16
  %1433 = sub nsw i16 %1432, %1430
  %1434 = icmp ugt i16 %1433, 255
  %1435 = trunc nuw i16 %1433 to i8
  %1436 = icmp sgt i16 %1433, -1
  %1437 = sext i1 %1436 to i8
  %1438 = select i1 %1434, i8 %1437, i8 %1435
  store i8 %1438, ptr %1424, align 1, !tbaa !10
  %1439 = getelementptr inbounds nuw i8, ptr %1424, i32 1
  %1440 = load i8, ptr %1439, align 1, !tbaa !10
  %1441 = zext i8 %1440 to i16
  %1442 = sub nsw i16 %1441, %1430
  %1443 = icmp ugt i16 %1442, 255
  %1444 = trunc nuw i16 %1442 to i8
  %1445 = icmp sgt i16 %1442, -1
  %1446 = sext i1 %1445 to i8
  %1447 = select i1 %1443, i8 %1446, i8 %1444
  store i8 %1447, ptr %1439, align 1, !tbaa !10
  %1448 = mul nuw i16 %1427, 198
  %1449 = lshr i16 %1448, 8
  %1450 = add nsw i16 %1427, -227
  %1451 = add nsw i16 %1450, %1449
  %1452 = load i8, ptr %1423, align 1, !tbaa !10
  %1453 = zext i8 %1452 to i16
  %1454 = add nsw i16 %1451, %1453
  %1455 = icmp ugt i16 %1454, 255
  %1456 = trunc nuw i16 %1454 to i8
  %1457 = icmp sgt i16 %1454, -1
  %1458 = sext i1 %1457 to i8
  %1459 = select i1 %1455, i8 %1458, i8 %1456
  store i8 %1459, ptr %1423, align 1, !tbaa !10
  %1460 = getelementptr inbounds nuw i8, ptr %1423, i32 1
  %1461 = load i8, ptr %1460, align 1, !tbaa !10
  %1462 = zext i8 %1461 to i16
  %1463 = add nsw i16 %1451, %1462
  %1464 = icmp ugt i16 %1463, 255
  %1465 = trunc nuw i16 %1463 to i8
  %1466 = icmp sgt i16 %1463, -1
  %1467 = sext i1 %1466 to i8
  %1468 = select i1 %1464, i8 %1467, i8 %1465
  store i8 %1468, ptr %1460, align 1, !tbaa !10
  %1469 = getelementptr inbounds nuw i8, ptr %1424, i32 2
  %1470 = getelementptr inbounds nuw i8, ptr %1423, i32 2
  %1471 = add nuw nsw i8 %1421, 1
  %1472 = icmp samesign ult i8 %1421, 3
  br i1 %1472, label %1420, label %1473, !llvm.loop !39

1473:                                             ; preds = %1420
  %1474 = getelementptr inbounds nuw i8, ptr %1422, i32 10
  %1475 = add nuw nsw i8 %1416, 1
  %1476 = icmp samesign ult i8 %1416, 7
  br i1 %1476, label %1415, label %1477, !llvm.loop !40

1477:                                             ; preds = %1473, %1535
  %1478 = phi i8 [ %1537, %1535 ], [ 0, %1473 ]
  %1479 = phi ptr [ %1536, %1535 ], [ getelementptr inbounds nuw (i8, ptr @gCoeffBuf, i32 8), %1473 ]
  %1480 = phi ptr [ %1532, %1535 ], [ getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 64), %1473 ]
  %1481 = phi ptr [ %1531, %1535 ], [ getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 64), %1473 ]
  br label %1482

1482:                                             ; preds = %1482, %1477
  %1483 = phi i8 [ 0, %1477 ], [ %1533, %1482 ]
  %1484 = phi ptr [ %1479, %1477 ], [ %1487, %1482 ]
  %1485 = phi ptr [ %1480, %1477 ], [ %1532, %1482 ]
  %1486 = phi ptr [ %1481, %1477 ], [ %1531, %1482 ]
  %1487 = getelementptr inbounds nuw i8, ptr %1484, i32 2
  %1488 = load i16, ptr %1484, align 2, !tbaa !11
  %1489 = and i16 %1488, 255
  %1490 = mul nuw nsw i16 %1489, 88
  %1491 = lshr i16 %1490, 8
  %1492 = add nsw i16 %1491, -44
  %1493 = load i8, ptr %1486, align 1, !tbaa !10
  %1494 = zext i8 %1493 to i16
  %1495 = sub nsw i16 %1494, %1492
  %1496 = icmp ugt i16 %1495, 255
  %1497 = trunc nuw i16 %1495 to i8
  %1498 = icmp sgt i16 %1495, -1
  %1499 = sext i1 %1498 to i8
  %1500 = select i1 %1496, i8 %1499, i8 %1497
  store i8 %1500, ptr %1486, align 1, !tbaa !10
  %1501 = getelementptr inbounds nuw i8, ptr %1486, i32 1
  %1502 = load i8, ptr %1501, align 1, !tbaa !10
  %1503 = zext i8 %1502 to i16
  %1504 = sub nsw i16 %1503, %1492
  %1505 = icmp ugt i16 %1504, 255
  %1506 = trunc nuw i16 %1504 to i8
  %1507 = icmp sgt i16 %1504, -1
  %1508 = sext i1 %1507 to i8
  %1509 = select i1 %1505, i8 %1508, i8 %1506
  store i8 %1509, ptr %1501, align 1, !tbaa !10
  %1510 = mul nuw i16 %1489, 198
  %1511 = lshr i16 %1510, 8
  %1512 = add nsw i16 %1489, -227
  %1513 = add nsw i16 %1512, %1511
  %1514 = load i8, ptr %1485, align 1, !tbaa !10
  %1515 = zext i8 %1514 to i16
  %1516 = add nsw i16 %1513, %1515
  %1517 = icmp ugt i16 %1516, 255
  %1518 = trunc nuw i16 %1516 to i8
  %1519 = icmp sgt i16 %1516, -1
  %1520 = sext i1 %1519 to i8
  %1521 = select i1 %1517, i8 %1520, i8 %1518
  store i8 %1521, ptr %1485, align 1, !tbaa !10
  %1522 = getelementptr inbounds nuw i8, ptr %1485, i32 1
  %1523 = load i8, ptr %1522, align 1, !tbaa !10
  %1524 = zext i8 %1523 to i16
  %1525 = add nsw i16 %1513, %1524
  %1526 = icmp ugt i16 %1525, 255
  %1527 = trunc nuw i16 %1525 to i8
  %1528 = icmp sgt i16 %1525, -1
  %1529 = sext i1 %1528 to i8
  %1530 = select i1 %1526, i8 %1529, i8 %1527
  store i8 %1530, ptr %1522, align 1, !tbaa !10
  %1531 = getelementptr inbounds nuw i8, ptr %1486, i32 2
  %1532 = getelementptr inbounds nuw i8, ptr %1485, i32 2
  %1533 = add nuw nsw i8 %1483, 1
  %1534 = icmp samesign ult i8 %1483, 3
  br i1 %1534, label %1482, label %1535, !llvm.loop !39

1535:                                             ; preds = %1482
  %1536 = getelementptr inbounds nuw i8, ptr %1484, i32 10
  %1537 = add nuw nsw i8 %1478, 1
  %1538 = icmp samesign ult i8 %1478, 7
  br i1 %1538, label %1477, label %1712, !llvm.loop !40

1539:                                             ; preds = %1391, %1597
  %1540 = phi i8 [ %1599, %1597 ], [ 0, %1391 ]
  %1541 = phi ptr [ %1598, %1597 ], [ @gCoeffBuf, %1391 ]
  %1542 = phi ptr [ %1594, %1597 ], [ @gMCUBufG, %1391 ]
  %1543 = phi ptr [ %1593, %1597 ], [ @gMCUBufR, %1391 ]
  br label %1544

1544:                                             ; preds = %1544, %1539
  %1545 = phi i8 [ 0, %1539 ], [ %1595, %1544 ]
  %1546 = phi ptr [ %1541, %1539 ], [ %1549, %1544 ]
  %1547 = phi ptr [ %1542, %1539 ], [ %1594, %1544 ]
  %1548 = phi ptr [ %1543, %1539 ], [ %1593, %1544 ]
  %1549 = getelementptr inbounds nuw i8, ptr %1546, i32 2
  %1550 = load i16, ptr %1546, align 2, !tbaa !11
  %1551 = and i16 %1550, 255
  %1552 = mul nuw nsw i16 %1551, 103
  %1553 = lshr i16 %1552, 8
  %1554 = add nsw i16 %1551, -179
  %1555 = add nsw i16 %1554, %1553
  %1556 = load i8, ptr %1548, align 1, !tbaa !10
  %1557 = zext i8 %1556 to i16
  %1558 = add nsw i16 %1555, %1557
  %1559 = icmp ugt i16 %1558, 255
  %1560 = trunc nuw i16 %1558 to i8
  %1561 = icmp sgt i16 %1558, -1
  %1562 = sext i1 %1561 to i8
  %1563 = select i1 %1559, i8 %1562, i8 %1560
  store i8 %1563, ptr %1548, align 1, !tbaa !10
  %1564 = getelementptr inbounds nuw i8, ptr %1548, i32 1
  %1565 = load i8, ptr %1564, align 1, !tbaa !10
  %1566 = zext i8 %1565 to i16
  %1567 = add nsw i16 %1555, %1566
  %1568 = icmp ugt i16 %1567, 255
  %1569 = trunc nuw i16 %1567 to i8
  %1570 = icmp sgt i16 %1567, -1
  %1571 = sext i1 %1570 to i8
  %1572 = select i1 %1568, i8 %1571, i8 %1569
  store i8 %1572, ptr %1564, align 1, !tbaa !10
  %1573 = mul nuw i16 %1551, 183
  %1574 = lshr i16 %1573, 8
  %1575 = add nsw i16 %1574, -91
  %1576 = load i8, ptr %1547, align 1, !tbaa !10
  %1577 = zext i8 %1576 to i16
  %1578 = sub nsw i16 %1577, %1575
  %1579 = icmp ugt i16 %1578, 255
  %1580 = trunc nuw i16 %1578 to i8
  %1581 = icmp sgt i16 %1578, -1
  %1582 = sext i1 %1581 to i8
  %1583 = select i1 %1579, i8 %1582, i8 %1580
  store i8 %1583, ptr %1547, align 1, !tbaa !10
  %1584 = getelementptr inbounds nuw i8, ptr %1547, i32 1
  %1585 = load i8, ptr %1584, align 1, !tbaa !10
  %1586 = zext i8 %1585 to i16
  %1587 = sub nsw i16 %1586, %1575
  %1588 = icmp ugt i16 %1587, 255
  %1589 = trunc nuw i16 %1587 to i8
  %1590 = icmp sgt i16 %1587, -1
  %1591 = sext i1 %1590 to i8
  %1592 = select i1 %1588, i8 %1591, i8 %1589
  store i8 %1592, ptr %1584, align 1, !tbaa !10
  %1593 = getelementptr inbounds nuw i8, ptr %1548, i32 2
  %1594 = getelementptr inbounds nuw i8, ptr %1547, i32 2
  %1595 = add nuw nsw i8 %1545, 1
  %1596 = icmp samesign ult i8 %1545, 3
  br i1 %1596, label %1544, label %1597, !llvm.loop !41

1597:                                             ; preds = %1544
  %1598 = getelementptr inbounds nuw i8, ptr %1546, i32 10
  %1599 = add nuw nsw i8 %1540, 1
  %1600 = icmp samesign ult i8 %1540, 7
  br i1 %1600, label %1539, label %1601, !llvm.loop !42

1601:                                             ; preds = %1597, %1659
  %1602 = phi i8 [ %1661, %1659 ], [ 0, %1597 ]
  %1603 = phi ptr [ %1660, %1659 ], [ getelementptr inbounds nuw (i8, ptr @gCoeffBuf, i32 8), %1597 ]
  %1604 = phi ptr [ %1656, %1659 ], [ getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 64), %1597 ]
  %1605 = phi ptr [ %1655, %1659 ], [ getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 64), %1597 ]
  br label %1606

1606:                                             ; preds = %1606, %1601
  %1607 = phi i8 [ 0, %1601 ], [ %1657, %1606 ]
  %1608 = phi ptr [ %1603, %1601 ], [ %1611, %1606 ]
  %1609 = phi ptr [ %1604, %1601 ], [ %1656, %1606 ]
  %1610 = phi ptr [ %1605, %1601 ], [ %1655, %1606 ]
  %1611 = getelementptr inbounds nuw i8, ptr %1608, i32 2
  %1612 = load i16, ptr %1608, align 2, !tbaa !11
  %1613 = and i16 %1612, 255
  %1614 = mul nuw nsw i16 %1613, 103
  %1615 = lshr i16 %1614, 8
  %1616 = add nsw i16 %1613, -179
  %1617 = add nsw i16 %1616, %1615
  %1618 = load i8, ptr %1610, align 1, !tbaa !10
  %1619 = zext i8 %1618 to i16
  %1620 = add nsw i16 %1617, %1619
  %1621 = icmp ugt i16 %1620, 255
  %1622 = trunc nuw i16 %1620 to i8
  %1623 = icmp sgt i16 %1620, -1
  %1624 = sext i1 %1623 to i8
  %1625 = select i1 %1621, i8 %1624, i8 %1622
  store i8 %1625, ptr %1610, align 1, !tbaa !10
  %1626 = getelementptr inbounds nuw i8, ptr %1610, i32 1
  %1627 = load i8, ptr %1626, align 1, !tbaa !10
  %1628 = zext i8 %1627 to i16
  %1629 = add nsw i16 %1617, %1628
  %1630 = icmp ugt i16 %1629, 255
  %1631 = trunc nuw i16 %1629 to i8
  %1632 = icmp sgt i16 %1629, -1
  %1633 = sext i1 %1632 to i8
  %1634 = select i1 %1630, i8 %1633, i8 %1631
  store i8 %1634, ptr %1626, align 1, !tbaa !10
  %1635 = mul nuw i16 %1613, 183
  %1636 = lshr i16 %1635, 8
  %1637 = add nsw i16 %1636, -91
  %1638 = load i8, ptr %1609, align 1, !tbaa !10
  %1639 = zext i8 %1638 to i16
  %1640 = sub nsw i16 %1639, %1637
  %1641 = icmp ugt i16 %1640, 255
  %1642 = trunc nuw i16 %1640 to i8
  %1643 = icmp sgt i16 %1640, -1
  %1644 = sext i1 %1643 to i8
  %1645 = select i1 %1641, i8 %1644, i8 %1642
  store i8 %1645, ptr %1609, align 1, !tbaa !10
  %1646 = getelementptr inbounds nuw i8, ptr %1609, i32 1
  %1647 = load i8, ptr %1646, align 1, !tbaa !10
  %1648 = zext i8 %1647 to i16
  %1649 = sub nsw i16 %1648, %1637
  %1650 = icmp ugt i16 %1649, 255
  %1651 = trunc nuw i16 %1649 to i8
  %1652 = icmp sgt i16 %1649, -1
  %1653 = sext i1 %1652 to i8
  %1654 = select i1 %1650, i8 %1653, i8 %1651
  store i8 %1654, ptr %1646, align 1, !tbaa !10
  %1655 = getelementptr inbounds nuw i8, ptr %1610, i32 2
  %1656 = getelementptr inbounds nuw i8, ptr %1609, i32 2
  %1657 = add nuw nsw i8 %1607, 1
  %1658 = icmp samesign ult i8 %1607, 3
  br i1 %1658, label %1606, label %1659, !llvm.loop !41

1659:                                             ; preds = %1606
  %1660 = getelementptr inbounds nuw i8, ptr %1608, i32 10
  %1661 = add nuw nsw i8 %1602, 1
  %1662 = icmp samesign ult i8 %1602, 7
  br i1 %1662, label %1601, label %1712, !llvm.loop !42

1663:                                             ; preds = %1027
  %1664 = trunc nuw i32 %107 to i8
  switch i8 %1664, label %1712 [
    i8 0, label %1698
    i8 1, label %1687
    i8 2, label %1676
    i8 3, label %1665
    i8 4, label %1709
    i8 5, label %1710
  ]

1665:                                             ; preds = %1663, %1665
  %1666 = phi i32 [ %1674, %1665 ], [ 0, %1663 ]
  %1667 = shl i32 %1666, 1
  %1668 = getelementptr i8, ptr @gCoeffBuf, i32 %1667
  %1669 = getelementptr i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 192), i32 %1666
  %1670 = getelementptr i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 192), i32 %1666
  %1671 = getelementptr i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 192), i32 %1666
  %1672 = load <2 x i16>, ptr %1668, align 2, !tbaa !11
  %1673 = trunc <2 x i16> %1672 to <2 x i8>
  store <2 x i8> %1673, ptr %1671, align 1, !tbaa !10
  store <2 x i8> %1673, ptr %1670, align 1, !tbaa !10
  store <2 x i8> %1673, ptr %1669, align 1, !tbaa !10
  %1674 = add nuw i32 %1666, 2
  %1675 = icmp eq i32 %1674, 64
  br i1 %1675, label %1712, label %1665, !llvm.loop !43

1676:                                             ; preds = %1663, %1676
  %1677 = phi i32 [ %1685, %1676 ], [ 0, %1663 ]
  %1678 = shl i32 %1677, 1
  %1679 = getelementptr i8, ptr @gCoeffBuf, i32 %1678
  %1680 = getelementptr i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 128), i32 %1677
  %1681 = getelementptr i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 128), i32 %1677
  %1682 = getelementptr i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 128), i32 %1677
  %1683 = load <2 x i16>, ptr %1679, align 2, !tbaa !11
  %1684 = trunc <2 x i16> %1683 to <2 x i8>
  store <2 x i8> %1684, ptr %1682, align 1, !tbaa !10
  store <2 x i8> %1684, ptr %1681, align 1, !tbaa !10
  store <2 x i8> %1684, ptr %1680, align 1, !tbaa !10
  %1685 = add nuw i32 %1677, 2
  %1686 = icmp eq i32 %1685, 64
  br i1 %1686, label %1712, label %1676, !llvm.loop !44

1687:                                             ; preds = %1663, %1687
  %1688 = phi i32 [ %1696, %1687 ], [ 0, %1663 ]
  %1689 = shl i32 %1688, 1
  %1690 = getelementptr i8, ptr @gCoeffBuf, i32 %1689
  %1691 = getelementptr i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufB, i32 64), i32 %1688
  %1692 = getelementptr i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufG, i32 64), i32 %1688
  %1693 = getelementptr i8, ptr getelementptr inbounds nuw (i8, ptr @gMCUBufR, i32 64), i32 %1688
  %1694 = load <2 x i16>, ptr %1690, align 2, !tbaa !11
  %1695 = trunc <2 x i16> %1694 to <2 x i8>
  store <2 x i8> %1695, ptr %1693, align 1, !tbaa !10
  store <2 x i8> %1695, ptr %1692, align 1, !tbaa !10
  store <2 x i8> %1695, ptr %1691, align 1, !tbaa !10
  %1696 = add nuw i32 %1688, 2
  %1697 = icmp eq i32 %1696, 64
  br i1 %1697, label %1712, label %1687, !llvm.loop !45

1698:                                             ; preds = %1663, %1698
  %1699 = phi i32 [ %1707, %1698 ], [ 0, %1663 ]
  %1700 = shl i32 %1699, 1
  %1701 = getelementptr i8, ptr @gCoeffBuf, i32 %1700
  %1702 = getelementptr i8, ptr @gMCUBufB, i32 %1699
  %1703 = getelementptr i8, ptr @gMCUBufG, i32 %1699
  %1704 = getelementptr i8, ptr @gMCUBufR, i32 %1699
  %1705 = load <2 x i16>, ptr %1701, align 2, !tbaa !11
  %1706 = trunc <2 x i16> %1705 to <2 x i8>
  store <2 x i8> %1706, ptr %1704, align 1, !tbaa !10
  store <2 x i8> %1706, ptr %1703, align 1, !tbaa !10
  store <2 x i8> %1706, ptr %1702, align 1, !tbaa !10
  %1707 = add nuw i32 %1699, 2
  %1708 = icmp eq i32 %1707, 64
  br i1 %1708, label %1712, label %1698, !llvm.loop !46

1709:                                             ; preds = %1663
  tail call fastcc void @upsampleCb(i8 noundef zeroext 0, i8 noundef zeroext 0) #7
  tail call fastcc void @upsampleCb(i8 noundef zeroext 4, i8 noundef zeroext 64) #7
  tail call fastcc void @upsampleCb(i8 noundef zeroext 32, i8 noundef zeroext -128) #7
  tail call fastcc void @upsampleCb(i8 noundef zeroext 36, i8 noundef zeroext -64) #7
  br label %1712

1710:                                             ; preds = %1663
  tail call fastcc void @upsampleCr(i8 noundef zeroext 0, i8 noundef zeroext 0) #7
  tail call fastcc void @upsampleCr(i8 noundef zeroext 4, i8 noundef zeroext 64) #7
  tail call fastcc void @upsampleCr(i8 noundef zeroext 32, i8 noundef zeroext -128) #7
  tail call fastcc void @upsampleCr(i8 noundef zeroext 36, i8 noundef zeroext -64) #7
  br label %1712

1711:                                             ; preds = %1027
  unreachable

1712:                                             ; preds = %1665, %1676, %1687, %1698, %1659, %1535, %1393, %1404, %1386, %1262, %1121, %1132, %1042, %1075, %1108, %1029, %1710, %1709, %1663, %1391, %1119, %1040, %494, %419, %418, %417, %416, %415, %413, %370, %327, %326, %325, %323, %280, %237, %236, %235, %233, %206, %179, %178, %176, %175
  %1713 = add nuw nsw i32 %107, 1
  %1714 = load i8, ptr @gMaxBlocksPerMCU, align 1, !tbaa !10
  %1715 = zext i8 %1714 to i32
  %1716 = icmp samesign ult i32 %1713, %1715
  br i1 %1716, label %106, label %1722, !llvm.loop !47

1717:                                             ; preds = %42, %72, %149, %154, %579, %611, %76
  %1718 = phi i8 [ 28, %149 ], [ 29, %76 ], [ 28, %579 ], [ 29, %72 ], [ 28, %611 ], [ 28, %154 ], [ 29, %42 ]
  %1719 = load i8, ptr @gCallbackStatus, align 1
  %1720 = icmp eq i8 %1719, 0
  %1721 = select i1 %1720, i8 %1718, i8 %1719
  br label %1728

1722:                                             ; preds = %1712, %103
  %1723 = load i8, ptr @gCallbackStatus, align 1
  %1724 = icmp eq i8 %1723, 0
  br i1 %1724, label %1725, label %1728

1725:                                             ; preds = %1722
  %1726 = load i16, ptr @gNumMCUSRemaining, align 2, !tbaa !11
  %1727 = add i16 %1726, -1
  store i16 %1727, ptr @gNumMCUSRemaining, align 2, !tbaa !11
  br label %1728

1728:                                             ; preds = %1722, %1717, %3, %0, %1725
  %1729 = phi i8 [ %1, %0 ], [ 1, %3 ], [ 0, %1725 ], [ %1721, %1717 ], [ %1723, %1722 ]
  ret i8 %1729
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: nounwind
define dso_local zeroext i8 @pjpeg_decode_init(ptr noundef writeonly captures(none) initializes((0, 44)) %0, ptr noundef %1, ptr noundef %2, i8 noundef zeroext %3) local_unnamed_addr #0 {
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  store i32 0, ptr %0, align 4, !tbaa !48
  %7 = getelementptr inbounds nuw i8, ptr %0, i32 4
  store i32 0, ptr %7, align 4, !tbaa !51
  %8 = getelementptr inbounds nuw i8, ptr %0, i32 8
  store i32 0, ptr %8, align 4, !tbaa !52
  %9 = getelementptr inbounds nuw i8, ptr %0, i32 12
  store i32 0, ptr %9, align 4, !tbaa !53
  %10 = getelementptr inbounds nuw i8, ptr %0, i32 16
  store i32 0, ptr %10, align 4, !tbaa !54
  %11 = getelementptr inbounds nuw i8, ptr %0, i32 20
  store i32 0, ptr %11, align 4, !tbaa !55
  %12 = getelementptr inbounds nuw i8, ptr %0, i32 24
  store i32 0, ptr %12, align 4, !tbaa !56
  %13 = getelementptr inbounds nuw i8, ptr %0, i32 28
  store i32 0, ptr %13, align 4, !tbaa !57
  %14 = getelementptr inbounds nuw i8, ptr %0, i32 32
  store ptr null, ptr %14, align 4, !tbaa !58
  %15 = getelementptr inbounds nuw i8, ptr %0, i32 36
  store ptr null, ptr %15, align 4, !tbaa !59
  %16 = getelementptr inbounds nuw i8, ptr %0, i32 40
  store ptr null, ptr %16, align 4, !tbaa !60
  store ptr %1, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  store ptr %2, ptr @g_pCallback_data, align 4, !tbaa !13
  store i8 0, ptr @gCallbackStatus, align 1, !tbaa !10
  store i8 %3, ptr @gReduce, align 1, !tbaa !10
  store i16 0, ptr @gImageXSize, align 2, !tbaa !11
  store i16 0, ptr @gImageYSize, align 2, !tbaa !11
  store i8 0, ptr @gCompsInFrame, align 1, !tbaa !10
  store i16 0, ptr @gRestartInterval, align 2, !tbaa !11
  store i8 0, ptr @gCompsInScan, align 1, !tbaa !10
  store i8 0, ptr @gValidHuffTables, align 1, !tbaa !10
  store i8 0, ptr @gValidQuantTables, align 1, !tbaa !10
  store i8 0, ptr @gTemFlag, align 1, !tbaa !10
  store i8 0, ptr @gInBufLeft, align 1, !tbaa !10
  store i8 0, ptr @gBitsLeft, align 1, !tbaa !10
  store i16 0, ptr @gBitBuf, align 2, !tbaa !11
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %17 = tail call zeroext i8 %1(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %2) #6
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %20, label %19

19:                                               ; preds = %4
  store i8 %17, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %20

20:                                               ; preds = %19, %4
  %21 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %30, label %23

23:                                               ; preds = %20
  %24 = add i8 %21, -1
  store i8 %24, ptr @gInBufLeft, align 1, !tbaa !10
  %25 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %26 = add i8 %25, 1
  store i8 %26, ptr @gInBufOfs, align 1, !tbaa !10
  %27 = zext i8 %25 to i32
  %28 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %27
  %29 = load i8, ptr %28, align 1, !tbaa !10
  br label %35

30:                                               ; preds = %20
  %31 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %32 = xor i8 %31, -1
  store i8 %32, ptr @gTemFlag, align 1, !tbaa !10
  %33 = icmp eq i8 %31, -1
  %34 = select i1 %33, i8 -39, i8 -1
  br label %35

35:                                               ; preds = %23, %30
  %36 = phi i8 [ 0, %30 ], [ %24, %23 ]
  %37 = phi i8 [ %34, %30 ], [ %29, %23 ]
  %38 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %39 = zext i8 %37 to i16
  %40 = or i16 %38, %39
  %41 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %42 = zext i8 %41 to i32
  %43 = sub nsw i32 8, %42
  %44 = zext i16 %40 to i32
  %45 = shl nuw nsw i32 %44, %43
  %46 = trunc i32 %45 to i16
  store i16 %46, ptr @gBitBuf, align 2, !tbaa !11
  %47 = load i8, ptr @gCallbackStatus, align 1, !tbaa !10
  %48 = icmp eq i8 %47, 0
  br i1 %48, label %49, label %1127

49:                                               ; preds = %35
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #8
  %50 = icmp ult i8 %41, 8
  br i1 %50, label %51, label %88

51:                                               ; preds = %49
  %52 = shl i32 %45, %42
  %53 = trunc i32 %52 to i16
  store i16 %53, ptr @gBitBuf, align 2, !tbaa !11
  %54 = icmp eq i8 %36, 0
  br i1 %54, label %55, label %64

55:                                               ; preds = %51
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %56 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %57 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %58 = tail call zeroext i8 %56(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %57) #6
  %59 = icmp eq i8 %58, 0
  br i1 %59, label %61, label %60

60:                                               ; preds = %55
  store i8 %58, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %61

61:                                               ; preds = %60, %55
  %62 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %63 = icmp eq i8 %62, 0
  br i1 %63, label %72, label %64

64:                                               ; preds = %61, %51
  %65 = phi i8 [ %62, %61 ], [ %36, %51 ]
  %66 = add i8 %65, -1
  store i8 %66, ptr @gInBufLeft, align 1, !tbaa !10
  %67 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %68 = add i8 %67, 1
  store i8 %68, ptr @gInBufOfs, align 1, !tbaa !10
  %69 = zext i8 %67 to i32
  %70 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %69
  %71 = load i8, ptr %70, align 1, !tbaa !10
  br label %77

72:                                               ; preds = %61
  %73 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %74 = xor i8 %73, -1
  store i8 %74, ptr @gTemFlag, align 1, !tbaa !10
  %75 = icmp eq i8 %73, -1
  %76 = select i1 %75, i8 -39, i8 -1
  br label %77

77:                                               ; preds = %72, %64
  %78 = phi i8 [ 0, %72 ], [ %66, %64 ]
  %79 = phi i8 [ %76, %72 ], [ %71, %64 ]
  %80 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %81 = zext i8 %79 to i16
  %82 = or i16 %80, %81
  %83 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %84 = zext i8 %83 to i32
  %85 = sub nsw i32 8, %84
  %86 = zext i16 %82 to i32
  %87 = shl nuw nsw i32 %86, %85
  br label %92

88:                                               ; preds = %49
  %89 = add i8 %41, -8
  %90 = shl i32 %45, 8
  %91 = and i32 %90, 16776960
  br label %92

92:                                               ; preds = %88, %77
  %93 = phi i8 [ %78, %77 ], [ %36, %88 ]
  %94 = phi i32 [ %87, %77 ], [ %91, %88 ]
  %95 = phi i8 [ %83, %77 ], [ %89, %88 ]
  store i8 %95, ptr @gBitsLeft, align 1, !tbaa !10
  %96 = icmp ult i8 %95, 8
  %97 = and i32 %94, 65535
  br i1 %96, label %98, label %136

98:                                               ; preds = %92
  %99 = zext nneg i8 %95 to i32
  %100 = shl i32 %94, %99
  %101 = trunc i32 %100 to i16
  store i16 %101, ptr @gBitBuf, align 2, !tbaa !11
  %102 = icmp eq i8 %93, 0
  br i1 %102, label %103, label %112

103:                                              ; preds = %98
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %104 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %105 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %106 = tail call zeroext i8 %104(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %105) #6
  %107 = icmp eq i8 %106, 0
  br i1 %107, label %109, label %108

108:                                              ; preds = %103
  store i8 %106, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %109

109:                                              ; preds = %108, %103
  %110 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %111 = icmp eq i8 %110, 0
  br i1 %111, label %120, label %112

112:                                              ; preds = %109, %98
  %113 = phi i8 [ %110, %109 ], [ %93, %98 ]
  %114 = add i8 %113, -1
  store i8 %114, ptr @gInBufLeft, align 1, !tbaa !10
  %115 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %116 = add i8 %115, 1
  store i8 %116, ptr @gInBufOfs, align 1, !tbaa !10
  %117 = zext i8 %115 to i32
  %118 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %117
  %119 = load i8, ptr %118, align 1, !tbaa !10
  br label %125

120:                                              ; preds = %109
  %121 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %122 = xor i8 %121, -1
  store i8 %122, ptr @gTemFlag, align 1, !tbaa !10
  %123 = icmp eq i8 %121, -1
  %124 = select i1 %123, i8 -39, i8 -1
  br label %125

125:                                              ; preds = %120, %112
  %126 = phi i8 [ 0, %120 ], [ %114, %112 ]
  %127 = phi i8 [ %124, %120 ], [ %119, %112 ]
  %128 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %129 = zext i8 %127 to i16
  %130 = or i16 %128, %129
  %131 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %132 = zext i8 %131 to i32
  %133 = sub nsw i32 8, %132
  %134 = zext i16 %130 to i32
  %135 = shl nuw nsw i32 %134, %133
  br label %139

136:                                              ; preds = %92
  %137 = add i8 %95, -8
  %138 = shl nuw nsw i32 %97, 8
  br label %139

139:                                              ; preds = %136, %125
  %140 = phi i8 [ %126, %125 ], [ %93, %136 ]
  %141 = phi i32 [ %135, %125 ], [ %138, %136 ]
  %142 = phi i8 [ %131, %125 ], [ %137, %136 ]
  %143 = trunc i32 %141 to i16
  store i16 %143, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %142, ptr @gBitsLeft, align 1, !tbaa !10
  %144 = lshr i32 %97, 8
  %145 = icmp ugt i16 %46, -257
  %146 = icmp eq i32 %144, 216
  %147 = select i1 %145, i1 %146, i1 false
  br i1 %147, label %213, label %148

148:                                              ; preds = %139
  %149 = trunc nuw i32 %144 to i8
  br label %150

150:                                              ; preds = %208, %148
  %151 = phi i8 [ %200, %208 ], [ %140, %148 ]
  %152 = phi i8 [ %202, %208 ], [ %142, %148 ]
  %153 = phi i16 [ %203, %208 ], [ %143, %148 ]
  %154 = phi i16 [ %209, %208 ], [ 4095, %148 ]
  %155 = phi i8 [ %205, %208 ], [ %149, %148 ]
  %156 = icmp ult i8 %152, 8
  %157 = zext i16 %153 to i32
  br i1 %156, label %158, label %196

158:                                              ; preds = %150
  %159 = zext nneg i8 %152 to i32
  %160 = shl nuw nsw i32 %157, %159
  %161 = trunc i32 %160 to i16
  store i16 %161, ptr @gBitBuf, align 2, !tbaa !11
  %162 = icmp eq i8 %151, 0
  br i1 %162, label %163, label %172

163:                                              ; preds = %158
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %164 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %165 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %166 = tail call zeroext i8 %164(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %165) #6
  %167 = icmp eq i8 %166, 0
  br i1 %167, label %169, label %168

168:                                              ; preds = %163
  store i8 %166, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %169

169:                                              ; preds = %168, %163
  %170 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %171 = icmp eq i8 %170, 0
  br i1 %171, label %180, label %172

172:                                              ; preds = %169, %158
  %173 = phi i8 [ %170, %169 ], [ %151, %158 ]
  %174 = add i8 %173, -1
  store i8 %174, ptr @gInBufLeft, align 1, !tbaa !10
  %175 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %176 = add i8 %175, 1
  store i8 %176, ptr @gInBufOfs, align 1, !tbaa !10
  %177 = zext i8 %175 to i32
  %178 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %177
  %179 = load i8, ptr %178, align 1, !tbaa !10
  br label %185

180:                                              ; preds = %169
  %181 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %182 = xor i8 %181, -1
  store i8 %182, ptr @gTemFlag, align 1, !tbaa !10
  %183 = icmp eq i8 %181, -1
  %184 = select i1 %183, i8 -39, i8 -1
  br label %185

185:                                              ; preds = %180, %172
  %186 = phi i8 [ 0, %180 ], [ %174, %172 ]
  %187 = phi i8 [ %184, %180 ], [ %179, %172 ]
  %188 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %189 = zext i8 %187 to i16
  %190 = or i16 %188, %189
  %191 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %192 = zext i8 %191 to i32
  %193 = sub nsw i32 8, %192
  %194 = zext i16 %190 to i32
  %195 = shl nuw nsw i32 %194, %193
  br label %199

196:                                              ; preds = %150
  %197 = add i8 %152, -8
  %198 = shl nuw nsw i32 %157, 8
  br label %199

199:                                              ; preds = %196, %185
  %200 = phi i8 [ %186, %185 ], [ %151, %196 ]
  %201 = phi i32 [ %195, %185 ], [ %198, %196 ]
  %202 = phi i8 [ %191, %185 ], [ %197, %196 ]
  %203 = trunc i32 %201 to i16
  store i16 %203, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %202, ptr @gBitsLeft, align 1, !tbaa !10
  %204 = lshr i16 %153, 8
  %205 = trunc nuw i16 %204 to i8
  %206 = icmp eq i8 %155, -1
  br i1 %206, label %207, label %208

207:                                              ; preds = %199
  switch i8 %205, label %208 [
    i8 -40, label %211
    i8 -39, label %549
  ]

208:                                              ; preds = %207, %199
  %209 = add nsw i16 %154, -1
  %210 = icmp eq i16 %209, 0
  br i1 %210, label %549, label %150

211:                                              ; preds = %207
  %212 = icmp ugt i16 %203, -257
  br i1 %212, label %213, label %549

213:                                              ; preds = %211, %139
  %214 = call fastcc zeroext i8 @processMarkers(ptr noundef %6) #7
  %215 = icmp eq i8 %214, 0
  br i1 %215, label %216, label %549

216:                                              ; preds = %213
  %217 = load i8, ptr %6, align 1, !tbaa !10
  switch i8 %217, label %548 [
    i8 -62, label %549
    i8 -64, label %218
    i8 -55, label %547
  ]

218:                                              ; preds = %216
  %219 = tail call fastcc zeroext i16 @getBits(i8 noundef zeroext 16, i8 noundef zeroext 0) #7
  %220 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %221 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %222 = icmp ult i8 %221, 8
  %223 = zext i16 %220 to i32
  br i1 %222, label %224, label %262

224:                                              ; preds = %218
  %225 = zext nneg i8 %221 to i32
  %226 = shl nuw nsw i32 %223, %225
  %227 = trunc i32 %226 to i16
  store i16 %227, ptr @gBitBuf, align 2, !tbaa !11
  %228 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %229 = icmp eq i8 %228, 0
  br i1 %229, label %230, label %239

230:                                              ; preds = %224
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %231 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %232 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %233 = tail call zeroext i8 %231(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %232) #6
  %234 = icmp eq i8 %233, 0
  br i1 %234, label %236, label %235

235:                                              ; preds = %230
  store i8 %233, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %236

236:                                              ; preds = %235, %230
  %237 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %238 = icmp eq i8 %237, 0
  br i1 %238, label %247, label %239

239:                                              ; preds = %236, %224
  %240 = phi i8 [ %237, %236 ], [ %228, %224 ]
  %241 = add i8 %240, -1
  store i8 %241, ptr @gInBufLeft, align 1, !tbaa !10
  %242 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %243 = add i8 %242, 1
  store i8 %243, ptr @gInBufOfs, align 1, !tbaa !10
  %244 = zext i8 %242 to i32
  %245 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %244
  %246 = load i8, ptr %245, align 1, !tbaa !10
  br label %252

247:                                              ; preds = %236
  %248 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %249 = xor i8 %248, -1
  store i8 %249, ptr @gTemFlag, align 1, !tbaa !10
  %250 = icmp eq i8 %248, -1
  %251 = select i1 %250, i8 -39, i8 -1
  br label %252

252:                                              ; preds = %247, %239
  %253 = phi i8 [ %251, %247 ], [ %246, %239 ]
  %254 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %255 = zext i8 %253 to i16
  %256 = or i16 %254, %255
  %257 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %258 = zext i8 %257 to i32
  %259 = sub nsw i32 8, %258
  %260 = zext i16 %256 to i32
  %261 = shl nuw nsw i32 %260, %259
  br label %265

262:                                              ; preds = %218
  %263 = add i8 %221, -8
  %264 = shl nuw nsw i32 %223, 8
  br label %265

265:                                              ; preds = %262, %252
  %266 = phi i32 [ %261, %252 ], [ %264, %262 ]
  %267 = phi i8 [ %257, %252 ], [ %263, %262 ]
  %268 = trunc i32 %266 to i16
  store i16 %268, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %267, ptr @gBitsLeft, align 1, !tbaa !10
  %269 = and i16 %220, -256
  %270 = icmp eq i16 %269, 2048
  br i1 %270, label %271, label %549

271:                                              ; preds = %265
  %272 = tail call fastcc zeroext i16 @getBits(i8 noundef zeroext 16, i8 noundef zeroext 0) #7
  store i16 %272, ptr @gImageYSize, align 2, !tbaa !11
  %273 = add i16 %272, -16385
  %274 = icmp ult i16 %273, -16384
  br i1 %274, label %549, label %275

275:                                              ; preds = %271
  %276 = tail call fastcc zeroext i16 @getBits(i8 noundef zeroext 16, i8 noundef zeroext 0) #7
  store i16 %276, ptr @gImageXSize, align 2, !tbaa !11
  %277 = add i16 %276, -16385
  %278 = icmp ult i16 %277, -16384
  br i1 %278, label %549, label %279

279:                                              ; preds = %275
  %280 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %281 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %282 = icmp ult i8 %281, 8
  %283 = zext i16 %280 to i32
  br i1 %282, label %284, label %322

284:                                              ; preds = %279
  %285 = zext nneg i8 %281 to i32
  %286 = shl nuw nsw i32 %283, %285
  %287 = trunc i32 %286 to i16
  store i16 %287, ptr @gBitBuf, align 2, !tbaa !11
  %288 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %289 = icmp eq i8 %288, 0
  br i1 %289, label %290, label %299

290:                                              ; preds = %284
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %291 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %292 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %293 = tail call zeroext i8 %291(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %292) #6
  %294 = icmp eq i8 %293, 0
  br i1 %294, label %296, label %295

295:                                              ; preds = %290
  store i8 %293, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %296

296:                                              ; preds = %295, %290
  %297 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %298 = icmp eq i8 %297, 0
  br i1 %298, label %307, label %299

299:                                              ; preds = %296, %284
  %300 = phi i8 [ %297, %296 ], [ %288, %284 ]
  %301 = add i8 %300, -1
  store i8 %301, ptr @gInBufLeft, align 1, !tbaa !10
  %302 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %303 = add i8 %302, 1
  store i8 %303, ptr @gInBufOfs, align 1, !tbaa !10
  %304 = zext i8 %302 to i32
  %305 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %304
  %306 = load i8, ptr %305, align 1, !tbaa !10
  br label %312

307:                                              ; preds = %296
  %308 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %309 = xor i8 %308, -1
  store i8 %309, ptr @gTemFlag, align 1, !tbaa !10
  %310 = icmp eq i8 %308, -1
  %311 = select i1 %310, i8 -39, i8 -1
  br label %312

312:                                              ; preds = %307, %299
  %313 = phi i8 [ %311, %307 ], [ %306, %299 ]
  %314 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %315 = zext i8 %313 to i16
  %316 = or i16 %314, %315
  %317 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %318 = zext i8 %317 to i32
  %319 = sub nsw i32 8, %318
  %320 = zext i16 %316 to i32
  %321 = shl nuw nsw i32 %320, %319
  br label %325

322:                                              ; preds = %279
  %323 = add i8 %281, -8
  %324 = shl nuw nsw i32 %283, 8
  br label %325

325:                                              ; preds = %322, %312
  %326 = phi i32 [ %321, %312 ], [ %324, %322 ]
  %327 = phi i8 [ %317, %312 ], [ %323, %322 ]
  %328 = trunc i32 %326 to i16
  store i16 %328, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %327, ptr @gBitsLeft, align 1, !tbaa !10
  %329 = lshr i16 %280, 8
  %330 = trunc nuw i16 %329 to i8
  store i8 %330, ptr @gCompsInFrame, align 1, !tbaa !10
  %331 = icmp ugt i16 %280, 1023
  br i1 %331, label %549, label %332

332:                                              ; preds = %325
  %333 = mul nuw nsw i16 %329, 3
  %334 = add nuw nsw i16 %333, 8
  %335 = icmp eq i16 %219, %334
  br i1 %335, label %336, label %549

336:                                              ; preds = %332
  %337 = icmp eq i16 %329, 0
  br i1 %337, label %554, label %343

338:                                              ; preds = %539
  %339 = add nuw nsw i32 %346, 1
  %340 = load i8, ptr @gCompsInFrame, align 1, !tbaa !10
  %341 = zext i8 %340 to i32
  %342 = icmp samesign ult i32 %339, %341
  br i1 %342, label %343, label %554, !llvm.loop !61

343:                                              ; preds = %336, %338
  %344 = phi i8 [ %541, %338 ], [ %327, %336 ]
  %345 = phi i16 [ %542, %338 ], [ %328, %336 ]
  %346 = phi i32 [ %339, %338 ], [ 0, %336 ]
  %347 = icmp ult i8 %344, 8
  %348 = zext i16 %345 to i32
  br i1 %347, label %349, label %387

349:                                              ; preds = %343
  %350 = zext nneg i8 %344 to i32
  %351 = shl nuw nsw i32 %348, %350
  %352 = trunc i32 %351 to i16
  store i16 %352, ptr @gBitBuf, align 2, !tbaa !11
  %353 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %354 = icmp eq i8 %353, 0
  br i1 %354, label %355, label %364

355:                                              ; preds = %349
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %356 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %357 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %358 = tail call zeroext i8 %356(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %357) #6
  %359 = icmp eq i8 %358, 0
  br i1 %359, label %361, label %360

360:                                              ; preds = %355
  store i8 %358, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %361

361:                                              ; preds = %360, %355
  %362 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %363 = icmp eq i8 %362, 0
  br i1 %363, label %372, label %364

364:                                              ; preds = %361, %349
  %365 = phi i8 [ %362, %361 ], [ %353, %349 ]
  %366 = add i8 %365, -1
  store i8 %366, ptr @gInBufLeft, align 1, !tbaa !10
  %367 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %368 = add i8 %367, 1
  store i8 %368, ptr @gInBufOfs, align 1, !tbaa !10
  %369 = zext i8 %367 to i32
  %370 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %369
  %371 = load i8, ptr %370, align 1, !tbaa !10
  br label %377

372:                                              ; preds = %361
  %373 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %374 = xor i8 %373, -1
  store i8 %374, ptr @gTemFlag, align 1, !tbaa !10
  %375 = icmp eq i8 %373, -1
  %376 = select i1 %375, i8 -39, i8 -1
  br label %377

377:                                              ; preds = %372, %364
  %378 = phi i8 [ %376, %372 ], [ %371, %364 ]
  %379 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %380 = zext i8 %378 to i16
  %381 = or i16 %379, %380
  %382 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %383 = zext i8 %382 to i32
  %384 = sub nsw i32 8, %383
  %385 = zext i16 %381 to i32
  %386 = shl nuw nsw i32 %385, %384
  br label %390

387:                                              ; preds = %343
  %388 = add i8 %344, -8
  %389 = shl nuw nsw i32 %348, 8
  br label %390

390:                                              ; preds = %387, %377
  %391 = phi i32 [ %386, %377 ], [ %389, %387 ]
  %392 = phi i8 [ %382, %377 ], [ %388, %387 ]
  store i8 %392, ptr @gBitsLeft, align 1, !tbaa !10
  %393 = lshr i16 %345, 8
  %394 = trunc nuw i16 %393 to i8
  %395 = getelementptr inbounds nuw i8, ptr @gCompIdent, i32 %346
  store i8 %394, ptr %395, align 1, !tbaa !10
  %396 = icmp ult i8 %392, 4
  %397 = and i32 %391, 65535
  br i1 %396, label %398, label %437

398:                                              ; preds = %390
  %399 = zext nneg i8 %392 to i32
  %400 = shl i32 %391, %399
  %401 = trunc i32 %400 to i16
  store i16 %401, ptr @gBitBuf, align 2, !tbaa !11
  %402 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %403 = icmp eq i8 %402, 0
  br i1 %403, label %404, label %413

404:                                              ; preds = %398
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %405 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %406 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %407 = tail call zeroext i8 %405(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %406) #6
  %408 = icmp eq i8 %407, 0
  br i1 %408, label %410, label %409

409:                                              ; preds = %404
  store i8 %407, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %410

410:                                              ; preds = %409, %404
  %411 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %412 = icmp eq i8 %411, 0
  br i1 %412, label %421, label %413

413:                                              ; preds = %410, %398
  %414 = phi i8 [ %411, %410 ], [ %402, %398 ]
  %415 = add i8 %414, -1
  store i8 %415, ptr @gInBufLeft, align 1, !tbaa !10
  %416 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %417 = add i8 %416, 1
  store i8 %417, ptr @gInBufOfs, align 1, !tbaa !10
  %418 = zext i8 %416 to i32
  %419 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %418
  %420 = load i8, ptr %419, align 1, !tbaa !10
  br label %426

421:                                              ; preds = %410
  %422 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %423 = xor i8 %422, -1
  store i8 %423, ptr @gTemFlag, align 1, !tbaa !10
  %424 = icmp eq i8 %422, -1
  %425 = select i1 %424, i8 -39, i8 -1
  br label %426

426:                                              ; preds = %421, %413
  %427 = phi i8 [ %425, %421 ], [ %420, %413 ]
  %428 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %429 = zext i8 %427 to i16
  %430 = or i16 %428, %429
  %431 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %432 = zext i8 %431 to i32
  %433 = sub nsw i32 4, %432
  %434 = zext i16 %430 to i32
  %435 = shl nuw nsw i32 %434, %433
  %436 = add i8 %431, 4
  br label %440

437:                                              ; preds = %390
  %438 = add i8 %392, -4
  %439 = shl nuw nsw i32 %397, 4
  br label %440

440:                                              ; preds = %437, %426
  %441 = phi i32 [ %435, %426 ], [ %439, %437 ]
  %442 = phi i8 [ %436, %426 ], [ %438, %437 ]
  store i8 %442, ptr @gBitsLeft, align 1, !tbaa !10
  %443 = lshr i32 %397, 12
  %444 = trunc nuw nsw i32 %443 to i8
  %445 = getelementptr inbounds nuw i8, ptr @gCompHSamp, i32 %346
  store i8 %444, ptr %445, align 1, !tbaa !10
  %446 = icmp ult i8 %442, 4
  %447 = and i32 %441, 65535
  br i1 %446, label %448, label %487

448:                                              ; preds = %440
  %449 = zext nneg i8 %442 to i32
  %450 = shl i32 %441, %449
  %451 = trunc i32 %450 to i16
  store i16 %451, ptr @gBitBuf, align 2, !tbaa !11
  %452 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %453 = icmp eq i8 %452, 0
  br i1 %453, label %454, label %463

454:                                              ; preds = %448
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %455 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %456 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %457 = tail call zeroext i8 %455(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %456) #6
  %458 = icmp eq i8 %457, 0
  br i1 %458, label %460, label %459

459:                                              ; preds = %454
  store i8 %457, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %460

460:                                              ; preds = %459, %454
  %461 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %462 = icmp eq i8 %461, 0
  br i1 %462, label %471, label %463

463:                                              ; preds = %460, %448
  %464 = phi i8 [ %461, %460 ], [ %452, %448 ]
  %465 = add i8 %464, -1
  store i8 %465, ptr @gInBufLeft, align 1, !tbaa !10
  %466 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %467 = add i8 %466, 1
  store i8 %467, ptr @gInBufOfs, align 1, !tbaa !10
  %468 = zext i8 %466 to i32
  %469 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %468
  %470 = load i8, ptr %469, align 1, !tbaa !10
  br label %476

471:                                              ; preds = %460
  %472 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %473 = xor i8 %472, -1
  store i8 %473, ptr @gTemFlag, align 1, !tbaa !10
  %474 = icmp eq i8 %472, -1
  %475 = select i1 %474, i8 -39, i8 -1
  br label %476

476:                                              ; preds = %471, %463
  %477 = phi i8 [ %475, %471 ], [ %470, %463 ]
  %478 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %479 = zext i8 %477 to i16
  %480 = or i16 %478, %479
  %481 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %482 = zext i8 %481 to i32
  %483 = sub nsw i32 4, %482
  %484 = zext i16 %480 to i32
  %485 = shl nuw nsw i32 %484, %483
  %486 = add i8 %481, 4
  br label %490

487:                                              ; preds = %440
  %488 = add i8 %442, -4
  %489 = shl nuw nsw i32 %447, 4
  br label %490

490:                                              ; preds = %487, %476
  %491 = phi i32 [ %485, %476 ], [ %489, %487 ]
  %492 = phi i8 [ %486, %476 ], [ %488, %487 ]
  store i8 %492, ptr @gBitsLeft, align 1, !tbaa !10
  %493 = lshr i32 %447, 12
  %494 = trunc nuw nsw i32 %493 to i8
  %495 = getelementptr inbounds nuw i8, ptr @gCompVSamp, i32 %346
  store i8 %494, ptr %495, align 1, !tbaa !10
  %496 = icmp ult i8 %492, 8
  %497 = and i32 %491, 65535
  br i1 %496, label %498, label %536

498:                                              ; preds = %490
  %499 = zext nneg i8 %492 to i32
  %500 = shl i32 %491, %499
  %501 = trunc i32 %500 to i16
  store i16 %501, ptr @gBitBuf, align 2, !tbaa !11
  %502 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %503 = icmp eq i8 %502, 0
  br i1 %503, label %504, label %513

504:                                              ; preds = %498
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %505 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %506 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %507 = tail call zeroext i8 %505(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %506) #6
  %508 = icmp eq i8 %507, 0
  br i1 %508, label %510, label %509

509:                                              ; preds = %504
  store i8 %507, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %510

510:                                              ; preds = %509, %504
  %511 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %512 = icmp eq i8 %511, 0
  br i1 %512, label %521, label %513

513:                                              ; preds = %510, %498
  %514 = phi i8 [ %511, %510 ], [ %502, %498 ]
  %515 = add i8 %514, -1
  store i8 %515, ptr @gInBufLeft, align 1, !tbaa !10
  %516 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %517 = add i8 %516, 1
  store i8 %517, ptr @gInBufOfs, align 1, !tbaa !10
  %518 = zext i8 %516 to i32
  %519 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %518
  %520 = load i8, ptr %519, align 1, !tbaa !10
  br label %526

521:                                              ; preds = %510
  %522 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %523 = xor i8 %522, -1
  store i8 %523, ptr @gTemFlag, align 1, !tbaa !10
  %524 = icmp eq i8 %522, -1
  %525 = select i1 %524, i8 -39, i8 -1
  br label %526

526:                                              ; preds = %521, %513
  %527 = phi i8 [ %525, %521 ], [ %520, %513 ]
  %528 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %529 = zext i8 %527 to i16
  %530 = or i16 %528, %529
  %531 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %532 = zext i8 %531 to i32
  %533 = sub nsw i32 8, %532
  %534 = zext i16 %530 to i32
  %535 = shl nuw nsw i32 %534, %533
  br label %539

536:                                              ; preds = %490
  %537 = add i8 %492, -8
  %538 = shl nuw nsw i32 %497, 8
  br label %539

539:                                              ; preds = %536, %526
  %540 = phi i32 [ %535, %526 ], [ %538, %536 ]
  %541 = phi i8 [ %531, %526 ], [ %537, %536 ]
  %542 = trunc i32 %540 to i16
  store i16 %542, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %541, ptr @gBitsLeft, align 1, !tbaa !10
  %543 = lshr i32 %491, 8
  %544 = trunc i32 %543 to i8
  %545 = getelementptr inbounds nuw i8, ptr @gCompQuant, i32 %346
  store i8 %544, ptr %545, align 1, !tbaa !10
  %546 = icmp samesign ult i32 %497, 512
  br i1 %546, label %338, label %549

547:                                              ; preds = %216
  br label %549

548:                                              ; preds = %216
  br label %549

549:                                              ; preds = %208, %207, %539, %547, %216, %548, %213, %211, %332, %265, %271, %275, %325
  %550 = phi i8 [ 37, %216 ], [ 36, %539 ], [ 10, %325 ], [ 9, %275 ], [ 8, %271 ], [ 7, %265 ], [ 11, %332 ], [ 17, %547 ], [ 19, %211 ], [ %214, %213 ], [ 20, %548 ], [ 19, %207 ], [ 19, %208 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #8
  %551 = load i8, ptr @gCallbackStatus, align 1
  %552 = icmp eq i8 %551, 0
  %553 = select i1 %552, i8 %550, i8 %551
  br label %1127

554:                                              ; preds = %338, %336
  %555 = phi i8 [ 0, %336 ], [ %340, %338 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #8
  %556 = load i8, ptr @gCallbackStatus, align 1
  %557 = icmp eq i8 %556, 0
  br i1 %557, label %558, label %1127

558:                                              ; preds = %554
  switch i8 %555, label %1127 [
    i8 1, label %559
    i8 3, label %566
  ]

559:                                              ; preds = %558
  %560 = load i8, ptr @gCompHSamp, align 1, !tbaa !10
  %561 = icmp eq i8 %560, 1
  %562 = load i8, ptr @gCompVSamp, align 1
  %563 = icmp eq i8 %562, 1
  %564 = select i1 %561, i1 %563, i1 false
  br i1 %564, label %565, label %1127

565:                                              ; preds = %559
  store i32 0, ptr @gScanType, align 4, !tbaa !6
  store i8 1, ptr @gMaxBlocksPerMCU, align 1, !tbaa !10
  store i8 0, ptr @gMCUOrg, align 1, !tbaa !10
  br label %591

566:                                              ; preds = %558
  %567 = load <2 x i8>, ptr getelementptr inbounds nuw (i8, ptr @gCompHSamp, i32 1), align 1
  %568 = load <2 x i8>, ptr getelementptr inbounds nuw (i8, ptr @gCompVSamp, i32 1), align 1
  %569 = shufflevector <2 x i8> %567, <2 x i8> %568, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %570 = freeze <4 x i8> %569
  %571 = bitcast <4 x i8> %570 to i32
  %572 = icmp eq i32 %571, 16843009
  br i1 %572, label %573, label %1127

573:                                              ; preds = %566
  %574 = load i8, ptr @gCompHSamp, align 1, !tbaa !10
  %575 = icmp eq i8 %574, 1
  %576 = load i8, ptr @gCompVSamp, align 1
  %577 = icmp eq i8 %576, 1
  %578 = select i1 %575, i1 %577, i1 false
  br i1 %578, label %579, label %580

579:                                              ; preds = %573
  store i32 1, ptr @gScanType, align 4, !tbaa !6
  store i8 3, ptr @gMaxBlocksPerMCU, align 1, !tbaa !10
  store i8 0, ptr @gMCUOrg, align 1, !tbaa !10
  store i8 1, ptr getelementptr inbounds nuw (i8, ptr @gMCUOrg, i32 1), align 1, !tbaa !10
  store i8 2, ptr getelementptr inbounds nuw (i8, ptr @gMCUOrg, i32 2), align 1, !tbaa !10
  br label %591

580:                                              ; preds = %573
  %581 = icmp eq i8 %576, 2
  %582 = select i1 %575, i1 %581, i1 false
  br i1 %582, label %583, label %584

583:                                              ; preds = %580
  store i32 3, ptr @gScanType, align 4, !tbaa !6
  store i8 4, ptr @gMaxBlocksPerMCU, align 1, !tbaa !10
  store i8 0, ptr @gMCUOrg, align 1, !tbaa !10
  store i8 0, ptr getelementptr inbounds nuw (i8, ptr @gMCUOrg, i32 1), align 1, !tbaa !10
  store i8 1, ptr getelementptr inbounds nuw (i8, ptr @gMCUOrg, i32 2), align 1, !tbaa !10
  store i8 2, ptr getelementptr inbounds nuw (i8, ptr @gMCUOrg, i32 3), align 1, !tbaa !10
  br label %591

584:                                              ; preds = %580
  %585 = icmp eq i8 %574, 2
  %586 = select i1 %585, i1 %577, i1 false
  br i1 %586, label %587, label %588

587:                                              ; preds = %584
  store i32 2, ptr @gScanType, align 4, !tbaa !6
  store i8 4, ptr @gMaxBlocksPerMCU, align 1, !tbaa !10
  store i8 0, ptr @gMCUOrg, align 1, !tbaa !10
  store i8 0, ptr getelementptr inbounds nuw (i8, ptr @gMCUOrg, i32 1), align 1, !tbaa !10
  store i8 1, ptr getelementptr inbounds nuw (i8, ptr @gMCUOrg, i32 2), align 1, !tbaa !10
  store i8 2, ptr getelementptr inbounds nuw (i8, ptr @gMCUOrg, i32 3), align 1, !tbaa !10
  br label %591

588:                                              ; preds = %584
  %589 = select i1 %585, i1 %581, i1 false
  br i1 %589, label %590, label %1127

590:                                              ; preds = %588
  store i32 4, ptr @gScanType, align 4, !tbaa !6
  store i8 6, ptr @gMaxBlocksPerMCU, align 1, !tbaa !10
  store i8 0, ptr @gMCUOrg, align 1, !tbaa !10
  store i8 0, ptr getelementptr inbounds nuw (i8, ptr @gMCUOrg, i32 1), align 1, !tbaa !10
  store i8 0, ptr getelementptr inbounds nuw (i8, ptr @gMCUOrg, i32 2), align 1, !tbaa !10
  store i8 0, ptr getelementptr inbounds nuw (i8, ptr @gMCUOrg, i32 3), align 1, !tbaa !10
  store i8 1, ptr getelementptr inbounds nuw (i8, ptr @gMCUOrg, i32 4), align 1, !tbaa !10
  store i8 2, ptr getelementptr inbounds nuw (i8, ptr @gMCUOrg, i32 5), align 1, !tbaa !10
  br label %591

591:                                              ; preds = %590, %587, %583, %579, %565
  %592 = phi i8 [ 8, %583 ], [ 16, %590 ], [ 16, %587 ], [ 8, %579 ], [ 8, %565 ]
  %593 = phi i8 [ 16, %583 ], [ 16, %590 ], [ 8, %587 ], [ 8, %579 ], [ 8, %565 ]
  %594 = phi <2 x i32> [ <i32 15, i32 7>, %583 ], [ splat (i32 15), %590 ], [ <i32 7, i32 15>, %587 ], [ splat (i32 7), %579 ], [ splat (i32 7), %565 ]
  %595 = phi <2 x i32> [ <i32 4, i32 3>, %583 ], [ splat (i32 4), %590 ], [ <i32 3, i32 4>, %587 ], [ splat (i32 3), %579 ], [ splat (i32 3), %565 ]
  store i8 %592, ptr @gMaxMCUXSize, align 1, !tbaa !10
  store i8 %593, ptr @gMaxMCUYSize, align 1, !tbaa !10
  %596 = load i16, ptr @gImageXSize, align 2, !tbaa !11
  %597 = load i16, ptr @gImageYSize, align 2, !tbaa !11
  %598 = insertelement <2 x i16> poison, i16 %597, i64 0
  %599 = insertelement <2 x i16> %598, i16 %596, i64 1
  %600 = zext <2 x i16> %599 to <2 x i32>
  %601 = add nuw nsw <2 x i32> %594, %600
  %602 = lshr <2 x i32> %601, %595
  %603 = trunc nuw <2 x i32> %602 to <2 x i16>
  %604 = extractelement <2 x i16> %603, i64 1
  store i16 %604, ptr @gMaxMCUSPerRow, align 2, !tbaa !11
  %605 = extractelement <2 x i16> %603, i64 0
  store i16 %605, ptr @gMaxMCUSPerCol, align 2, !tbaa !11
  %606 = mul i16 %605, %604
  store i16 %606, ptr @gNumMCUSRemaining, align 2, !tbaa !11
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #8
  %607 = call fastcc zeroext i8 @processMarkers(ptr noundef %5) #7
  %608 = icmp eq i8 %607, 0
  br i1 %608, label %609, label %1101

609:                                              ; preds = %591
  %610 = load i8, ptr %5, align 1, !tbaa !10
  %611 = icmp eq i8 %610, -38
  br i1 %611, label %612, label %1101

612:                                              ; preds = %609
  %613 = tail call fastcc zeroext i16 @getBits(i8 noundef zeroext 16, i8 noundef zeroext 0) #7
  %614 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %615 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %616 = icmp ult i8 %615, 8
  %617 = zext i16 %614 to i32
  br i1 %616, label %618, label %656

618:                                              ; preds = %612
  %619 = zext nneg i8 %615 to i32
  %620 = shl nuw nsw i32 %617, %619
  %621 = trunc i32 %620 to i16
  store i16 %621, ptr @gBitBuf, align 2, !tbaa !11
  %622 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %623 = icmp eq i8 %622, 0
  br i1 %623, label %624, label %633

624:                                              ; preds = %618
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %625 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %626 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %627 = tail call zeroext i8 %625(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %626) #6
  %628 = icmp eq i8 %627, 0
  br i1 %628, label %630, label %629

629:                                              ; preds = %624
  store i8 %627, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %630

630:                                              ; preds = %629, %624
  %631 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %632 = icmp eq i8 %631, 0
  br i1 %632, label %641, label %633

633:                                              ; preds = %630, %618
  %634 = phi i8 [ %631, %630 ], [ %622, %618 ]
  %635 = add i8 %634, -1
  store i8 %635, ptr @gInBufLeft, align 1, !tbaa !10
  %636 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %637 = add i8 %636, 1
  store i8 %637, ptr @gInBufOfs, align 1, !tbaa !10
  %638 = zext i8 %636 to i32
  %639 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %638
  %640 = load i8, ptr %639, align 1, !tbaa !10
  br label %646

641:                                              ; preds = %630
  %642 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %643 = xor i8 %642, -1
  store i8 %643, ptr @gTemFlag, align 1, !tbaa !10
  %644 = icmp eq i8 %642, -1
  %645 = select i1 %644, i8 -39, i8 -1
  br label %646

646:                                              ; preds = %641, %633
  %647 = phi i8 [ %645, %641 ], [ %640, %633 ]
  %648 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %649 = zext i8 %647 to i16
  %650 = or i16 %648, %649
  %651 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %652 = zext i8 %651 to i32
  %653 = sub nsw i32 8, %652
  %654 = zext i16 %650 to i32
  %655 = shl nuw nsw i32 %654, %653
  br label %659

656:                                              ; preds = %612
  %657 = add i8 %615, -8
  %658 = shl nuw nsw i32 %617, 8
  br label %659

659:                                              ; preds = %656, %646
  %660 = phi i32 [ %655, %646 ], [ %658, %656 ]
  %661 = phi i8 [ %651, %646 ], [ %657, %656 ]
  %662 = trunc i32 %660 to i16
  store i16 %662, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %661, ptr @gBitsLeft, align 1, !tbaa !10
  %663 = lshr i16 %614, 8
  %664 = trunc nuw i16 %663 to i8
  store i8 %664, ptr @gCompsInScan, align 1, !tbaa !10
  %665 = shl nuw nsw i16 %663, 1
  %666 = add i16 %613, -6
  %667 = icmp ne i16 %665, %666
  %668 = icmp eq i16 %663, 0
  %669 = or i1 %668, %667
  %670 = icmp ugt i16 %614, 1023
  %671 = select i1 %669, i1 true, i1 %670
  br i1 %671, label %1101, label %672

672:                                              ; preds = %659
  %673 = add nsw i16 %613, -3
  br label %674

674:                                              ; preds = %788, %672
  %675 = phi i8 [ %661, %672 ], [ %771, %788 ]
  %676 = phi i16 [ %662, %672 ], [ %772, %788 ]
  %677 = phi i32 [ 0, %672 ], [ %796, %788 ]
  %678 = phi i16 [ %673, %672 ], [ %774, %788 ]
  %679 = icmp ult i8 %675, 8
  %680 = zext i16 %676 to i32
  br i1 %679, label %681, label %719

681:                                              ; preds = %674
  %682 = zext nneg i8 %675 to i32
  %683 = shl nuw nsw i32 %680, %682
  %684 = trunc i32 %683 to i16
  store i16 %684, ptr @gBitBuf, align 2, !tbaa !11
  %685 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %686 = icmp eq i8 %685, 0
  br i1 %686, label %687, label %696

687:                                              ; preds = %681
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %688 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %689 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %690 = tail call zeroext i8 %688(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %689) #6
  %691 = icmp eq i8 %690, 0
  br i1 %691, label %693, label %692

692:                                              ; preds = %687
  store i8 %690, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %693

693:                                              ; preds = %692, %687
  %694 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %695 = icmp eq i8 %694, 0
  br i1 %695, label %704, label %696

696:                                              ; preds = %693, %681
  %697 = phi i8 [ %694, %693 ], [ %685, %681 ]
  %698 = add i8 %697, -1
  store i8 %698, ptr @gInBufLeft, align 1, !tbaa !10
  %699 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %700 = add i8 %699, 1
  store i8 %700, ptr @gInBufOfs, align 1, !tbaa !10
  %701 = zext i8 %699 to i32
  %702 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %701
  %703 = load i8, ptr %702, align 1, !tbaa !10
  br label %709

704:                                              ; preds = %693
  %705 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %706 = xor i8 %705, -1
  store i8 %706, ptr @gTemFlag, align 1, !tbaa !10
  %707 = icmp eq i8 %705, -1
  %708 = select i1 %707, i8 -39, i8 -1
  br label %709

709:                                              ; preds = %704, %696
  %710 = phi i8 [ %708, %704 ], [ %703, %696 ]
  %711 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %712 = zext i8 %710 to i16
  %713 = or i16 %711, %712
  %714 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %715 = zext i8 %714 to i32
  %716 = sub nsw i32 8, %715
  %717 = zext i16 %713 to i32
  %718 = shl nuw nsw i32 %717, %716
  br label %722

719:                                              ; preds = %674
  %720 = add i8 %675, -8
  %721 = shl nuw nsw i32 %680, 8
  br label %722

722:                                              ; preds = %719, %709
  %723 = phi i32 [ %718, %709 ], [ %721, %719 ]
  %724 = phi i8 [ %714, %709 ], [ %720, %719 ]
  store i8 %724, ptr @gBitsLeft, align 1, !tbaa !10
  %725 = lshr i16 %676, 8
  %726 = icmp ult i8 %724, 8
  br i1 %726, label %727, label %765

727:                                              ; preds = %722
  %728 = zext nneg i8 %724 to i32
  %729 = shl i32 %723, %728
  %730 = trunc i32 %729 to i16
  store i16 %730, ptr @gBitBuf, align 2, !tbaa !11
  %731 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %732 = icmp eq i8 %731, 0
  br i1 %732, label %733, label %742

733:                                              ; preds = %727
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %734 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %735 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %736 = tail call zeroext i8 %734(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %735) #6
  %737 = icmp eq i8 %736, 0
  br i1 %737, label %739, label %738

738:                                              ; preds = %733
  store i8 %736, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %739

739:                                              ; preds = %738, %733
  %740 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %741 = icmp eq i8 %740, 0
  br i1 %741, label %750, label %742

742:                                              ; preds = %739, %727
  %743 = phi i8 [ %740, %739 ], [ %731, %727 ]
  %744 = add i8 %743, -1
  store i8 %744, ptr @gInBufLeft, align 1, !tbaa !10
  %745 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %746 = add i8 %745, 1
  store i8 %746, ptr @gInBufOfs, align 1, !tbaa !10
  %747 = zext i8 %745 to i32
  %748 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %747
  %749 = load i8, ptr %748, align 1, !tbaa !10
  br label %755

750:                                              ; preds = %739
  %751 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %752 = xor i8 %751, -1
  store i8 %752, ptr @gTemFlag, align 1, !tbaa !10
  %753 = icmp eq i8 %751, -1
  %754 = select i1 %753, i8 -39, i8 -1
  br label %755

755:                                              ; preds = %750, %742
  %756 = phi i8 [ %754, %750 ], [ %749, %742 ]
  %757 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %758 = zext i8 %756 to i16
  %759 = or i16 %757, %758
  %760 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %761 = zext i8 %760 to i32
  %762 = sub nsw i32 8, %761
  %763 = zext i16 %759 to i32
  %764 = shl nuw nsw i32 %763, %762
  br label %769

765:                                              ; preds = %722
  %766 = add i8 %724, -8
  %767 = shl i32 %723, 8
  %768 = and i32 %767, 16776960
  br label %769

769:                                              ; preds = %765, %755
  %770 = phi i32 [ %764, %755 ], [ %768, %765 ]
  %771 = phi i8 [ %760, %755 ], [ %766, %765 ]
  %772 = trunc i32 %770 to i16
  store i16 %772, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %771, ptr @gBitsLeft, align 1, !tbaa !10
  %773 = lshr i32 %723, 8
  %774 = add i16 %678, -2
  %775 = load i8, ptr @gCompsInFrame, align 1, !tbaa !10
  %776 = icmp eq i8 %775, 0
  br i1 %776, label %1101, label %777

777:                                              ; preds = %769
  %778 = trunc nuw i16 %725 to i8
  %779 = zext i8 %775 to i32
  br label %780

780:                                              ; preds = %785, %777
  %781 = phi i32 [ 0, %777 ], [ %786, %785 ]
  %782 = getelementptr inbounds nuw i8, ptr @gCompIdent, i32 %781
  %783 = load i8, ptr %782, align 1, !tbaa !10
  %784 = icmp eq i8 %783, %778
  br i1 %784, label %788, label %785

785:                                              ; preds = %780
  %786 = add nuw nsw i32 %781, 1
  %787 = icmp eq i32 %786, %779
  br i1 %787, label %1101, label %780, !llvm.loop !62

788:                                              ; preds = %780
  %789 = trunc nuw i32 %781 to i8
  %790 = getelementptr inbounds nuw i8, ptr @gCompList, i32 %677
  store i8 %789, ptr %790, align 1, !tbaa !10
  %791 = trunc i32 %773 to i8
  %792 = lshr i8 %791, 4
  %793 = getelementptr inbounds nuw i8, ptr @gCompDCTab, i32 %781
  store i8 %792, ptr %793, align 1, !tbaa !10
  %794 = and i8 %791, 15
  %795 = getelementptr inbounds nuw i8, ptr @gCompACTab, i32 %781
  store i8 %794, ptr %795, align 1, !tbaa !10
  %796 = add nuw nsw i32 %677, 1
  %797 = load i8, ptr @gCompsInScan, align 1, !tbaa !10
  %798 = zext i8 %797 to i32
  %799 = icmp samesign ult i32 %796, %798
  br i1 %799, label %674, label %800, !llvm.loop !63

800:                                              ; preds = %788
  %801 = add i16 %678, -5
  %802 = icmp ult i8 %771, 8
  br i1 %802, label %803, label %841

803:                                              ; preds = %800
  %804 = zext nneg i8 %771 to i32
  %805 = shl i32 %770, %804
  %806 = trunc i32 %805 to i16
  store i16 %806, ptr @gBitBuf, align 2, !tbaa !11
  %807 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %808 = icmp eq i8 %807, 0
  br i1 %808, label %809, label %818

809:                                              ; preds = %803
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %810 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %811 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %812 = tail call zeroext i8 %810(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %811) #6
  %813 = icmp eq i8 %812, 0
  br i1 %813, label %815, label %814

814:                                              ; preds = %809
  store i8 %812, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %815

815:                                              ; preds = %814, %809
  %816 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %817 = icmp eq i8 %816, 0
  br i1 %817, label %826, label %818

818:                                              ; preds = %815, %803
  %819 = phi i8 [ %816, %815 ], [ %807, %803 ]
  %820 = add i8 %819, -1
  store i8 %820, ptr @gInBufLeft, align 1, !tbaa !10
  %821 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %822 = add i8 %821, 1
  store i8 %822, ptr @gInBufOfs, align 1, !tbaa !10
  %823 = zext i8 %821 to i32
  %824 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %823
  %825 = load i8, ptr %824, align 1, !tbaa !10
  br label %831

826:                                              ; preds = %815
  %827 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %828 = xor i8 %827, -1
  store i8 %828, ptr @gTemFlag, align 1, !tbaa !10
  %829 = icmp eq i8 %827, -1
  %830 = select i1 %829, i8 -39, i8 -1
  br label %831

831:                                              ; preds = %826, %818
  %832 = phi i8 [ %830, %826 ], [ %825, %818 ]
  %833 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %834 = zext i8 %832 to i16
  %835 = or i16 %833, %834
  %836 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %837 = zext i8 %836 to i32
  %838 = sub nsw i32 8, %837
  %839 = zext i16 %835 to i32
  %840 = shl nuw nsw i32 %839, %838
  br label %845

841:                                              ; preds = %800
  %842 = add i8 %771, -8
  %843 = shl i32 %770, 8
  %844 = and i32 %843, 16776960
  br label %845

845:                                              ; preds = %841, %831
  %846 = phi i32 [ %840, %831 ], [ %844, %841 ]
  %847 = phi i8 [ %836, %831 ], [ %842, %841 ]
  store i8 %847, ptr @gBitsLeft, align 1, !tbaa !10
  %848 = lshr i32 %770, 8
  %849 = trunc i32 %848 to i8
  store volatile i8 %849, ptr @spectral_start, align 1, !tbaa !10
  %850 = icmp ult i8 %847, 8
  br i1 %850, label %851, label %889

851:                                              ; preds = %845
  %852 = zext nneg i8 %847 to i32
  %853 = shl i32 %846, %852
  %854 = trunc i32 %853 to i16
  store i16 %854, ptr @gBitBuf, align 2, !tbaa !11
  %855 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %856 = icmp eq i8 %855, 0
  br i1 %856, label %857, label %866

857:                                              ; preds = %851
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %858 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %859 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %860 = tail call zeroext i8 %858(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %859) #6
  %861 = icmp eq i8 %860, 0
  br i1 %861, label %863, label %862

862:                                              ; preds = %857
  store i8 %860, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %863

863:                                              ; preds = %862, %857
  %864 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %865 = icmp eq i8 %864, 0
  br i1 %865, label %874, label %866

866:                                              ; preds = %863, %851
  %867 = phi i8 [ %864, %863 ], [ %855, %851 ]
  %868 = add i8 %867, -1
  store i8 %868, ptr @gInBufLeft, align 1, !tbaa !10
  %869 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %870 = add i8 %869, 1
  store i8 %870, ptr @gInBufOfs, align 1, !tbaa !10
  %871 = zext i8 %869 to i32
  %872 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %871
  %873 = load i8, ptr %872, align 1, !tbaa !10
  br label %879

874:                                              ; preds = %863
  %875 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %876 = xor i8 %875, -1
  store i8 %876, ptr @gTemFlag, align 1, !tbaa !10
  %877 = icmp eq i8 %875, -1
  %878 = select i1 %877, i8 -39, i8 -1
  br label %879

879:                                              ; preds = %874, %866
  %880 = phi i8 [ %878, %874 ], [ %873, %866 ]
  %881 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %882 = zext i8 %880 to i16
  %883 = or i16 %881, %882
  %884 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %885 = zext i8 %884 to i32
  %886 = sub nsw i32 8, %885
  %887 = zext i16 %883 to i32
  %888 = shl nuw nsw i32 %887, %886
  br label %893

889:                                              ; preds = %845
  %890 = add i8 %847, -8
  %891 = shl i32 %846, 8
  %892 = and i32 %891, 16776960
  br label %893

893:                                              ; preds = %889, %879
  %894 = phi i32 [ %888, %879 ], [ %892, %889 ]
  %895 = phi i8 [ %884, %879 ], [ %890, %889 ]
  store i8 %895, ptr @gBitsLeft, align 1, !tbaa !10
  %896 = lshr i32 %846, 8
  %897 = trunc i32 %896 to i8
  store volatile i8 %897, ptr @spectral_end, align 1, !tbaa !10
  %898 = icmp ult i8 %895, 4
  %899 = and i32 %894, 65535
  br i1 %898, label %900, label %939

900:                                              ; preds = %893
  %901 = zext nneg i8 %895 to i32
  %902 = shl i32 %894, %901
  %903 = trunc i32 %902 to i16
  store i16 %903, ptr @gBitBuf, align 2, !tbaa !11
  %904 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %905 = icmp eq i8 %904, 0
  br i1 %905, label %906, label %915

906:                                              ; preds = %900
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %907 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %908 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %909 = tail call zeroext i8 %907(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %908) #6
  %910 = icmp eq i8 %909, 0
  br i1 %910, label %912, label %911

911:                                              ; preds = %906
  store i8 %909, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %912

912:                                              ; preds = %911, %906
  %913 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %914 = icmp eq i8 %913, 0
  br i1 %914, label %923, label %915

915:                                              ; preds = %912, %900
  %916 = phi i8 [ %913, %912 ], [ %904, %900 ]
  %917 = add i8 %916, -1
  store i8 %917, ptr @gInBufLeft, align 1, !tbaa !10
  %918 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %919 = add i8 %918, 1
  store i8 %919, ptr @gInBufOfs, align 1, !tbaa !10
  %920 = zext i8 %918 to i32
  %921 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %920
  %922 = load i8, ptr %921, align 1, !tbaa !10
  br label %928

923:                                              ; preds = %912
  %924 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %925 = xor i8 %924, -1
  store i8 %925, ptr @gTemFlag, align 1, !tbaa !10
  %926 = icmp eq i8 %924, -1
  %927 = select i1 %926, i8 -39, i8 -1
  br label %928

928:                                              ; preds = %923, %915
  %929 = phi i8 [ %927, %923 ], [ %922, %915 ]
  %930 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %931 = zext i8 %929 to i16
  %932 = or i16 %930, %931
  %933 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %934 = zext i8 %933 to i32
  %935 = sub nsw i32 4, %934
  %936 = zext i16 %932 to i32
  %937 = shl nuw nsw i32 %936, %935
  %938 = add i8 %933, 4
  br label %942

939:                                              ; preds = %893
  %940 = add i8 %895, -4
  %941 = shl nuw nsw i32 %899, 4
  br label %942

942:                                              ; preds = %939, %928
  %943 = phi i32 [ %937, %928 ], [ %941, %939 ]
  %944 = phi i8 [ %938, %928 ], [ %940, %939 ]
  store i8 %944, ptr @gBitsLeft, align 1, !tbaa !10
  %945 = lshr i32 %899, 12
  %946 = trunc nuw nsw i32 %945 to i8
  store volatile i8 %946, ptr @successive_high, align 1, !tbaa !10
  %947 = icmp ult i8 %944, 4
  %948 = and i32 %943, 65535
  br i1 %947, label %949, label %988

949:                                              ; preds = %942
  %950 = zext nneg i8 %944 to i32
  %951 = shl i32 %943, %950
  %952 = trunc i32 %951 to i16
  store i16 %952, ptr @gBitBuf, align 2, !tbaa !11
  %953 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %954 = icmp eq i8 %953, 0
  br i1 %954, label %955, label %964

955:                                              ; preds = %949
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %956 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %957 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %958 = tail call zeroext i8 %956(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %957) #6
  %959 = icmp eq i8 %958, 0
  br i1 %959, label %961, label %960

960:                                              ; preds = %955
  store i8 %958, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %961

961:                                              ; preds = %960, %955
  %962 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %963 = icmp eq i8 %962, 0
  br i1 %963, label %972, label %964

964:                                              ; preds = %961, %949
  %965 = phi i8 [ %962, %961 ], [ %953, %949 ]
  %966 = add i8 %965, -1
  store i8 %966, ptr @gInBufLeft, align 1, !tbaa !10
  %967 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %968 = add i8 %967, 1
  store i8 %968, ptr @gInBufOfs, align 1, !tbaa !10
  %969 = zext i8 %967 to i32
  %970 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %969
  %971 = load i8, ptr %970, align 1, !tbaa !10
  br label %977

972:                                              ; preds = %961
  %973 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %974 = xor i8 %973, -1
  store i8 %974, ptr @gTemFlag, align 1, !tbaa !10
  %975 = icmp eq i8 %973, -1
  %976 = select i1 %975, i8 -39, i8 -1
  br label %977

977:                                              ; preds = %972, %964
  %978 = phi i8 [ %976, %972 ], [ %971, %964 ]
  %979 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %980 = zext i8 %978 to i16
  %981 = or i16 %979, %980
  %982 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %983 = zext i8 %982 to i32
  %984 = sub nsw i32 4, %983
  %985 = zext i16 %981 to i32
  %986 = shl nuw nsw i32 %985, %984
  %987 = add i8 %982, 4
  br label %991

988:                                              ; preds = %942
  %989 = add i8 %944, -4
  %990 = shl nuw nsw i32 %948, 4
  br label %991

991:                                              ; preds = %988, %977
  %992 = phi i32 [ %986, %977 ], [ %990, %988 ]
  %993 = phi i8 [ %987, %977 ], [ %989, %988 ]
  %994 = trunc i32 %992 to i16
  store i16 %994, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %993, ptr @gBitsLeft, align 1, !tbaa !10
  %995 = lshr i32 %948, 12
  %996 = trunc nuw nsw i32 %995 to i8
  store volatile i8 %996, ptr @successive_low, align 1, !tbaa !10
  %997 = icmp eq i16 %801, 0
  br i1 %997, label %1051, label %998

998:                                              ; preds = %991, %1045
  %999 = phi i8 [ %1047, %1045 ], [ %993, %991 ]
  %1000 = phi i32 [ %1046, %1045 ], [ %992, %991 ]
  %1001 = phi i16 [ %1049, %1045 ], [ %801, %991 ]
  %1002 = icmp ult i8 %999, 8
  br i1 %1002, label %1003, label %1041

1003:                                             ; preds = %998
  %1004 = zext nneg i8 %999 to i32
  %1005 = shl i32 %1000, %1004
  %1006 = trunc i32 %1005 to i16
  store i16 %1006, ptr @gBitBuf, align 2, !tbaa !11
  %1007 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %1008 = icmp eq i8 %1007, 0
  br i1 %1008, label %1009, label %1018

1009:                                             ; preds = %1003
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %1010 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %1011 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %1012 = tail call zeroext i8 %1010(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %1011) #6
  %1013 = icmp eq i8 %1012, 0
  br i1 %1013, label %1015, label %1014

1014:                                             ; preds = %1009
  store i8 %1012, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %1015

1015:                                             ; preds = %1014, %1009
  %1016 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %1017 = icmp eq i8 %1016, 0
  br i1 %1017, label %1026, label %1018

1018:                                             ; preds = %1015, %1003
  %1019 = phi i8 [ %1016, %1015 ], [ %1007, %1003 ]
  %1020 = add i8 %1019, -1
  store i8 %1020, ptr @gInBufLeft, align 1, !tbaa !10
  %1021 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %1022 = add i8 %1021, 1
  store i8 %1022, ptr @gInBufOfs, align 1, !tbaa !10
  %1023 = zext i8 %1021 to i32
  %1024 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %1023
  %1025 = load i8, ptr %1024, align 1, !tbaa !10
  br label %1031

1026:                                             ; preds = %1015
  %1027 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %1028 = xor i8 %1027, -1
  store i8 %1028, ptr @gTemFlag, align 1, !tbaa !10
  %1029 = icmp eq i8 %1027, -1
  %1030 = select i1 %1029, i8 -39, i8 -1
  br label %1031

1031:                                             ; preds = %1026, %1018
  %1032 = phi i8 [ %1030, %1026 ], [ %1025, %1018 ]
  %1033 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %1034 = zext i8 %1032 to i16
  %1035 = or i16 %1033, %1034
  %1036 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %1037 = zext i8 %1036 to i32
  %1038 = sub nsw i32 8, %1037
  %1039 = zext i16 %1035 to i32
  %1040 = shl nuw nsw i32 %1039, %1038
  br label %1045

1041:                                             ; preds = %998
  %1042 = add i8 %999, -8
  %1043 = shl i32 %1000, 8
  %1044 = and i32 %1043, 16776960
  br label %1045

1045:                                             ; preds = %1041, %1031
  %1046 = phi i32 [ %1040, %1031 ], [ %1044, %1041 ]
  %1047 = phi i8 [ %1036, %1031 ], [ %1042, %1041 ]
  %1048 = trunc i32 %1046 to i16
  store i16 %1048, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %1047, ptr @gBitsLeft, align 1, !tbaa !10
  %1049 = add i16 %1001, -1
  %1050 = icmp eq i16 %1049, 0
  br i1 %1050, label %1051, label %998, !llvm.loop !64

1051:                                             ; preds = %1045, %991
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #8
  %1052 = load i8, ptr @gCompsInScan, align 1, !tbaa !10
  %1053 = icmp eq i8 %1052, 0
  br i1 %1053, label %1097, label %1054

1054:                                             ; preds = %1051
  %1055 = load i8, ptr @gValidHuffTables, align 1, !tbaa !10
  %1056 = zext nneg i8 %1055 to i32
  %1057 = zext i8 %1052 to i32
  br label %1061

1058:                                             ; preds = %1072
  %1059 = add nuw nsw i32 %1062, 1
  %1060 = icmp eq i32 %1059, %1057
  br i1 %1060, label %1080, label %1061, !llvm.loop !65

1061:                                             ; preds = %1058, %1054
  %1062 = phi i32 [ 0, %1054 ], [ %1059, %1058 ]
  %1063 = getelementptr inbounds nuw i8, ptr @gCompList, i32 %1062
  %1064 = load i8, ptr %1063, align 1, !tbaa !10
  %1065 = zext i8 %1064 to i32
  %1066 = getelementptr inbounds nuw i8, ptr @gCompDCTab, i32 %1065
  %1067 = load i8, ptr %1066, align 1, !tbaa !10
  %1068 = zext nneg i8 %1067 to i32
  %1069 = shl nuw i32 1, %1068
  %1070 = and i32 %1069, %1056
  %1071 = icmp eq i32 %1070, 0
  br i1 %1071, label %1103, label %1072

1072:                                             ; preds = %1061
  %1073 = getelementptr inbounds nuw i8, ptr @gCompACTab, i32 %1065
  %1074 = load i8, ptr %1073, align 1, !tbaa !10
  %1075 = add i8 %1074, 2
  %1076 = zext nneg i8 %1075 to i32
  %1077 = shl nuw i32 1, %1076
  %1078 = and i32 %1077, %1056
  %1079 = icmp eq i32 %1078, 0
  br i1 %1079, label %1103, label %1058

1080:                                             ; preds = %1058
  %1081 = load i8, ptr @gValidQuantTables, align 1, !tbaa !10
  %1082 = zext nneg i8 %1081 to i32
  br label %1086

1083:                                             ; preds = %1086
  %1084 = add nuw nsw i32 %1087, 1
  %1085 = icmp eq i32 %1084, %1057
  br i1 %1085, label %1097, label %1086, !llvm.loop !66

1086:                                             ; preds = %1083, %1080
  %1087 = phi i32 [ 0, %1080 ], [ %1084, %1083 ]
  %1088 = getelementptr inbounds nuw i8, ptr @gCompList, i32 %1087
  %1089 = load i8, ptr %1088, align 1, !tbaa !10
  %1090 = zext i8 %1089 to i32
  %1091 = getelementptr inbounds nuw i8, ptr @gCompQuant, i32 %1090
  %1092 = load i8, ptr %1091, align 1, !tbaa !10
  %1093 = icmp eq i8 %1092, 0
  %1094 = select i1 %1093, i32 1, i32 2
  %1095 = and i32 %1094, %1082
  %1096 = icmp eq i32 %1095, 0
  br i1 %1096, label %1103, label %1083

1097:                                             ; preds = %1083, %1051
  store i16 0, ptr @gLastDC, align 2, !tbaa !11
  store i16 0, ptr getelementptr inbounds nuw (i8, ptr @gLastDC, i32 2), align 2, !tbaa !11
  store i16 0, ptr getelementptr inbounds nuw (i8, ptr @gLastDC, i32 4), align 2, !tbaa !11
  %1098 = load i16, ptr @gRestartInterval, align 2, !tbaa !11
  %1099 = icmp eq i16 %1098, 0
  br i1 %1099, label %1108, label %1100

1100:                                             ; preds = %1097
  store i16 %1098, ptr @gRestartsLeft, align 2, !tbaa !11
  store i16 0, ptr @gNextRestartNum, align 2, !tbaa !11
  br label %1108

1101:                                             ; preds = %769, %785, %609, %591, %659
  %1102 = phi i8 [ 15, %785 ], [ %607, %591 ], [ 18, %609 ], [ 14, %659 ], [ 15, %769 ]
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #8
  br label %1103

1103:                                             ; preds = %1061, %1072, %1086, %1101
  %1104 = phi i8 [ 23, %1086 ], [ %1102, %1101 ], [ 24, %1072 ], [ 24, %1061 ]
  %1105 = load i8, ptr @gCallbackStatus, align 1
  %1106 = icmp eq i8 %1105, 0
  %1107 = select i1 %1106, i8 %1104, i8 %1105
  br label %1127

1108:                                             ; preds = %1097, %1100
  tail call fastcc void @fixInBuffer() #7
  %1109 = load i8, ptr @gCallbackStatus, align 1
  %1110 = icmp eq i8 %1109, 0
  br i1 %1110, label %1111, label %1127

1111:                                             ; preds = %1108
  %1112 = load i16, ptr @gImageXSize, align 2, !tbaa !11
  %1113 = zext i16 %1112 to i32
  store i32 %1113, ptr %0, align 4, !tbaa !48
  %1114 = load i16, ptr @gImageYSize, align 2, !tbaa !11
  %1115 = zext i16 %1114 to i32
  store i32 %1115, ptr %7, align 4, !tbaa !51
  %1116 = load i8, ptr @gCompsInFrame, align 1, !tbaa !10
  %1117 = zext i8 %1116 to i32
  store i32 %1117, ptr %8, align 4, !tbaa !52
  %1118 = load i32, ptr @gScanType, align 4, !tbaa !6
  store i32 %1118, ptr %11, align 4, !tbaa !55
  %1119 = load i16, ptr @gMaxMCUSPerRow, align 2, !tbaa !11
  %1120 = zext i16 %1119 to i32
  store i32 %1120, ptr %9, align 4, !tbaa !53
  %1121 = load i16, ptr @gMaxMCUSPerCol, align 2, !tbaa !11
  %1122 = zext i16 %1121 to i32
  store i32 %1122, ptr %10, align 4, !tbaa !54
  %1123 = load i8, ptr @gMaxMCUXSize, align 1, !tbaa !10
  %1124 = zext nneg i8 %1123 to i32
  store i32 %1124, ptr %12, align 4, !tbaa !56
  %1125 = load i8, ptr @gMaxMCUYSize, align 1, !tbaa !10
  %1126 = zext nneg i8 %1125 to i32
  store i32 %1126, ptr %13, align 4, !tbaa !57
  store ptr @gMCUBufR, ptr %14, align 4, !tbaa !58
  store ptr @gMCUBufG, ptr %15, align 4, !tbaa !59
  store ptr @gMCUBufB, ptr %16, align 4, !tbaa !60
  br label %1127

1127:                                             ; preds = %1108, %1103, %554, %549, %558, %566, %559, %588, %35, %1111
  %1128 = phi i8 [ 0, %1111 ], [ 27, %588 ], [ %47, %35 ], [ %556, %554 ], [ 26, %558 ], [ 27, %566 ], [ 27, %559 ], [ %553, %549 ], [ %1107, %1103 ], [ %1109, %1108 ]
  ret i8 %1128
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @huffDecode(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1) unnamed_addr #0 {
  %3 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %4 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %6, label %13

6:                                                ; preds = %2
  %7 = tail call fastcc zeroext i8 @getOctet(i8 noundef zeroext 1) #7
  %8 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %9 = zext i8 %7 to i16
  %10 = or i16 %8, %9
  %11 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %12 = add i8 %11, 8
  br label %13

13:                                               ; preds = %2, %6
  %14 = phi i16 [ %10, %6 ], [ %3, %2 ]
  %15 = phi i8 [ %12, %6 ], [ %4, %2 ]
  %16 = lshr i16 %3, 15
  %17 = add i8 %15, -1
  store i8 %17, ptr @gBitsLeft, align 1, !tbaa !10
  %18 = shl i16 %14, 1
  store i16 %18, ptr @gBitBuf, align 2, !tbaa !11
  %19 = getelementptr inbounds nuw i8, ptr %0, i32 32
  br label %20

20:                                               ; preds = %13, %41
  %21 = phi i8 [ %17, %13 ], [ %44, %41 ]
  %22 = phi i16 [ %18, %13 ], [ %45, %41 ]
  %23 = phi i16 [ %16, %13 ], [ %46, %41 ]
  %24 = phi i8 [ 0, %13 ], [ %32, %41 ]
  %25 = zext nneg i8 %24 to i32
  %26 = getelementptr inbounds nuw i16, ptr %19, i32 %25
  %27 = load i16, ptr %26, align 2, !tbaa !11
  %28 = icmp ugt i16 %23, %27
  %29 = icmp eq i16 %27, -1
  %30 = or i1 %28, %29
  br i1 %30, label %31, label %48

31:                                               ; preds = %20
  %32 = add nuw nsw i8 %24, 1
  %33 = icmp eq i8 %21, 0
  br i1 %33, label %34, label %41

34:                                               ; preds = %31
  %35 = tail call fastcc zeroext i8 @getOctet(i8 noundef zeroext 1) #7
  %36 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %37 = zext i8 %35 to i16
  %38 = or i16 %36, %37
  %39 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %40 = add i8 %39, 8
  br label %41

41:                                               ; preds = %34, %31
  %42 = phi i16 [ %38, %34 ], [ %22, %31 ]
  %43 = phi i8 [ %40, %34 ], [ %21, %31 ]
  %44 = add i8 %43, -1
  store i8 %44, ptr @gBitsLeft, align 1, !tbaa !10
  %45 = shl i16 %42, 1
  store i16 %45, ptr @gBitBuf, align 2, !tbaa !11
  %46 = tail call i16 @llvm.fshl.i16(i16 %23, i16 %22, i16 1)
  %47 = icmp eq i8 %32, 16
  br i1 %47, label %61, label %20

48:                                               ; preds = %20
  %49 = getelementptr inbounds nuw i8, ptr %0, i32 64
  %50 = getelementptr inbounds nuw i8, ptr %49, i32 %25
  %51 = load i8, ptr %50, align 1, !tbaa !10
  %52 = trunc i16 %23 to i8
  %53 = getelementptr inbounds nuw i16, ptr %0, i32 %25
  %54 = load i16, ptr %53, align 2, !tbaa !11
  %55 = trunc i16 %54 to i8
  %56 = add i8 %51, %52
  %57 = sub i8 %56, %55
  %58 = zext i8 %57 to i32
  %59 = getelementptr inbounds nuw i8, ptr %1, i32 %58
  %60 = load i8, ptr %59, align 1, !tbaa !10
  br label %61

61:                                               ; preds = %41, %48
  %62 = phi i8 [ %60, %48 ], [ 0, %41 ]
  ret i8 %62
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal fastcc signext i16 @huffExtend(i16 noundef zeroext %0, i8 noundef zeroext %1) unnamed_addr #2 {
  %3 = add i8 %1, -1
  %4 = icmp ult i8 %3, 15
  br i1 %4, label %5, label %16

5:                                                ; preds = %2
  %6 = zext nneg i8 %3 to i32
  %7 = getelementptr inbounds nuw i16, ptr @switch.table.huffExtend, i32 %6
  %8 = load i16, ptr %7, align 2
  %9 = icmp ult i16 %0, %8
  br i1 %9, label %10, label %16

10:                                               ; preds = %5
  %11 = zext nneg i8 %1 to i32
  %12 = getelementptr i16, ptr @switch.table.huffExtend.1, i32 %11
  %13 = getelementptr i8, ptr %12, i32 -2
  %14 = load i16, ptr %13, align 2
  %15 = add nsw i16 %14, %0
  br label %16

16:                                               ; preds = %2, %5, %10
  %17 = phi i16 [ %15, %10 ], [ %0, %5 ], [ %0, %2 ]
  ret i16 %17
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @getOctet(i8 noundef zeroext range(i8 0, 2) %0) unnamed_addr #0 {
  %2 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %4, label %13

4:                                                ; preds = %1
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %5 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %6 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %7 = tail call zeroext i8 %5(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %6) #6
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %4
  store i8 %7, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %10

10:                                               ; preds = %9, %4
  %11 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %24, label %13

13:                                               ; preds = %1, %10
  %14 = phi i8 [ %11, %10 ], [ %2, %1 ]
  %15 = add i8 %14, -1
  store i8 %15, ptr @gInBufLeft, align 1, !tbaa !10
  %16 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %17 = add i8 %16, 1
  store i8 %17, ptr @gInBufOfs, align 1, !tbaa !10
  %18 = zext i8 %16 to i32
  %19 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %18
  %20 = load i8, ptr %19, align 1, !tbaa !10
  %21 = icmp ne i8 %0, 0
  %22 = icmp eq i8 %20, -1
  %23 = select i1 %21, i1 %22, i1 false
  br i1 %23, label %31, label %70

24:                                               ; preds = %10
  %25 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %26 = xor i8 %25, -1
  store i8 %26, ptr @gTemFlag, align 1, !tbaa !10
  %27 = icmp ne i8 %25, -1
  %28 = select i1 %27, i8 -1, i8 -39
  %29 = icmp ne i8 %0, 0
  %30 = select i1 %29, i1 %27, i1 false
  br i1 %30, label %35, label %70

31:                                               ; preds = %13
  %32 = icmp eq i8 %15, 0
  br i1 %32, label %35, label %33

33:                                               ; preds = %31
  %34 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  br label %50

35:                                               ; preds = %24, %31
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %36 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %37 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %38 = tail call zeroext i8 %36(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %37) #6
  %39 = icmp eq i8 %38, 0
  br i1 %39, label %41, label %40

40:                                               ; preds = %35
  store i8 %38, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %41

41:                                               ; preds = %40, %35
  %42 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %43 = icmp eq i8 %42, 0
  %44 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  br i1 %43, label %45, label %50

45:                                               ; preds = %41
  %46 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %47 = xor i8 %46, -1
  store i8 %47, ptr @gTemFlag, align 1, !tbaa !10
  %48 = icmp eq i8 %46, -1
  %49 = select i1 %48, i8 -39, i8 -1
  br label %59

50:                                               ; preds = %33, %41
  %51 = phi i8 [ %44, %41 ], [ %34, %33 ]
  %52 = phi i8 [ %42, %41 ], [ %15, %33 ]
  %53 = add i8 %52, -1
  store i8 %53, ptr @gInBufLeft, align 1, !tbaa !10
  %54 = add i8 %51, 1
  store i8 %54, ptr @gInBufOfs, align 1, !tbaa !10
  %55 = zext i8 %51 to i32
  %56 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %55
  %57 = load i8, ptr %56, align 1, !tbaa !10
  %58 = icmp eq i8 %57, 0
  br i1 %58, label %70, label %59

59:                                               ; preds = %45, %50
  %60 = phi i8 [ 0, %45 ], [ %53, %50 ]
  %61 = phi i8 [ %44, %45 ], [ %54, %50 ]
  %62 = phi i8 [ %49, %45 ], [ %57, %50 ]
  %63 = add i8 %61, -1
  %64 = zext i8 %63 to i32
  %65 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %64
  store i8 %62, ptr %65, align 1, !tbaa !10
  %66 = add i8 %61, -2
  store i8 %66, ptr @gInBufOfs, align 1, !tbaa !10
  %67 = zext i8 %66 to i32
  %68 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %67
  store i8 -1, ptr %68, align 1, !tbaa !10
  %69 = add i8 %60, 2
  store i8 %69, ptr @gInBufLeft, align 1, !tbaa !10
  br label %70

70:                                               ; preds = %24, %50, %59, %13
  %71 = phi i8 [ %28, %24 ], [ -1, %50 ], [ -1, %59 ], [ %20, %13 ]
  ret i8 %71
}

; Function Attrs: nounwind
define internal fastcc zeroext i16 @getBits(i8 noundef zeroext range(i8 1, 0) %0, i8 noundef zeroext range(i8 0, 2) %1) unnamed_addr #0 {
  %3 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %4 = icmp ugt i8 %0, 8
  %5 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  br i1 %4, label %6, label %27

6:                                                ; preds = %2
  %7 = add i8 %0, -8
  %8 = zext nneg i8 %5 to i32
  %9 = zext i16 %3 to i32
  %10 = shl i32 %9, %8
  %11 = trunc i32 %10 to i16
  store i16 %11, ptr @gBitBuf, align 2, !tbaa !11
  %12 = tail call fastcc zeroext i8 @getOctet(i8 noundef zeroext %1) #7
  %13 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %14 = zext i8 %12 to i16
  %15 = or i16 %13, %14
  %16 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %17 = zext i8 %16 to i32
  %18 = sub nsw i32 8, %17
  %19 = zext i16 %15 to i32
  %20 = shl nuw nsw i32 %19, %18
  %21 = trunc i32 %20 to i16
  %22 = and i32 %9, 65280
  %23 = lshr i32 %20, 8
  %24 = and i32 %23, 255
  %25 = or disjoint i32 %24, %22
  %26 = trunc nuw i32 %25 to i16
  br label %27

27:                                               ; preds = %6, %2
  %28 = phi i16 [ %21, %6 ], [ %3, %2 ]
  %29 = phi i8 [ %16, %6 ], [ %5, %2 ]
  %30 = phi i8 [ %7, %6 ], [ %0, %2 ]
  %31 = phi i16 [ %26, %6 ], [ %3, %2 ]
  %32 = zext i8 %30 to i32
  %33 = icmp ult i8 %29, %30
  %34 = zext i16 %28 to i32
  br i1 %33, label %35, label %50

35:                                               ; preds = %27
  %36 = zext nneg i8 %29 to i32
  %37 = shl i32 %34, %36
  %38 = trunc i32 %37 to i16
  store i16 %38, ptr @gBitBuf, align 2, !tbaa !11
  %39 = tail call fastcc zeroext i8 @getOctet(i8 noundef zeroext %1) #7
  %40 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %41 = zext i8 %39 to i16
  %42 = or i16 %40, %41
  %43 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %44 = zext i8 %43 to i32
  %45 = sub nsw i32 %32, %44
  %46 = zext i16 %42 to i32
  %47 = shl i32 %46, %45
  %48 = sub i8 %43, %30
  %49 = add i8 %48, 8
  br label %53

50:                                               ; preds = %27
  %51 = sub nuw i8 %29, %30
  %52 = shl i32 %34, %32
  br label %53

53:                                               ; preds = %50, %35
  %54 = phi i32 [ %47, %35 ], [ %52, %50 ]
  %55 = phi i8 [ %49, %35 ], [ %51, %50 ]
  %56 = trunc i32 %54 to i16
  store i16 %56, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %55, ptr @gBitsLeft, align 1, !tbaa !10
  %57 = zext i8 %0 to i32
  %58 = zext i16 %31 to i32
  %59 = sub nsw i32 16, %57
  %60 = lshr i32 %58, %59
  %61 = trunc nuw i32 %60 to i16
  ret i16 %61
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define internal fastcc void @upsampleCb(i8 noundef zeroext range(i8 0, 37) %0, i8 noundef zeroext range(i8 -64, -127) %1) unnamed_addr #3 {
  %3 = zext nneg i8 %0 to i32
  %4 = getelementptr inbounds nuw i16, ptr @gCoeffBuf, i32 %3
  %5 = zext i8 %1 to i32
  %6 = getelementptr inbounds nuw i8, ptr @gMCUBufG, i32 %5
  %7 = getelementptr inbounds nuw i8, ptr @gMCUBufB, i32 %5
  br label %8

8:                                                ; preds = %2, %102
  %9 = phi i8 [ 0, %2 ], [ %106, %102 ]
  %10 = phi ptr [ %4, %2 ], [ %103, %102 ]
  %11 = phi ptr [ %7, %2 ], [ %105, %102 ]
  %12 = phi ptr [ %6, %2 ], [ %104, %102 ]
  br label %13

13:                                               ; preds = %8, %13
  %14 = phi i8 [ 0, %8 ], [ %100, %13 ]
  %15 = phi ptr [ %10, %8 ], [ %18, %13 ]
  %16 = phi ptr [ %11, %8 ], [ %99, %13 ]
  %17 = phi ptr [ %12, %8 ], [ %98, %13 ]
  %18 = getelementptr inbounds nuw i8, ptr %15, i32 2
  %19 = load i16, ptr %15, align 2, !tbaa !11
  %20 = and i16 %19, 255
  %21 = mul nuw nsw i16 %20, 88
  %22 = lshr i16 %21, 8
  %23 = add nsw i16 %22, -44
  %24 = load i8, ptr %17, align 1, !tbaa !10
  %25 = zext i8 %24 to i16
  %26 = sub nsw i16 %25, %23
  %27 = icmp ugt i16 %26, 255
  %28 = trunc nuw i16 %26 to i8
  %29 = icmp sgt i16 %26, -1
  %30 = sext i1 %29 to i8
  %31 = select i1 %27, i8 %30, i8 %28
  store i8 %31, ptr %17, align 1, !tbaa !10
  %32 = getelementptr inbounds nuw i8, ptr %17, i32 1
  %33 = load i8, ptr %32, align 1, !tbaa !10
  %34 = zext i8 %33 to i16
  %35 = sub nsw i16 %34, %23
  %36 = icmp ugt i16 %35, 255
  %37 = trunc nuw i16 %35 to i8
  %38 = icmp sgt i16 %35, -1
  %39 = sext i1 %38 to i8
  %40 = select i1 %36, i8 %39, i8 %37
  store i8 %40, ptr %32, align 1, !tbaa !10
  %41 = getelementptr inbounds nuw i8, ptr %17, i32 8
  %42 = load i8, ptr %41, align 1, !tbaa !10
  %43 = zext i8 %42 to i16
  %44 = sub nsw i16 %43, %23
  %45 = icmp ugt i16 %44, 255
  %46 = trunc nuw i16 %44 to i8
  %47 = icmp sgt i16 %44, -1
  %48 = sext i1 %47 to i8
  %49 = select i1 %45, i8 %48, i8 %46
  store i8 %49, ptr %41, align 1, !tbaa !10
  %50 = getelementptr inbounds nuw i8, ptr %17, i32 9
  %51 = load i8, ptr %50, align 1, !tbaa !10
  %52 = zext i8 %51 to i16
  %53 = sub nsw i16 %52, %23
  %54 = icmp ugt i16 %53, 255
  %55 = trunc nuw i16 %53 to i8
  %56 = icmp sgt i16 %53, -1
  %57 = sext i1 %56 to i8
  %58 = select i1 %54, i8 %57, i8 %55
  store i8 %58, ptr %50, align 1, !tbaa !10
  %59 = mul nuw i16 %20, 198
  %60 = lshr i16 %59, 8
  %61 = add nsw i16 %20, -227
  %62 = add nsw i16 %61, %60
  %63 = load i8, ptr %16, align 1, !tbaa !10
  %64 = zext i8 %63 to i16
  %65 = add nsw i16 %62, %64
  %66 = icmp ugt i16 %65, 255
  %67 = trunc nuw i16 %65 to i8
  %68 = icmp sgt i16 %65, -1
  %69 = sext i1 %68 to i8
  %70 = select i1 %66, i8 %69, i8 %67
  store i8 %70, ptr %16, align 1, !tbaa !10
  %71 = getelementptr inbounds nuw i8, ptr %16, i32 1
  %72 = load i8, ptr %71, align 1, !tbaa !10
  %73 = zext i8 %72 to i16
  %74 = add nsw i16 %62, %73
  %75 = icmp ugt i16 %74, 255
  %76 = trunc nuw i16 %74 to i8
  %77 = icmp sgt i16 %74, -1
  %78 = sext i1 %77 to i8
  %79 = select i1 %75, i8 %78, i8 %76
  store i8 %79, ptr %71, align 1, !tbaa !10
  %80 = getelementptr inbounds nuw i8, ptr %16, i32 8
  %81 = load i8, ptr %80, align 1, !tbaa !10
  %82 = zext i8 %81 to i16
  %83 = add nsw i16 %62, %82
  %84 = icmp ugt i16 %83, 255
  %85 = trunc nuw i16 %83 to i8
  %86 = icmp sgt i16 %83, -1
  %87 = sext i1 %86 to i8
  %88 = select i1 %84, i8 %87, i8 %85
  store i8 %88, ptr %80, align 1, !tbaa !10
  %89 = getelementptr inbounds nuw i8, ptr %16, i32 9
  %90 = load i8, ptr %89, align 1, !tbaa !10
  %91 = zext i8 %90 to i16
  %92 = add nsw i16 %62, %91
  %93 = icmp ugt i16 %92, 255
  %94 = trunc nuw i16 %92 to i8
  %95 = icmp sgt i16 %92, -1
  %96 = sext i1 %95 to i8
  %97 = select i1 %93, i8 %96, i8 %94
  store i8 %97, ptr %89, align 1, !tbaa !10
  %98 = getelementptr inbounds nuw i8, ptr %17, i32 2
  %99 = getelementptr inbounds nuw i8, ptr %16, i32 2
  %100 = add nuw nsw i8 %14, 1
  %101 = icmp samesign ult i8 %14, 3
  br i1 %101, label %13, label %102, !llvm.loop !67

102:                                              ; preds = %13
  %103 = getelementptr inbounds nuw i8, ptr %15, i32 10
  %104 = getelementptr inbounds nuw i8, ptr %17, i32 10
  %105 = getelementptr inbounds nuw i8, ptr %16, i32 10
  %106 = add nuw nsw i8 %9, 1
  %107 = icmp samesign ult i8 %9, 3
  br i1 %107, label %8, label %108, !llvm.loop !68

108:                                              ; preds = %102
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none)
define internal fastcc void @upsampleCr(i8 noundef zeroext range(i8 0, 37) %0, i8 noundef zeroext range(i8 -64, -127) %1) unnamed_addr #3 {
  %3 = zext nneg i8 %0 to i32
  %4 = getelementptr inbounds nuw i16, ptr @gCoeffBuf, i32 %3
  %5 = zext i8 %1 to i32
  %6 = getelementptr inbounds nuw i8, ptr @gMCUBufR, i32 %5
  %7 = getelementptr inbounds nuw i8, ptr @gMCUBufG, i32 %5
  br label %8

8:                                                ; preds = %2, %102
  %9 = phi i8 [ 0, %2 ], [ %106, %102 ]
  %10 = phi ptr [ %4, %2 ], [ %103, %102 ]
  %11 = phi ptr [ %7, %2 ], [ %105, %102 ]
  %12 = phi ptr [ %6, %2 ], [ %104, %102 ]
  br label %13

13:                                               ; preds = %8, %13
  %14 = phi i8 [ 0, %8 ], [ %100, %13 ]
  %15 = phi ptr [ %10, %8 ], [ %18, %13 ]
  %16 = phi ptr [ %11, %8 ], [ %99, %13 ]
  %17 = phi ptr [ %12, %8 ], [ %98, %13 ]
  %18 = getelementptr inbounds nuw i8, ptr %15, i32 2
  %19 = load i16, ptr %15, align 2, !tbaa !11
  %20 = and i16 %19, 255
  %21 = mul nuw nsw i16 %20, 103
  %22 = lshr i16 %21, 8
  %23 = add nsw i16 %20, -179
  %24 = add nsw i16 %23, %22
  %25 = load i8, ptr %17, align 1, !tbaa !10
  %26 = zext i8 %25 to i16
  %27 = add nsw i16 %24, %26
  %28 = icmp ugt i16 %27, 255
  %29 = trunc nuw i16 %27 to i8
  %30 = icmp sgt i16 %27, -1
  %31 = sext i1 %30 to i8
  %32 = select i1 %28, i8 %31, i8 %29
  store i8 %32, ptr %17, align 1, !tbaa !10
  %33 = getelementptr inbounds nuw i8, ptr %17, i32 1
  %34 = load i8, ptr %33, align 1, !tbaa !10
  %35 = zext i8 %34 to i16
  %36 = add nsw i16 %24, %35
  %37 = icmp ugt i16 %36, 255
  %38 = trunc nuw i16 %36 to i8
  %39 = icmp sgt i16 %36, -1
  %40 = sext i1 %39 to i8
  %41 = select i1 %37, i8 %40, i8 %38
  store i8 %41, ptr %33, align 1, !tbaa !10
  %42 = getelementptr inbounds nuw i8, ptr %17, i32 8
  %43 = load i8, ptr %42, align 1, !tbaa !10
  %44 = zext i8 %43 to i16
  %45 = add nsw i16 %24, %44
  %46 = icmp ugt i16 %45, 255
  %47 = trunc nuw i16 %45 to i8
  %48 = icmp sgt i16 %45, -1
  %49 = sext i1 %48 to i8
  %50 = select i1 %46, i8 %49, i8 %47
  store i8 %50, ptr %42, align 1, !tbaa !10
  %51 = getelementptr inbounds nuw i8, ptr %17, i32 9
  %52 = load i8, ptr %51, align 1, !tbaa !10
  %53 = zext i8 %52 to i16
  %54 = add nsw i16 %24, %53
  %55 = icmp ugt i16 %54, 255
  %56 = trunc nuw i16 %54 to i8
  %57 = icmp sgt i16 %54, -1
  %58 = sext i1 %57 to i8
  %59 = select i1 %55, i8 %58, i8 %56
  store i8 %59, ptr %51, align 1, !tbaa !10
  %60 = mul nuw i16 %20, 183
  %61 = lshr i16 %60, 8
  %62 = add nsw i16 %61, -91
  %63 = load i8, ptr %16, align 1, !tbaa !10
  %64 = zext i8 %63 to i16
  %65 = sub nsw i16 %64, %62
  %66 = icmp ugt i16 %65, 255
  %67 = trunc nuw i16 %65 to i8
  %68 = icmp sgt i16 %65, -1
  %69 = sext i1 %68 to i8
  %70 = select i1 %66, i8 %69, i8 %67
  store i8 %70, ptr %16, align 1, !tbaa !10
  %71 = getelementptr inbounds nuw i8, ptr %16, i32 1
  %72 = load i8, ptr %71, align 1, !tbaa !10
  %73 = zext i8 %72 to i16
  %74 = sub nsw i16 %73, %62
  %75 = icmp ugt i16 %74, 255
  %76 = trunc nuw i16 %74 to i8
  %77 = icmp sgt i16 %74, -1
  %78 = sext i1 %77 to i8
  %79 = select i1 %75, i8 %78, i8 %76
  store i8 %79, ptr %71, align 1, !tbaa !10
  %80 = getelementptr inbounds nuw i8, ptr %16, i32 8
  %81 = load i8, ptr %80, align 1, !tbaa !10
  %82 = zext i8 %81 to i16
  %83 = sub nsw i16 %82, %62
  %84 = icmp ugt i16 %83, 255
  %85 = trunc nuw i16 %83 to i8
  %86 = icmp sgt i16 %83, -1
  %87 = sext i1 %86 to i8
  %88 = select i1 %84, i8 %87, i8 %85
  store i8 %88, ptr %80, align 1, !tbaa !10
  %89 = getelementptr inbounds nuw i8, ptr %16, i32 9
  %90 = load i8, ptr %89, align 1, !tbaa !10
  %91 = zext i8 %90 to i16
  %92 = sub nsw i16 %91, %62
  %93 = icmp ugt i16 %92, 255
  %94 = trunc nuw i16 %92 to i8
  %95 = icmp sgt i16 %92, -1
  %96 = sext i1 %95 to i8
  %97 = select i1 %93, i8 %96, i8 %94
  store i8 %97, ptr %89, align 1, !tbaa !10
  %98 = getelementptr inbounds nuw i8, ptr %17, i32 2
  %99 = getelementptr inbounds nuw i8, ptr %16, i32 2
  %100 = add nuw nsw i8 %14, 1
  %101 = icmp samesign ult i8 %14, 3
  br i1 %101, label %13, label %102, !llvm.loop !69

102:                                              ; preds = %13
  %103 = getelementptr inbounds nuw i8, ptr %15, i32 10
  %104 = getelementptr inbounds nuw i8, ptr %17, i32 10
  %105 = getelementptr inbounds nuw i8, ptr %16, i32 10
  %106 = add nuw nsw i8 %9, 1
  %107 = icmp samesign ult i8 %9, 3
  br i1 %107, label %8, label %108, !llvm.loop !70

108:                                              ; preds = %102
  ret void
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 19) i8 @processMarkers(ptr noundef nonnull writeonly captures(none) %0) unnamed_addr #0 {
  %2 = alloca [16 x i8], align 1
  br label %3

3:                                                ; preds = %569, %1
  %4 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %5 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  br label %6

6:                                                ; preds = %57, %3
  %7 = phi i16 [ %5, %3 ], [ %58, %57 ]
  %8 = phi i8 [ %4, %3 ], [ %59, %57 ]
  %9 = icmp ult i8 %8, 8
  %10 = zext i16 %7 to i32
  br i1 %9, label %11, label %49

11:                                               ; preds = %6
  %12 = zext nneg i8 %8 to i32
  %13 = shl nuw nsw i32 %10, %12
  %14 = trunc i32 %13 to i16
  store i16 %14, ptr @gBitBuf, align 2, !tbaa !11
  %15 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %17, label %26

17:                                               ; preds = %11
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %18 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %19 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %20 = tail call zeroext i8 %18(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %19) #6
  %21 = icmp eq i8 %20, 0
  br i1 %21, label %23, label %22

22:                                               ; preds = %17
  store i8 %20, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %23

23:                                               ; preds = %22, %17
  %24 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %25 = icmp eq i8 %24, 0
  br i1 %25, label %34, label %26

26:                                               ; preds = %23, %11
  %27 = phi i8 [ %24, %23 ], [ %15, %11 ]
  %28 = add i8 %27, -1
  store i8 %28, ptr @gInBufLeft, align 1, !tbaa !10
  %29 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %30 = add i8 %29, 1
  store i8 %30, ptr @gInBufOfs, align 1, !tbaa !10
  %31 = zext i8 %29 to i32
  %32 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %31
  %33 = load i8, ptr %32, align 1, !tbaa !10
  br label %39

34:                                               ; preds = %23
  %35 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %36 = xor i8 %35, -1
  store i8 %36, ptr @gTemFlag, align 1, !tbaa !10
  %37 = icmp eq i8 %35, -1
  %38 = select i1 %37, i8 -39, i8 -1
  br label %39

39:                                               ; preds = %34, %26
  %40 = phi i8 [ %38, %34 ], [ %33, %26 ]
  %41 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %42 = zext i8 %40 to i16
  %43 = or i16 %41, %42
  %44 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %45 = zext i8 %44 to i32
  %46 = sub nsw i32 8, %45
  %47 = zext i16 %43 to i32
  %48 = shl nuw nsw i32 %47, %46
  br label %52

49:                                               ; preds = %6
  %50 = add i8 %8, -8
  %51 = shl nuw nsw i32 %10, 8
  br label %52

52:                                               ; preds = %49, %39
  %53 = phi i32 [ %48, %39 ], [ %51, %49 ]
  %54 = phi i8 [ %44, %39 ], [ %50, %49 ]
  %55 = trunc i32 %53 to i16
  store i16 %55, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %54, ptr @gBitsLeft, align 1, !tbaa !10
  %56 = icmp ugt i16 %7, -257
  br i1 %56, label %60, label %57

57:                                               ; preds = %106, %52
  %58 = phi i16 [ %55, %52 ], [ %109, %106 ]
  %59 = phi i8 [ %54, %52 ], [ %108, %106 ]
  br label %6, !llvm.loop !71

60:                                               ; preds = %52, %106
  %61 = phi i16 [ %109, %106 ], [ %55, %52 ]
  %62 = phi i8 [ %108, %106 ], [ %54, %52 ]
  %63 = icmp ult i8 %62, 8
  %64 = zext i16 %61 to i32
  br i1 %63, label %65, label %103

65:                                               ; preds = %60
  %66 = zext nneg i8 %62 to i32
  %67 = shl nuw nsw i32 %64, %66
  %68 = trunc i32 %67 to i16
  store i16 %68, ptr @gBitBuf, align 2, !tbaa !11
  %69 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %70 = icmp eq i8 %69, 0
  br i1 %70, label %71, label %80

71:                                               ; preds = %65
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %72 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %73 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %74 = tail call zeroext i8 %72(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %73) #6
  %75 = icmp eq i8 %74, 0
  br i1 %75, label %77, label %76

76:                                               ; preds = %71
  store i8 %74, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %77

77:                                               ; preds = %76, %71
  %78 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %79 = icmp eq i8 %78, 0
  br i1 %79, label %88, label %80

80:                                               ; preds = %77, %65
  %81 = phi i8 [ %78, %77 ], [ %69, %65 ]
  %82 = add i8 %81, -1
  store i8 %82, ptr @gInBufLeft, align 1, !tbaa !10
  %83 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %84 = add i8 %83, 1
  store i8 %84, ptr @gInBufOfs, align 1, !tbaa !10
  %85 = zext i8 %83 to i32
  %86 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %85
  %87 = load i8, ptr %86, align 1, !tbaa !10
  br label %93

88:                                               ; preds = %77
  %89 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %90 = xor i8 %89, -1
  store i8 %90, ptr @gTemFlag, align 1, !tbaa !10
  %91 = icmp eq i8 %89, -1
  %92 = select i1 %91, i8 -39, i8 -1
  br label %93

93:                                               ; preds = %88, %80
  %94 = phi i8 [ %92, %88 ], [ %87, %80 ]
  %95 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %96 = zext i8 %94 to i16
  %97 = or i16 %95, %96
  %98 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %99 = zext i8 %98 to i32
  %100 = sub nsw i32 8, %99
  %101 = zext i16 %97 to i32
  %102 = shl nuw nsw i32 %101, %100
  br label %106

103:                                              ; preds = %60
  %104 = add i8 %62, -8
  %105 = shl nuw nsw i32 %64, 8
  br label %106

106:                                              ; preds = %103, %93
  %107 = phi i32 [ %102, %93 ], [ %105, %103 ]
  %108 = phi i8 [ %98, %93 ], [ %104, %103 ]
  %109 = trunc i32 %107 to i16
  store i16 %109, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %108, ptr @gBitsLeft, align 1, !tbaa !10
  %110 = lshr i16 %61, 8
  %111 = trunc nuw i16 %110 to i8
  switch i8 %111, label %563 [
    i8 -1, label %60
    i8 0, label %57
    i8 -64, label %112
    i8 -63, label %112
    i8 -62, label %112
    i8 -61, label %112
    i8 -59, label %112
    i8 -58, label %112
    i8 -57, label %112
    i8 -55, label %112
    i8 -54, label %112
    i8 -53, label %112
    i8 -51, label %112
    i8 -50, label %112
    i8 -49, label %112
    i8 -40, label %112
    i8 -39, label %112
    i8 -38, label %112
    i8 -60, label %113
    i8 -52, label %626
    i8 -37, label %354
    i8 -35, label %558
    i8 -56, label %627
    i8 -48, label %627
    i8 -47, label %627
    i8 -46, label %627
    i8 -45, label %627
    i8 -44, label %627
    i8 -43, label %627
    i8 -42, label %627
    i8 -41, label %627
    i8 1, label %627
  ]

112:                                              ; preds = %106, %106, %106, %106, %106, %106, %106, %106, %106, %106, %106, %106, %106, %106, %106, %106
  store i8 %111, ptr %0, align 1, !tbaa !10
  br label %627

113:                                              ; preds = %106
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #8
  %114 = tail call fastcc zeroext i16 @getBits(i8 noundef zeroext 16, i8 noundef zeroext 0) #7
  %115 = icmp ult i16 %114, 2
  br i1 %115, label %353, label %116

116:                                              ; preds = %113
  %117 = add i16 %114, -2
  %118 = icmp eq i16 %117, 0
  br i1 %118, label %353, label %119

119:                                              ; preds = %116
  %120 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %121 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  br label %125

122:                                              ; preds = %342
  %123 = sub nuw i16 %128, %324
  %124 = icmp eq i16 %123, 0
  br i1 %124, label %353, label %125, !llvm.loop !72

125:                                              ; preds = %122, %119
  %126 = phi i8 [ %322, %122 ], [ %121, %119 ]
  %127 = phi i16 [ %323, %122 ], [ %120, %119 ]
  %128 = phi i16 [ %123, %122 ], [ %117, %119 ]
  %129 = icmp ult i8 %126, 8
  %130 = zext i16 %127 to i32
  br i1 %129, label %131, label %169

131:                                              ; preds = %125
  %132 = zext nneg i8 %126 to i32
  %133 = shl nuw nsw i32 %130, %132
  %134 = trunc i32 %133 to i16
  store i16 %134, ptr @gBitBuf, align 2, !tbaa !11
  %135 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %136 = icmp eq i8 %135, 0
  br i1 %136, label %137, label %146

137:                                              ; preds = %131
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %138 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %139 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %140 = tail call zeroext i8 %138(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %139) #6
  %141 = icmp eq i8 %140, 0
  br i1 %141, label %143, label %142

142:                                              ; preds = %137
  store i8 %140, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %143

143:                                              ; preds = %142, %137
  %144 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %145 = icmp eq i8 %144, 0
  br i1 %145, label %154, label %146

146:                                              ; preds = %143, %131
  %147 = phi i8 [ %144, %143 ], [ %135, %131 ]
  %148 = add i8 %147, -1
  store i8 %148, ptr @gInBufLeft, align 1, !tbaa !10
  %149 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %150 = add i8 %149, 1
  store i8 %150, ptr @gInBufOfs, align 1, !tbaa !10
  %151 = zext i8 %149 to i32
  %152 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %151
  %153 = load i8, ptr %152, align 1, !tbaa !10
  br label %159

154:                                              ; preds = %143
  %155 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %156 = xor i8 %155, -1
  store i8 %156, ptr @gTemFlag, align 1, !tbaa !10
  %157 = icmp eq i8 %155, -1
  %158 = select i1 %157, i8 -39, i8 -1
  br label %159

159:                                              ; preds = %154, %146
  %160 = phi i8 [ %158, %154 ], [ %153, %146 ]
  %161 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %162 = zext i8 %160 to i16
  %163 = or i16 %161, %162
  %164 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %165 = zext i8 %164 to i32
  %166 = sub nsw i32 8, %165
  %167 = zext i16 %163 to i32
  %168 = shl nuw nsw i32 %167, %166
  br label %172

169:                                              ; preds = %125
  %170 = add i8 %126, -8
  %171 = shl nuw nsw i32 %130, 8
  br label %172

172:                                              ; preds = %169, %159
  %173 = phi i32 [ %168, %159 ], [ %171, %169 ]
  %174 = phi i8 [ %164, %159 ], [ %170, %169 ]
  %175 = trunc i32 %173 to i16
  store i16 %175, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %174, ptr @gBitsLeft, align 1, !tbaa !10
  %176 = lshr i16 %127, 8
  %177 = zext nneg i16 %176 to i32
  %178 = and i32 %177, 14
  %179 = icmp ne i32 %178, 0
  %180 = and i32 %177, 240
  %181 = icmp samesign ugt i32 %180, 16
  %182 = select i1 %179, i1 true, i1 %181
  br i1 %182, label %353, label %183

183:                                              ; preds = %172
  %184 = lshr i16 %127, 11
  %185 = and i16 %184, 2
  %186 = and i16 %176, 1
  %187 = or disjoint i16 %185, %186
  %188 = trunc nuw nsw i16 %187 to i8
  switch i8 %188, label %190 [
    i8 0, label %189
    i8 1, label %193
    i8 2, label %191
    i8 3, label %192
  ]

189:                                              ; preds = %183
  br label %193

190:                                              ; preds = %183
  unreachable

191:                                              ; preds = %183
  br label %193

192:                                              ; preds = %183
  br label %193

193:                                              ; preds = %192, %191, %189, %183
  %194 = phi ptr [ @gHuffTab3, %192 ], [ @gHuffTab2, %191 ], [ @gHuffTab0, %189 ], [ @gHuffTab1, %183 ]
  %195 = phi ptr [ @gHuffVal3, %192 ], [ @gHuffVal2, %191 ], [ @gHuffVal0, %189 ], [ @gHuffVal1, %183 ]
  %196 = shl nuw nsw i8 1, %188
  %197 = load i8, ptr @gValidHuffTables, align 1, !tbaa !10
  %198 = or i8 %197, %196
  store i8 %198, ptr @gValidHuffTables, align 1, !tbaa !10
  br label %199

199:                                              ; preds = %247, %193
  %200 = phi i8 [ %174, %193 ], [ %249, %247 ]
  %201 = phi i16 [ %175, %193 ], [ %250, %247 ]
  %202 = phi i32 [ 0, %193 ], [ %255, %247 ]
  %203 = phi i16 [ 0, %193 ], [ %254, %247 ]
  %204 = icmp ult i8 %200, 8
  %205 = zext i16 %201 to i32
  br i1 %204, label %206, label %244

206:                                              ; preds = %199
  %207 = zext nneg i8 %200 to i32
  %208 = shl nuw nsw i32 %205, %207
  %209 = trunc i32 %208 to i16
  store i16 %209, ptr @gBitBuf, align 2, !tbaa !11
  %210 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %211 = icmp eq i8 %210, 0
  br i1 %211, label %212, label %221

212:                                              ; preds = %206
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %213 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %214 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %215 = tail call zeroext i8 %213(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %214) #6
  %216 = icmp eq i8 %215, 0
  br i1 %216, label %218, label %217

217:                                              ; preds = %212
  store i8 %215, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %218

218:                                              ; preds = %217, %212
  %219 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %220 = icmp eq i8 %219, 0
  br i1 %220, label %229, label %221

221:                                              ; preds = %218, %206
  %222 = phi i8 [ %219, %218 ], [ %210, %206 ]
  %223 = add i8 %222, -1
  store i8 %223, ptr @gInBufLeft, align 1, !tbaa !10
  %224 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %225 = add i8 %224, 1
  store i8 %225, ptr @gInBufOfs, align 1, !tbaa !10
  %226 = zext i8 %224 to i32
  %227 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %226
  %228 = load i8, ptr %227, align 1, !tbaa !10
  br label %234

229:                                              ; preds = %218
  %230 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %231 = xor i8 %230, -1
  store i8 %231, ptr @gTemFlag, align 1, !tbaa !10
  %232 = icmp eq i8 %230, -1
  %233 = select i1 %232, i8 -39, i8 -1
  br label %234

234:                                              ; preds = %229, %221
  %235 = phi i8 [ %233, %229 ], [ %228, %221 ]
  %236 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %237 = zext i8 %235 to i16
  %238 = or i16 %236, %237
  %239 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %240 = zext i8 %239 to i32
  %241 = sub nsw i32 8, %240
  %242 = zext i16 %238 to i32
  %243 = shl nuw nsw i32 %242, %241
  br label %247

244:                                              ; preds = %199
  %245 = add i8 %200, -8
  %246 = shl nuw nsw i32 %205, 8
  br label %247

247:                                              ; preds = %244, %234
  %248 = phi i32 [ %243, %234 ], [ %246, %244 ]
  %249 = phi i8 [ %239, %234 ], [ %245, %244 ]
  %250 = trunc i32 %248 to i16
  store i16 %250, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %249, ptr @gBitsLeft, align 1, !tbaa !10
  %251 = lshr i16 %201, 8
  %252 = trunc nuw i16 %251 to i8
  %253 = getelementptr inbounds nuw i8, ptr %2, i32 %202
  store i8 %252, ptr %253, align 1, !tbaa !10
  %254 = add i16 %203, %251
  %255 = add nuw nsw i32 %202, 1
  %256 = icmp eq i32 %255, 16
  br i1 %256, label %257, label %199, !llvm.loop !73

257:                                              ; preds = %247
  %258 = icmp samesign ult i8 %188, 2
  %259 = select i1 %258, i16 12, i16 255
  %260 = icmp ugt i16 %254, %259
  br i1 %260, label %353, label %261

261:                                              ; preds = %257
  %262 = icmp eq i16 %254, 0
  br i1 %262, label %321, label %263

263:                                              ; preds = %261, %311
  %264 = phi i8 [ %313, %311 ], [ %249, %261 ]
  %265 = phi i16 [ %314, %311 ], [ %250, %261 ]
  %266 = phi i8 [ %318, %311 ], [ 0, %261 ]
  %267 = zext i8 %266 to i32
  %268 = icmp ult i8 %264, 8
  %269 = zext i16 %265 to i32
  br i1 %268, label %270, label %308

270:                                              ; preds = %263
  %271 = zext nneg i8 %264 to i32
  %272 = shl nuw nsw i32 %269, %271
  %273 = trunc i32 %272 to i16
  store i16 %273, ptr @gBitBuf, align 2, !tbaa !11
  %274 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %275 = icmp eq i8 %274, 0
  br i1 %275, label %276, label %285

276:                                              ; preds = %270
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %277 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %278 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %279 = tail call zeroext i8 %277(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %278) #6
  %280 = icmp eq i8 %279, 0
  br i1 %280, label %282, label %281

281:                                              ; preds = %276
  store i8 %279, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %282

282:                                              ; preds = %281, %276
  %283 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %284 = icmp eq i8 %283, 0
  br i1 %284, label %293, label %285

285:                                              ; preds = %282, %270
  %286 = phi i8 [ %283, %282 ], [ %274, %270 ]
  %287 = add i8 %286, -1
  store i8 %287, ptr @gInBufLeft, align 1, !tbaa !10
  %288 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %289 = add i8 %288, 1
  store i8 %289, ptr @gInBufOfs, align 1, !tbaa !10
  %290 = zext i8 %288 to i32
  %291 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %290
  %292 = load i8, ptr %291, align 1, !tbaa !10
  br label %298

293:                                              ; preds = %282
  %294 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %295 = xor i8 %294, -1
  store i8 %295, ptr @gTemFlag, align 1, !tbaa !10
  %296 = icmp eq i8 %294, -1
  %297 = select i1 %296, i8 -39, i8 -1
  br label %298

298:                                              ; preds = %293, %285
  %299 = phi i8 [ %297, %293 ], [ %292, %285 ]
  %300 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %301 = zext i8 %299 to i16
  %302 = or i16 %300, %301
  %303 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %304 = zext i8 %303 to i32
  %305 = sub nsw i32 8, %304
  %306 = zext i16 %302 to i32
  %307 = shl nuw nsw i32 %306, %305
  br label %311

308:                                              ; preds = %263
  %309 = add i8 %264, -8
  %310 = shl nuw nsw i32 %269, 8
  br label %311

311:                                              ; preds = %308, %298
  %312 = phi i32 [ %307, %298 ], [ %310, %308 ]
  %313 = phi i8 [ %303, %298 ], [ %309, %308 ]
  %314 = trunc i32 %312 to i16
  store i16 %314, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %313, ptr @gBitsLeft, align 1, !tbaa !10
  %315 = lshr i16 %265, 8
  %316 = trunc nuw i16 %315 to i8
  %317 = getelementptr inbounds nuw i8, ptr %195, i32 %267
  store i8 %316, ptr %317, align 1, !tbaa !10
  %318 = add i8 %266, 1
  %319 = zext i8 %318 to i16
  %320 = icmp ugt i16 %254, %319
  br i1 %320, label %263, label %321, !llvm.loop !74

321:                                              ; preds = %311, %261
  %322 = phi i8 [ %249, %261 ], [ %313, %311 ]
  %323 = phi i16 [ %250, %261 ], [ %314, %311 ]
  %324 = add nuw nsw i16 %254, 17
  %325 = icmp ult i16 %128, %324
  br i1 %325, label %353, label %326

326:                                              ; preds = %321
  %327 = getelementptr inbounds nuw i8, ptr %194, i32 32
  %328 = getelementptr inbounds nuw i8, ptr %194, i32 64
  br label %329

329:                                              ; preds = %342, %326
  %330 = phi i32 [ %351, %342 ], [ 0, %326 ]
  %331 = phi i8 [ %346, %342 ], [ 0, %326 ]
  %332 = phi i16 [ %350, %342 ], [ 0, %326 ]
  %333 = getelementptr inbounds nuw i8, ptr %2, i32 %330
  %334 = load i8, ptr %333, align 1, !tbaa !10
  %335 = icmp eq i8 %334, 0
  %336 = getelementptr inbounds nuw i16, ptr %194, i32 %330
  br i1 %335, label %342, label %337

337:                                              ; preds = %329
  %338 = zext i8 %334 to i16
  %339 = add i16 %332, %338
  %340 = add i16 %339, -1
  %341 = add i8 %334, %331
  br label %342

342:                                              ; preds = %337, %329
  %343 = phi i16 [ %332, %337 ], [ 0, %329 ]
  %344 = phi i16 [ %340, %337 ], [ -1, %329 ]
  %345 = phi i8 [ %331, %337 ], [ 0, %329 ]
  %346 = phi i8 [ %341, %337 ], [ %331, %329 ]
  %347 = phi i16 [ %339, %337 ], [ %332, %329 ]
  store i16 %343, ptr %336, align 2, !tbaa !11
  %348 = getelementptr inbounds nuw i16, ptr %327, i32 %330
  store i16 %344, ptr %348, align 2, !tbaa !11
  %349 = getelementptr inbounds nuw i8, ptr %328, i32 %330
  store i8 %345, ptr %349, align 1, !tbaa !10
  %350 = shl i16 %347, 1
  %351 = add nuw nsw i32 %330, 1
  %352 = icmp eq i32 %351, 16
  br i1 %352, label %122, label %329, !llvm.loop !72

353:                                              ; preds = %122, %172, %257, %321, %113, %116
  call void @llvm.lifetime.end.p0(ptr nonnull %2) #8
  br label %569

354:                                              ; preds = %106
  %355 = tail call fastcc zeroext i16 @getBits(i8 noundef zeroext 16, i8 noundef zeroext 0) #7
  %356 = icmp ult i16 %355, 2
  br i1 %356, label %569, label %357

357:                                              ; preds = %354
  %358 = add i16 %355, -2
  %359 = icmp eq i16 %358, 0
  br i1 %359, label %569, label %360

360:                                              ; preds = %357
  %361 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %362 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  br label %367

363:                                              ; preds = %554
  %364 = trunc nuw nsw i32 %555 to i16
  %365 = sub i16 %370, %364
  %366 = icmp eq i16 %365, 0
  br i1 %366, label %569, label %367, !llvm.loop !75

367:                                              ; preds = %363, %360
  %368 = phi i8 [ %534, %363 ], [ %362, %360 ]
  %369 = phi i16 [ %535, %363 ], [ %361, %360 ]
  %370 = phi i16 [ %365, %363 ], [ %358, %360 ]
  %371 = icmp ult i8 %368, 8
  %372 = zext i16 %369 to i32
  br i1 %371, label %373, label %411

373:                                              ; preds = %367
  %374 = zext nneg i8 %368 to i32
  %375 = shl nuw nsw i32 %372, %374
  %376 = trunc i32 %375 to i16
  store i16 %376, ptr @gBitBuf, align 2, !tbaa !11
  %377 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %378 = icmp eq i8 %377, 0
  br i1 %378, label %379, label %388

379:                                              ; preds = %373
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %380 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %381 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %382 = tail call zeroext i8 %380(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %381) #6
  %383 = icmp eq i8 %382, 0
  br i1 %383, label %385, label %384

384:                                              ; preds = %379
  store i8 %382, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %385

385:                                              ; preds = %384, %379
  %386 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %387 = icmp eq i8 %386, 0
  br i1 %387, label %396, label %388

388:                                              ; preds = %385, %373
  %389 = phi i8 [ %386, %385 ], [ %377, %373 ]
  %390 = add i8 %389, -1
  store i8 %390, ptr @gInBufLeft, align 1, !tbaa !10
  %391 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %392 = add i8 %391, 1
  store i8 %392, ptr @gInBufOfs, align 1, !tbaa !10
  %393 = zext i8 %391 to i32
  %394 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %393
  %395 = load i8, ptr %394, align 1, !tbaa !10
  br label %401

396:                                              ; preds = %385
  %397 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %398 = xor i8 %397, -1
  store i8 %398, ptr @gTemFlag, align 1, !tbaa !10
  %399 = icmp eq i8 %397, -1
  %400 = select i1 %399, i8 -39, i8 -1
  br label %401

401:                                              ; preds = %396, %388
  %402 = phi i8 [ %400, %396 ], [ %395, %388 ]
  %403 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %404 = zext i8 %402 to i16
  %405 = or i16 %403, %404
  %406 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %407 = zext i8 %406 to i32
  %408 = sub nsw i32 8, %407
  %409 = zext i16 %405 to i32
  %410 = shl nuw nsw i32 %409, %408
  br label %414

411:                                              ; preds = %367
  %412 = add i8 %368, -8
  %413 = shl nuw nsw i32 %372, 8
  br label %414

414:                                              ; preds = %411, %401
  %415 = phi i32 [ %410, %401 ], [ %413, %411 ]
  %416 = phi i8 [ %406, %401 ], [ %412, %411 ]
  %417 = trunc i32 %415 to i16
  store i16 %417, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %416, ptr @gBitsLeft, align 1, !tbaa !10
  %418 = lshr i16 %369, 8
  %419 = trunc nuw i16 %418 to i8
  %420 = and i8 %419, 15
  %421 = icmp samesign ugt i8 %420, 1
  br i1 %421, label %569, label %422

422:                                              ; preds = %414
  %423 = icmp eq i8 %420, 0
  %424 = select i1 %423, i8 1, i8 2
  %425 = load i8, ptr @gValidQuantTables, align 1, !tbaa !10
  %426 = or i8 %425, %424
  store i8 %426, ptr @gValidQuantTables, align 1, !tbaa !10
  %427 = icmp ult i8 %419, 16
  %428 = select i1 %423, ptr @gQuant0, ptr @gQuant1
  br label %429

429:                                              ; preds = %533, %422
  %430 = phi i8 [ %416, %422 ], [ %534, %533 ]
  %431 = phi i16 [ %417, %422 ], [ %535, %533 ]
  %432 = phi i32 [ 0, %422 ], [ %538, %533 ]
  %433 = icmp ult i8 %430, 8
  %434 = zext i16 %431 to i32
  br i1 %433, label %435, label %473

435:                                              ; preds = %429
  %436 = zext nneg i8 %430 to i32
  %437 = shl nuw nsw i32 %434, %436
  %438 = trunc i32 %437 to i16
  store i16 %438, ptr @gBitBuf, align 2, !tbaa !11
  %439 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %440 = icmp eq i8 %439, 0
  br i1 %440, label %441, label %450

441:                                              ; preds = %435
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %442 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %443 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %444 = tail call zeroext i8 %442(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %443) #6
  %445 = icmp eq i8 %444, 0
  br i1 %445, label %447, label %446

446:                                              ; preds = %441
  store i8 %444, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %447

447:                                              ; preds = %446, %441
  %448 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %449 = icmp eq i8 %448, 0
  br i1 %449, label %458, label %450

450:                                              ; preds = %447, %435
  %451 = phi i8 [ %448, %447 ], [ %439, %435 ]
  %452 = add i8 %451, -1
  store i8 %452, ptr @gInBufLeft, align 1, !tbaa !10
  %453 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %454 = add i8 %453, 1
  store i8 %454, ptr @gInBufOfs, align 1, !tbaa !10
  %455 = zext i8 %453 to i32
  %456 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %455
  %457 = load i8, ptr %456, align 1, !tbaa !10
  br label %463

458:                                              ; preds = %447
  %459 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %460 = xor i8 %459, -1
  store i8 %460, ptr @gTemFlag, align 1, !tbaa !10
  %461 = icmp eq i8 %459, -1
  %462 = select i1 %461, i8 -39, i8 -1
  br label %463

463:                                              ; preds = %458, %450
  %464 = phi i8 [ %462, %458 ], [ %457, %450 ]
  %465 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %466 = zext i8 %464 to i16
  %467 = or i16 %465, %466
  %468 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %469 = zext i8 %468 to i32
  %470 = sub nsw i32 8, %469
  %471 = zext i16 %467 to i32
  %472 = shl nuw nsw i32 %471, %470
  br label %476

473:                                              ; preds = %429
  %474 = add i8 %430, -8
  %475 = shl nuw nsw i32 %434, 8
  br label %476

476:                                              ; preds = %473, %463
  %477 = phi i32 [ %472, %463 ], [ %475, %473 ]
  %478 = phi i8 [ %468, %463 ], [ %474, %473 ]
  %479 = trunc i32 %477 to i16
  store i16 %479, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %478, ptr @gBitsLeft, align 1, !tbaa !10
  %480 = lshr i16 %431, 8
  br i1 %427, label %533, label %481

481:                                              ; preds = %476
  %482 = and i16 %431, -256
  %483 = icmp ult i8 %478, 8
  %484 = and i32 %477, 65535
  br i1 %483, label %485, label %523

485:                                              ; preds = %481
  %486 = zext nneg i8 %478 to i32
  %487 = shl i32 %477, %486
  %488 = trunc i32 %487 to i16
  store i16 %488, ptr @gBitBuf, align 2, !tbaa !11
  %489 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %490 = icmp eq i8 %489, 0
  br i1 %490, label %491, label %500

491:                                              ; preds = %485
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %492 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %493 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %494 = tail call zeroext i8 %492(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %493) #6
  %495 = icmp eq i8 %494, 0
  br i1 %495, label %497, label %496

496:                                              ; preds = %491
  store i8 %494, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %497

497:                                              ; preds = %496, %491
  %498 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %499 = icmp eq i8 %498, 0
  br i1 %499, label %508, label %500

500:                                              ; preds = %497, %485
  %501 = phi i8 [ %498, %497 ], [ %489, %485 ]
  %502 = add i8 %501, -1
  store i8 %502, ptr @gInBufLeft, align 1, !tbaa !10
  %503 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %504 = add i8 %503, 1
  store i8 %504, ptr @gInBufOfs, align 1, !tbaa !10
  %505 = zext i8 %503 to i32
  %506 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %505
  %507 = load i8, ptr %506, align 1, !tbaa !10
  br label %513

508:                                              ; preds = %497
  %509 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %510 = xor i8 %509, -1
  store i8 %510, ptr @gTemFlag, align 1, !tbaa !10
  %511 = icmp eq i8 %509, -1
  %512 = select i1 %511, i8 -39, i8 -1
  br label %513

513:                                              ; preds = %508, %500
  %514 = phi i8 [ %512, %508 ], [ %507, %500 ]
  %515 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %516 = zext i8 %514 to i16
  %517 = or i16 %515, %516
  %518 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %519 = zext i8 %518 to i32
  %520 = sub nsw i32 8, %519
  %521 = zext i16 %517 to i32
  %522 = shl nuw nsw i32 %521, %520
  br label %526

523:                                              ; preds = %481
  %524 = add i8 %478, -8
  %525 = shl nuw nsw i32 %484, 8
  br label %526

526:                                              ; preds = %523, %513
  %527 = phi i32 [ %522, %513 ], [ %525, %523 ]
  %528 = phi i8 [ %518, %513 ], [ %524, %523 ]
  %529 = trunc i32 %527 to i16
  store i16 %529, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %528, ptr @gBitsLeft, align 1, !tbaa !10
  %530 = lshr i32 %484, 8
  %531 = trunc nuw nsw i32 %530 to i16
  %532 = or disjoint i16 %482, %531
  br label %533

533:                                              ; preds = %526, %476
  %534 = phi i8 [ %528, %526 ], [ %478, %476 ]
  %535 = phi i16 [ %529, %526 ], [ %479, %476 ]
  %536 = phi i16 [ %532, %526 ], [ %480, %476 ]
  %537 = getelementptr inbounds nuw i16, ptr %428, i32 %432
  store i16 %536, ptr %537, align 2, !tbaa !11
  %538 = add nuw nsw i32 %432, 1
  %539 = icmp eq i32 %538, 64
  br i1 %539, label %540, label %429, !llvm.loop !76

540:                                              ; preds = %533, %540
  %541 = phi i32 [ %552, %540 ], [ 0, %533 ]
  %542 = getelementptr inbounds nuw i16, ptr %428, i32 %541
  %543 = load <2 x i16>, ptr %542, align 2, !tbaa !11
  %544 = sext <2 x i16> %543 to <2 x i32>
  %545 = getelementptr inbounds nuw i8, ptr @gWinogradQuant, i32 %541
  %546 = load <2 x i8>, ptr %545, align 1, !tbaa !10
  %547 = zext <2 x i8> %546 to <2 x i32>
  %548 = mul nsw <2 x i32> %547, %544
  %549 = add nsw <2 x i32> %548, splat (i32 4)
  %550 = lshr <2 x i32> %549, splat (i32 3)
  %551 = trunc <2 x i32> %550 to <2 x i16>
  store <2 x i16> %551, ptr %542, align 2, !tbaa !11
  %552 = add nuw i32 %541, 2
  %553 = icmp eq i32 %552, 64
  br i1 %553, label %554, label %540, !llvm.loop !77

554:                                              ; preds = %540
  %555 = select i1 %427, i32 65, i32 129
  %556 = zext i16 %370 to i32
  %557 = icmp samesign ugt i32 %555, %556
  br i1 %557, label %569, label %363

558:                                              ; preds = %106
  %559 = tail call fastcc zeroext i16 @getBits(i8 noundef zeroext 16, i8 noundef zeroext 0) #7
  %560 = icmp eq i16 %559, 4
  br i1 %560, label %561, label %569

561:                                              ; preds = %558
  %562 = tail call fastcc zeroext i16 @getBits(i8 noundef zeroext 16, i8 noundef zeroext 0) #7
  store i16 %562, ptr @gRestartInterval, align 2, !tbaa !11
  br label %569

563:                                              ; preds = %106
  %564 = tail call fastcc zeroext i16 @getBits(i8 noundef zeroext 16, i8 noundef zeroext 0) #7
  %565 = icmp ult i16 %564, 2
  br i1 %565, label %569, label %566

566:                                              ; preds = %563
  %567 = add i16 %564, -2
  %568 = icmp eq i16 %567, 0
  br i1 %568, label %569, label %570

569:                                              ; preds = %363, %414, %554, %620, %566, %563, %561, %558, %357, %354, %353
  br label %3

570:                                              ; preds = %566
  %571 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %572 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  br label %573

573:                                              ; preds = %620, %570
  %574 = phi i8 [ %622, %620 ], [ %572, %570 ]
  %575 = phi i16 [ %623, %620 ], [ %571, %570 ]
  %576 = phi i16 [ %624, %620 ], [ %567, %570 ]
  %577 = icmp ult i8 %574, 8
  %578 = zext i16 %575 to i32
  br i1 %577, label %579, label %617

579:                                              ; preds = %573
  %580 = zext nneg i8 %574 to i32
  %581 = shl nuw nsw i32 %578, %580
  %582 = trunc i32 %581 to i16
  store i16 %582, ptr @gBitBuf, align 2, !tbaa !11
  %583 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %584 = icmp eq i8 %583, 0
  br i1 %584, label %585, label %594

585:                                              ; preds = %579
  store i8 4, ptr @gInBufOfs, align 1, !tbaa !10
  %586 = load ptr, ptr @g_pNeedBytesCallback, align 4, !tbaa !13
  %587 = load ptr, ptr @g_pCallback_data, align 4, !tbaa !13
  %588 = tail call zeroext i8 %586(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @gInBuf, i32 4), i8 noundef zeroext -4, ptr noundef nonnull @gInBufLeft, ptr noundef %587) #6
  %589 = icmp eq i8 %588, 0
  br i1 %589, label %591, label %590

590:                                              ; preds = %585
  store i8 %588, ptr @gCallbackStatus, align 1, !tbaa !10
  br label %591

591:                                              ; preds = %590, %585
  %592 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  %593 = icmp eq i8 %592, 0
  br i1 %593, label %602, label %594

594:                                              ; preds = %591, %579
  %595 = phi i8 [ %592, %591 ], [ %583, %579 ]
  %596 = add i8 %595, -1
  store i8 %596, ptr @gInBufLeft, align 1, !tbaa !10
  %597 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %598 = add i8 %597, 1
  store i8 %598, ptr @gInBufOfs, align 1, !tbaa !10
  %599 = zext i8 %597 to i32
  %600 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %599
  %601 = load i8, ptr %600, align 1, !tbaa !10
  br label %607

602:                                              ; preds = %591
  %603 = load i8, ptr @gTemFlag, align 1, !tbaa !10
  %604 = xor i8 %603, -1
  store i8 %604, ptr @gTemFlag, align 1, !tbaa !10
  %605 = icmp eq i8 %603, -1
  %606 = select i1 %605, i8 -39, i8 -1
  br label %607

607:                                              ; preds = %602, %594
  %608 = phi i8 [ %606, %602 ], [ %601, %594 ]
  %609 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %610 = zext i8 %608 to i16
  %611 = or i16 %609, %610
  %612 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %613 = zext i8 %612 to i32
  %614 = sub nsw i32 8, %613
  %615 = zext i16 %611 to i32
  %616 = shl nuw nsw i32 %615, %614
  br label %620

617:                                              ; preds = %573
  %618 = add i8 %574, -8
  %619 = shl nuw nsw i32 %578, 8
  br label %620

620:                                              ; preds = %617, %607
  %621 = phi i32 [ %616, %607 ], [ %619, %617 ]
  %622 = phi i8 [ %612, %607 ], [ %618, %617 ]
  %623 = trunc i32 %621 to i16
  store i16 %623, ptr @gBitBuf, align 2, !tbaa !11
  store i8 %622, ptr @gBitsLeft, align 1, !tbaa !10
  %624 = add i16 %576, -1
  %625 = icmp eq i16 %624, 0
  br i1 %625, label %569, label %573, !llvm.loop !78

626:                                              ; preds = %106
  br label %627

627:                                              ; preds = %106, %106, %106, %106, %106, %106, %106, %106, %106, %106, %626, %112
  %628 = phi i8 [ 17, %626 ], [ 0, %112 ], [ 18, %106 ], [ 18, %106 ], [ 18, %106 ], [ 18, %106 ], [ 18, %106 ], [ 18, %106 ], [ 18, %106 ], [ 18, %106 ], [ 18, %106 ], [ 18, %106 ]
  ret i8 %628
}

; Function Attrs: nounwind
define internal fastcc void @fixInBuffer() unnamed_addr #0 {
  %1 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %2 = icmp eq i8 %1, 0
  %3 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %4 = load i8, ptr @gInBufOfs, align 1, !tbaa !10
  %5 = load i8, ptr @gInBufLeft, align 1, !tbaa !10
  br i1 %2, label %12, label %6

6:                                                ; preds = %0
  %7 = trunc i16 %3 to i8
  %8 = add i8 %4, -1
  %9 = zext i8 %8 to i32
  %10 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %9
  store i8 %7, ptr %10, align 1, !tbaa !10
  %11 = add i8 %5, 1
  br label %12

12:                                               ; preds = %6, %0
  %13 = phi i8 [ %11, %6 ], [ %5, %0 ]
  %14 = phi i8 [ %8, %6 ], [ %4, %0 ]
  %15 = lshr i16 %3, 8
  %16 = trunc nuw i16 %15 to i8
  %17 = add i8 %14, -1
  store i8 %17, ptr @gInBufOfs, align 1, !tbaa !10
  %18 = zext i8 %17 to i32
  %19 = getelementptr inbounds nuw i8, ptr @gInBuf, i32 %18
  store i8 %16, ptr %19, align 1, !tbaa !10
  %20 = add i8 %13, 1
  store i8 %20, ptr @gInBufLeft, align 1, !tbaa !10
  %21 = shl i16 %3, 8
  store i8 0, ptr @gBitsLeft, align 1, !tbaa !10
  store i16 %21, ptr @gBitBuf, align 2, !tbaa !11
  %22 = tail call fastcc zeroext i8 @getOctet(i8 noundef zeroext 1) #7
  %23 = load i16, ptr @gBitBuf, align 2, !tbaa !11
  %24 = zext i8 %22 to i16
  %25 = or i16 %23, %24
  %26 = load i8, ptr @gBitsLeft, align 1, !tbaa !10
  %27 = zext i8 %26 to i32
  %28 = sub nsw i32 8, %27
  %29 = zext i16 %25 to i32
  %30 = shl nuw nsw i32 %29, %28
  %31 = trunc i32 %30 to i16
  store i16 %31, ptr @gBitBuf, align 2, !tbaa !11
  ret void
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.fshl.i16(i16, i16, i16) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.or.v4i16(<4 x i16>) #5

attributes #0 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nobuiltin nounwind "no-builtins" }
attributes #7 = { nobuiltin "no-builtins" }
attributes #8 = { nounwind }

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
!11 = !{!12, !12, i64 0}
!12 = !{!"short", !8, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"any pointer", !8, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
!18 = distinct !{!18, !16}
!19 = distinct !{!19, !16}
!20 = distinct !{!20, !16}
!21 = distinct !{!21, !16, !22, !23}
!22 = !{!"llvm.loop.isvectorized", i32 1}
!23 = !{!"llvm.loop.unroll.runtime.disable"}
!24 = distinct !{!24, !16, !22, !23}
!25 = distinct !{!25, !16, !23, !22}
!26 = distinct !{!26, !16}
!27 = distinct !{!27, !16, !22, !23}
!28 = distinct !{!28, !16, !22, !23}
!29 = distinct !{!29, !16, !22, !23}
!30 = distinct !{!30, !16, !22, !23}
!31 = distinct !{!31, !16, !22, !23}
!32 = distinct !{!32, !16, !22, !23}
!33 = distinct !{!33, !16}
!34 = distinct !{!34, !16}
!35 = distinct !{!35, !16}
!36 = distinct !{!36, !16}
!37 = distinct !{!37, !16, !22, !23}
!38 = distinct !{!38, !16, !22, !23}
!39 = distinct !{!39, !16}
!40 = distinct !{!40, !16}
!41 = distinct !{!41, !16}
!42 = distinct !{!42, !16}
!43 = distinct !{!43, !16, !22, !23}
!44 = distinct !{!44, !16, !22, !23}
!45 = distinct !{!45, !16, !22, !23}
!46 = distinct !{!46, !16, !22, !23}
!47 = distinct !{!47, !16}
!48 = !{!49, !7, i64 0}
!49 = !{!"", !7, i64 0, !7, i64 4, !7, i64 8, !7, i64 12, !7, i64 16, !7, i64 20, !7, i64 24, !7, i64 28, !50, i64 32, !50, i64 36, !50, i64 40}
!50 = !{!"p1 omnipotent char", !14, i64 0}
!51 = !{!49, !7, i64 4}
!52 = !{!49, !7, i64 8}
!53 = !{!49, !7, i64 12}
!54 = !{!49, !7, i64 16}
!55 = !{!49, !7, i64 20}
!56 = !{!49, !7, i64 24}
!57 = !{!49, !7, i64 28}
!58 = !{!49, !50, i64 32}
!59 = !{!49, !50, i64 36}
!60 = !{!49, !50, i64 40}
!61 = distinct !{!61, !16}
!62 = distinct !{!62, !16}
!63 = distinct !{!63, !16}
!64 = distinct !{!64, !16}
!65 = distinct !{!65, !16}
!66 = distinct !{!66, !16}
!67 = distinct !{!67, !16}
!68 = distinct !{!68, !16}
!69 = distinct !{!69, !16}
!70 = distinct !{!70, !16}
!71 = distinct !{!71, !16}
!72 = distinct !{!72, !16}
!73 = distinct !{!73, !16}
!74 = distinct !{!74, !16}
!75 = distinct !{!75, !16}
!76 = distinct !{!76, !16}
!77 = distinct !{!77, !16, !22, !23}
!78 = distinct !{!78, !16}
