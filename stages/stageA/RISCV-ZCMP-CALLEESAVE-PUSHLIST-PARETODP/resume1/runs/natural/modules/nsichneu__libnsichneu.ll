; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1\resources\corpus\embench\src\nsichneu\libnsichneu.c'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\\resume1\\resources\\corpus\\embench\\src\\nsichneu\\libnsichneu.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

@P1_is_marked = dso_local global i32 3, align 4
@P2_is_marked = dso_local global i32 5, align 4
@P3_is_marked = dso_local global i32 0, align 4
@P1_marking_member_0 = dso_local global [3 x i32] zeroinitializer, align 4
@P2_marking_member_0 = dso_local global [5 x i32] zeroinitializer, align 4
@P3_marking_member_0 = dso_local global [6 x i32] zeroinitializer, align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local void @initialise_benchmark() local_unnamed_addr #0 {
  ret void
}

; Function Attrs: nofree norecurse nounwind memory(readwrite, target_mem0: none, target_mem1: none)
define dso_local void @warm_caches(i32 noundef %0) local_unnamed_addr #1 {
  tail call fastcc void @benchmark_body(i32 noundef %0) #5
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind memory(readwrite, argmem: none, target_mem0: none, target_mem1: none)
define internal fastcc void @benchmark_body(i32 noundef %0) unnamed_addr #2 {
  %2 = icmp sgt i32 %0, 0
  br i1 %2, label %3, label %4087

3:                                                ; preds = %1, %4084
  %4 = phi i32 [ %4085, %4084 ], [ 0, %1 ]
  store volatile i32 3, ptr @P1_is_marked, align 4, !tbaa !6
  store volatile i32 5, ptr @P2_is_marked, align 4, !tbaa !6
  store volatile i32 0, ptr @P3_is_marked, align 4, !tbaa !6
  %5 = load volatile i32, ptr @P1_is_marked, align 4, !tbaa !6
  %6 = icmp sgt i32 %5, 2
  br i1 %6, label %7, label %32

7:                                                ; preds = %3
  %8 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %9 = icmp slt i32 %8, 4
  br i1 %9, label %10, label %32

10:                                               ; preds = %7
  %11 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 4), align 4, !tbaa !10
  %12 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 8), align 4, !tbaa !10
  %13 = icmp eq i32 %11, %12
  br i1 %13, label %14, label %32

14:                                               ; preds = %10
  %15 = load volatile i32, ptr @P1_marking_member_0, align 4, !tbaa !10
  %16 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 4), align 4, !tbaa !10
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %32

18:                                               ; preds = %14
  %19 = load volatile i32, ptr @P1_is_marked, align 4, !tbaa !6
  %20 = add nsw i32 %19, -3
  store volatile i32 %20, ptr @P1_is_marked, align 4, !tbaa !6
  %21 = sub nsw i32 %15, %16
  %22 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %23 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %22
  store volatile i32 %15, ptr %23, align 4, !tbaa !10
  %24 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %25 = getelementptr i32, ptr @P3_marking_member_0, i32 %24
  %26 = getelementptr i8, ptr %25, i32 4
  store volatile i32 %16, ptr %26, align 4, !tbaa !10
  %27 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %28 = getelementptr i32, ptr @P3_marking_member_0, i32 %27
  %29 = getelementptr i8, ptr %28, i32 8
  store volatile i32 %21, ptr %29, align 4, !tbaa !10
  %30 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %31 = add nsw i32 %30, 3
  store volatile i32 %31, ptr @P3_is_marked, align 4, !tbaa !6
  br label %32

32:                                               ; preds = %14, %18, %10, %7, %3
  %33 = load volatile i32, ptr @P1_is_marked, align 4, !tbaa !6
  %34 = icmp sgt i32 %33, 2
  br i1 %34, label %35, label %60

35:                                               ; preds = %32
  %36 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %37 = icmp slt i32 %36, 4
  br i1 %37, label %38, label %60

38:                                               ; preds = %35
  %39 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 8), align 4, !tbaa !10
  %40 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 4), align 4, !tbaa !10
  %41 = icmp eq i32 %39, %40
  br i1 %41, label %42, label %60

42:                                               ; preds = %38
  %43 = load volatile i32, ptr @P1_marking_member_0, align 4, !tbaa !10
  %44 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 8), align 4, !tbaa !10
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %46, label %60

46:                                               ; preds = %42
  %47 = load volatile i32, ptr @P1_is_marked, align 4, !tbaa !6
  %48 = add nsw i32 %47, -3
  store volatile i32 %48, ptr @P1_is_marked, align 4, !tbaa !6
  %49 = sub nsw i32 %43, %44
  %50 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %51 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %50
  store volatile i32 %43, ptr %51, align 4, !tbaa !10
  %52 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %53 = getelementptr i32, ptr @P3_marking_member_0, i32 %52
  %54 = getelementptr i8, ptr %53, i32 4
  store volatile i32 %44, ptr %54, align 4, !tbaa !10
  %55 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %56 = getelementptr i32, ptr @P3_marking_member_0, i32 %55
  %57 = getelementptr i8, ptr %56, i32 8
  store volatile i32 %49, ptr %57, align 4, !tbaa !10
  %58 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %59 = add nsw i32 %58, 3
  store volatile i32 %59, ptr @P3_is_marked, align 4, !tbaa !6
  br label %60

60:                                               ; preds = %42, %46, %38, %35, %32
  %61 = load volatile i32, ptr @P1_is_marked, align 4, !tbaa !6
  %62 = icmp sgt i32 %61, 2
  br i1 %62, label %63, label %88

63:                                               ; preds = %60
  %64 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %65 = icmp slt i32 %64, 4
  br i1 %65, label %66, label %88

66:                                               ; preds = %63
  %67 = load volatile i32, ptr @P1_marking_member_0, align 4, !tbaa !10
  %68 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 8), align 4, !tbaa !10
  %69 = icmp eq i32 %67, %68
  br i1 %69, label %70, label %88

70:                                               ; preds = %66
  %71 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 4), align 4, !tbaa !10
  %72 = load volatile i32, ptr @P1_marking_member_0, align 4, !tbaa !10
  %73 = icmp slt i32 %71, %72
  br i1 %73, label %74, label %88

74:                                               ; preds = %70
  %75 = load volatile i32, ptr @P1_is_marked, align 4, !tbaa !6
  %76 = add nsw i32 %75, -3
  store volatile i32 %76, ptr @P1_is_marked, align 4, !tbaa !6
  %77 = sub nsw i32 %71, %72
  %78 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %79 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %78
  store volatile i32 %71, ptr %79, align 4, !tbaa !10
  %80 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %81 = getelementptr i32, ptr @P3_marking_member_0, i32 %80
  %82 = getelementptr i8, ptr %81, i32 4
  store volatile i32 %72, ptr %82, align 4, !tbaa !10
  %83 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %84 = getelementptr i32, ptr @P3_marking_member_0, i32 %83
  %85 = getelementptr i8, ptr %84, i32 8
  store volatile i32 %77, ptr %85, align 4, !tbaa !10
  %86 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %87 = add nsw i32 %86, 3
  store volatile i32 %87, ptr @P3_is_marked, align 4, !tbaa !6
  br label %88

88:                                               ; preds = %70, %74, %66, %63, %60
  %89 = load volatile i32, ptr @P1_is_marked, align 4, !tbaa !6
  %90 = icmp sgt i32 %89, 2
  br i1 %90, label %91, label %116

91:                                               ; preds = %88
  %92 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %93 = icmp slt i32 %92, 4
  br i1 %93, label %94, label %116

94:                                               ; preds = %91
  %95 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 8), align 4, !tbaa !10
  %96 = load volatile i32, ptr @P1_marking_member_0, align 4, !tbaa !10
  %97 = icmp eq i32 %95, %96
  br i1 %97, label %98, label %116

98:                                               ; preds = %94
  %99 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 4), align 4, !tbaa !10
  %100 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 8), align 4, !tbaa !10
  %101 = icmp slt i32 %99, %100
  br i1 %101, label %102, label %116

102:                                              ; preds = %98
  %103 = load volatile i32, ptr @P1_is_marked, align 4, !tbaa !6
  %104 = add nsw i32 %103, -3
  store volatile i32 %104, ptr @P1_is_marked, align 4, !tbaa !6
  %105 = sub nsw i32 %99, %100
  %106 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %107 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %106
  store volatile i32 %99, ptr %107, align 4, !tbaa !10
  %108 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %109 = getelementptr i32, ptr @P3_marking_member_0, i32 %108
  %110 = getelementptr i8, ptr %109, i32 4
  store volatile i32 %100, ptr %110, align 4, !tbaa !10
  %111 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %112 = getelementptr i32, ptr @P3_marking_member_0, i32 %111
  %113 = getelementptr i8, ptr %112, i32 8
  store volatile i32 %105, ptr %113, align 4, !tbaa !10
  %114 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %115 = add nsw i32 %114, 3
  store volatile i32 %115, ptr @P3_is_marked, align 4, !tbaa !6
  br label %116

116:                                              ; preds = %98, %102, %94, %91, %88
  %117 = load volatile i32, ptr @P1_is_marked, align 4, !tbaa !6
  %118 = icmp sgt i32 %117, 2
  br i1 %118, label %119, label %144

119:                                              ; preds = %116
  %120 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %121 = icmp slt i32 %120, 4
  br i1 %121, label %122, label %144

122:                                              ; preds = %119
  %123 = load volatile i32, ptr @P1_marking_member_0, align 4, !tbaa !10
  %124 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 4), align 4, !tbaa !10
  %125 = icmp eq i32 %123, %124
  br i1 %125, label %126, label %144

126:                                              ; preds = %122
  %127 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 8), align 4, !tbaa !10
  %128 = load volatile i32, ptr @P1_marking_member_0, align 4, !tbaa !10
  %129 = icmp slt i32 %127, %128
  br i1 %129, label %130, label %144

130:                                              ; preds = %126
  %131 = load volatile i32, ptr @P1_is_marked, align 4, !tbaa !6
  %132 = add nsw i32 %131, -3
  store volatile i32 %132, ptr @P1_is_marked, align 4, !tbaa !6
  %133 = sub nsw i32 %127, %128
  %134 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %135 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %134
  store volatile i32 %127, ptr %135, align 4, !tbaa !10
  %136 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %137 = getelementptr i32, ptr @P3_marking_member_0, i32 %136
  %138 = getelementptr i8, ptr %137, i32 4
  store volatile i32 %128, ptr %138, align 4, !tbaa !10
  %139 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %140 = getelementptr i32, ptr @P3_marking_member_0, i32 %139
  %141 = getelementptr i8, ptr %140, i32 8
  store volatile i32 %133, ptr %141, align 4, !tbaa !10
  %142 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %143 = add nsw i32 %142, 3
  store volatile i32 %143, ptr @P3_is_marked, align 4, !tbaa !6
  br label %144

144:                                              ; preds = %126, %130, %122, %119, %116
  %145 = load volatile i32, ptr @P1_is_marked, align 4, !tbaa !6
  %146 = icmp sgt i32 %145, 2
  br i1 %146, label %147, label %172

147:                                              ; preds = %144
  %148 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %149 = icmp slt i32 %148, 4
  br i1 %149, label %150, label %172

150:                                              ; preds = %147
  %151 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 4), align 4, !tbaa !10
  %152 = load volatile i32, ptr @P1_marking_member_0, align 4, !tbaa !10
  %153 = icmp eq i32 %151, %152
  br i1 %153, label %154, label %172

154:                                              ; preds = %150
  %155 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 8), align 4, !tbaa !10
  %156 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 4), align 4, !tbaa !10
  %157 = icmp slt i32 %155, %156
  br i1 %157, label %158, label %172

158:                                              ; preds = %154
  %159 = load volatile i32, ptr @P1_is_marked, align 4, !tbaa !6
  %160 = add nsw i32 %159, -3
  store volatile i32 %160, ptr @P1_is_marked, align 4, !tbaa !6
  %161 = sub nsw i32 %155, %156
  %162 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %163 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %162
  store volatile i32 %155, ptr %163, align 4, !tbaa !10
  %164 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %165 = getelementptr i32, ptr @P3_marking_member_0, i32 %164
  %166 = getelementptr i8, ptr %165, i32 4
  store volatile i32 %156, ptr %166, align 4, !tbaa !10
  %167 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %168 = getelementptr i32, ptr @P3_marking_member_0, i32 %167
  %169 = getelementptr i8, ptr %168, i32 8
  store volatile i32 %161, ptr %169, align 4, !tbaa !10
  %170 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %171 = add nsw i32 %170, 3
  store volatile i32 %171, ptr @P3_is_marked, align 4, !tbaa !6
  br label %172

172:                                              ; preds = %154, %158, %150, %147, %144
  %173 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %174 = icmp sgt i32 %173, 3
  br i1 %174, label %175, label %204

175:                                              ; preds = %172
  %176 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %177 = icmp slt i32 %176, 4
  br i1 %177, label %178, label %204

178:                                              ; preds = %175
  %179 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %180 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %181 = icmp eq i32 %179, %180
  br i1 %181, label %182, label %204

182:                                              ; preds = %178
  %183 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %184 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %185 = icmp eq i32 %183, %184
  br i1 %185, label %186, label %204

186:                                              ; preds = %182
  %187 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %188 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %189 = icmp sgt i32 %188, %187
  br i1 %189, label %190, label %204

190:                                              ; preds = %186
  %191 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %192 = add nsw i32 %191, -4
  store volatile i32 %192, ptr @P2_is_marked, align 4, !tbaa !6
  %193 = add nsw i32 %188, %187
  %194 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %195 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %194
  store volatile i32 %187, ptr %195, align 4, !tbaa !10
  %196 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %197 = getelementptr i32, ptr @P3_marking_member_0, i32 %196
  %198 = getelementptr i8, ptr %197, i32 4
  store volatile i32 %188, ptr %198, align 4, !tbaa !10
  %199 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %200 = getelementptr i32, ptr @P3_marking_member_0, i32 %199
  %201 = getelementptr i8, ptr %200, i32 8
  store volatile i32 %193, ptr %201, align 4, !tbaa !10
  %202 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %203 = add nsw i32 %202, 3
  store volatile i32 %203, ptr @P3_is_marked, align 4, !tbaa !6
  br label %204

204:                                              ; preds = %186, %190, %182, %178, %175, %172
  %205 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %206 = icmp sgt i32 %205, 3
  br i1 %206, label %207, label %236

207:                                              ; preds = %204
  %208 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %209 = icmp slt i32 %208, 4
  br i1 %209, label %210, label %236

210:                                              ; preds = %207
  %211 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %212 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %213 = icmp eq i32 %211, %212
  br i1 %213, label %214, label %236

214:                                              ; preds = %210
  %215 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %216 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %217 = icmp eq i32 %215, %216
  br i1 %217, label %218, label %236

218:                                              ; preds = %214
  %219 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %220 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %221 = icmp sgt i32 %220, %219
  br i1 %221, label %222, label %236

222:                                              ; preds = %218
  %223 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %224 = add nsw i32 %223, -4
  store volatile i32 %224, ptr @P2_is_marked, align 4, !tbaa !6
  %225 = add nsw i32 %220, %219
  %226 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %227 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %226
  store volatile i32 %219, ptr %227, align 4, !tbaa !10
  %228 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %229 = getelementptr i32, ptr @P3_marking_member_0, i32 %228
  %230 = getelementptr i8, ptr %229, i32 4
  store volatile i32 %220, ptr %230, align 4, !tbaa !10
  %231 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %232 = getelementptr i32, ptr @P3_marking_member_0, i32 %231
  %233 = getelementptr i8, ptr %232, i32 8
  store volatile i32 %225, ptr %233, align 4, !tbaa !10
  %234 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %235 = add nsw i32 %234, 3
  store volatile i32 %235, ptr @P3_is_marked, align 4, !tbaa !6
  br label %236

236:                                              ; preds = %218, %222, %214, %210, %207, %204
  %237 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %238 = icmp sgt i32 %237, 3
  br i1 %238, label %239, label %268

239:                                              ; preds = %236
  %240 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %241 = icmp slt i32 %240, 4
  br i1 %241, label %242, label %268

242:                                              ; preds = %239
  %243 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %244 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %245 = icmp eq i32 %243, %244
  br i1 %245, label %246, label %268

246:                                              ; preds = %242
  %247 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %248 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %249 = icmp eq i32 %247, %248
  br i1 %249, label %250, label %268

250:                                              ; preds = %246
  %251 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %252 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %253 = icmp sgt i32 %252, %251
  br i1 %253, label %254, label %268

254:                                              ; preds = %250
  %255 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %256 = add nsw i32 %255, -4
  store volatile i32 %256, ptr @P2_is_marked, align 4, !tbaa !6
  %257 = add nsw i32 %252, %251
  %258 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %259 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %258
  store volatile i32 %251, ptr %259, align 4, !tbaa !10
  %260 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %261 = getelementptr i32, ptr @P3_marking_member_0, i32 %260
  %262 = getelementptr i8, ptr %261, i32 4
  store volatile i32 %252, ptr %262, align 4, !tbaa !10
  %263 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %264 = getelementptr i32, ptr @P3_marking_member_0, i32 %263
  %265 = getelementptr i8, ptr %264, i32 8
  store volatile i32 %257, ptr %265, align 4, !tbaa !10
  %266 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %267 = add nsw i32 %266, 3
  store volatile i32 %267, ptr @P3_is_marked, align 4, !tbaa !6
  br label %268

268:                                              ; preds = %250, %254, %246, %242, %239, %236
  %269 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %270 = icmp sgt i32 %269, 3
  br i1 %270, label %271, label %300

271:                                              ; preds = %268
  %272 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %273 = icmp slt i32 %272, 4
  br i1 %273, label %274, label %300

274:                                              ; preds = %271
  %275 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %276 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %277 = icmp eq i32 %275, %276
  br i1 %277, label %278, label %300

278:                                              ; preds = %274
  %279 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %280 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %281 = icmp eq i32 %279, %280
  br i1 %281, label %282, label %300

282:                                              ; preds = %278
  %283 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %284 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %285 = icmp sgt i32 %284, %283
  br i1 %285, label %286, label %300

286:                                              ; preds = %282
  %287 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %288 = add nsw i32 %287, -4
  store volatile i32 %288, ptr @P2_is_marked, align 4, !tbaa !6
  %289 = add nsw i32 %284, %283
  %290 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %291 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %290
  store volatile i32 %283, ptr %291, align 4, !tbaa !10
  %292 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %293 = getelementptr i32, ptr @P3_marking_member_0, i32 %292
  %294 = getelementptr i8, ptr %293, i32 4
  store volatile i32 %284, ptr %294, align 4, !tbaa !10
  %295 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %296 = getelementptr i32, ptr @P3_marking_member_0, i32 %295
  %297 = getelementptr i8, ptr %296, i32 8
  store volatile i32 %289, ptr %297, align 4, !tbaa !10
  %298 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %299 = add nsw i32 %298, 3
  store volatile i32 %299, ptr @P3_is_marked, align 4, !tbaa !6
  br label %300

300:                                              ; preds = %282, %286, %278, %274, %271, %268
  %301 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %302 = icmp sgt i32 %301, 3
  br i1 %302, label %303, label %332

303:                                              ; preds = %300
  %304 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %305 = icmp slt i32 %304, 4
  br i1 %305, label %306, label %332

306:                                              ; preds = %303
  %307 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %308 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %309 = icmp eq i32 %307, %308
  br i1 %309, label %310, label %332

310:                                              ; preds = %306
  %311 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %312 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %313 = icmp eq i32 %311, %312
  br i1 %313, label %314, label %332

314:                                              ; preds = %310
  %315 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %316 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %317 = icmp sgt i32 %316, %315
  br i1 %317, label %318, label %332

318:                                              ; preds = %314
  %319 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %320 = add nsw i32 %319, -4
  store volatile i32 %320, ptr @P2_is_marked, align 4, !tbaa !6
  %321 = add nsw i32 %316, %315
  %322 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %323 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %322
  store volatile i32 %315, ptr %323, align 4, !tbaa !10
  %324 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %325 = getelementptr i32, ptr @P3_marking_member_0, i32 %324
  %326 = getelementptr i8, ptr %325, i32 4
  store volatile i32 %316, ptr %326, align 4, !tbaa !10
  %327 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %328 = getelementptr i32, ptr @P3_marking_member_0, i32 %327
  %329 = getelementptr i8, ptr %328, i32 8
  store volatile i32 %321, ptr %329, align 4, !tbaa !10
  %330 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %331 = add nsw i32 %330, 3
  store volatile i32 %331, ptr @P3_is_marked, align 4, !tbaa !6
  br label %332

332:                                              ; preds = %314, %318, %310, %306, %303, %300
  %333 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %334 = icmp sgt i32 %333, 3
  br i1 %334, label %335, label %364

335:                                              ; preds = %332
  %336 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %337 = icmp slt i32 %336, 4
  br i1 %337, label %338, label %364

338:                                              ; preds = %335
  %339 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %340 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %341 = icmp eq i32 %339, %340
  br i1 %341, label %342, label %364

342:                                              ; preds = %338
  %343 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %344 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %345 = icmp eq i32 %343, %344
  br i1 %345, label %346, label %364

346:                                              ; preds = %342
  %347 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %348 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %349 = icmp sgt i32 %348, %347
  br i1 %349, label %350, label %364

350:                                              ; preds = %346
  %351 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %352 = add nsw i32 %351, -4
  store volatile i32 %352, ptr @P2_is_marked, align 4, !tbaa !6
  %353 = add nsw i32 %348, %347
  %354 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %355 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %354
  store volatile i32 %347, ptr %355, align 4, !tbaa !10
  %356 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %357 = getelementptr i32, ptr @P3_marking_member_0, i32 %356
  %358 = getelementptr i8, ptr %357, i32 4
  store volatile i32 %348, ptr %358, align 4, !tbaa !10
  %359 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %360 = getelementptr i32, ptr @P3_marking_member_0, i32 %359
  %361 = getelementptr i8, ptr %360, i32 8
  store volatile i32 %353, ptr %361, align 4, !tbaa !10
  %362 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %363 = add nsw i32 %362, 3
  store volatile i32 %363, ptr @P3_is_marked, align 4, !tbaa !6
  br label %364

364:                                              ; preds = %346, %350, %342, %338, %335, %332
  %365 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %366 = icmp sgt i32 %365, 3
  br i1 %366, label %367, label %396

367:                                              ; preds = %364
  %368 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %369 = icmp slt i32 %368, 4
  br i1 %369, label %370, label %396

370:                                              ; preds = %367
  %371 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %372 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %373 = icmp eq i32 %371, %372
  br i1 %373, label %374, label %396

374:                                              ; preds = %370
  %375 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %376 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %377 = icmp eq i32 %375, %376
  br i1 %377, label %378, label %396

378:                                              ; preds = %374
  %379 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %380 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %381 = icmp sgt i32 %380, %379
  br i1 %381, label %382, label %396

382:                                              ; preds = %378
  %383 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %384 = add nsw i32 %383, -4
  store volatile i32 %384, ptr @P2_is_marked, align 4, !tbaa !6
  %385 = add nsw i32 %380, %379
  %386 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %387 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %386
  store volatile i32 %379, ptr %387, align 4, !tbaa !10
  %388 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %389 = getelementptr i32, ptr @P3_marking_member_0, i32 %388
  %390 = getelementptr i8, ptr %389, i32 4
  store volatile i32 %380, ptr %390, align 4, !tbaa !10
  %391 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %392 = getelementptr i32, ptr @P3_marking_member_0, i32 %391
  %393 = getelementptr i8, ptr %392, i32 8
  store volatile i32 %385, ptr %393, align 4, !tbaa !10
  %394 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %395 = add nsw i32 %394, 3
  store volatile i32 %395, ptr @P3_is_marked, align 4, !tbaa !6
  br label %396

396:                                              ; preds = %378, %382, %374, %370, %367, %364
  %397 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %398 = icmp sgt i32 %397, 3
  br i1 %398, label %399, label %428

399:                                              ; preds = %396
  %400 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %401 = icmp slt i32 %400, 4
  br i1 %401, label %402, label %428

402:                                              ; preds = %399
  %403 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %404 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %405 = icmp eq i32 %403, %404
  br i1 %405, label %406, label %428

406:                                              ; preds = %402
  %407 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %408 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %409 = icmp eq i32 %407, %408
  br i1 %409, label %410, label %428

410:                                              ; preds = %406
  %411 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %412 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %413 = icmp sgt i32 %412, %411
  br i1 %413, label %414, label %428

414:                                              ; preds = %410
  %415 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %416 = add nsw i32 %415, -4
  store volatile i32 %416, ptr @P2_is_marked, align 4, !tbaa !6
  %417 = add nsw i32 %412, %411
  %418 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %419 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %418
  store volatile i32 %411, ptr %419, align 4, !tbaa !10
  %420 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %421 = getelementptr i32, ptr @P3_marking_member_0, i32 %420
  %422 = getelementptr i8, ptr %421, i32 4
  store volatile i32 %412, ptr %422, align 4, !tbaa !10
  %423 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %424 = getelementptr i32, ptr @P3_marking_member_0, i32 %423
  %425 = getelementptr i8, ptr %424, i32 8
  store volatile i32 %417, ptr %425, align 4, !tbaa !10
  %426 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %427 = add nsw i32 %426, 3
  store volatile i32 %427, ptr @P3_is_marked, align 4, !tbaa !6
  br label %428

428:                                              ; preds = %410, %414, %406, %402, %399, %396
  %429 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %430 = icmp sgt i32 %429, 3
  br i1 %430, label %431, label %460

431:                                              ; preds = %428
  %432 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %433 = icmp slt i32 %432, 4
  br i1 %433, label %434, label %460

434:                                              ; preds = %431
  %435 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %436 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %437 = icmp eq i32 %435, %436
  br i1 %437, label %438, label %460

438:                                              ; preds = %434
  %439 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %440 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %441 = icmp eq i32 %439, %440
  br i1 %441, label %442, label %460

442:                                              ; preds = %438
  %443 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %444 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %445 = icmp sgt i32 %444, %443
  br i1 %445, label %446, label %460

446:                                              ; preds = %442
  %447 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %448 = add nsw i32 %447, -4
  store volatile i32 %448, ptr @P2_is_marked, align 4, !tbaa !6
  %449 = add nsw i32 %444, %443
  %450 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %451 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %450
  store volatile i32 %443, ptr %451, align 4, !tbaa !10
  %452 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %453 = getelementptr i32, ptr @P3_marking_member_0, i32 %452
  %454 = getelementptr i8, ptr %453, i32 4
  store volatile i32 %444, ptr %454, align 4, !tbaa !10
  %455 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %456 = getelementptr i32, ptr @P3_marking_member_0, i32 %455
  %457 = getelementptr i8, ptr %456, i32 8
  store volatile i32 %449, ptr %457, align 4, !tbaa !10
  %458 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %459 = add nsw i32 %458, 3
  store volatile i32 %459, ptr @P3_is_marked, align 4, !tbaa !6
  br label %460

460:                                              ; preds = %442, %446, %438, %434, %431, %428
  %461 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %462 = icmp sgt i32 %461, 3
  br i1 %462, label %463, label %492

463:                                              ; preds = %460
  %464 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %465 = icmp slt i32 %464, 4
  br i1 %465, label %466, label %492

466:                                              ; preds = %463
  %467 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %468 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %469 = icmp eq i32 %467, %468
  br i1 %469, label %470, label %492

470:                                              ; preds = %466
  %471 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %472 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %473 = icmp eq i32 %471, %472
  br i1 %473, label %474, label %492

474:                                              ; preds = %470
  %475 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %476 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %477 = icmp sgt i32 %476, %475
  br i1 %477, label %478, label %492

478:                                              ; preds = %474
  %479 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %480 = add nsw i32 %479, -4
  store volatile i32 %480, ptr @P2_is_marked, align 4, !tbaa !6
  %481 = add nsw i32 %476, %475
  %482 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %483 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %482
  store volatile i32 %475, ptr %483, align 4, !tbaa !10
  %484 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %485 = getelementptr i32, ptr @P3_marking_member_0, i32 %484
  %486 = getelementptr i8, ptr %485, i32 4
  store volatile i32 %476, ptr %486, align 4, !tbaa !10
  %487 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %488 = getelementptr i32, ptr @P3_marking_member_0, i32 %487
  %489 = getelementptr i8, ptr %488, i32 8
  store volatile i32 %481, ptr %489, align 4, !tbaa !10
  %490 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %491 = add nsw i32 %490, 3
  store volatile i32 %491, ptr @P3_is_marked, align 4, !tbaa !6
  br label %492

492:                                              ; preds = %474, %478, %470, %466, %463, %460
  %493 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %494 = icmp sgt i32 %493, 3
  br i1 %494, label %495, label %524

495:                                              ; preds = %492
  %496 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %497 = icmp slt i32 %496, 4
  br i1 %497, label %498, label %524

498:                                              ; preds = %495
  %499 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %500 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %501 = icmp eq i32 %499, %500
  br i1 %501, label %502, label %524

502:                                              ; preds = %498
  %503 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %504 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %505 = icmp eq i32 %503, %504
  br i1 %505, label %506, label %524

506:                                              ; preds = %502
  %507 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %508 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %509 = icmp sgt i32 %508, %507
  br i1 %509, label %510, label %524

510:                                              ; preds = %506
  %511 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %512 = add nsw i32 %511, -4
  store volatile i32 %512, ptr @P2_is_marked, align 4, !tbaa !6
  %513 = add nsw i32 %508, %507
  %514 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %515 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %514
  store volatile i32 %507, ptr %515, align 4, !tbaa !10
  %516 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %517 = getelementptr i32, ptr @P3_marking_member_0, i32 %516
  %518 = getelementptr i8, ptr %517, i32 4
  store volatile i32 %508, ptr %518, align 4, !tbaa !10
  %519 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %520 = getelementptr i32, ptr @P3_marking_member_0, i32 %519
  %521 = getelementptr i8, ptr %520, i32 8
  store volatile i32 %513, ptr %521, align 4, !tbaa !10
  %522 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %523 = add nsw i32 %522, 3
  store volatile i32 %523, ptr @P3_is_marked, align 4, !tbaa !6
  br label %524

524:                                              ; preds = %506, %510, %502, %498, %495, %492
  %525 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %526 = icmp sgt i32 %525, 3
  br i1 %526, label %527, label %556

527:                                              ; preds = %524
  %528 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %529 = icmp slt i32 %528, 4
  br i1 %529, label %530, label %556

530:                                              ; preds = %527
  %531 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %532 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %533 = icmp eq i32 %531, %532
  br i1 %533, label %534, label %556

534:                                              ; preds = %530
  %535 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %536 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %537 = icmp eq i32 %535, %536
  br i1 %537, label %538, label %556

538:                                              ; preds = %534
  %539 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %540 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %541 = icmp sgt i32 %540, %539
  br i1 %541, label %542, label %556

542:                                              ; preds = %538
  %543 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %544 = add nsw i32 %543, -4
  store volatile i32 %544, ptr @P2_is_marked, align 4, !tbaa !6
  %545 = add nsw i32 %540, %539
  %546 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %547 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %546
  store volatile i32 %539, ptr %547, align 4, !tbaa !10
  %548 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %549 = getelementptr i32, ptr @P3_marking_member_0, i32 %548
  %550 = getelementptr i8, ptr %549, i32 4
  store volatile i32 %540, ptr %550, align 4, !tbaa !10
  %551 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %552 = getelementptr i32, ptr @P3_marking_member_0, i32 %551
  %553 = getelementptr i8, ptr %552, i32 8
  store volatile i32 %545, ptr %553, align 4, !tbaa !10
  %554 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %555 = add nsw i32 %554, 3
  store volatile i32 %555, ptr @P3_is_marked, align 4, !tbaa !6
  br label %556

556:                                              ; preds = %538, %542, %534, %530, %527, %524
  %557 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %558 = icmp sgt i32 %557, 3
  br i1 %558, label %559, label %588

559:                                              ; preds = %556
  %560 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %561 = icmp slt i32 %560, 4
  br i1 %561, label %562, label %588

562:                                              ; preds = %559
  %563 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %564 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %565 = icmp eq i32 %563, %564
  br i1 %565, label %566, label %588

566:                                              ; preds = %562
  %567 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %568 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %569 = icmp eq i32 %567, %568
  br i1 %569, label %570, label %588

570:                                              ; preds = %566
  %571 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %572 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %573 = icmp sgt i32 %572, %571
  br i1 %573, label %574, label %588

574:                                              ; preds = %570
  %575 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %576 = add nsw i32 %575, -4
  store volatile i32 %576, ptr @P2_is_marked, align 4, !tbaa !6
  %577 = add nsw i32 %572, %571
  %578 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %579 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %578
  store volatile i32 %571, ptr %579, align 4, !tbaa !10
  %580 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %581 = getelementptr i32, ptr @P3_marking_member_0, i32 %580
  %582 = getelementptr i8, ptr %581, i32 4
  store volatile i32 %572, ptr %582, align 4, !tbaa !10
  %583 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %584 = getelementptr i32, ptr @P3_marking_member_0, i32 %583
  %585 = getelementptr i8, ptr %584, i32 8
  store volatile i32 %577, ptr %585, align 4, !tbaa !10
  %586 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %587 = add nsw i32 %586, 3
  store volatile i32 %587, ptr @P3_is_marked, align 4, !tbaa !6
  br label %588

588:                                              ; preds = %570, %574, %566, %562, %559, %556
  %589 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %590 = icmp sgt i32 %589, 3
  br i1 %590, label %591, label %620

591:                                              ; preds = %588
  %592 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %593 = icmp slt i32 %592, 4
  br i1 %593, label %594, label %620

594:                                              ; preds = %591
  %595 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %596 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %597 = icmp eq i32 %595, %596
  br i1 %597, label %598, label %620

598:                                              ; preds = %594
  %599 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %600 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %601 = icmp eq i32 %599, %600
  br i1 %601, label %602, label %620

602:                                              ; preds = %598
  %603 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %604 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %605 = icmp sgt i32 %604, %603
  br i1 %605, label %606, label %620

606:                                              ; preds = %602
  %607 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %608 = add nsw i32 %607, -4
  store volatile i32 %608, ptr @P2_is_marked, align 4, !tbaa !6
  %609 = add nsw i32 %604, %603
  %610 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %611 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %610
  store volatile i32 %603, ptr %611, align 4, !tbaa !10
  %612 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %613 = getelementptr i32, ptr @P3_marking_member_0, i32 %612
  %614 = getelementptr i8, ptr %613, i32 4
  store volatile i32 %604, ptr %614, align 4, !tbaa !10
  %615 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %616 = getelementptr i32, ptr @P3_marking_member_0, i32 %615
  %617 = getelementptr i8, ptr %616, i32 8
  store volatile i32 %609, ptr %617, align 4, !tbaa !10
  %618 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %619 = add nsw i32 %618, 3
  store volatile i32 %619, ptr @P3_is_marked, align 4, !tbaa !6
  br label %620

620:                                              ; preds = %602, %606, %598, %594, %591, %588
  %621 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %622 = icmp sgt i32 %621, 3
  br i1 %622, label %623, label %652

623:                                              ; preds = %620
  %624 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %625 = icmp slt i32 %624, 4
  br i1 %625, label %626, label %652

626:                                              ; preds = %623
  %627 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %628 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %629 = icmp eq i32 %627, %628
  br i1 %629, label %630, label %652

630:                                              ; preds = %626
  %631 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %632 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %633 = icmp eq i32 %631, %632
  br i1 %633, label %634, label %652

634:                                              ; preds = %630
  %635 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %636 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %637 = icmp sgt i32 %636, %635
  br i1 %637, label %638, label %652

638:                                              ; preds = %634
  %639 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %640 = add nsw i32 %639, -4
  store volatile i32 %640, ptr @P2_is_marked, align 4, !tbaa !6
  %641 = add nsw i32 %636, %635
  %642 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %643 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %642
  store volatile i32 %635, ptr %643, align 4, !tbaa !10
  %644 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %645 = getelementptr i32, ptr @P3_marking_member_0, i32 %644
  %646 = getelementptr i8, ptr %645, i32 4
  store volatile i32 %636, ptr %646, align 4, !tbaa !10
  %647 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %648 = getelementptr i32, ptr @P3_marking_member_0, i32 %647
  %649 = getelementptr i8, ptr %648, i32 8
  store volatile i32 %641, ptr %649, align 4, !tbaa !10
  %650 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %651 = add nsw i32 %650, 3
  store volatile i32 %651, ptr @P3_is_marked, align 4, !tbaa !6
  br label %652

652:                                              ; preds = %634, %638, %630, %626, %623, %620
  %653 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %654 = icmp sgt i32 %653, 3
  br i1 %654, label %655, label %684

655:                                              ; preds = %652
  %656 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %657 = icmp slt i32 %656, 4
  br i1 %657, label %658, label %684

658:                                              ; preds = %655
  %659 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %660 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %661 = icmp eq i32 %659, %660
  br i1 %661, label %662, label %684

662:                                              ; preds = %658
  %663 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %664 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %665 = icmp eq i32 %663, %664
  br i1 %665, label %666, label %684

666:                                              ; preds = %662
  %667 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %668 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %669 = icmp sgt i32 %668, %667
  br i1 %669, label %670, label %684

670:                                              ; preds = %666
  %671 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %672 = add nsw i32 %671, -4
  store volatile i32 %672, ptr @P2_is_marked, align 4, !tbaa !6
  %673 = add nsw i32 %668, %667
  %674 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %675 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %674
  store volatile i32 %667, ptr %675, align 4, !tbaa !10
  %676 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %677 = getelementptr i32, ptr @P3_marking_member_0, i32 %676
  %678 = getelementptr i8, ptr %677, i32 4
  store volatile i32 %668, ptr %678, align 4, !tbaa !10
  %679 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %680 = getelementptr i32, ptr @P3_marking_member_0, i32 %679
  %681 = getelementptr i8, ptr %680, i32 8
  store volatile i32 %673, ptr %681, align 4, !tbaa !10
  %682 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %683 = add nsw i32 %682, 3
  store volatile i32 %683, ptr @P3_is_marked, align 4, !tbaa !6
  br label %684

684:                                              ; preds = %666, %670, %662, %658, %655, %652
  %685 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %686 = icmp sgt i32 %685, 3
  br i1 %686, label %687, label %716

687:                                              ; preds = %684
  %688 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %689 = icmp slt i32 %688, 4
  br i1 %689, label %690, label %716

690:                                              ; preds = %687
  %691 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %692 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %693 = icmp eq i32 %691, %692
  br i1 %693, label %694, label %716

694:                                              ; preds = %690
  %695 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %696 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %697 = icmp eq i32 %695, %696
  br i1 %697, label %698, label %716

698:                                              ; preds = %694
  %699 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %700 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %701 = icmp sgt i32 %700, %699
  br i1 %701, label %702, label %716

702:                                              ; preds = %698
  %703 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %704 = add nsw i32 %703, -4
  store volatile i32 %704, ptr @P2_is_marked, align 4, !tbaa !6
  %705 = add nsw i32 %700, %699
  %706 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %707 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %706
  store volatile i32 %699, ptr %707, align 4, !tbaa !10
  %708 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %709 = getelementptr i32, ptr @P3_marking_member_0, i32 %708
  %710 = getelementptr i8, ptr %709, i32 4
  store volatile i32 %700, ptr %710, align 4, !tbaa !10
  %711 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %712 = getelementptr i32, ptr @P3_marking_member_0, i32 %711
  %713 = getelementptr i8, ptr %712, i32 8
  store volatile i32 %705, ptr %713, align 4, !tbaa !10
  %714 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %715 = add nsw i32 %714, 3
  store volatile i32 %715, ptr @P3_is_marked, align 4, !tbaa !6
  br label %716

716:                                              ; preds = %698, %702, %694, %690, %687, %684
  %717 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %718 = icmp sgt i32 %717, 3
  br i1 %718, label %719, label %748

719:                                              ; preds = %716
  %720 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %721 = icmp slt i32 %720, 4
  br i1 %721, label %722, label %748

722:                                              ; preds = %719
  %723 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %724 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %725 = icmp eq i32 %723, %724
  br i1 %725, label %726, label %748

726:                                              ; preds = %722
  %727 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %728 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %729 = icmp eq i32 %727, %728
  br i1 %729, label %730, label %748

730:                                              ; preds = %726
  %731 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %732 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %733 = icmp sgt i32 %732, %731
  br i1 %733, label %734, label %748

734:                                              ; preds = %730
  %735 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %736 = add nsw i32 %735, -4
  store volatile i32 %736, ptr @P2_is_marked, align 4, !tbaa !6
  %737 = add nsw i32 %732, %731
  %738 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %739 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %738
  store volatile i32 %731, ptr %739, align 4, !tbaa !10
  %740 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %741 = getelementptr i32, ptr @P3_marking_member_0, i32 %740
  %742 = getelementptr i8, ptr %741, i32 4
  store volatile i32 %732, ptr %742, align 4, !tbaa !10
  %743 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %744 = getelementptr i32, ptr @P3_marking_member_0, i32 %743
  %745 = getelementptr i8, ptr %744, i32 8
  store volatile i32 %737, ptr %745, align 4, !tbaa !10
  %746 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %747 = add nsw i32 %746, 3
  store volatile i32 %747, ptr @P3_is_marked, align 4, !tbaa !6
  br label %748

748:                                              ; preds = %730, %734, %726, %722, %719, %716
  %749 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %750 = icmp sgt i32 %749, 3
  br i1 %750, label %751, label %780

751:                                              ; preds = %748
  %752 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %753 = icmp slt i32 %752, 4
  br i1 %753, label %754, label %780

754:                                              ; preds = %751
  %755 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %756 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %757 = icmp eq i32 %755, %756
  br i1 %757, label %758, label %780

758:                                              ; preds = %754
  %759 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %760 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %761 = icmp eq i32 %759, %760
  br i1 %761, label %762, label %780

762:                                              ; preds = %758
  %763 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %764 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %765 = icmp sgt i32 %764, %763
  br i1 %765, label %766, label %780

766:                                              ; preds = %762
  %767 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %768 = add nsw i32 %767, -4
  store volatile i32 %768, ptr @P2_is_marked, align 4, !tbaa !6
  %769 = add nsw i32 %764, %763
  %770 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %771 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %770
  store volatile i32 %763, ptr %771, align 4, !tbaa !10
  %772 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %773 = getelementptr i32, ptr @P3_marking_member_0, i32 %772
  %774 = getelementptr i8, ptr %773, i32 4
  store volatile i32 %764, ptr %774, align 4, !tbaa !10
  %775 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %776 = getelementptr i32, ptr @P3_marking_member_0, i32 %775
  %777 = getelementptr i8, ptr %776, i32 8
  store volatile i32 %769, ptr %777, align 4, !tbaa !10
  %778 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %779 = add nsw i32 %778, 3
  store volatile i32 %779, ptr @P3_is_marked, align 4, !tbaa !6
  br label %780

780:                                              ; preds = %762, %766, %758, %754, %751, %748
  %781 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %782 = icmp sgt i32 %781, 3
  br i1 %782, label %783, label %812

783:                                              ; preds = %780
  %784 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %785 = icmp slt i32 %784, 4
  br i1 %785, label %786, label %812

786:                                              ; preds = %783
  %787 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %788 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %789 = icmp eq i32 %787, %788
  br i1 %789, label %790, label %812

790:                                              ; preds = %786
  %791 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %792 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %793 = icmp eq i32 %791, %792
  br i1 %793, label %794, label %812

794:                                              ; preds = %790
  %795 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %796 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %797 = icmp sgt i32 %796, %795
  br i1 %797, label %798, label %812

798:                                              ; preds = %794
  %799 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %800 = add nsw i32 %799, -4
  store volatile i32 %800, ptr @P2_is_marked, align 4, !tbaa !6
  %801 = add nsw i32 %796, %795
  %802 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %803 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %802
  store volatile i32 %795, ptr %803, align 4, !tbaa !10
  %804 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %805 = getelementptr i32, ptr @P3_marking_member_0, i32 %804
  %806 = getelementptr i8, ptr %805, i32 4
  store volatile i32 %796, ptr %806, align 4, !tbaa !10
  %807 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %808 = getelementptr i32, ptr @P3_marking_member_0, i32 %807
  %809 = getelementptr i8, ptr %808, i32 8
  store volatile i32 %801, ptr %809, align 4, !tbaa !10
  %810 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %811 = add nsw i32 %810, 3
  store volatile i32 %811, ptr @P3_is_marked, align 4, !tbaa !6
  br label %812

812:                                              ; preds = %794, %798, %790, %786, %783, %780
  %813 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %814 = icmp sgt i32 %813, 3
  br i1 %814, label %815, label %844

815:                                              ; preds = %812
  %816 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %817 = icmp slt i32 %816, 4
  br i1 %817, label %818, label %844

818:                                              ; preds = %815
  %819 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %820 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %821 = icmp eq i32 %819, %820
  br i1 %821, label %822, label %844

822:                                              ; preds = %818
  %823 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %824 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %825 = icmp eq i32 %823, %824
  br i1 %825, label %826, label %844

826:                                              ; preds = %822
  %827 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %828 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %829 = icmp sgt i32 %828, %827
  br i1 %829, label %830, label %844

830:                                              ; preds = %826
  %831 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %832 = add nsw i32 %831, -4
  store volatile i32 %832, ptr @P2_is_marked, align 4, !tbaa !6
  %833 = add nsw i32 %828, %827
  %834 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %835 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %834
  store volatile i32 %827, ptr %835, align 4, !tbaa !10
  %836 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %837 = getelementptr i32, ptr @P3_marking_member_0, i32 %836
  %838 = getelementptr i8, ptr %837, i32 4
  store volatile i32 %828, ptr %838, align 4, !tbaa !10
  %839 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %840 = getelementptr i32, ptr @P3_marking_member_0, i32 %839
  %841 = getelementptr i8, ptr %840, i32 8
  store volatile i32 %833, ptr %841, align 4, !tbaa !10
  %842 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %843 = add nsw i32 %842, 3
  store volatile i32 %843, ptr @P3_is_marked, align 4, !tbaa !6
  br label %844

844:                                              ; preds = %826, %830, %822, %818, %815, %812
  %845 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %846 = icmp sgt i32 %845, 3
  br i1 %846, label %847, label %876

847:                                              ; preds = %844
  %848 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %849 = icmp slt i32 %848, 4
  br i1 %849, label %850, label %876

850:                                              ; preds = %847
  %851 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %852 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %853 = icmp eq i32 %851, %852
  br i1 %853, label %854, label %876

854:                                              ; preds = %850
  %855 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %856 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %857 = icmp eq i32 %855, %856
  br i1 %857, label %858, label %876

858:                                              ; preds = %854
  %859 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %860 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %861 = icmp sgt i32 %860, %859
  br i1 %861, label %862, label %876

862:                                              ; preds = %858
  %863 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %864 = add nsw i32 %863, -4
  store volatile i32 %864, ptr @P2_is_marked, align 4, !tbaa !6
  %865 = add nsw i32 %860, %859
  %866 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %867 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %866
  store volatile i32 %859, ptr %867, align 4, !tbaa !10
  %868 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %869 = getelementptr i32, ptr @P3_marking_member_0, i32 %868
  %870 = getelementptr i8, ptr %869, i32 4
  store volatile i32 %860, ptr %870, align 4, !tbaa !10
  %871 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %872 = getelementptr i32, ptr @P3_marking_member_0, i32 %871
  %873 = getelementptr i8, ptr %872, i32 8
  store volatile i32 %865, ptr %873, align 4, !tbaa !10
  %874 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %875 = add nsw i32 %874, 3
  store volatile i32 %875, ptr @P3_is_marked, align 4, !tbaa !6
  br label %876

876:                                              ; preds = %858, %862, %854, %850, %847, %844
  %877 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %878 = icmp sgt i32 %877, 3
  br i1 %878, label %879, label %908

879:                                              ; preds = %876
  %880 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %881 = icmp slt i32 %880, 4
  br i1 %881, label %882, label %908

882:                                              ; preds = %879
  %883 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %884 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %885 = icmp eq i32 %883, %884
  br i1 %885, label %886, label %908

886:                                              ; preds = %882
  %887 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %888 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %889 = icmp eq i32 %887, %888
  br i1 %889, label %890, label %908

890:                                              ; preds = %886
  %891 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %892 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %893 = icmp sgt i32 %892, %891
  br i1 %893, label %894, label %908

894:                                              ; preds = %890
  %895 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %896 = add nsw i32 %895, -4
  store volatile i32 %896, ptr @P2_is_marked, align 4, !tbaa !6
  %897 = add nsw i32 %892, %891
  %898 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %899 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %898
  store volatile i32 %891, ptr %899, align 4, !tbaa !10
  %900 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %901 = getelementptr i32, ptr @P3_marking_member_0, i32 %900
  %902 = getelementptr i8, ptr %901, i32 4
  store volatile i32 %892, ptr %902, align 4, !tbaa !10
  %903 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %904 = getelementptr i32, ptr @P3_marking_member_0, i32 %903
  %905 = getelementptr i8, ptr %904, i32 8
  store volatile i32 %897, ptr %905, align 4, !tbaa !10
  %906 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %907 = add nsw i32 %906, 3
  store volatile i32 %907, ptr @P3_is_marked, align 4, !tbaa !6
  br label %908

908:                                              ; preds = %890, %894, %886, %882, %879, %876
  %909 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %910 = icmp sgt i32 %909, 3
  br i1 %910, label %911, label %940

911:                                              ; preds = %908
  %912 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %913 = icmp slt i32 %912, 4
  br i1 %913, label %914, label %940

914:                                              ; preds = %911
  %915 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %916 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %917 = icmp eq i32 %915, %916
  br i1 %917, label %918, label %940

918:                                              ; preds = %914
  %919 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %920 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %921 = icmp eq i32 %919, %920
  br i1 %921, label %922, label %940

922:                                              ; preds = %918
  %923 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %924 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %925 = icmp sgt i32 %924, %923
  br i1 %925, label %926, label %940

926:                                              ; preds = %922
  %927 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %928 = add nsw i32 %927, -4
  store volatile i32 %928, ptr @P2_is_marked, align 4, !tbaa !6
  %929 = add nsw i32 %924, %923
  %930 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %931 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %930
  store volatile i32 %923, ptr %931, align 4, !tbaa !10
  %932 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %933 = getelementptr i32, ptr @P3_marking_member_0, i32 %932
  %934 = getelementptr i8, ptr %933, i32 4
  store volatile i32 %924, ptr %934, align 4, !tbaa !10
  %935 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %936 = getelementptr i32, ptr @P3_marking_member_0, i32 %935
  %937 = getelementptr i8, ptr %936, i32 8
  store volatile i32 %929, ptr %937, align 4, !tbaa !10
  %938 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %939 = add nsw i32 %938, 3
  store volatile i32 %939, ptr @P3_is_marked, align 4, !tbaa !6
  br label %940

940:                                              ; preds = %922, %926, %918, %914, %911, %908
  %941 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %942 = icmp sgt i32 %941, 4
  br i1 %942, label %943, label %973

943:                                              ; preds = %940
  %944 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %945 = icmp slt i32 %944, 4
  br i1 %945, label %946, label %973

946:                                              ; preds = %943
  %947 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %948 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %949 = icmp eq i32 %947, %948
  br i1 %949, label %950, label %973

950:                                              ; preds = %946
  %951 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %952 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %953 = icmp eq i32 %951, %952
  br i1 %953, label %954, label %973

954:                                              ; preds = %950
  %955 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %956 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %957 = icmp sgt i32 %956, %955
  br i1 %957, label %958, label %973

958:                                              ; preds = %954
  %959 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %959, ptr @P2_marking_member_0, align 4, !tbaa !10
  %960 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %961 = add nsw i32 %960, -4
  store volatile i32 %961, ptr @P2_is_marked, align 4, !tbaa !6
  %962 = add nsw i32 %956, %955
  %963 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %964 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %963
  store volatile i32 %955, ptr %964, align 4, !tbaa !10
  %965 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %966 = getelementptr i32, ptr @P3_marking_member_0, i32 %965
  %967 = getelementptr i8, ptr %966, i32 4
  store volatile i32 %956, ptr %967, align 4, !tbaa !10
  %968 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %969 = getelementptr i32, ptr @P3_marking_member_0, i32 %968
  %970 = getelementptr i8, ptr %969, i32 8
  store volatile i32 %962, ptr %970, align 4, !tbaa !10
  %971 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %972 = add nsw i32 %971, 3
  store volatile i32 %972, ptr @P3_is_marked, align 4, !tbaa !6
  br label %973

973:                                              ; preds = %954, %958, %950, %946, %943, %940
  %974 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %975 = icmp sgt i32 %974, 4
  br i1 %975, label %976, label %1006

976:                                              ; preds = %973
  %977 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %978 = icmp slt i32 %977, 4
  br i1 %978, label %979, label %1006

979:                                              ; preds = %976
  %980 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %981 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %982 = icmp eq i32 %980, %981
  br i1 %982, label %983, label %1006

983:                                              ; preds = %979
  %984 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %985 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %986 = icmp eq i32 %984, %985
  br i1 %986, label %987, label %1006

987:                                              ; preds = %983
  %988 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %989 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %990 = icmp sgt i32 %989, %988
  br i1 %990, label %991, label %1006

991:                                              ; preds = %987
  %992 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %992, ptr @P2_marking_member_0, align 4, !tbaa !10
  %993 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %994 = add nsw i32 %993, -4
  store volatile i32 %994, ptr @P2_is_marked, align 4, !tbaa !6
  %995 = add nsw i32 %989, %988
  %996 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %997 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %996
  store volatile i32 %988, ptr %997, align 4, !tbaa !10
  %998 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %999 = getelementptr i32, ptr @P3_marking_member_0, i32 %998
  %1000 = getelementptr i8, ptr %999, i32 4
  store volatile i32 %989, ptr %1000, align 4, !tbaa !10
  %1001 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1002 = getelementptr i32, ptr @P3_marking_member_0, i32 %1001
  %1003 = getelementptr i8, ptr %1002, i32 8
  store volatile i32 %995, ptr %1003, align 4, !tbaa !10
  %1004 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1005 = add nsw i32 %1004, 3
  store volatile i32 %1005, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1006

1006:                                             ; preds = %987, %991, %983, %979, %976, %973
  %1007 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1008 = icmp sgt i32 %1007, 4
  br i1 %1008, label %1009, label %1039

1009:                                             ; preds = %1006
  %1010 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1011 = icmp slt i32 %1010, 4
  br i1 %1011, label %1012, label %1039

1012:                                             ; preds = %1009
  %1013 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1014 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1015 = icmp eq i32 %1013, %1014
  br i1 %1015, label %1016, label %1039

1016:                                             ; preds = %1012
  %1017 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1018 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1019 = icmp eq i32 %1017, %1018
  br i1 %1019, label %1020, label %1039

1020:                                             ; preds = %1016
  %1021 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1022 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1023 = icmp sgt i32 %1022, %1021
  br i1 %1023, label %1024, label %1039

1024:                                             ; preds = %1020
  %1025 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %1025, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1026 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1027 = add nsw i32 %1026, -4
  store volatile i32 %1027, ptr @P2_is_marked, align 4, !tbaa !6
  %1028 = add nsw i32 %1022, %1021
  %1029 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1030 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1029
  store volatile i32 %1021, ptr %1030, align 4, !tbaa !10
  %1031 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1032 = getelementptr i32, ptr @P3_marking_member_0, i32 %1031
  %1033 = getelementptr i8, ptr %1032, i32 4
  store volatile i32 %1022, ptr %1033, align 4, !tbaa !10
  %1034 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1035 = getelementptr i32, ptr @P3_marking_member_0, i32 %1034
  %1036 = getelementptr i8, ptr %1035, i32 8
  store volatile i32 %1028, ptr %1036, align 4, !tbaa !10
  %1037 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1038 = add nsw i32 %1037, 3
  store volatile i32 %1038, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1039

1039:                                             ; preds = %1020, %1024, %1016, %1012, %1009, %1006
  %1040 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1041 = icmp sgt i32 %1040, 4
  br i1 %1041, label %1042, label %1072

1042:                                             ; preds = %1039
  %1043 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1044 = icmp slt i32 %1043, 4
  br i1 %1044, label %1045, label %1072

1045:                                             ; preds = %1042
  %1046 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1047 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1048 = icmp eq i32 %1046, %1047
  br i1 %1048, label %1049, label %1072

1049:                                             ; preds = %1045
  %1050 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1051 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1052 = icmp eq i32 %1050, %1051
  br i1 %1052, label %1053, label %1072

1053:                                             ; preds = %1049
  %1054 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1055 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1056 = icmp sgt i32 %1055, %1054
  br i1 %1056, label %1057, label %1072

1057:                                             ; preds = %1053
  %1058 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %1058, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1059 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1060 = add nsw i32 %1059, -4
  store volatile i32 %1060, ptr @P2_is_marked, align 4, !tbaa !6
  %1061 = add nsw i32 %1055, %1054
  %1062 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1063 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1062
  store volatile i32 %1054, ptr %1063, align 4, !tbaa !10
  %1064 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1065 = getelementptr i32, ptr @P3_marking_member_0, i32 %1064
  %1066 = getelementptr i8, ptr %1065, i32 4
  store volatile i32 %1055, ptr %1066, align 4, !tbaa !10
  %1067 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1068 = getelementptr i32, ptr @P3_marking_member_0, i32 %1067
  %1069 = getelementptr i8, ptr %1068, i32 8
  store volatile i32 %1061, ptr %1069, align 4, !tbaa !10
  %1070 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1071 = add nsw i32 %1070, 3
  store volatile i32 %1071, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1072

1072:                                             ; preds = %1053, %1057, %1049, %1045, %1042, %1039
  %1073 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1074 = icmp sgt i32 %1073, 4
  br i1 %1074, label %1075, label %1105

1075:                                             ; preds = %1072
  %1076 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1077 = icmp slt i32 %1076, 4
  br i1 %1077, label %1078, label %1105

1078:                                             ; preds = %1075
  %1079 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1080 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1081 = icmp eq i32 %1079, %1080
  br i1 %1081, label %1082, label %1105

1082:                                             ; preds = %1078
  %1083 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1084 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1085 = icmp eq i32 %1083, %1084
  br i1 %1085, label %1086, label %1105

1086:                                             ; preds = %1082
  %1087 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1088 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1089 = icmp sgt i32 %1088, %1087
  br i1 %1089, label %1090, label %1105

1090:                                             ; preds = %1086
  %1091 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %1091, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1092 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1093 = add nsw i32 %1092, -4
  store volatile i32 %1093, ptr @P2_is_marked, align 4, !tbaa !6
  %1094 = add nsw i32 %1088, %1087
  %1095 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1096 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1095
  store volatile i32 %1087, ptr %1096, align 4, !tbaa !10
  %1097 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1098 = getelementptr i32, ptr @P3_marking_member_0, i32 %1097
  %1099 = getelementptr i8, ptr %1098, i32 4
  store volatile i32 %1088, ptr %1099, align 4, !tbaa !10
  %1100 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1101 = getelementptr i32, ptr @P3_marking_member_0, i32 %1100
  %1102 = getelementptr i8, ptr %1101, i32 8
  store volatile i32 %1094, ptr %1102, align 4, !tbaa !10
  %1103 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1104 = add nsw i32 %1103, 3
  store volatile i32 %1104, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1105

1105:                                             ; preds = %1086, %1090, %1082, %1078, %1075, %1072
  %1106 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1107 = icmp sgt i32 %1106, 4
  br i1 %1107, label %1108, label %1138

1108:                                             ; preds = %1105
  %1109 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1110 = icmp slt i32 %1109, 4
  br i1 %1110, label %1111, label %1138

1111:                                             ; preds = %1108
  %1112 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1113 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1114 = icmp eq i32 %1112, %1113
  br i1 %1114, label %1115, label %1138

1115:                                             ; preds = %1111
  %1116 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1117 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1118 = icmp eq i32 %1116, %1117
  br i1 %1118, label %1119, label %1138

1119:                                             ; preds = %1115
  %1120 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1121 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1122 = icmp sgt i32 %1121, %1120
  br i1 %1122, label %1123, label %1138

1123:                                             ; preds = %1119
  %1124 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %1124, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1125 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1126 = add nsw i32 %1125, -4
  store volatile i32 %1126, ptr @P2_is_marked, align 4, !tbaa !6
  %1127 = add nsw i32 %1121, %1120
  %1128 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1129 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1128
  store volatile i32 %1120, ptr %1129, align 4, !tbaa !10
  %1130 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1131 = getelementptr i32, ptr @P3_marking_member_0, i32 %1130
  %1132 = getelementptr i8, ptr %1131, i32 4
  store volatile i32 %1121, ptr %1132, align 4, !tbaa !10
  %1133 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1134 = getelementptr i32, ptr @P3_marking_member_0, i32 %1133
  %1135 = getelementptr i8, ptr %1134, i32 8
  store volatile i32 %1127, ptr %1135, align 4, !tbaa !10
  %1136 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1137 = add nsw i32 %1136, 3
  store volatile i32 %1137, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1138

1138:                                             ; preds = %1119, %1123, %1115, %1111, %1108, %1105
  %1139 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1140 = icmp sgt i32 %1139, 4
  br i1 %1140, label %1141, label %1171

1141:                                             ; preds = %1138
  %1142 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1143 = icmp slt i32 %1142, 4
  br i1 %1143, label %1144, label %1171

1144:                                             ; preds = %1141
  %1145 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1146 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1147 = icmp eq i32 %1145, %1146
  br i1 %1147, label %1148, label %1171

1148:                                             ; preds = %1144
  %1149 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1150 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1151 = icmp eq i32 %1149, %1150
  br i1 %1151, label %1152, label %1171

1152:                                             ; preds = %1148
  %1153 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1154 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1155 = icmp sgt i32 %1154, %1153
  br i1 %1155, label %1156, label %1171

1156:                                             ; preds = %1152
  %1157 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %1157, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1158 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1159 = add nsw i32 %1158, -4
  store volatile i32 %1159, ptr @P2_is_marked, align 4, !tbaa !6
  %1160 = add nsw i32 %1154, %1153
  %1161 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1162 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1161
  store volatile i32 %1153, ptr %1162, align 4, !tbaa !10
  %1163 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1164 = getelementptr i32, ptr @P3_marking_member_0, i32 %1163
  %1165 = getelementptr i8, ptr %1164, i32 4
  store volatile i32 %1154, ptr %1165, align 4, !tbaa !10
  %1166 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1167 = getelementptr i32, ptr @P3_marking_member_0, i32 %1166
  %1168 = getelementptr i8, ptr %1167, i32 8
  store volatile i32 %1160, ptr %1168, align 4, !tbaa !10
  %1169 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1170 = add nsw i32 %1169, 3
  store volatile i32 %1170, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1171

1171:                                             ; preds = %1152, %1156, %1148, %1144, %1141, %1138
  %1172 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1173 = icmp sgt i32 %1172, 4
  br i1 %1173, label %1174, label %1204

1174:                                             ; preds = %1171
  %1175 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1176 = icmp slt i32 %1175, 4
  br i1 %1176, label %1177, label %1204

1177:                                             ; preds = %1174
  %1178 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1179 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1180 = icmp eq i32 %1178, %1179
  br i1 %1180, label %1181, label %1204

1181:                                             ; preds = %1177
  %1182 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1183 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1184 = icmp eq i32 %1182, %1183
  br i1 %1184, label %1185, label %1204

1185:                                             ; preds = %1181
  %1186 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1187 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1188 = icmp sgt i32 %1187, %1186
  br i1 %1188, label %1189, label %1204

1189:                                             ; preds = %1185
  %1190 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %1190, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1191 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1192 = add nsw i32 %1191, -4
  store volatile i32 %1192, ptr @P2_is_marked, align 4, !tbaa !6
  %1193 = add nsw i32 %1187, %1186
  %1194 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1195 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1194
  store volatile i32 %1186, ptr %1195, align 4, !tbaa !10
  %1196 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1197 = getelementptr i32, ptr @P3_marking_member_0, i32 %1196
  %1198 = getelementptr i8, ptr %1197, i32 4
  store volatile i32 %1187, ptr %1198, align 4, !tbaa !10
  %1199 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1200 = getelementptr i32, ptr @P3_marking_member_0, i32 %1199
  %1201 = getelementptr i8, ptr %1200, i32 8
  store volatile i32 %1193, ptr %1201, align 4, !tbaa !10
  %1202 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1203 = add nsw i32 %1202, 3
  store volatile i32 %1203, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1204

1204:                                             ; preds = %1185, %1189, %1181, %1177, %1174, %1171
  %1205 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1206 = icmp sgt i32 %1205, 4
  br i1 %1206, label %1207, label %1237

1207:                                             ; preds = %1204
  %1208 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1209 = icmp slt i32 %1208, 4
  br i1 %1209, label %1210, label %1237

1210:                                             ; preds = %1207
  %1211 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1212 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1213 = icmp eq i32 %1211, %1212
  br i1 %1213, label %1214, label %1237

1214:                                             ; preds = %1210
  %1215 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1216 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1217 = icmp eq i32 %1215, %1216
  br i1 %1217, label %1218, label %1237

1218:                                             ; preds = %1214
  %1219 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1220 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1221 = icmp sgt i32 %1220, %1219
  br i1 %1221, label %1222, label %1237

1222:                                             ; preds = %1218
  %1223 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %1223, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1224 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1225 = add nsw i32 %1224, -4
  store volatile i32 %1225, ptr @P2_is_marked, align 4, !tbaa !6
  %1226 = add nsw i32 %1220, %1219
  %1227 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1228 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1227
  store volatile i32 %1219, ptr %1228, align 4, !tbaa !10
  %1229 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1230 = getelementptr i32, ptr @P3_marking_member_0, i32 %1229
  %1231 = getelementptr i8, ptr %1230, i32 4
  store volatile i32 %1220, ptr %1231, align 4, !tbaa !10
  %1232 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1233 = getelementptr i32, ptr @P3_marking_member_0, i32 %1232
  %1234 = getelementptr i8, ptr %1233, i32 8
  store volatile i32 %1226, ptr %1234, align 4, !tbaa !10
  %1235 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1236 = add nsw i32 %1235, 3
  store volatile i32 %1236, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1237

1237:                                             ; preds = %1218, %1222, %1214, %1210, %1207, %1204
  %1238 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1239 = icmp sgt i32 %1238, 4
  br i1 %1239, label %1240, label %1270

1240:                                             ; preds = %1237
  %1241 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1242 = icmp slt i32 %1241, 4
  br i1 %1242, label %1243, label %1270

1243:                                             ; preds = %1240
  %1244 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1245 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1246 = icmp eq i32 %1244, %1245
  br i1 %1246, label %1247, label %1270

1247:                                             ; preds = %1243
  %1248 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1249 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1250 = icmp eq i32 %1248, %1249
  br i1 %1250, label %1251, label %1270

1251:                                             ; preds = %1247
  %1252 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1253 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1254 = icmp sgt i32 %1253, %1252
  br i1 %1254, label %1255, label %1270

1255:                                             ; preds = %1251
  %1256 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %1256, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1257 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1258 = add nsw i32 %1257, -4
  store volatile i32 %1258, ptr @P2_is_marked, align 4, !tbaa !6
  %1259 = add nsw i32 %1253, %1252
  %1260 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1261 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1260
  store volatile i32 %1252, ptr %1261, align 4, !tbaa !10
  %1262 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1263 = getelementptr i32, ptr @P3_marking_member_0, i32 %1262
  %1264 = getelementptr i8, ptr %1263, i32 4
  store volatile i32 %1253, ptr %1264, align 4, !tbaa !10
  %1265 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1266 = getelementptr i32, ptr @P3_marking_member_0, i32 %1265
  %1267 = getelementptr i8, ptr %1266, i32 8
  store volatile i32 %1259, ptr %1267, align 4, !tbaa !10
  %1268 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1269 = add nsw i32 %1268, 3
  store volatile i32 %1269, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1270

1270:                                             ; preds = %1251, %1255, %1247, %1243, %1240, %1237
  %1271 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1272 = icmp sgt i32 %1271, 4
  br i1 %1272, label %1273, label %1303

1273:                                             ; preds = %1270
  %1274 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1275 = icmp slt i32 %1274, 4
  br i1 %1275, label %1276, label %1303

1276:                                             ; preds = %1273
  %1277 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1278 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1279 = icmp eq i32 %1277, %1278
  br i1 %1279, label %1280, label %1303

1280:                                             ; preds = %1276
  %1281 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1282 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1283 = icmp eq i32 %1281, %1282
  br i1 %1283, label %1284, label %1303

1284:                                             ; preds = %1280
  %1285 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1286 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1287 = icmp sgt i32 %1286, %1285
  br i1 %1287, label %1288, label %1303

1288:                                             ; preds = %1284
  %1289 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %1289, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1290 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1291 = add nsw i32 %1290, -4
  store volatile i32 %1291, ptr @P2_is_marked, align 4, !tbaa !6
  %1292 = add nsw i32 %1286, %1285
  %1293 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1294 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1293
  store volatile i32 %1285, ptr %1294, align 4, !tbaa !10
  %1295 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1296 = getelementptr i32, ptr @P3_marking_member_0, i32 %1295
  %1297 = getelementptr i8, ptr %1296, i32 4
  store volatile i32 %1286, ptr %1297, align 4, !tbaa !10
  %1298 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1299 = getelementptr i32, ptr @P3_marking_member_0, i32 %1298
  %1300 = getelementptr i8, ptr %1299, i32 8
  store volatile i32 %1292, ptr %1300, align 4, !tbaa !10
  %1301 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1302 = add nsw i32 %1301, 3
  store volatile i32 %1302, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1303

1303:                                             ; preds = %1284, %1288, %1280, %1276, %1273, %1270
  %1304 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1305 = icmp sgt i32 %1304, 4
  br i1 %1305, label %1306, label %1336

1306:                                             ; preds = %1303
  %1307 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1308 = icmp slt i32 %1307, 4
  br i1 %1308, label %1309, label %1336

1309:                                             ; preds = %1306
  %1310 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1311 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1312 = icmp eq i32 %1310, %1311
  br i1 %1312, label %1313, label %1336

1313:                                             ; preds = %1309
  %1314 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1315 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1316 = icmp eq i32 %1314, %1315
  br i1 %1316, label %1317, label %1336

1317:                                             ; preds = %1313
  %1318 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1319 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1320 = icmp sgt i32 %1319, %1318
  br i1 %1320, label %1321, label %1336

1321:                                             ; preds = %1317
  %1322 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %1322, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1323 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1324 = add nsw i32 %1323, -4
  store volatile i32 %1324, ptr @P2_is_marked, align 4, !tbaa !6
  %1325 = add nsw i32 %1319, %1318
  %1326 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1327 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1326
  store volatile i32 %1318, ptr %1327, align 4, !tbaa !10
  %1328 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1329 = getelementptr i32, ptr @P3_marking_member_0, i32 %1328
  %1330 = getelementptr i8, ptr %1329, i32 4
  store volatile i32 %1319, ptr %1330, align 4, !tbaa !10
  %1331 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1332 = getelementptr i32, ptr @P3_marking_member_0, i32 %1331
  %1333 = getelementptr i8, ptr %1332, i32 8
  store volatile i32 %1325, ptr %1333, align 4, !tbaa !10
  %1334 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1335 = add nsw i32 %1334, 3
  store volatile i32 %1335, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1336

1336:                                             ; preds = %1317, %1321, %1313, %1309, %1306, %1303
  %1337 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1338 = icmp sgt i32 %1337, 4
  br i1 %1338, label %1339, label %1369

1339:                                             ; preds = %1336
  %1340 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1341 = icmp slt i32 %1340, 4
  br i1 %1341, label %1342, label %1369

1342:                                             ; preds = %1339
  %1343 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1344 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1345 = icmp eq i32 %1343, %1344
  br i1 %1345, label %1346, label %1369

1346:                                             ; preds = %1342
  %1347 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1348 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1349 = icmp eq i32 %1347, %1348
  br i1 %1349, label %1350, label %1369

1350:                                             ; preds = %1346
  %1351 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1352 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1353 = icmp sgt i32 %1352, %1351
  br i1 %1353, label %1354, label %1369

1354:                                             ; preds = %1350
  %1355 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %1355, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1356 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1357 = add nsw i32 %1356, -4
  store volatile i32 %1357, ptr @P2_is_marked, align 4, !tbaa !6
  %1358 = add nsw i32 %1352, %1351
  %1359 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1360 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1359
  store volatile i32 %1351, ptr %1360, align 4, !tbaa !10
  %1361 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1362 = getelementptr i32, ptr @P3_marking_member_0, i32 %1361
  %1363 = getelementptr i8, ptr %1362, i32 4
  store volatile i32 %1352, ptr %1363, align 4, !tbaa !10
  %1364 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1365 = getelementptr i32, ptr @P3_marking_member_0, i32 %1364
  %1366 = getelementptr i8, ptr %1365, i32 8
  store volatile i32 %1358, ptr %1366, align 4, !tbaa !10
  %1367 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1368 = add nsw i32 %1367, 3
  store volatile i32 %1368, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1369

1369:                                             ; preds = %1350, %1354, %1346, %1342, %1339, %1336
  %1370 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1371 = icmp sgt i32 %1370, 4
  br i1 %1371, label %1372, label %1402

1372:                                             ; preds = %1369
  %1373 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1374 = icmp slt i32 %1373, 4
  br i1 %1374, label %1375, label %1402

1375:                                             ; preds = %1372
  %1376 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1377 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1378 = icmp eq i32 %1376, %1377
  br i1 %1378, label %1379, label %1402

1379:                                             ; preds = %1375
  %1380 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1381 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1382 = icmp eq i32 %1380, %1381
  br i1 %1382, label %1383, label %1402

1383:                                             ; preds = %1379
  %1384 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1385 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1386 = icmp sgt i32 %1385, %1384
  br i1 %1386, label %1387, label %1402

1387:                                             ; preds = %1383
  %1388 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %1388, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1389 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1390 = add nsw i32 %1389, -4
  store volatile i32 %1390, ptr @P2_is_marked, align 4, !tbaa !6
  %1391 = add nsw i32 %1385, %1384
  %1392 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1393 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1392
  store volatile i32 %1384, ptr %1393, align 4, !tbaa !10
  %1394 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1395 = getelementptr i32, ptr @P3_marking_member_0, i32 %1394
  %1396 = getelementptr i8, ptr %1395, i32 4
  store volatile i32 %1385, ptr %1396, align 4, !tbaa !10
  %1397 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1398 = getelementptr i32, ptr @P3_marking_member_0, i32 %1397
  %1399 = getelementptr i8, ptr %1398, i32 8
  store volatile i32 %1391, ptr %1399, align 4, !tbaa !10
  %1400 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1401 = add nsw i32 %1400, 3
  store volatile i32 %1401, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1402

1402:                                             ; preds = %1383, %1387, %1379, %1375, %1372, %1369
  %1403 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1404 = icmp sgt i32 %1403, 4
  br i1 %1404, label %1405, label %1435

1405:                                             ; preds = %1402
  %1406 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1407 = icmp slt i32 %1406, 4
  br i1 %1407, label %1408, label %1435

1408:                                             ; preds = %1405
  %1409 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1410 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1411 = icmp eq i32 %1409, %1410
  br i1 %1411, label %1412, label %1435

1412:                                             ; preds = %1408
  %1413 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1414 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1415 = icmp eq i32 %1413, %1414
  br i1 %1415, label %1416, label %1435

1416:                                             ; preds = %1412
  %1417 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1418 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1419 = icmp sgt i32 %1418, %1417
  br i1 %1419, label %1420, label %1435

1420:                                             ; preds = %1416
  %1421 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %1421, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1422 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1423 = add nsw i32 %1422, -4
  store volatile i32 %1423, ptr @P2_is_marked, align 4, !tbaa !6
  %1424 = add nsw i32 %1418, %1417
  %1425 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1426 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1425
  store volatile i32 %1417, ptr %1426, align 4, !tbaa !10
  %1427 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1428 = getelementptr i32, ptr @P3_marking_member_0, i32 %1427
  %1429 = getelementptr i8, ptr %1428, i32 4
  store volatile i32 %1418, ptr %1429, align 4, !tbaa !10
  %1430 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1431 = getelementptr i32, ptr @P3_marking_member_0, i32 %1430
  %1432 = getelementptr i8, ptr %1431, i32 8
  store volatile i32 %1424, ptr %1432, align 4, !tbaa !10
  %1433 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1434 = add nsw i32 %1433, 3
  store volatile i32 %1434, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1435

1435:                                             ; preds = %1416, %1420, %1412, %1408, %1405, %1402
  %1436 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1437 = icmp sgt i32 %1436, 4
  br i1 %1437, label %1438, label %1468

1438:                                             ; preds = %1435
  %1439 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1440 = icmp slt i32 %1439, 4
  br i1 %1440, label %1441, label %1468

1441:                                             ; preds = %1438
  %1442 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1443 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1444 = icmp eq i32 %1442, %1443
  br i1 %1444, label %1445, label %1468

1445:                                             ; preds = %1441
  %1446 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1447 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1448 = icmp eq i32 %1446, %1447
  br i1 %1448, label %1449, label %1468

1449:                                             ; preds = %1445
  %1450 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1451 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1452 = icmp sgt i32 %1451, %1450
  br i1 %1452, label %1453, label %1468

1453:                                             ; preds = %1449
  %1454 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %1454, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1455 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1456 = add nsw i32 %1455, -4
  store volatile i32 %1456, ptr @P2_is_marked, align 4, !tbaa !6
  %1457 = add nsw i32 %1451, %1450
  %1458 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1459 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1458
  store volatile i32 %1450, ptr %1459, align 4, !tbaa !10
  %1460 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1461 = getelementptr i32, ptr @P3_marking_member_0, i32 %1460
  %1462 = getelementptr i8, ptr %1461, i32 4
  store volatile i32 %1451, ptr %1462, align 4, !tbaa !10
  %1463 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1464 = getelementptr i32, ptr @P3_marking_member_0, i32 %1463
  %1465 = getelementptr i8, ptr %1464, i32 8
  store volatile i32 %1457, ptr %1465, align 4, !tbaa !10
  %1466 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1467 = add nsw i32 %1466, 3
  store volatile i32 %1467, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1468

1468:                                             ; preds = %1449, %1453, %1445, %1441, %1438, %1435
  %1469 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1470 = icmp sgt i32 %1469, 4
  br i1 %1470, label %1471, label %1501

1471:                                             ; preds = %1468
  %1472 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1473 = icmp slt i32 %1472, 4
  br i1 %1473, label %1474, label %1501

1474:                                             ; preds = %1471
  %1475 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1476 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1477 = icmp eq i32 %1475, %1476
  br i1 %1477, label %1478, label %1501

1478:                                             ; preds = %1474
  %1479 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1480 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1481 = icmp eq i32 %1479, %1480
  br i1 %1481, label %1482, label %1501

1482:                                             ; preds = %1478
  %1483 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1484 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1485 = icmp sgt i32 %1484, %1483
  br i1 %1485, label %1486, label %1501

1486:                                             ; preds = %1482
  %1487 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %1487, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1488 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1489 = add nsw i32 %1488, -4
  store volatile i32 %1489, ptr @P2_is_marked, align 4, !tbaa !6
  %1490 = add nsw i32 %1484, %1483
  %1491 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1492 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1491
  store volatile i32 %1483, ptr %1492, align 4, !tbaa !10
  %1493 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1494 = getelementptr i32, ptr @P3_marking_member_0, i32 %1493
  %1495 = getelementptr i8, ptr %1494, i32 4
  store volatile i32 %1484, ptr %1495, align 4, !tbaa !10
  %1496 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1497 = getelementptr i32, ptr @P3_marking_member_0, i32 %1496
  %1498 = getelementptr i8, ptr %1497, i32 8
  store volatile i32 %1490, ptr %1498, align 4, !tbaa !10
  %1499 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1500 = add nsw i32 %1499, 3
  store volatile i32 %1500, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1501

1501:                                             ; preds = %1482, %1486, %1478, %1474, %1471, %1468
  %1502 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1503 = icmp sgt i32 %1502, 4
  br i1 %1503, label %1504, label %1534

1504:                                             ; preds = %1501
  %1505 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1506 = icmp slt i32 %1505, 4
  br i1 %1506, label %1507, label %1534

1507:                                             ; preds = %1504
  %1508 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1509 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1510 = icmp eq i32 %1508, %1509
  br i1 %1510, label %1511, label %1534

1511:                                             ; preds = %1507
  %1512 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1513 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1514 = icmp eq i32 %1512, %1513
  br i1 %1514, label %1515, label %1534

1515:                                             ; preds = %1511
  %1516 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1517 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1518 = icmp sgt i32 %1517, %1516
  br i1 %1518, label %1519, label %1534

1519:                                             ; preds = %1515
  %1520 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %1520, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1521 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1522 = add nsw i32 %1521, -4
  store volatile i32 %1522, ptr @P2_is_marked, align 4, !tbaa !6
  %1523 = add nsw i32 %1517, %1516
  %1524 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1525 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1524
  store volatile i32 %1516, ptr %1525, align 4, !tbaa !10
  %1526 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1527 = getelementptr i32, ptr @P3_marking_member_0, i32 %1526
  %1528 = getelementptr i8, ptr %1527, i32 4
  store volatile i32 %1517, ptr %1528, align 4, !tbaa !10
  %1529 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1530 = getelementptr i32, ptr @P3_marking_member_0, i32 %1529
  %1531 = getelementptr i8, ptr %1530, i32 8
  store volatile i32 %1523, ptr %1531, align 4, !tbaa !10
  %1532 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1533 = add nsw i32 %1532, 3
  store volatile i32 %1533, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1534

1534:                                             ; preds = %1515, %1519, %1511, %1507, %1504, %1501
  %1535 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1536 = icmp sgt i32 %1535, 4
  br i1 %1536, label %1537, label %1567

1537:                                             ; preds = %1534
  %1538 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1539 = icmp slt i32 %1538, 4
  br i1 %1539, label %1540, label %1567

1540:                                             ; preds = %1537
  %1541 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1542 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1543 = icmp eq i32 %1541, %1542
  br i1 %1543, label %1544, label %1567

1544:                                             ; preds = %1540
  %1545 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1546 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1547 = icmp eq i32 %1545, %1546
  br i1 %1547, label %1548, label %1567

1548:                                             ; preds = %1544
  %1549 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1550 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1551 = icmp sgt i32 %1550, %1549
  br i1 %1551, label %1552, label %1567

1552:                                             ; preds = %1548
  %1553 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %1553, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1554 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1555 = add nsw i32 %1554, -4
  store volatile i32 %1555, ptr @P2_is_marked, align 4, !tbaa !6
  %1556 = add nsw i32 %1550, %1549
  %1557 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1558 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1557
  store volatile i32 %1549, ptr %1558, align 4, !tbaa !10
  %1559 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1560 = getelementptr i32, ptr @P3_marking_member_0, i32 %1559
  %1561 = getelementptr i8, ptr %1560, i32 4
  store volatile i32 %1550, ptr %1561, align 4, !tbaa !10
  %1562 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1563 = getelementptr i32, ptr @P3_marking_member_0, i32 %1562
  %1564 = getelementptr i8, ptr %1563, i32 8
  store volatile i32 %1556, ptr %1564, align 4, !tbaa !10
  %1565 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1566 = add nsw i32 %1565, 3
  store volatile i32 %1566, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1567

1567:                                             ; preds = %1548, %1552, %1544, %1540, %1537, %1534
  %1568 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1569 = icmp sgt i32 %1568, 4
  br i1 %1569, label %1570, label %1600

1570:                                             ; preds = %1567
  %1571 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1572 = icmp slt i32 %1571, 4
  br i1 %1572, label %1573, label %1600

1573:                                             ; preds = %1570
  %1574 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1575 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1576 = icmp eq i32 %1574, %1575
  br i1 %1576, label %1577, label %1600

1577:                                             ; preds = %1573
  %1578 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1579 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1580 = icmp eq i32 %1578, %1579
  br i1 %1580, label %1581, label %1600

1581:                                             ; preds = %1577
  %1582 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1583 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1584 = icmp sgt i32 %1583, %1582
  br i1 %1584, label %1585, label %1600

1585:                                             ; preds = %1581
  %1586 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %1586, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1587 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1588 = add nsw i32 %1587, -4
  store volatile i32 %1588, ptr @P2_is_marked, align 4, !tbaa !6
  %1589 = add nsw i32 %1583, %1582
  %1590 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1591 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1590
  store volatile i32 %1582, ptr %1591, align 4, !tbaa !10
  %1592 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1593 = getelementptr i32, ptr @P3_marking_member_0, i32 %1592
  %1594 = getelementptr i8, ptr %1593, i32 4
  store volatile i32 %1583, ptr %1594, align 4, !tbaa !10
  %1595 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1596 = getelementptr i32, ptr @P3_marking_member_0, i32 %1595
  %1597 = getelementptr i8, ptr %1596, i32 8
  store volatile i32 %1589, ptr %1597, align 4, !tbaa !10
  %1598 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1599 = add nsw i32 %1598, 3
  store volatile i32 %1599, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1600

1600:                                             ; preds = %1581, %1585, %1577, %1573, %1570, %1567
  %1601 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1602 = icmp sgt i32 %1601, 4
  br i1 %1602, label %1603, label %1633

1603:                                             ; preds = %1600
  %1604 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1605 = icmp slt i32 %1604, 4
  br i1 %1605, label %1606, label %1633

1606:                                             ; preds = %1603
  %1607 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1608 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1609 = icmp eq i32 %1607, %1608
  br i1 %1609, label %1610, label %1633

1610:                                             ; preds = %1606
  %1611 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1612 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1613 = icmp eq i32 %1611, %1612
  br i1 %1613, label %1614, label %1633

1614:                                             ; preds = %1610
  %1615 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1616 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1617 = icmp sgt i32 %1616, %1615
  br i1 %1617, label %1618, label %1633

1618:                                             ; preds = %1614
  %1619 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %1619, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1620 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1621 = add nsw i32 %1620, -4
  store volatile i32 %1621, ptr @P2_is_marked, align 4, !tbaa !6
  %1622 = add nsw i32 %1616, %1615
  %1623 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1624 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1623
  store volatile i32 %1615, ptr %1624, align 4, !tbaa !10
  %1625 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1626 = getelementptr i32, ptr @P3_marking_member_0, i32 %1625
  %1627 = getelementptr i8, ptr %1626, i32 4
  store volatile i32 %1616, ptr %1627, align 4, !tbaa !10
  %1628 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1629 = getelementptr i32, ptr @P3_marking_member_0, i32 %1628
  %1630 = getelementptr i8, ptr %1629, i32 8
  store volatile i32 %1622, ptr %1630, align 4, !tbaa !10
  %1631 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1632 = add nsw i32 %1631, 3
  store volatile i32 %1632, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1633

1633:                                             ; preds = %1614, %1618, %1610, %1606, %1603, %1600
  %1634 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1635 = icmp sgt i32 %1634, 4
  br i1 %1635, label %1636, label %1666

1636:                                             ; preds = %1633
  %1637 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1638 = icmp slt i32 %1637, 4
  br i1 %1638, label %1639, label %1666

1639:                                             ; preds = %1636
  %1640 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1641 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1642 = icmp eq i32 %1640, %1641
  br i1 %1642, label %1643, label %1666

1643:                                             ; preds = %1639
  %1644 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1645 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1646 = icmp eq i32 %1644, %1645
  br i1 %1646, label %1647, label %1666

1647:                                             ; preds = %1643
  %1648 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1649 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1650 = icmp sgt i32 %1649, %1648
  br i1 %1650, label %1651, label %1666

1651:                                             ; preds = %1647
  %1652 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %1652, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1653 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1654 = add nsw i32 %1653, -4
  store volatile i32 %1654, ptr @P2_is_marked, align 4, !tbaa !6
  %1655 = add nsw i32 %1649, %1648
  %1656 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1657 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1656
  store volatile i32 %1648, ptr %1657, align 4, !tbaa !10
  %1658 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1659 = getelementptr i32, ptr @P3_marking_member_0, i32 %1658
  %1660 = getelementptr i8, ptr %1659, i32 4
  store volatile i32 %1649, ptr %1660, align 4, !tbaa !10
  %1661 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1662 = getelementptr i32, ptr @P3_marking_member_0, i32 %1661
  %1663 = getelementptr i8, ptr %1662, i32 8
  store volatile i32 %1655, ptr %1663, align 4, !tbaa !10
  %1664 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1665 = add nsw i32 %1664, 3
  store volatile i32 %1665, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1666

1666:                                             ; preds = %1647, %1651, %1643, %1639, %1636, %1633
  %1667 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1668 = icmp sgt i32 %1667, 4
  br i1 %1668, label %1669, label %1699

1669:                                             ; preds = %1666
  %1670 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1671 = icmp slt i32 %1670, 4
  br i1 %1671, label %1672, label %1699

1672:                                             ; preds = %1669
  %1673 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1674 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1675 = icmp eq i32 %1673, %1674
  br i1 %1675, label %1676, label %1699

1676:                                             ; preds = %1672
  %1677 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1678 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1679 = icmp eq i32 %1677, %1678
  br i1 %1679, label %1680, label %1699

1680:                                             ; preds = %1676
  %1681 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1682 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1683 = icmp sgt i32 %1682, %1681
  br i1 %1683, label %1684, label %1699

1684:                                             ; preds = %1680
  %1685 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %1685, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1686 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1687 = add nsw i32 %1686, -4
  store volatile i32 %1687, ptr @P2_is_marked, align 4, !tbaa !6
  %1688 = add nsw i32 %1682, %1681
  %1689 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1690 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1689
  store volatile i32 %1681, ptr %1690, align 4, !tbaa !10
  %1691 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1692 = getelementptr i32, ptr @P3_marking_member_0, i32 %1691
  %1693 = getelementptr i8, ptr %1692, i32 4
  store volatile i32 %1682, ptr %1693, align 4, !tbaa !10
  %1694 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1695 = getelementptr i32, ptr @P3_marking_member_0, i32 %1694
  %1696 = getelementptr i8, ptr %1695, i32 8
  store volatile i32 %1688, ptr %1696, align 4, !tbaa !10
  %1697 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1698 = add nsw i32 %1697, 3
  store volatile i32 %1698, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1699

1699:                                             ; preds = %1680, %1684, %1676, %1672, %1669, %1666
  %1700 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1701 = icmp sgt i32 %1700, 4
  br i1 %1701, label %1702, label %1731

1702:                                             ; preds = %1699
  %1703 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1704 = icmp slt i32 %1703, 4
  br i1 %1704, label %1705, label %1731

1705:                                             ; preds = %1702
  %1706 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1707 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1708 = icmp eq i32 %1706, %1707
  br i1 %1708, label %1709, label %1731

1709:                                             ; preds = %1705
  %1710 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1711 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1712 = icmp eq i32 %1710, %1711
  br i1 %1712, label %1713, label %1731

1713:                                             ; preds = %1709
  %1714 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1715 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1716 = icmp sgt i32 %1715, %1714
  br i1 %1716, label %1717, label %1731

1717:                                             ; preds = %1713
  %1718 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1719 = add nsw i32 %1718, -4
  store volatile i32 %1719, ptr @P2_is_marked, align 4, !tbaa !6
  %1720 = add nsw i32 %1715, %1714
  %1721 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1722 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1721
  store volatile i32 %1714, ptr %1722, align 4, !tbaa !10
  %1723 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1724 = getelementptr i32, ptr @P3_marking_member_0, i32 %1723
  %1725 = getelementptr i8, ptr %1724, i32 4
  store volatile i32 %1715, ptr %1725, align 4, !tbaa !10
  %1726 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1727 = getelementptr i32, ptr @P3_marking_member_0, i32 %1726
  %1728 = getelementptr i8, ptr %1727, i32 8
  store volatile i32 %1720, ptr %1728, align 4, !tbaa !10
  %1729 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1730 = add nsw i32 %1729, 3
  store volatile i32 %1730, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1731

1731:                                             ; preds = %1713, %1717, %1709, %1705, %1702, %1699
  %1732 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1733 = icmp sgt i32 %1732, 4
  br i1 %1733, label %1734, label %1764

1734:                                             ; preds = %1731
  %1735 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1736 = icmp slt i32 %1735, 4
  br i1 %1736, label %1737, label %1764

1737:                                             ; preds = %1734
  %1738 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1739 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1740 = icmp eq i32 %1738, %1739
  br i1 %1740, label %1741, label %1764

1741:                                             ; preds = %1737
  %1742 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1743 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1744 = icmp eq i32 %1742, %1743
  br i1 %1744, label %1745, label %1764

1745:                                             ; preds = %1741
  %1746 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1747 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1748 = icmp sgt i32 %1747, %1746
  br i1 %1748, label %1749, label %1764

1749:                                             ; preds = %1745
  %1750 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %1750, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1751 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1752 = add nsw i32 %1751, -4
  store volatile i32 %1752, ptr @P2_is_marked, align 4, !tbaa !6
  %1753 = add nsw i32 %1747, %1746
  %1754 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1755 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1754
  store volatile i32 %1746, ptr %1755, align 4, !tbaa !10
  %1756 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1757 = getelementptr i32, ptr @P3_marking_member_0, i32 %1756
  %1758 = getelementptr i8, ptr %1757, i32 4
  store volatile i32 %1747, ptr %1758, align 4, !tbaa !10
  %1759 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1760 = getelementptr i32, ptr @P3_marking_member_0, i32 %1759
  %1761 = getelementptr i8, ptr %1760, i32 8
  store volatile i32 %1753, ptr %1761, align 4, !tbaa !10
  %1762 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1763 = add nsw i32 %1762, 3
  store volatile i32 %1763, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1764

1764:                                             ; preds = %1745, %1749, %1741, %1737, %1734, %1731
  %1765 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1766 = icmp sgt i32 %1765, 4
  br i1 %1766, label %1767, label %1796

1767:                                             ; preds = %1764
  %1768 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1769 = icmp slt i32 %1768, 4
  br i1 %1769, label %1770, label %1796

1770:                                             ; preds = %1767
  %1771 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1772 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1773 = icmp eq i32 %1771, %1772
  br i1 %1773, label %1774, label %1796

1774:                                             ; preds = %1770
  %1775 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1776 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1777 = icmp eq i32 %1775, %1776
  br i1 %1777, label %1778, label %1796

1778:                                             ; preds = %1774
  %1779 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1780 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1781 = icmp sgt i32 %1780, %1779
  br i1 %1781, label %1782, label %1796

1782:                                             ; preds = %1778
  %1783 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1784 = add nsw i32 %1783, -4
  store volatile i32 %1784, ptr @P2_is_marked, align 4, !tbaa !6
  %1785 = add nsw i32 %1780, %1779
  %1786 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1787 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1786
  store volatile i32 %1779, ptr %1787, align 4, !tbaa !10
  %1788 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1789 = getelementptr i32, ptr @P3_marking_member_0, i32 %1788
  %1790 = getelementptr i8, ptr %1789, i32 4
  store volatile i32 %1780, ptr %1790, align 4, !tbaa !10
  %1791 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1792 = getelementptr i32, ptr @P3_marking_member_0, i32 %1791
  %1793 = getelementptr i8, ptr %1792, i32 8
  store volatile i32 %1785, ptr %1793, align 4, !tbaa !10
  %1794 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1795 = add nsw i32 %1794, 3
  store volatile i32 %1795, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1796

1796:                                             ; preds = %1778, %1782, %1774, %1770, %1767, %1764
  %1797 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1798 = icmp sgt i32 %1797, 4
  br i1 %1798, label %1799, label %1829

1799:                                             ; preds = %1796
  %1800 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1801 = icmp slt i32 %1800, 4
  br i1 %1801, label %1802, label %1829

1802:                                             ; preds = %1799
  %1803 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1804 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1805 = icmp eq i32 %1803, %1804
  br i1 %1805, label %1806, label %1829

1806:                                             ; preds = %1802
  %1807 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1808 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1809 = icmp eq i32 %1807, %1808
  br i1 %1809, label %1810, label %1829

1810:                                             ; preds = %1806
  %1811 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1812 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1813 = icmp sgt i32 %1812, %1811
  br i1 %1813, label %1814, label %1829

1814:                                             ; preds = %1810
  %1815 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %1815, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1816 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1817 = add nsw i32 %1816, -4
  store volatile i32 %1817, ptr @P2_is_marked, align 4, !tbaa !6
  %1818 = add nsw i32 %1812, %1811
  %1819 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1820 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1819
  store volatile i32 %1811, ptr %1820, align 4, !tbaa !10
  %1821 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1822 = getelementptr i32, ptr @P3_marking_member_0, i32 %1821
  %1823 = getelementptr i8, ptr %1822, i32 4
  store volatile i32 %1812, ptr %1823, align 4, !tbaa !10
  %1824 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1825 = getelementptr i32, ptr @P3_marking_member_0, i32 %1824
  %1826 = getelementptr i8, ptr %1825, i32 8
  store volatile i32 %1818, ptr %1826, align 4, !tbaa !10
  %1827 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1828 = add nsw i32 %1827, 3
  store volatile i32 %1828, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1829

1829:                                             ; preds = %1810, %1814, %1806, %1802, %1799, %1796
  %1830 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1831 = icmp sgt i32 %1830, 4
  br i1 %1831, label %1832, label %1861

1832:                                             ; preds = %1829
  %1833 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1834 = icmp slt i32 %1833, 4
  br i1 %1834, label %1835, label %1861

1835:                                             ; preds = %1832
  %1836 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1837 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1838 = icmp eq i32 %1836, %1837
  br i1 %1838, label %1839, label %1861

1839:                                             ; preds = %1835
  %1840 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1841 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1842 = icmp eq i32 %1840, %1841
  br i1 %1842, label %1843, label %1861

1843:                                             ; preds = %1839
  %1844 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1845 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1846 = icmp sgt i32 %1845, %1844
  br i1 %1846, label %1847, label %1861

1847:                                             ; preds = %1843
  %1848 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1849 = add nsw i32 %1848, -4
  store volatile i32 %1849, ptr @P2_is_marked, align 4, !tbaa !6
  %1850 = add nsw i32 %1845, %1844
  %1851 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1852 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1851
  store volatile i32 %1844, ptr %1852, align 4, !tbaa !10
  %1853 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1854 = getelementptr i32, ptr @P3_marking_member_0, i32 %1853
  %1855 = getelementptr i8, ptr %1854, i32 4
  store volatile i32 %1845, ptr %1855, align 4, !tbaa !10
  %1856 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1857 = getelementptr i32, ptr @P3_marking_member_0, i32 %1856
  %1858 = getelementptr i8, ptr %1857, i32 8
  store volatile i32 %1850, ptr %1858, align 4, !tbaa !10
  %1859 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1860 = add nsw i32 %1859, 3
  store volatile i32 %1860, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1861

1861:                                             ; preds = %1843, %1847, %1839, %1835, %1832, %1829
  %1862 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1863 = icmp sgt i32 %1862, 4
  br i1 %1863, label %1864, label %1894

1864:                                             ; preds = %1861
  %1865 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1866 = icmp slt i32 %1865, 4
  br i1 %1866, label %1867, label %1894

1867:                                             ; preds = %1864
  %1868 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1869 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1870 = icmp eq i32 %1868, %1869
  br i1 %1870, label %1871, label %1894

1871:                                             ; preds = %1867
  %1872 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1873 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1874 = icmp eq i32 %1872, %1873
  br i1 %1874, label %1875, label %1894

1875:                                             ; preds = %1871
  %1876 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1877 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1878 = icmp sgt i32 %1877, %1876
  br i1 %1878, label %1879, label %1894

1879:                                             ; preds = %1875
  %1880 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %1880, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1881 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1882 = add nsw i32 %1881, -4
  store volatile i32 %1882, ptr @P2_is_marked, align 4, !tbaa !6
  %1883 = add nsw i32 %1877, %1876
  %1884 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1885 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1884
  store volatile i32 %1876, ptr %1885, align 4, !tbaa !10
  %1886 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1887 = getelementptr i32, ptr @P3_marking_member_0, i32 %1886
  %1888 = getelementptr i8, ptr %1887, i32 4
  store volatile i32 %1877, ptr %1888, align 4, !tbaa !10
  %1889 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1890 = getelementptr i32, ptr @P3_marking_member_0, i32 %1889
  %1891 = getelementptr i8, ptr %1890, i32 8
  store volatile i32 %1883, ptr %1891, align 4, !tbaa !10
  %1892 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1893 = add nsw i32 %1892, 3
  store volatile i32 %1893, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1894

1894:                                             ; preds = %1875, %1879, %1871, %1867, %1864, %1861
  %1895 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1896 = icmp sgt i32 %1895, 4
  br i1 %1896, label %1897, label %1926

1897:                                             ; preds = %1894
  %1898 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1899 = icmp slt i32 %1898, 4
  br i1 %1899, label %1900, label %1926

1900:                                             ; preds = %1897
  %1901 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1902 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1903 = icmp eq i32 %1901, %1902
  br i1 %1903, label %1904, label %1926

1904:                                             ; preds = %1900
  %1905 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1906 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1907 = icmp eq i32 %1905, %1906
  br i1 %1907, label %1908, label %1926

1908:                                             ; preds = %1904
  %1909 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1910 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1911 = icmp sgt i32 %1910, %1909
  br i1 %1911, label %1912, label %1926

1912:                                             ; preds = %1908
  %1913 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1914 = add nsw i32 %1913, -4
  store volatile i32 %1914, ptr @P2_is_marked, align 4, !tbaa !6
  %1915 = add nsw i32 %1910, %1909
  %1916 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1917 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1916
  store volatile i32 %1909, ptr %1917, align 4, !tbaa !10
  %1918 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1919 = getelementptr i32, ptr @P3_marking_member_0, i32 %1918
  %1920 = getelementptr i8, ptr %1919, i32 4
  store volatile i32 %1910, ptr %1920, align 4, !tbaa !10
  %1921 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1922 = getelementptr i32, ptr @P3_marking_member_0, i32 %1921
  %1923 = getelementptr i8, ptr %1922, i32 8
  store volatile i32 %1915, ptr %1923, align 4, !tbaa !10
  %1924 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1925 = add nsw i32 %1924, 3
  store volatile i32 %1925, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1926

1926:                                             ; preds = %1908, %1912, %1904, %1900, %1897, %1894
  %1927 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1928 = icmp sgt i32 %1927, 4
  br i1 %1928, label %1929, label %1959

1929:                                             ; preds = %1926
  %1930 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1931 = icmp slt i32 %1930, 4
  br i1 %1931, label %1932, label %1959

1932:                                             ; preds = %1929
  %1933 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1934 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1935 = icmp eq i32 %1933, %1934
  br i1 %1935, label %1936, label %1959

1936:                                             ; preds = %1932
  %1937 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1938 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %1939 = icmp eq i32 %1937, %1938
  br i1 %1939, label %1940, label %1959

1940:                                             ; preds = %1936
  %1941 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1942 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1943 = icmp sgt i32 %1942, %1941
  br i1 %1943, label %1944, label %1959

1944:                                             ; preds = %1940
  %1945 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %1945, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1946 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1947 = add nsw i32 %1946, -4
  store volatile i32 %1947, ptr @P2_is_marked, align 4, !tbaa !6
  %1948 = add nsw i32 %1942, %1941
  %1949 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1950 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1949
  store volatile i32 %1941, ptr %1950, align 4, !tbaa !10
  %1951 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1952 = getelementptr i32, ptr @P3_marking_member_0, i32 %1951
  %1953 = getelementptr i8, ptr %1952, i32 4
  store volatile i32 %1942, ptr %1953, align 4, !tbaa !10
  %1954 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1955 = getelementptr i32, ptr @P3_marking_member_0, i32 %1954
  %1956 = getelementptr i8, ptr %1955, i32 8
  store volatile i32 %1948, ptr %1956, align 4, !tbaa !10
  %1957 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1958 = add nsw i32 %1957, 3
  store volatile i32 %1958, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1959

1959:                                             ; preds = %1940, %1944, %1936, %1932, %1929, %1926
  %1960 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1961 = icmp sgt i32 %1960, 4
  br i1 %1961, label %1962, label %1992

1962:                                             ; preds = %1959
  %1963 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1964 = icmp slt i32 %1963, 4
  br i1 %1964, label %1965, label %1992

1965:                                             ; preds = %1962
  %1966 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1967 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1968 = icmp eq i32 %1966, %1967
  br i1 %1968, label %1969, label %1992

1969:                                             ; preds = %1965
  %1970 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1971 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %1972 = icmp eq i32 %1970, %1971
  br i1 %1972, label %1973, label %1992

1973:                                             ; preds = %1969
  %1974 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %1975 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %1976 = icmp sgt i32 %1975, %1974
  br i1 %1976, label %1977, label %1992

1977:                                             ; preds = %1973
  %1978 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %1978, ptr @P2_marking_member_0, align 4, !tbaa !10
  %1979 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1980 = add nsw i32 %1979, -4
  store volatile i32 %1980, ptr @P2_is_marked, align 4, !tbaa !6
  %1981 = add nsw i32 %1975, %1974
  %1982 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1983 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %1982
  store volatile i32 %1974, ptr %1983, align 4, !tbaa !10
  %1984 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1985 = getelementptr i32, ptr @P3_marking_member_0, i32 %1984
  %1986 = getelementptr i8, ptr %1985, i32 4
  store volatile i32 %1975, ptr %1986, align 4, !tbaa !10
  %1987 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1988 = getelementptr i32, ptr @P3_marking_member_0, i32 %1987
  %1989 = getelementptr i8, ptr %1988, i32 8
  store volatile i32 %1981, ptr %1989, align 4, !tbaa !10
  %1990 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1991 = add nsw i32 %1990, 3
  store volatile i32 %1991, ptr @P3_is_marked, align 4, !tbaa !6
  br label %1992

1992:                                             ; preds = %1973, %1977, %1969, %1965, %1962, %1959
  %1993 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %1994 = icmp sgt i32 %1993, 4
  br i1 %1994, label %1995, label %2025

1995:                                             ; preds = %1992
  %1996 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %1997 = icmp slt i32 %1996, 4
  br i1 %1997, label %1998, label %2025

1998:                                             ; preds = %1995
  %1999 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2000 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2001 = icmp eq i32 %1999, %2000
  br i1 %2001, label %2002, label %2025

2002:                                             ; preds = %1998
  %2003 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2004 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2005 = icmp eq i32 %2003, %2004
  br i1 %2005, label %2006, label %2025

2006:                                             ; preds = %2002
  %2007 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2008 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2009 = icmp sgt i32 %2008, %2007
  br i1 %2009, label %2010, label %2025

2010:                                             ; preds = %2006
  %2011 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %2011, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2012 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2013 = add nsw i32 %2012, -4
  store volatile i32 %2013, ptr @P2_is_marked, align 4, !tbaa !6
  %2014 = add nsw i32 %2008, %2007
  %2015 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2016 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2015
  store volatile i32 %2007, ptr %2016, align 4, !tbaa !10
  %2017 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2018 = getelementptr i32, ptr @P3_marking_member_0, i32 %2017
  %2019 = getelementptr i8, ptr %2018, i32 4
  store volatile i32 %2008, ptr %2019, align 4, !tbaa !10
  %2020 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2021 = getelementptr i32, ptr @P3_marking_member_0, i32 %2020
  %2022 = getelementptr i8, ptr %2021, i32 8
  store volatile i32 %2014, ptr %2022, align 4, !tbaa !10
  %2023 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2024 = add nsw i32 %2023, 3
  store volatile i32 %2024, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2025

2025:                                             ; preds = %2006, %2010, %2002, %1998, %1995, %1992
  %2026 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2027 = icmp sgt i32 %2026, 4
  br i1 %2027, label %2028, label %2057

2028:                                             ; preds = %2025
  %2029 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2030 = icmp slt i32 %2029, 4
  br i1 %2030, label %2031, label %2057

2031:                                             ; preds = %2028
  %2032 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2033 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2034 = icmp eq i32 %2032, %2033
  br i1 %2034, label %2035, label %2057

2035:                                             ; preds = %2031
  %2036 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2037 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2038 = icmp eq i32 %2036, %2037
  br i1 %2038, label %2039, label %2057

2039:                                             ; preds = %2035
  %2040 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2041 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2042 = icmp sgt i32 %2041, %2040
  br i1 %2042, label %2043, label %2057

2043:                                             ; preds = %2039
  %2044 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2045 = add nsw i32 %2044, -4
  store volatile i32 %2045, ptr @P2_is_marked, align 4, !tbaa !6
  %2046 = add nsw i32 %2041, %2040
  %2047 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2048 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2047
  store volatile i32 %2040, ptr %2048, align 4, !tbaa !10
  %2049 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2050 = getelementptr i32, ptr @P3_marking_member_0, i32 %2049
  %2051 = getelementptr i8, ptr %2050, i32 4
  store volatile i32 %2041, ptr %2051, align 4, !tbaa !10
  %2052 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2053 = getelementptr i32, ptr @P3_marking_member_0, i32 %2052
  %2054 = getelementptr i8, ptr %2053, i32 8
  store volatile i32 %2046, ptr %2054, align 4, !tbaa !10
  %2055 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2056 = add nsw i32 %2055, 3
  store volatile i32 %2056, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2057

2057:                                             ; preds = %2039, %2043, %2035, %2031, %2028, %2025
  %2058 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2059 = icmp sgt i32 %2058, 4
  br i1 %2059, label %2060, label %2090

2060:                                             ; preds = %2057
  %2061 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2062 = icmp slt i32 %2061, 4
  br i1 %2062, label %2063, label %2090

2063:                                             ; preds = %2060
  %2064 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2065 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2066 = icmp eq i32 %2064, %2065
  br i1 %2066, label %2067, label %2090

2067:                                             ; preds = %2063
  %2068 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2069 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2070 = icmp eq i32 %2068, %2069
  br i1 %2070, label %2071, label %2090

2071:                                             ; preds = %2067
  %2072 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2073 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2074 = icmp sgt i32 %2073, %2072
  br i1 %2074, label %2075, label %2090

2075:                                             ; preds = %2071
  %2076 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %2076, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2077 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2078 = add nsw i32 %2077, -4
  store volatile i32 %2078, ptr @P2_is_marked, align 4, !tbaa !6
  %2079 = add nsw i32 %2073, %2072
  %2080 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2081 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2080
  store volatile i32 %2072, ptr %2081, align 4, !tbaa !10
  %2082 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2083 = getelementptr i32, ptr @P3_marking_member_0, i32 %2082
  %2084 = getelementptr i8, ptr %2083, i32 4
  store volatile i32 %2073, ptr %2084, align 4, !tbaa !10
  %2085 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2086 = getelementptr i32, ptr @P3_marking_member_0, i32 %2085
  %2087 = getelementptr i8, ptr %2086, i32 8
  store volatile i32 %2079, ptr %2087, align 4, !tbaa !10
  %2088 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2089 = add nsw i32 %2088, 3
  store volatile i32 %2089, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2090

2090:                                             ; preds = %2071, %2075, %2067, %2063, %2060, %2057
  %2091 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2092 = icmp sgt i32 %2091, 4
  br i1 %2092, label %2093, label %2122

2093:                                             ; preds = %2090
  %2094 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2095 = icmp slt i32 %2094, 4
  br i1 %2095, label %2096, label %2122

2096:                                             ; preds = %2093
  %2097 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2098 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2099 = icmp eq i32 %2097, %2098
  br i1 %2099, label %2100, label %2122

2100:                                             ; preds = %2096
  %2101 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2102 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2103 = icmp eq i32 %2101, %2102
  br i1 %2103, label %2104, label %2122

2104:                                             ; preds = %2100
  %2105 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2106 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2107 = icmp sgt i32 %2106, %2105
  br i1 %2107, label %2108, label %2122

2108:                                             ; preds = %2104
  %2109 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2110 = add nsw i32 %2109, -4
  store volatile i32 %2110, ptr @P2_is_marked, align 4, !tbaa !6
  %2111 = add nsw i32 %2106, %2105
  %2112 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2113 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2112
  store volatile i32 %2105, ptr %2113, align 4, !tbaa !10
  %2114 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2115 = getelementptr i32, ptr @P3_marking_member_0, i32 %2114
  %2116 = getelementptr i8, ptr %2115, i32 4
  store volatile i32 %2106, ptr %2116, align 4, !tbaa !10
  %2117 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2118 = getelementptr i32, ptr @P3_marking_member_0, i32 %2117
  %2119 = getelementptr i8, ptr %2118, i32 8
  store volatile i32 %2111, ptr %2119, align 4, !tbaa !10
  %2120 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2121 = add nsw i32 %2120, 3
  store volatile i32 %2121, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2122

2122:                                             ; preds = %2104, %2108, %2100, %2096, %2093, %2090
  %2123 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2124 = icmp sgt i32 %2123, 4
  br i1 %2124, label %2125, label %2155

2125:                                             ; preds = %2122
  %2126 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2127 = icmp slt i32 %2126, 4
  br i1 %2127, label %2128, label %2155

2128:                                             ; preds = %2125
  %2129 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2130 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2131 = icmp eq i32 %2129, %2130
  br i1 %2131, label %2132, label %2155

2132:                                             ; preds = %2128
  %2133 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2134 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2135 = icmp eq i32 %2133, %2134
  br i1 %2135, label %2136, label %2155

2136:                                             ; preds = %2132
  %2137 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2138 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2139 = icmp sgt i32 %2138, %2137
  br i1 %2139, label %2140, label %2155

2140:                                             ; preds = %2136
  %2141 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %2141, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2142 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2143 = add nsw i32 %2142, -4
  store volatile i32 %2143, ptr @P2_is_marked, align 4, !tbaa !6
  %2144 = add nsw i32 %2138, %2137
  %2145 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2146 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2145
  store volatile i32 %2137, ptr %2146, align 4, !tbaa !10
  %2147 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2148 = getelementptr i32, ptr @P3_marking_member_0, i32 %2147
  %2149 = getelementptr i8, ptr %2148, i32 4
  store volatile i32 %2138, ptr %2149, align 4, !tbaa !10
  %2150 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2151 = getelementptr i32, ptr @P3_marking_member_0, i32 %2150
  %2152 = getelementptr i8, ptr %2151, i32 8
  store volatile i32 %2144, ptr %2152, align 4, !tbaa !10
  %2153 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2154 = add nsw i32 %2153, 3
  store volatile i32 %2154, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2155

2155:                                             ; preds = %2136, %2140, %2132, %2128, %2125, %2122
  %2156 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2157 = icmp sgt i32 %2156, 4
  br i1 %2157, label %2158, label %2188

2158:                                             ; preds = %2155
  %2159 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2160 = icmp slt i32 %2159, 4
  br i1 %2160, label %2161, label %2188

2161:                                             ; preds = %2158
  %2162 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2163 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2164 = icmp eq i32 %2162, %2163
  br i1 %2164, label %2165, label %2188

2165:                                             ; preds = %2161
  %2166 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2167 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2168 = icmp eq i32 %2166, %2167
  br i1 %2168, label %2169, label %2188

2169:                                             ; preds = %2165
  %2170 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2171 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2172 = icmp sgt i32 %2171, %2170
  br i1 %2172, label %2173, label %2188

2173:                                             ; preds = %2169
  %2174 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %2174, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2175 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2176 = add nsw i32 %2175, -4
  store volatile i32 %2176, ptr @P2_is_marked, align 4, !tbaa !6
  %2177 = add nsw i32 %2171, %2170
  %2178 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2179 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2178
  store volatile i32 %2170, ptr %2179, align 4, !tbaa !10
  %2180 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2181 = getelementptr i32, ptr @P3_marking_member_0, i32 %2180
  %2182 = getelementptr i8, ptr %2181, i32 4
  store volatile i32 %2171, ptr %2182, align 4, !tbaa !10
  %2183 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2184 = getelementptr i32, ptr @P3_marking_member_0, i32 %2183
  %2185 = getelementptr i8, ptr %2184, i32 8
  store volatile i32 %2177, ptr %2185, align 4, !tbaa !10
  %2186 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2187 = add nsw i32 %2186, 3
  store volatile i32 %2187, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2188

2188:                                             ; preds = %2169, %2173, %2165, %2161, %2158, %2155
  %2189 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2190 = icmp sgt i32 %2189, 4
  br i1 %2190, label %2191, label %2221

2191:                                             ; preds = %2188
  %2192 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2193 = icmp slt i32 %2192, 4
  br i1 %2193, label %2194, label %2221

2194:                                             ; preds = %2191
  %2195 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2196 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2197 = icmp eq i32 %2195, %2196
  br i1 %2197, label %2198, label %2221

2198:                                             ; preds = %2194
  %2199 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2200 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2201 = icmp eq i32 %2199, %2200
  br i1 %2201, label %2202, label %2221

2202:                                             ; preds = %2198
  %2203 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2204 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2205 = icmp sgt i32 %2204, %2203
  br i1 %2205, label %2206, label %2221

2206:                                             ; preds = %2202
  %2207 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %2207, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2208 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2209 = add nsw i32 %2208, -4
  store volatile i32 %2209, ptr @P2_is_marked, align 4, !tbaa !6
  %2210 = add nsw i32 %2204, %2203
  %2211 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2212 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2211
  store volatile i32 %2203, ptr %2212, align 4, !tbaa !10
  %2213 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2214 = getelementptr i32, ptr @P3_marking_member_0, i32 %2213
  %2215 = getelementptr i8, ptr %2214, i32 4
  store volatile i32 %2204, ptr %2215, align 4, !tbaa !10
  %2216 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2217 = getelementptr i32, ptr @P3_marking_member_0, i32 %2216
  %2218 = getelementptr i8, ptr %2217, i32 8
  store volatile i32 %2210, ptr %2218, align 4, !tbaa !10
  %2219 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2220 = add nsw i32 %2219, 3
  store volatile i32 %2220, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2221

2221:                                             ; preds = %2202, %2206, %2198, %2194, %2191, %2188
  %2222 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2223 = icmp sgt i32 %2222, 4
  br i1 %2223, label %2224, label %2254

2224:                                             ; preds = %2221
  %2225 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2226 = icmp slt i32 %2225, 4
  br i1 %2226, label %2227, label %2254

2227:                                             ; preds = %2224
  %2228 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2229 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2230 = icmp eq i32 %2228, %2229
  br i1 %2230, label %2231, label %2254

2231:                                             ; preds = %2227
  %2232 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2233 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2234 = icmp eq i32 %2232, %2233
  br i1 %2234, label %2235, label %2254

2235:                                             ; preds = %2231
  %2236 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2237 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2238 = icmp sgt i32 %2237, %2236
  br i1 %2238, label %2239, label %2254

2239:                                             ; preds = %2235
  %2240 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %2240, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2241 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2242 = add nsw i32 %2241, -4
  store volatile i32 %2242, ptr @P2_is_marked, align 4, !tbaa !6
  %2243 = add nsw i32 %2237, %2236
  %2244 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2245 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2244
  store volatile i32 %2236, ptr %2245, align 4, !tbaa !10
  %2246 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2247 = getelementptr i32, ptr @P3_marking_member_0, i32 %2246
  %2248 = getelementptr i8, ptr %2247, i32 4
  store volatile i32 %2237, ptr %2248, align 4, !tbaa !10
  %2249 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2250 = getelementptr i32, ptr @P3_marking_member_0, i32 %2249
  %2251 = getelementptr i8, ptr %2250, i32 8
  store volatile i32 %2243, ptr %2251, align 4, !tbaa !10
  %2252 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2253 = add nsw i32 %2252, 3
  store volatile i32 %2253, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2254

2254:                                             ; preds = %2235, %2239, %2231, %2227, %2224, %2221
  %2255 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2256 = icmp sgt i32 %2255, 4
  br i1 %2256, label %2257, label %2287

2257:                                             ; preds = %2254
  %2258 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2259 = icmp slt i32 %2258, 4
  br i1 %2259, label %2260, label %2287

2260:                                             ; preds = %2257
  %2261 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2262 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2263 = icmp eq i32 %2261, %2262
  br i1 %2263, label %2264, label %2287

2264:                                             ; preds = %2260
  %2265 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2266 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2267 = icmp eq i32 %2265, %2266
  br i1 %2267, label %2268, label %2287

2268:                                             ; preds = %2264
  %2269 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2270 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2271 = icmp sgt i32 %2270, %2269
  br i1 %2271, label %2272, label %2287

2272:                                             ; preds = %2268
  %2273 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %2273, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2274 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2275 = add nsw i32 %2274, -4
  store volatile i32 %2275, ptr @P2_is_marked, align 4, !tbaa !6
  %2276 = add nsw i32 %2270, %2269
  %2277 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2278 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2277
  store volatile i32 %2269, ptr %2278, align 4, !tbaa !10
  %2279 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2280 = getelementptr i32, ptr @P3_marking_member_0, i32 %2279
  %2281 = getelementptr i8, ptr %2280, i32 4
  store volatile i32 %2270, ptr %2281, align 4, !tbaa !10
  %2282 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2283 = getelementptr i32, ptr @P3_marking_member_0, i32 %2282
  %2284 = getelementptr i8, ptr %2283, i32 8
  store volatile i32 %2276, ptr %2284, align 4, !tbaa !10
  %2285 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2286 = add nsw i32 %2285, 3
  store volatile i32 %2286, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2287

2287:                                             ; preds = %2268, %2272, %2264, %2260, %2257, %2254
  %2288 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2289 = icmp sgt i32 %2288, 4
  br i1 %2289, label %2290, label %2319

2290:                                             ; preds = %2287
  %2291 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2292 = icmp slt i32 %2291, 4
  br i1 %2292, label %2293, label %2319

2293:                                             ; preds = %2290
  %2294 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2295 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2296 = icmp eq i32 %2294, %2295
  br i1 %2296, label %2297, label %2319

2297:                                             ; preds = %2293
  %2298 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2299 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2300 = icmp eq i32 %2298, %2299
  br i1 %2300, label %2301, label %2319

2301:                                             ; preds = %2297
  %2302 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2303 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2304 = icmp sgt i32 %2303, %2302
  br i1 %2304, label %2305, label %2319

2305:                                             ; preds = %2301
  %2306 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2307 = add nsw i32 %2306, -4
  store volatile i32 %2307, ptr @P2_is_marked, align 4, !tbaa !6
  %2308 = add nsw i32 %2303, %2302
  %2309 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2310 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2309
  store volatile i32 %2302, ptr %2310, align 4, !tbaa !10
  %2311 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2312 = getelementptr i32, ptr @P3_marking_member_0, i32 %2311
  %2313 = getelementptr i8, ptr %2312, i32 4
  store volatile i32 %2303, ptr %2313, align 4, !tbaa !10
  %2314 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2315 = getelementptr i32, ptr @P3_marking_member_0, i32 %2314
  %2316 = getelementptr i8, ptr %2315, i32 8
  store volatile i32 %2308, ptr %2316, align 4, !tbaa !10
  %2317 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2318 = add nsw i32 %2317, 3
  store volatile i32 %2318, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2319

2319:                                             ; preds = %2301, %2305, %2297, %2293, %2290, %2287
  %2320 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2321 = icmp sgt i32 %2320, 4
  br i1 %2321, label %2322, label %2352

2322:                                             ; preds = %2319
  %2323 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2324 = icmp slt i32 %2323, 4
  br i1 %2324, label %2325, label %2352

2325:                                             ; preds = %2322
  %2326 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2327 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2328 = icmp eq i32 %2326, %2327
  br i1 %2328, label %2329, label %2352

2329:                                             ; preds = %2325
  %2330 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2331 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2332 = icmp eq i32 %2330, %2331
  br i1 %2332, label %2333, label %2352

2333:                                             ; preds = %2329
  %2334 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2335 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2336 = icmp sgt i32 %2335, %2334
  br i1 %2336, label %2337, label %2352

2337:                                             ; preds = %2333
  %2338 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %2338, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2339 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2340 = add nsw i32 %2339, -4
  store volatile i32 %2340, ptr @P2_is_marked, align 4, !tbaa !6
  %2341 = add nsw i32 %2335, %2334
  %2342 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2343 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2342
  store volatile i32 %2334, ptr %2343, align 4, !tbaa !10
  %2344 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2345 = getelementptr i32, ptr @P3_marking_member_0, i32 %2344
  %2346 = getelementptr i8, ptr %2345, i32 4
  store volatile i32 %2335, ptr %2346, align 4, !tbaa !10
  %2347 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2348 = getelementptr i32, ptr @P3_marking_member_0, i32 %2347
  %2349 = getelementptr i8, ptr %2348, i32 8
  store volatile i32 %2341, ptr %2349, align 4, !tbaa !10
  %2350 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2351 = add nsw i32 %2350, 3
  store volatile i32 %2351, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2352

2352:                                             ; preds = %2333, %2337, %2329, %2325, %2322, %2319
  %2353 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2354 = icmp sgt i32 %2353, 4
  br i1 %2354, label %2355, label %2384

2355:                                             ; preds = %2352
  %2356 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2357 = icmp slt i32 %2356, 4
  br i1 %2357, label %2358, label %2384

2358:                                             ; preds = %2355
  %2359 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2360 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2361 = icmp eq i32 %2359, %2360
  br i1 %2361, label %2362, label %2384

2362:                                             ; preds = %2358
  %2363 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2364 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2365 = icmp eq i32 %2363, %2364
  br i1 %2365, label %2366, label %2384

2366:                                             ; preds = %2362
  %2367 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2368 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2369 = icmp sgt i32 %2368, %2367
  br i1 %2369, label %2370, label %2384

2370:                                             ; preds = %2366
  %2371 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2372 = add nsw i32 %2371, -4
  store volatile i32 %2372, ptr @P2_is_marked, align 4, !tbaa !6
  %2373 = add nsw i32 %2368, %2367
  %2374 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2375 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2374
  store volatile i32 %2367, ptr %2375, align 4, !tbaa !10
  %2376 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2377 = getelementptr i32, ptr @P3_marking_member_0, i32 %2376
  %2378 = getelementptr i8, ptr %2377, i32 4
  store volatile i32 %2368, ptr %2378, align 4, !tbaa !10
  %2379 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2380 = getelementptr i32, ptr @P3_marking_member_0, i32 %2379
  %2381 = getelementptr i8, ptr %2380, i32 8
  store volatile i32 %2373, ptr %2381, align 4, !tbaa !10
  %2382 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2383 = add nsw i32 %2382, 3
  store volatile i32 %2383, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2384

2384:                                             ; preds = %2366, %2370, %2362, %2358, %2355, %2352
  %2385 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2386 = icmp sgt i32 %2385, 4
  br i1 %2386, label %2387, label %2417

2387:                                             ; preds = %2384
  %2388 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2389 = icmp slt i32 %2388, 4
  br i1 %2389, label %2390, label %2417

2390:                                             ; preds = %2387
  %2391 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2392 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2393 = icmp eq i32 %2391, %2392
  br i1 %2393, label %2394, label %2417

2394:                                             ; preds = %2390
  %2395 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2396 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2397 = icmp eq i32 %2395, %2396
  br i1 %2397, label %2398, label %2417

2398:                                             ; preds = %2394
  %2399 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2400 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2401 = icmp sgt i32 %2400, %2399
  br i1 %2401, label %2402, label %2417

2402:                                             ; preds = %2398
  %2403 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %2403, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2404 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2405 = add nsw i32 %2404, -4
  store volatile i32 %2405, ptr @P2_is_marked, align 4, !tbaa !6
  %2406 = add nsw i32 %2400, %2399
  %2407 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2408 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2407
  store volatile i32 %2399, ptr %2408, align 4, !tbaa !10
  %2409 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2410 = getelementptr i32, ptr @P3_marking_member_0, i32 %2409
  %2411 = getelementptr i8, ptr %2410, i32 4
  store volatile i32 %2400, ptr %2411, align 4, !tbaa !10
  %2412 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2413 = getelementptr i32, ptr @P3_marking_member_0, i32 %2412
  %2414 = getelementptr i8, ptr %2413, i32 8
  store volatile i32 %2406, ptr %2414, align 4, !tbaa !10
  %2415 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2416 = add nsw i32 %2415, 3
  store volatile i32 %2416, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2417

2417:                                             ; preds = %2398, %2402, %2394, %2390, %2387, %2384
  %2418 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2419 = icmp sgt i32 %2418, 4
  br i1 %2419, label %2420, label %2449

2420:                                             ; preds = %2417
  %2421 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2422 = icmp slt i32 %2421, 4
  br i1 %2422, label %2423, label %2449

2423:                                             ; preds = %2420
  %2424 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2425 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2426 = icmp eq i32 %2424, %2425
  br i1 %2426, label %2427, label %2449

2427:                                             ; preds = %2423
  %2428 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2429 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2430 = icmp eq i32 %2428, %2429
  br i1 %2430, label %2431, label %2449

2431:                                             ; preds = %2427
  %2432 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2433 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2434 = icmp sgt i32 %2433, %2432
  br i1 %2434, label %2435, label %2449

2435:                                             ; preds = %2431
  %2436 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2437 = add nsw i32 %2436, -4
  store volatile i32 %2437, ptr @P2_is_marked, align 4, !tbaa !6
  %2438 = add nsw i32 %2433, %2432
  %2439 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2440 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2439
  store volatile i32 %2432, ptr %2440, align 4, !tbaa !10
  %2441 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2442 = getelementptr i32, ptr @P3_marking_member_0, i32 %2441
  %2443 = getelementptr i8, ptr %2442, i32 4
  store volatile i32 %2433, ptr %2443, align 4, !tbaa !10
  %2444 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2445 = getelementptr i32, ptr @P3_marking_member_0, i32 %2444
  %2446 = getelementptr i8, ptr %2445, i32 8
  store volatile i32 %2438, ptr %2446, align 4, !tbaa !10
  %2447 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2448 = add nsw i32 %2447, 3
  store volatile i32 %2448, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2449

2449:                                             ; preds = %2431, %2435, %2427, %2423, %2420, %2417
  %2450 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2451 = icmp sgt i32 %2450, 4
  br i1 %2451, label %2452, label %2482

2452:                                             ; preds = %2449
  %2453 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2454 = icmp slt i32 %2453, 4
  br i1 %2454, label %2455, label %2482

2455:                                             ; preds = %2452
  %2456 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2457 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2458 = icmp eq i32 %2456, %2457
  br i1 %2458, label %2459, label %2482

2459:                                             ; preds = %2455
  %2460 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2461 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2462 = icmp eq i32 %2460, %2461
  br i1 %2462, label %2463, label %2482

2463:                                             ; preds = %2459
  %2464 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2465 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2466 = icmp sgt i32 %2465, %2464
  br i1 %2466, label %2467, label %2482

2467:                                             ; preds = %2463
  %2468 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %2468, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2469 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2470 = add nsw i32 %2469, -4
  store volatile i32 %2470, ptr @P2_is_marked, align 4, !tbaa !6
  %2471 = add nsw i32 %2465, %2464
  %2472 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2473 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2472
  store volatile i32 %2464, ptr %2473, align 4, !tbaa !10
  %2474 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2475 = getelementptr i32, ptr @P3_marking_member_0, i32 %2474
  %2476 = getelementptr i8, ptr %2475, i32 4
  store volatile i32 %2465, ptr %2476, align 4, !tbaa !10
  %2477 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2478 = getelementptr i32, ptr @P3_marking_member_0, i32 %2477
  %2479 = getelementptr i8, ptr %2478, i32 8
  store volatile i32 %2471, ptr %2479, align 4, !tbaa !10
  %2480 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2481 = add nsw i32 %2480, 3
  store volatile i32 %2481, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2482

2482:                                             ; preds = %2463, %2467, %2459, %2455, %2452, %2449
  %2483 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2484 = icmp sgt i32 %2483, 4
  br i1 %2484, label %2485, label %2514

2485:                                             ; preds = %2482
  %2486 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2487 = icmp slt i32 %2486, 4
  br i1 %2487, label %2488, label %2514

2488:                                             ; preds = %2485
  %2489 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2490 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2491 = icmp eq i32 %2489, %2490
  br i1 %2491, label %2492, label %2514

2492:                                             ; preds = %2488
  %2493 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2494 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2495 = icmp eq i32 %2493, %2494
  br i1 %2495, label %2496, label %2514

2496:                                             ; preds = %2492
  %2497 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2498 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2499 = icmp sgt i32 %2498, %2497
  br i1 %2499, label %2500, label %2514

2500:                                             ; preds = %2496
  %2501 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2502 = add nsw i32 %2501, -4
  store volatile i32 %2502, ptr @P2_is_marked, align 4, !tbaa !6
  %2503 = add nsw i32 %2498, %2497
  %2504 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2505 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2504
  store volatile i32 %2497, ptr %2505, align 4, !tbaa !10
  %2506 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2507 = getelementptr i32, ptr @P3_marking_member_0, i32 %2506
  %2508 = getelementptr i8, ptr %2507, i32 4
  store volatile i32 %2498, ptr %2508, align 4, !tbaa !10
  %2509 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2510 = getelementptr i32, ptr @P3_marking_member_0, i32 %2509
  %2511 = getelementptr i8, ptr %2510, i32 8
  store volatile i32 %2503, ptr %2511, align 4, !tbaa !10
  %2512 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2513 = add nsw i32 %2512, 3
  store volatile i32 %2513, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2514

2514:                                             ; preds = %2496, %2500, %2492, %2488, %2485, %2482
  %2515 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2516 = icmp sgt i32 %2515, 4
  br i1 %2516, label %2517, label %2547

2517:                                             ; preds = %2514
  %2518 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2519 = icmp slt i32 %2518, 4
  br i1 %2519, label %2520, label %2547

2520:                                             ; preds = %2517
  %2521 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2522 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2523 = icmp eq i32 %2521, %2522
  br i1 %2523, label %2524, label %2547

2524:                                             ; preds = %2520
  %2525 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2526 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2527 = icmp eq i32 %2525, %2526
  br i1 %2527, label %2528, label %2547

2528:                                             ; preds = %2524
  %2529 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2530 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2531 = icmp sgt i32 %2530, %2529
  br i1 %2531, label %2532, label %2547

2532:                                             ; preds = %2528
  %2533 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %2533, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2534 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2535 = add nsw i32 %2534, -4
  store volatile i32 %2535, ptr @P2_is_marked, align 4, !tbaa !6
  %2536 = add nsw i32 %2530, %2529
  %2537 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2538 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2537
  store volatile i32 %2529, ptr %2538, align 4, !tbaa !10
  %2539 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2540 = getelementptr i32, ptr @P3_marking_member_0, i32 %2539
  %2541 = getelementptr i8, ptr %2540, i32 4
  store volatile i32 %2530, ptr %2541, align 4, !tbaa !10
  %2542 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2543 = getelementptr i32, ptr @P3_marking_member_0, i32 %2542
  %2544 = getelementptr i8, ptr %2543, i32 8
  store volatile i32 %2536, ptr %2544, align 4, !tbaa !10
  %2545 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2546 = add nsw i32 %2545, 3
  store volatile i32 %2546, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2547

2547:                                             ; preds = %2528, %2532, %2524, %2520, %2517, %2514
  %2548 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2549 = icmp sgt i32 %2548, 4
  br i1 %2549, label %2550, label %2580

2550:                                             ; preds = %2547
  %2551 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2552 = icmp slt i32 %2551, 4
  br i1 %2552, label %2553, label %2580

2553:                                             ; preds = %2550
  %2554 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2555 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2556 = icmp eq i32 %2554, %2555
  br i1 %2556, label %2557, label %2580

2557:                                             ; preds = %2553
  %2558 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2559 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2560 = icmp eq i32 %2558, %2559
  br i1 %2560, label %2561, label %2580

2561:                                             ; preds = %2557
  %2562 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2563 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2564 = icmp sgt i32 %2563, %2562
  br i1 %2564, label %2565, label %2580

2565:                                             ; preds = %2561
  %2566 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %2566, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2567 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2568 = add nsw i32 %2567, -4
  store volatile i32 %2568, ptr @P2_is_marked, align 4, !tbaa !6
  %2569 = add nsw i32 %2563, %2562
  %2570 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2571 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2570
  store volatile i32 %2562, ptr %2571, align 4, !tbaa !10
  %2572 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2573 = getelementptr i32, ptr @P3_marking_member_0, i32 %2572
  %2574 = getelementptr i8, ptr %2573, i32 4
  store volatile i32 %2563, ptr %2574, align 4, !tbaa !10
  %2575 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2576 = getelementptr i32, ptr @P3_marking_member_0, i32 %2575
  %2577 = getelementptr i8, ptr %2576, i32 8
  store volatile i32 %2569, ptr %2577, align 4, !tbaa !10
  %2578 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2579 = add nsw i32 %2578, 3
  store volatile i32 %2579, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2580

2580:                                             ; preds = %2561, %2565, %2557, %2553, %2550, %2547
  %2581 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2582 = icmp sgt i32 %2581, 4
  br i1 %2582, label %2583, label %2613

2583:                                             ; preds = %2580
  %2584 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2585 = icmp slt i32 %2584, 4
  br i1 %2585, label %2586, label %2613

2586:                                             ; preds = %2583
  %2587 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2588 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2589 = icmp eq i32 %2587, %2588
  br i1 %2589, label %2590, label %2613

2590:                                             ; preds = %2586
  %2591 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2592 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2593 = icmp eq i32 %2591, %2592
  br i1 %2593, label %2594, label %2613

2594:                                             ; preds = %2590
  %2595 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2596 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2597 = icmp sgt i32 %2596, %2595
  br i1 %2597, label %2598, label %2613

2598:                                             ; preds = %2594
  %2599 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %2599, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2600 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2601 = add nsw i32 %2600, -4
  store volatile i32 %2601, ptr @P2_is_marked, align 4, !tbaa !6
  %2602 = add nsw i32 %2596, %2595
  %2603 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2604 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2603
  store volatile i32 %2595, ptr %2604, align 4, !tbaa !10
  %2605 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2606 = getelementptr i32, ptr @P3_marking_member_0, i32 %2605
  %2607 = getelementptr i8, ptr %2606, i32 4
  store volatile i32 %2596, ptr %2607, align 4, !tbaa !10
  %2608 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2609 = getelementptr i32, ptr @P3_marking_member_0, i32 %2608
  %2610 = getelementptr i8, ptr %2609, i32 8
  store volatile i32 %2602, ptr %2610, align 4, !tbaa !10
  %2611 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2612 = add nsw i32 %2611, 3
  store volatile i32 %2612, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2613

2613:                                             ; preds = %2594, %2598, %2590, %2586, %2583, %2580
  %2614 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2615 = icmp sgt i32 %2614, 4
  br i1 %2615, label %2616, label %2645

2616:                                             ; preds = %2613
  %2617 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2618 = icmp slt i32 %2617, 4
  br i1 %2618, label %2619, label %2645

2619:                                             ; preds = %2616
  %2620 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2621 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2622 = icmp eq i32 %2620, %2621
  br i1 %2622, label %2623, label %2645

2623:                                             ; preds = %2619
  %2624 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2625 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2626 = icmp eq i32 %2624, %2625
  br i1 %2626, label %2627, label %2645

2627:                                             ; preds = %2623
  %2628 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2629 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2630 = icmp sgt i32 %2629, %2628
  br i1 %2630, label %2631, label %2645

2631:                                             ; preds = %2627
  %2632 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2633 = add nsw i32 %2632, -4
  store volatile i32 %2633, ptr @P2_is_marked, align 4, !tbaa !6
  %2634 = add nsw i32 %2629, %2628
  %2635 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2636 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2635
  store volatile i32 %2628, ptr %2636, align 4, !tbaa !10
  %2637 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2638 = getelementptr i32, ptr @P3_marking_member_0, i32 %2637
  %2639 = getelementptr i8, ptr %2638, i32 4
  store volatile i32 %2629, ptr %2639, align 4, !tbaa !10
  %2640 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2641 = getelementptr i32, ptr @P3_marking_member_0, i32 %2640
  %2642 = getelementptr i8, ptr %2641, i32 8
  store volatile i32 %2634, ptr %2642, align 4, !tbaa !10
  %2643 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2644 = add nsw i32 %2643, 3
  store volatile i32 %2644, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2645

2645:                                             ; preds = %2627, %2631, %2623, %2619, %2616, %2613
  %2646 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2647 = icmp sgt i32 %2646, 4
  br i1 %2647, label %2648, label %2678

2648:                                             ; preds = %2645
  %2649 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2650 = icmp slt i32 %2649, 4
  br i1 %2650, label %2651, label %2678

2651:                                             ; preds = %2648
  %2652 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2653 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2654 = icmp eq i32 %2652, %2653
  br i1 %2654, label %2655, label %2678

2655:                                             ; preds = %2651
  %2656 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2657 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2658 = icmp eq i32 %2656, %2657
  br i1 %2658, label %2659, label %2678

2659:                                             ; preds = %2655
  %2660 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2661 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2662 = icmp sgt i32 %2661, %2660
  br i1 %2662, label %2663, label %2678

2663:                                             ; preds = %2659
  %2664 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %2664, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2665 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2666 = add nsw i32 %2665, -4
  store volatile i32 %2666, ptr @P2_is_marked, align 4, !tbaa !6
  %2667 = add nsw i32 %2661, %2660
  %2668 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2669 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2668
  store volatile i32 %2660, ptr %2669, align 4, !tbaa !10
  %2670 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2671 = getelementptr i32, ptr @P3_marking_member_0, i32 %2670
  %2672 = getelementptr i8, ptr %2671, i32 4
  store volatile i32 %2661, ptr %2672, align 4, !tbaa !10
  %2673 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2674 = getelementptr i32, ptr @P3_marking_member_0, i32 %2673
  %2675 = getelementptr i8, ptr %2674, i32 8
  store volatile i32 %2667, ptr %2675, align 4, !tbaa !10
  %2676 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2677 = add nsw i32 %2676, 3
  store volatile i32 %2677, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2678

2678:                                             ; preds = %2659, %2663, %2655, %2651, %2648, %2645
  %2679 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2680 = icmp sgt i32 %2679, 4
  br i1 %2680, label %2681, label %2710

2681:                                             ; preds = %2678
  %2682 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2683 = icmp slt i32 %2682, 4
  br i1 %2683, label %2684, label %2710

2684:                                             ; preds = %2681
  %2685 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2686 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2687 = icmp eq i32 %2685, %2686
  br i1 %2687, label %2688, label %2710

2688:                                             ; preds = %2684
  %2689 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2690 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2691 = icmp eq i32 %2689, %2690
  br i1 %2691, label %2692, label %2710

2692:                                             ; preds = %2688
  %2693 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2694 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2695 = icmp sgt i32 %2694, %2693
  br i1 %2695, label %2696, label %2710

2696:                                             ; preds = %2692
  %2697 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2698 = add nsw i32 %2697, -4
  store volatile i32 %2698, ptr @P2_is_marked, align 4, !tbaa !6
  %2699 = add nsw i32 %2694, %2693
  %2700 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2701 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2700
  store volatile i32 %2693, ptr %2701, align 4, !tbaa !10
  %2702 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2703 = getelementptr i32, ptr @P3_marking_member_0, i32 %2702
  %2704 = getelementptr i8, ptr %2703, i32 4
  store volatile i32 %2694, ptr %2704, align 4, !tbaa !10
  %2705 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2706 = getelementptr i32, ptr @P3_marking_member_0, i32 %2705
  %2707 = getelementptr i8, ptr %2706, i32 8
  store volatile i32 %2699, ptr %2707, align 4, !tbaa !10
  %2708 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2709 = add nsw i32 %2708, 3
  store volatile i32 %2709, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2710

2710:                                             ; preds = %2692, %2696, %2688, %2684, %2681, %2678
  %2711 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2712 = icmp sgt i32 %2711, 4
  br i1 %2712, label %2713, label %2743

2713:                                             ; preds = %2710
  %2714 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2715 = icmp slt i32 %2714, 4
  br i1 %2715, label %2716, label %2743

2716:                                             ; preds = %2713
  %2717 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2718 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2719 = icmp eq i32 %2717, %2718
  br i1 %2719, label %2720, label %2743

2720:                                             ; preds = %2716
  %2721 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2722 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2723 = icmp eq i32 %2721, %2722
  br i1 %2723, label %2724, label %2743

2724:                                             ; preds = %2720
  %2725 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2726 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2727 = icmp sgt i32 %2726, %2725
  br i1 %2727, label %2728, label %2743

2728:                                             ; preds = %2724
  %2729 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %2729, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2730 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2731 = add nsw i32 %2730, -4
  store volatile i32 %2731, ptr @P2_is_marked, align 4, !tbaa !6
  %2732 = add nsw i32 %2726, %2725
  %2733 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2734 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2733
  store volatile i32 %2725, ptr %2734, align 4, !tbaa !10
  %2735 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2736 = getelementptr i32, ptr @P3_marking_member_0, i32 %2735
  %2737 = getelementptr i8, ptr %2736, i32 4
  store volatile i32 %2726, ptr %2737, align 4, !tbaa !10
  %2738 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2739 = getelementptr i32, ptr @P3_marking_member_0, i32 %2738
  %2740 = getelementptr i8, ptr %2739, i32 8
  store volatile i32 %2732, ptr %2740, align 4, !tbaa !10
  %2741 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2742 = add nsw i32 %2741, 3
  store volatile i32 %2742, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2743

2743:                                             ; preds = %2724, %2728, %2720, %2716, %2713, %2710
  %2744 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2745 = icmp sgt i32 %2744, 4
  br i1 %2745, label %2746, label %2776

2746:                                             ; preds = %2743
  %2747 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2748 = icmp slt i32 %2747, 4
  br i1 %2748, label %2749, label %2776

2749:                                             ; preds = %2746
  %2750 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2751 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2752 = icmp eq i32 %2750, %2751
  br i1 %2752, label %2753, label %2776

2753:                                             ; preds = %2749
  %2754 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2755 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2756 = icmp eq i32 %2754, %2755
  br i1 %2756, label %2757, label %2776

2757:                                             ; preds = %2753
  %2758 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2759 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2760 = icmp sgt i32 %2759, %2758
  br i1 %2760, label %2761, label %2776

2761:                                             ; preds = %2757
  %2762 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %2762, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2763 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2764 = add nsw i32 %2763, -4
  store volatile i32 %2764, ptr @P2_is_marked, align 4, !tbaa !6
  %2765 = add nsw i32 %2759, %2758
  %2766 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2767 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2766
  store volatile i32 %2758, ptr %2767, align 4, !tbaa !10
  %2768 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2769 = getelementptr i32, ptr @P3_marking_member_0, i32 %2768
  %2770 = getelementptr i8, ptr %2769, i32 4
  store volatile i32 %2759, ptr %2770, align 4, !tbaa !10
  %2771 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2772 = getelementptr i32, ptr @P3_marking_member_0, i32 %2771
  %2773 = getelementptr i8, ptr %2772, i32 8
  store volatile i32 %2765, ptr %2773, align 4, !tbaa !10
  %2774 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2775 = add nsw i32 %2774, 3
  store volatile i32 %2775, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2776

2776:                                             ; preds = %2757, %2761, %2753, %2749, %2746, %2743
  %2777 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2778 = icmp sgt i32 %2777, 4
  br i1 %2778, label %2779, label %2809

2779:                                             ; preds = %2776
  %2780 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2781 = icmp slt i32 %2780, 4
  br i1 %2781, label %2782, label %2809

2782:                                             ; preds = %2779
  %2783 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2784 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2785 = icmp eq i32 %2783, %2784
  br i1 %2785, label %2786, label %2809

2786:                                             ; preds = %2782
  %2787 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2788 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2789 = icmp eq i32 %2787, %2788
  br i1 %2789, label %2790, label %2809

2790:                                             ; preds = %2786
  %2791 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2792 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2793 = icmp sgt i32 %2792, %2791
  br i1 %2793, label %2794, label %2809

2794:                                             ; preds = %2790
  %2795 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %2795, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2796 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2797 = add nsw i32 %2796, -4
  store volatile i32 %2797, ptr @P2_is_marked, align 4, !tbaa !6
  %2798 = add nsw i32 %2792, %2791
  %2799 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2800 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2799
  store volatile i32 %2791, ptr %2800, align 4, !tbaa !10
  %2801 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2802 = getelementptr i32, ptr @P3_marking_member_0, i32 %2801
  %2803 = getelementptr i8, ptr %2802, i32 4
  store volatile i32 %2792, ptr %2803, align 4, !tbaa !10
  %2804 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2805 = getelementptr i32, ptr @P3_marking_member_0, i32 %2804
  %2806 = getelementptr i8, ptr %2805, i32 8
  store volatile i32 %2798, ptr %2806, align 4, !tbaa !10
  %2807 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2808 = add nsw i32 %2807, 3
  store volatile i32 %2808, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2809

2809:                                             ; preds = %2790, %2794, %2786, %2782, %2779, %2776
  %2810 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2811 = icmp sgt i32 %2810, 4
  br i1 %2811, label %2812, label %2842

2812:                                             ; preds = %2809
  %2813 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2814 = icmp slt i32 %2813, 4
  br i1 %2814, label %2815, label %2842

2815:                                             ; preds = %2812
  %2816 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2817 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2818 = icmp eq i32 %2816, %2817
  br i1 %2818, label %2819, label %2842

2819:                                             ; preds = %2815
  %2820 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2821 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2822 = icmp eq i32 %2820, %2821
  br i1 %2822, label %2823, label %2842

2823:                                             ; preds = %2819
  %2824 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2825 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2826 = icmp sgt i32 %2825, %2824
  br i1 %2826, label %2827, label %2842

2827:                                             ; preds = %2823
  %2828 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %2828, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2829 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2830 = add nsw i32 %2829, -4
  store volatile i32 %2830, ptr @P2_is_marked, align 4, !tbaa !6
  %2831 = add nsw i32 %2825, %2824
  %2832 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2833 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2832
  store volatile i32 %2824, ptr %2833, align 4, !tbaa !10
  %2834 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2835 = getelementptr i32, ptr @P3_marking_member_0, i32 %2834
  %2836 = getelementptr i8, ptr %2835, i32 4
  store volatile i32 %2825, ptr %2836, align 4, !tbaa !10
  %2837 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2838 = getelementptr i32, ptr @P3_marking_member_0, i32 %2837
  %2839 = getelementptr i8, ptr %2838, i32 8
  store volatile i32 %2831, ptr %2839, align 4, !tbaa !10
  %2840 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2841 = add nsw i32 %2840, 3
  store volatile i32 %2841, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2842

2842:                                             ; preds = %2823, %2827, %2819, %2815, %2812, %2809
  %2843 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2844 = icmp sgt i32 %2843, 4
  br i1 %2844, label %2845, label %2875

2845:                                             ; preds = %2842
  %2846 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2847 = icmp slt i32 %2846, 4
  br i1 %2847, label %2848, label %2875

2848:                                             ; preds = %2845
  %2849 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2850 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2851 = icmp eq i32 %2849, %2850
  br i1 %2851, label %2852, label %2875

2852:                                             ; preds = %2848
  %2853 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2854 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2855 = icmp eq i32 %2853, %2854
  br i1 %2855, label %2856, label %2875

2856:                                             ; preds = %2852
  %2857 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2858 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2859 = icmp sgt i32 %2858, %2857
  br i1 %2859, label %2860, label %2875

2860:                                             ; preds = %2856
  %2861 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %2861, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2862 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2863 = add nsw i32 %2862, -4
  store volatile i32 %2863, ptr @P2_is_marked, align 4, !tbaa !6
  %2864 = add nsw i32 %2858, %2857
  %2865 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2866 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2865
  store volatile i32 %2857, ptr %2866, align 4, !tbaa !10
  %2867 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2868 = getelementptr i32, ptr @P3_marking_member_0, i32 %2867
  %2869 = getelementptr i8, ptr %2868, i32 4
  store volatile i32 %2858, ptr %2869, align 4, !tbaa !10
  %2870 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2871 = getelementptr i32, ptr @P3_marking_member_0, i32 %2870
  %2872 = getelementptr i8, ptr %2871, i32 8
  store volatile i32 %2864, ptr %2872, align 4, !tbaa !10
  %2873 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2874 = add nsw i32 %2873, 3
  store volatile i32 %2874, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2875

2875:                                             ; preds = %2856, %2860, %2852, %2848, %2845, %2842
  %2876 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2877 = icmp sgt i32 %2876, 4
  br i1 %2877, label %2878, label %2907

2878:                                             ; preds = %2875
  %2879 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2880 = icmp slt i32 %2879, 4
  br i1 %2880, label %2881, label %2907

2881:                                             ; preds = %2878
  %2882 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2883 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2884 = icmp eq i32 %2882, %2883
  br i1 %2884, label %2885, label %2907

2885:                                             ; preds = %2881
  %2886 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2887 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2888 = icmp eq i32 %2886, %2887
  br i1 %2888, label %2889, label %2907

2889:                                             ; preds = %2885
  %2890 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2891 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2892 = icmp sgt i32 %2891, %2890
  br i1 %2892, label %2893, label %2907

2893:                                             ; preds = %2889
  %2894 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2895 = add nsw i32 %2894, -4
  store volatile i32 %2895, ptr @P2_is_marked, align 4, !tbaa !6
  %2896 = add nsw i32 %2891, %2890
  %2897 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2898 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2897
  store volatile i32 %2890, ptr %2898, align 4, !tbaa !10
  %2899 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2900 = getelementptr i32, ptr @P3_marking_member_0, i32 %2899
  %2901 = getelementptr i8, ptr %2900, i32 4
  store volatile i32 %2891, ptr %2901, align 4, !tbaa !10
  %2902 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2903 = getelementptr i32, ptr @P3_marking_member_0, i32 %2902
  %2904 = getelementptr i8, ptr %2903, i32 8
  store volatile i32 %2896, ptr %2904, align 4, !tbaa !10
  %2905 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2906 = add nsw i32 %2905, 3
  store volatile i32 %2906, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2907

2907:                                             ; preds = %2889, %2893, %2885, %2881, %2878, %2875
  %2908 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2909 = icmp sgt i32 %2908, 4
  br i1 %2909, label %2910, label %2940

2910:                                             ; preds = %2907
  %2911 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2912 = icmp slt i32 %2911, 4
  br i1 %2912, label %2913, label %2940

2913:                                             ; preds = %2910
  %2914 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2915 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2916 = icmp eq i32 %2914, %2915
  br i1 %2916, label %2917, label %2940

2917:                                             ; preds = %2913
  %2918 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2919 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2920 = icmp eq i32 %2918, %2919
  br i1 %2920, label %2921, label %2940

2921:                                             ; preds = %2917
  %2922 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2923 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2924 = icmp sgt i32 %2923, %2922
  br i1 %2924, label %2925, label %2940

2925:                                             ; preds = %2921
  %2926 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %2926, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2927 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2928 = add nsw i32 %2927, -4
  store volatile i32 %2928, ptr @P2_is_marked, align 4, !tbaa !6
  %2929 = add nsw i32 %2923, %2922
  %2930 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2931 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2930
  store volatile i32 %2922, ptr %2931, align 4, !tbaa !10
  %2932 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2933 = getelementptr i32, ptr @P3_marking_member_0, i32 %2932
  %2934 = getelementptr i8, ptr %2933, i32 4
  store volatile i32 %2923, ptr %2934, align 4, !tbaa !10
  %2935 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2936 = getelementptr i32, ptr @P3_marking_member_0, i32 %2935
  %2937 = getelementptr i8, ptr %2936, i32 8
  store volatile i32 %2929, ptr %2937, align 4, !tbaa !10
  %2938 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2939 = add nsw i32 %2938, 3
  store volatile i32 %2939, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2940

2940:                                             ; preds = %2921, %2925, %2917, %2913, %2910, %2907
  %2941 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2942 = icmp sgt i32 %2941, 4
  br i1 %2942, label %2943, label %2972

2943:                                             ; preds = %2940
  %2944 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2945 = icmp slt i32 %2944, 4
  br i1 %2945, label %2946, label %2972

2946:                                             ; preds = %2943
  %2947 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2948 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2949 = icmp eq i32 %2947, %2948
  br i1 %2949, label %2950, label %2972

2950:                                             ; preds = %2946
  %2951 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2952 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2953 = icmp eq i32 %2951, %2952
  br i1 %2953, label %2954, label %2972

2954:                                             ; preds = %2950
  %2955 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2956 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %2957 = icmp sgt i32 %2956, %2955
  br i1 %2957, label %2958, label %2972

2958:                                             ; preds = %2954
  %2959 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2960 = add nsw i32 %2959, -4
  store volatile i32 %2960, ptr @P2_is_marked, align 4, !tbaa !6
  %2961 = add nsw i32 %2956, %2955
  %2962 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2963 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2962
  store volatile i32 %2955, ptr %2963, align 4, !tbaa !10
  %2964 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2965 = getelementptr i32, ptr @P3_marking_member_0, i32 %2964
  %2966 = getelementptr i8, ptr %2965, i32 4
  store volatile i32 %2956, ptr %2966, align 4, !tbaa !10
  %2967 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2968 = getelementptr i32, ptr @P3_marking_member_0, i32 %2967
  %2969 = getelementptr i8, ptr %2968, i32 8
  store volatile i32 %2961, ptr %2969, align 4, !tbaa !10
  %2970 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2971 = add nsw i32 %2970, 3
  store volatile i32 %2971, ptr @P3_is_marked, align 4, !tbaa !6
  br label %2972

2972:                                             ; preds = %2954, %2958, %2950, %2946, %2943, %2940
  %2973 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2974 = icmp sgt i32 %2973, 4
  br i1 %2974, label %2975, label %3005

2975:                                             ; preds = %2972
  %2976 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2977 = icmp slt i32 %2976, 4
  br i1 %2977, label %2978, label %3005

2978:                                             ; preds = %2975
  %2979 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2980 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2981 = icmp eq i32 %2979, %2980
  br i1 %2981, label %2982, label %3005

2982:                                             ; preds = %2978
  %2983 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2984 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %2985 = icmp eq i32 %2983, %2984
  br i1 %2985, label %2986, label %3005

2986:                                             ; preds = %2982
  %2987 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %2988 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %2989 = icmp sgt i32 %2988, %2987
  br i1 %2989, label %2990, label %3005

2990:                                             ; preds = %2986
  %2991 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %2991, ptr @P2_marking_member_0, align 4, !tbaa !10
  %2992 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %2993 = add nsw i32 %2992, -4
  store volatile i32 %2993, ptr @P2_is_marked, align 4, !tbaa !6
  %2994 = add nsw i32 %2988, %2987
  %2995 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2996 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %2995
  store volatile i32 %2987, ptr %2996, align 4, !tbaa !10
  %2997 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %2998 = getelementptr i32, ptr @P3_marking_member_0, i32 %2997
  %2999 = getelementptr i8, ptr %2998, i32 4
  store volatile i32 %2988, ptr %2999, align 4, !tbaa !10
  %3000 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3001 = getelementptr i32, ptr @P3_marking_member_0, i32 %3000
  %3002 = getelementptr i8, ptr %3001, i32 8
  store volatile i32 %2994, ptr %3002, align 4, !tbaa !10
  %3003 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3004 = add nsw i32 %3003, 3
  store volatile i32 %3004, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3005

3005:                                             ; preds = %2986, %2990, %2982, %2978, %2975, %2972
  %3006 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3007 = icmp sgt i32 %3006, 4
  br i1 %3007, label %3008, label %3037

3008:                                             ; preds = %3005
  %3009 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3010 = icmp slt i32 %3009, 4
  br i1 %3010, label %3011, label %3037

3011:                                             ; preds = %3008
  %3012 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3013 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3014 = icmp eq i32 %3012, %3013
  br i1 %3014, label %3015, label %3037

3015:                                             ; preds = %3011
  %3016 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3017 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3018 = icmp eq i32 %3016, %3017
  br i1 %3018, label %3019, label %3037

3019:                                             ; preds = %3015
  %3020 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3021 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3022 = icmp sgt i32 %3021, %3020
  br i1 %3022, label %3023, label %3037

3023:                                             ; preds = %3019
  %3024 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3025 = add nsw i32 %3024, -4
  store volatile i32 %3025, ptr @P2_is_marked, align 4, !tbaa !6
  %3026 = add nsw i32 %3021, %3020
  %3027 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3028 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3027
  store volatile i32 %3020, ptr %3028, align 4, !tbaa !10
  %3029 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3030 = getelementptr i32, ptr @P3_marking_member_0, i32 %3029
  %3031 = getelementptr i8, ptr %3030, i32 4
  store volatile i32 %3021, ptr %3031, align 4, !tbaa !10
  %3032 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3033 = getelementptr i32, ptr @P3_marking_member_0, i32 %3032
  %3034 = getelementptr i8, ptr %3033, i32 8
  store volatile i32 %3026, ptr %3034, align 4, !tbaa !10
  %3035 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3036 = add nsw i32 %3035, 3
  store volatile i32 %3036, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3037

3037:                                             ; preds = %3019, %3023, %3015, %3011, %3008, %3005
  %3038 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3039 = icmp sgt i32 %3038, 4
  br i1 %3039, label %3040, label %3070

3040:                                             ; preds = %3037
  %3041 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3042 = icmp slt i32 %3041, 4
  br i1 %3042, label %3043, label %3070

3043:                                             ; preds = %3040
  %3044 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3045 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3046 = icmp eq i32 %3044, %3045
  br i1 %3046, label %3047, label %3070

3047:                                             ; preds = %3043
  %3048 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3049 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3050 = icmp eq i32 %3048, %3049
  br i1 %3050, label %3051, label %3070

3051:                                             ; preds = %3047
  %3052 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3053 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3054 = icmp sgt i32 %3053, %3052
  br i1 %3054, label %3055, label %3070

3055:                                             ; preds = %3051
  %3056 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %3056, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3057 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3058 = add nsw i32 %3057, -4
  store volatile i32 %3058, ptr @P2_is_marked, align 4, !tbaa !6
  %3059 = add nsw i32 %3053, %3052
  %3060 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3061 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3060
  store volatile i32 %3052, ptr %3061, align 4, !tbaa !10
  %3062 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3063 = getelementptr i32, ptr @P3_marking_member_0, i32 %3062
  %3064 = getelementptr i8, ptr %3063, i32 4
  store volatile i32 %3053, ptr %3064, align 4, !tbaa !10
  %3065 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3066 = getelementptr i32, ptr @P3_marking_member_0, i32 %3065
  %3067 = getelementptr i8, ptr %3066, i32 8
  store volatile i32 %3059, ptr %3067, align 4, !tbaa !10
  %3068 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3069 = add nsw i32 %3068, 3
  store volatile i32 %3069, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3070

3070:                                             ; preds = %3051, %3055, %3047, %3043, %3040, %3037
  %3071 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3072 = icmp sgt i32 %3071, 4
  br i1 %3072, label %3073, label %3102

3073:                                             ; preds = %3070
  %3074 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3075 = icmp slt i32 %3074, 4
  br i1 %3075, label %3076, label %3102

3076:                                             ; preds = %3073
  %3077 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3078 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3079 = icmp eq i32 %3077, %3078
  br i1 %3079, label %3080, label %3102

3080:                                             ; preds = %3076
  %3081 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3082 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3083 = icmp eq i32 %3081, %3082
  br i1 %3083, label %3084, label %3102

3084:                                             ; preds = %3080
  %3085 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3086 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3087 = icmp sgt i32 %3086, %3085
  br i1 %3087, label %3088, label %3102

3088:                                             ; preds = %3084
  %3089 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3090 = add nsw i32 %3089, -4
  store volatile i32 %3090, ptr @P2_is_marked, align 4, !tbaa !6
  %3091 = add nsw i32 %3086, %3085
  %3092 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3093 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3092
  store volatile i32 %3085, ptr %3093, align 4, !tbaa !10
  %3094 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3095 = getelementptr i32, ptr @P3_marking_member_0, i32 %3094
  %3096 = getelementptr i8, ptr %3095, i32 4
  store volatile i32 %3086, ptr %3096, align 4, !tbaa !10
  %3097 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3098 = getelementptr i32, ptr @P3_marking_member_0, i32 %3097
  %3099 = getelementptr i8, ptr %3098, i32 8
  store volatile i32 %3091, ptr %3099, align 4, !tbaa !10
  %3100 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3101 = add nsw i32 %3100, 3
  store volatile i32 %3101, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3102

3102:                                             ; preds = %3084, %3088, %3080, %3076, %3073, %3070
  %3103 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3104 = icmp sgt i32 %3103, 4
  br i1 %3104, label %3105, label %3135

3105:                                             ; preds = %3102
  %3106 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3107 = icmp slt i32 %3106, 4
  br i1 %3107, label %3108, label %3135

3108:                                             ; preds = %3105
  %3109 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3110 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3111 = icmp eq i32 %3109, %3110
  br i1 %3111, label %3112, label %3135

3112:                                             ; preds = %3108
  %3113 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3114 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3115 = icmp eq i32 %3113, %3114
  br i1 %3115, label %3116, label %3135

3116:                                             ; preds = %3112
  %3117 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3118 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3119 = icmp sgt i32 %3118, %3117
  br i1 %3119, label %3120, label %3135

3120:                                             ; preds = %3116
  %3121 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %3121, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3122 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3123 = add nsw i32 %3122, -4
  store volatile i32 %3123, ptr @P2_is_marked, align 4, !tbaa !6
  %3124 = add nsw i32 %3118, %3117
  %3125 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3126 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3125
  store volatile i32 %3117, ptr %3126, align 4, !tbaa !10
  %3127 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3128 = getelementptr i32, ptr @P3_marking_member_0, i32 %3127
  %3129 = getelementptr i8, ptr %3128, i32 4
  store volatile i32 %3118, ptr %3129, align 4, !tbaa !10
  %3130 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3131 = getelementptr i32, ptr @P3_marking_member_0, i32 %3130
  %3132 = getelementptr i8, ptr %3131, i32 8
  store volatile i32 %3124, ptr %3132, align 4, !tbaa !10
  %3133 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3134 = add nsw i32 %3133, 3
  store volatile i32 %3134, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3135

3135:                                             ; preds = %3116, %3120, %3112, %3108, %3105, %3102
  %3136 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3137 = icmp sgt i32 %3136, 4
  br i1 %3137, label %3138, label %3168

3138:                                             ; preds = %3135
  %3139 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3140 = icmp slt i32 %3139, 4
  br i1 %3140, label %3141, label %3168

3141:                                             ; preds = %3138
  %3142 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3143 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3144 = icmp eq i32 %3142, %3143
  br i1 %3144, label %3145, label %3168

3145:                                             ; preds = %3141
  %3146 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3147 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3148 = icmp eq i32 %3146, %3147
  br i1 %3148, label %3149, label %3168

3149:                                             ; preds = %3145
  %3150 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3151 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3152 = icmp sgt i32 %3151, %3150
  br i1 %3152, label %3153, label %3168

3153:                                             ; preds = %3149
  %3154 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %3154, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3155 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3156 = add nsw i32 %3155, -4
  store volatile i32 %3156, ptr @P2_is_marked, align 4, !tbaa !6
  %3157 = add nsw i32 %3151, %3150
  %3158 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3159 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3158
  store volatile i32 %3150, ptr %3159, align 4, !tbaa !10
  %3160 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3161 = getelementptr i32, ptr @P3_marking_member_0, i32 %3160
  %3162 = getelementptr i8, ptr %3161, i32 4
  store volatile i32 %3151, ptr %3162, align 4, !tbaa !10
  %3163 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3164 = getelementptr i32, ptr @P3_marking_member_0, i32 %3163
  %3165 = getelementptr i8, ptr %3164, i32 8
  store volatile i32 %3157, ptr %3165, align 4, !tbaa !10
  %3166 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3167 = add nsw i32 %3166, 3
  store volatile i32 %3167, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3168

3168:                                             ; preds = %3149, %3153, %3145, %3141, %3138, %3135
  %3169 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3170 = icmp sgt i32 %3169, 4
  br i1 %3170, label %3171, label %3201

3171:                                             ; preds = %3168
  %3172 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3173 = icmp slt i32 %3172, 4
  br i1 %3173, label %3174, label %3201

3174:                                             ; preds = %3171
  %3175 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3176 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3177 = icmp eq i32 %3175, %3176
  br i1 %3177, label %3178, label %3201

3178:                                             ; preds = %3174
  %3179 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3180 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3181 = icmp eq i32 %3179, %3180
  br i1 %3181, label %3182, label %3201

3182:                                             ; preds = %3178
  %3183 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3184 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3185 = icmp sgt i32 %3184, %3183
  br i1 %3185, label %3186, label %3201

3186:                                             ; preds = %3182
  %3187 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %3187, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3188 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3189 = add nsw i32 %3188, -4
  store volatile i32 %3189, ptr @P2_is_marked, align 4, !tbaa !6
  %3190 = add nsw i32 %3184, %3183
  %3191 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3192 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3191
  store volatile i32 %3183, ptr %3192, align 4, !tbaa !10
  %3193 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3194 = getelementptr i32, ptr @P3_marking_member_0, i32 %3193
  %3195 = getelementptr i8, ptr %3194, i32 4
  store volatile i32 %3184, ptr %3195, align 4, !tbaa !10
  %3196 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3197 = getelementptr i32, ptr @P3_marking_member_0, i32 %3196
  %3198 = getelementptr i8, ptr %3197, i32 8
  store volatile i32 %3190, ptr %3198, align 4, !tbaa !10
  %3199 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3200 = add nsw i32 %3199, 3
  store volatile i32 %3200, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3201

3201:                                             ; preds = %3182, %3186, %3178, %3174, %3171, %3168
  %3202 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3203 = icmp sgt i32 %3202, 4
  br i1 %3203, label %3204, label %3233

3204:                                             ; preds = %3201
  %3205 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3206 = icmp slt i32 %3205, 4
  br i1 %3206, label %3207, label %3233

3207:                                             ; preds = %3204
  %3208 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3209 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3210 = icmp eq i32 %3208, %3209
  br i1 %3210, label %3211, label %3233

3211:                                             ; preds = %3207
  %3212 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3213 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3214 = icmp eq i32 %3212, %3213
  br i1 %3214, label %3215, label %3233

3215:                                             ; preds = %3211
  %3216 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3217 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3218 = icmp sgt i32 %3217, %3216
  br i1 %3218, label %3219, label %3233

3219:                                             ; preds = %3215
  %3220 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3221 = add nsw i32 %3220, -4
  store volatile i32 %3221, ptr @P2_is_marked, align 4, !tbaa !6
  %3222 = add nsw i32 %3217, %3216
  %3223 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3224 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3223
  store volatile i32 %3216, ptr %3224, align 4, !tbaa !10
  %3225 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3226 = getelementptr i32, ptr @P3_marking_member_0, i32 %3225
  %3227 = getelementptr i8, ptr %3226, i32 4
  store volatile i32 %3217, ptr %3227, align 4, !tbaa !10
  %3228 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3229 = getelementptr i32, ptr @P3_marking_member_0, i32 %3228
  %3230 = getelementptr i8, ptr %3229, i32 8
  store volatile i32 %3222, ptr %3230, align 4, !tbaa !10
  %3231 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3232 = add nsw i32 %3231, 3
  store volatile i32 %3232, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3233

3233:                                             ; preds = %3215, %3219, %3211, %3207, %3204, %3201
  %3234 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3235 = icmp sgt i32 %3234, 4
  br i1 %3235, label %3236, label %3266

3236:                                             ; preds = %3233
  %3237 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3238 = icmp slt i32 %3237, 4
  br i1 %3238, label %3239, label %3266

3239:                                             ; preds = %3236
  %3240 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3241 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3242 = icmp eq i32 %3240, %3241
  br i1 %3242, label %3243, label %3266

3243:                                             ; preds = %3239
  %3244 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3245 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3246 = icmp eq i32 %3244, %3245
  br i1 %3246, label %3247, label %3266

3247:                                             ; preds = %3243
  %3248 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3249 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3250 = icmp sgt i32 %3249, %3248
  br i1 %3250, label %3251, label %3266

3251:                                             ; preds = %3247
  %3252 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %3252, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3253 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3254 = add nsw i32 %3253, -4
  store volatile i32 %3254, ptr @P2_is_marked, align 4, !tbaa !6
  %3255 = add nsw i32 %3249, %3248
  %3256 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3257 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3256
  store volatile i32 %3248, ptr %3257, align 4, !tbaa !10
  %3258 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3259 = getelementptr i32, ptr @P3_marking_member_0, i32 %3258
  %3260 = getelementptr i8, ptr %3259, i32 4
  store volatile i32 %3249, ptr %3260, align 4, !tbaa !10
  %3261 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3262 = getelementptr i32, ptr @P3_marking_member_0, i32 %3261
  %3263 = getelementptr i8, ptr %3262, i32 8
  store volatile i32 %3255, ptr %3263, align 4, !tbaa !10
  %3264 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3265 = add nsw i32 %3264, 3
  store volatile i32 %3265, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3266

3266:                                             ; preds = %3247, %3251, %3243, %3239, %3236, %3233
  %3267 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3268 = icmp sgt i32 %3267, 4
  br i1 %3268, label %3269, label %3298

3269:                                             ; preds = %3266
  %3270 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3271 = icmp slt i32 %3270, 4
  br i1 %3271, label %3272, label %3298

3272:                                             ; preds = %3269
  %3273 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3274 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3275 = icmp eq i32 %3273, %3274
  br i1 %3275, label %3276, label %3298

3276:                                             ; preds = %3272
  %3277 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3278 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3279 = icmp eq i32 %3277, %3278
  br i1 %3279, label %3280, label %3298

3280:                                             ; preds = %3276
  %3281 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3282 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3283 = icmp sgt i32 %3282, %3281
  br i1 %3283, label %3284, label %3298

3284:                                             ; preds = %3280
  %3285 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3286 = add nsw i32 %3285, -4
  store volatile i32 %3286, ptr @P2_is_marked, align 4, !tbaa !6
  %3287 = add nsw i32 %3282, %3281
  %3288 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3289 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3288
  store volatile i32 %3281, ptr %3289, align 4, !tbaa !10
  %3290 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3291 = getelementptr i32, ptr @P3_marking_member_0, i32 %3290
  %3292 = getelementptr i8, ptr %3291, i32 4
  store volatile i32 %3282, ptr %3292, align 4, !tbaa !10
  %3293 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3294 = getelementptr i32, ptr @P3_marking_member_0, i32 %3293
  %3295 = getelementptr i8, ptr %3294, i32 8
  store volatile i32 %3287, ptr %3295, align 4, !tbaa !10
  %3296 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3297 = add nsw i32 %3296, 3
  store volatile i32 %3297, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3298

3298:                                             ; preds = %3280, %3284, %3276, %3272, %3269, %3266
  %3299 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3300 = icmp sgt i32 %3299, 4
  br i1 %3300, label %3301, label %3331

3301:                                             ; preds = %3298
  %3302 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3303 = icmp slt i32 %3302, 4
  br i1 %3303, label %3304, label %3331

3304:                                             ; preds = %3301
  %3305 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3306 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3307 = icmp eq i32 %3305, %3306
  br i1 %3307, label %3308, label %3331

3308:                                             ; preds = %3304
  %3309 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3310 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3311 = icmp eq i32 %3309, %3310
  br i1 %3311, label %3312, label %3331

3312:                                             ; preds = %3308
  %3313 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3314 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3315 = icmp sgt i32 %3314, %3313
  br i1 %3315, label %3316, label %3331

3316:                                             ; preds = %3312
  %3317 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %3317, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3318 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3319 = add nsw i32 %3318, -4
  store volatile i32 %3319, ptr @P2_is_marked, align 4, !tbaa !6
  %3320 = add nsw i32 %3314, %3313
  %3321 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3322 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3321
  store volatile i32 %3313, ptr %3322, align 4, !tbaa !10
  %3323 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3324 = getelementptr i32, ptr @P3_marking_member_0, i32 %3323
  %3325 = getelementptr i8, ptr %3324, i32 4
  store volatile i32 %3314, ptr %3325, align 4, !tbaa !10
  %3326 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3327 = getelementptr i32, ptr @P3_marking_member_0, i32 %3326
  %3328 = getelementptr i8, ptr %3327, i32 8
  store volatile i32 %3320, ptr %3328, align 4, !tbaa !10
  %3329 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3330 = add nsw i32 %3329, 3
  store volatile i32 %3330, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3331

3331:                                             ; preds = %3312, %3316, %3308, %3304, %3301, %3298
  %3332 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3333 = icmp sgt i32 %3332, 4
  br i1 %3333, label %3334, label %3364

3334:                                             ; preds = %3331
  %3335 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3336 = icmp slt i32 %3335, 4
  br i1 %3336, label %3337, label %3364

3337:                                             ; preds = %3334
  %3338 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3339 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3340 = icmp eq i32 %3338, %3339
  br i1 %3340, label %3341, label %3364

3341:                                             ; preds = %3337
  %3342 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3343 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3344 = icmp eq i32 %3342, %3343
  br i1 %3344, label %3345, label %3364

3345:                                             ; preds = %3341
  %3346 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3347 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3348 = icmp sgt i32 %3347, %3346
  br i1 %3348, label %3349, label %3364

3349:                                             ; preds = %3345
  %3350 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %3350, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3351 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3352 = add nsw i32 %3351, -4
  store volatile i32 %3352, ptr @P2_is_marked, align 4, !tbaa !6
  %3353 = add nsw i32 %3347, %3346
  %3354 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3355 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3354
  store volatile i32 %3346, ptr %3355, align 4, !tbaa !10
  %3356 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3357 = getelementptr i32, ptr @P3_marking_member_0, i32 %3356
  %3358 = getelementptr i8, ptr %3357, i32 4
  store volatile i32 %3347, ptr %3358, align 4, !tbaa !10
  %3359 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3360 = getelementptr i32, ptr @P3_marking_member_0, i32 %3359
  %3361 = getelementptr i8, ptr %3360, i32 8
  store volatile i32 %3353, ptr %3361, align 4, !tbaa !10
  %3362 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3363 = add nsw i32 %3362, 3
  store volatile i32 %3363, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3364

3364:                                             ; preds = %3345, %3349, %3341, %3337, %3334, %3331
  %3365 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3366 = icmp sgt i32 %3365, 4
  br i1 %3366, label %3367, label %3397

3367:                                             ; preds = %3364
  %3368 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3369 = icmp slt i32 %3368, 4
  br i1 %3369, label %3370, label %3397

3370:                                             ; preds = %3367
  %3371 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3372 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3373 = icmp eq i32 %3371, %3372
  br i1 %3373, label %3374, label %3397

3374:                                             ; preds = %3370
  %3375 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3376 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3377 = icmp eq i32 %3375, %3376
  br i1 %3377, label %3378, label %3397

3378:                                             ; preds = %3374
  %3379 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3380 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3381 = icmp sgt i32 %3380, %3379
  br i1 %3381, label %3382, label %3397

3382:                                             ; preds = %3378
  %3383 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %3383, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3384 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3385 = add nsw i32 %3384, -4
  store volatile i32 %3385, ptr @P2_is_marked, align 4, !tbaa !6
  %3386 = add nsw i32 %3380, %3379
  %3387 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3388 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3387
  store volatile i32 %3379, ptr %3388, align 4, !tbaa !10
  %3389 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3390 = getelementptr i32, ptr @P3_marking_member_0, i32 %3389
  %3391 = getelementptr i8, ptr %3390, i32 4
  store volatile i32 %3380, ptr %3391, align 4, !tbaa !10
  %3392 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3393 = getelementptr i32, ptr @P3_marking_member_0, i32 %3392
  %3394 = getelementptr i8, ptr %3393, i32 8
  store volatile i32 %3386, ptr %3394, align 4, !tbaa !10
  %3395 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3396 = add nsw i32 %3395, 3
  store volatile i32 %3396, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3397

3397:                                             ; preds = %3378, %3382, %3374, %3370, %3367, %3364
  %3398 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3399 = icmp sgt i32 %3398, 4
  br i1 %3399, label %3400, label %3430

3400:                                             ; preds = %3397
  %3401 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3402 = icmp slt i32 %3401, 4
  br i1 %3402, label %3403, label %3430

3403:                                             ; preds = %3400
  %3404 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3405 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3406 = icmp eq i32 %3404, %3405
  br i1 %3406, label %3407, label %3430

3407:                                             ; preds = %3403
  %3408 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3409 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3410 = icmp eq i32 %3408, %3409
  br i1 %3410, label %3411, label %3430

3411:                                             ; preds = %3407
  %3412 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3413 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3414 = icmp sgt i32 %3413, %3412
  br i1 %3414, label %3415, label %3430

3415:                                             ; preds = %3411
  %3416 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %3416, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3417 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3418 = add nsw i32 %3417, -4
  store volatile i32 %3418, ptr @P2_is_marked, align 4, !tbaa !6
  %3419 = add nsw i32 %3413, %3412
  %3420 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3421 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3420
  store volatile i32 %3412, ptr %3421, align 4, !tbaa !10
  %3422 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3423 = getelementptr i32, ptr @P3_marking_member_0, i32 %3422
  %3424 = getelementptr i8, ptr %3423, i32 4
  store volatile i32 %3413, ptr %3424, align 4, !tbaa !10
  %3425 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3426 = getelementptr i32, ptr @P3_marking_member_0, i32 %3425
  %3427 = getelementptr i8, ptr %3426, i32 8
  store volatile i32 %3419, ptr %3427, align 4, !tbaa !10
  %3428 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3429 = add nsw i32 %3428, 3
  store volatile i32 %3429, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3430

3430:                                             ; preds = %3411, %3415, %3407, %3403, %3400, %3397
  %3431 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3432 = icmp sgt i32 %3431, 4
  br i1 %3432, label %3433, label %3463

3433:                                             ; preds = %3430
  %3434 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3435 = icmp slt i32 %3434, 4
  br i1 %3435, label %3436, label %3463

3436:                                             ; preds = %3433
  %3437 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3438 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3439 = icmp eq i32 %3437, %3438
  br i1 %3439, label %3440, label %3463

3440:                                             ; preds = %3436
  %3441 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3442 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3443 = icmp eq i32 %3441, %3442
  br i1 %3443, label %3444, label %3463

3444:                                             ; preds = %3440
  %3445 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3446 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3447 = icmp sgt i32 %3446, %3445
  br i1 %3447, label %3448, label %3463

3448:                                             ; preds = %3444
  %3449 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %3449, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3450 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3451 = add nsw i32 %3450, -4
  store volatile i32 %3451, ptr @P2_is_marked, align 4, !tbaa !6
  %3452 = add nsw i32 %3446, %3445
  %3453 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3454 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3453
  store volatile i32 %3445, ptr %3454, align 4, !tbaa !10
  %3455 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3456 = getelementptr i32, ptr @P3_marking_member_0, i32 %3455
  %3457 = getelementptr i8, ptr %3456, i32 4
  store volatile i32 %3446, ptr %3457, align 4, !tbaa !10
  %3458 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3459 = getelementptr i32, ptr @P3_marking_member_0, i32 %3458
  %3460 = getelementptr i8, ptr %3459, i32 8
  store volatile i32 %3452, ptr %3460, align 4, !tbaa !10
  %3461 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3462 = add nsw i32 %3461, 3
  store volatile i32 %3462, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3463

3463:                                             ; preds = %3444, %3448, %3440, %3436, %3433, %3430
  %3464 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3465 = icmp sgt i32 %3464, 4
  br i1 %3465, label %3466, label %3496

3466:                                             ; preds = %3463
  %3467 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3468 = icmp slt i32 %3467, 4
  br i1 %3468, label %3469, label %3496

3469:                                             ; preds = %3466
  %3470 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3471 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3472 = icmp eq i32 %3470, %3471
  br i1 %3472, label %3473, label %3496

3473:                                             ; preds = %3469
  %3474 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3475 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3476 = icmp eq i32 %3474, %3475
  br i1 %3476, label %3477, label %3496

3477:                                             ; preds = %3473
  %3478 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3479 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3480 = icmp sgt i32 %3479, %3478
  br i1 %3480, label %3481, label %3496

3481:                                             ; preds = %3477
  %3482 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %3482, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3483 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3484 = add nsw i32 %3483, -4
  store volatile i32 %3484, ptr @P2_is_marked, align 4, !tbaa !6
  %3485 = add nsw i32 %3479, %3478
  %3486 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3487 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3486
  store volatile i32 %3478, ptr %3487, align 4, !tbaa !10
  %3488 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3489 = getelementptr i32, ptr @P3_marking_member_0, i32 %3488
  %3490 = getelementptr i8, ptr %3489, i32 4
  store volatile i32 %3479, ptr %3490, align 4, !tbaa !10
  %3491 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3492 = getelementptr i32, ptr @P3_marking_member_0, i32 %3491
  %3493 = getelementptr i8, ptr %3492, i32 8
  store volatile i32 %3485, ptr %3493, align 4, !tbaa !10
  %3494 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3495 = add nsw i32 %3494, 3
  store volatile i32 %3495, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3496

3496:                                             ; preds = %3477, %3481, %3473, %3469, %3466, %3463
  %3497 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3498 = icmp sgt i32 %3497, 4
  br i1 %3498, label %3499, label %3529

3499:                                             ; preds = %3496
  %3500 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3501 = icmp slt i32 %3500, 4
  br i1 %3501, label %3502, label %3529

3502:                                             ; preds = %3499
  %3503 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3504 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3505 = icmp eq i32 %3503, %3504
  br i1 %3505, label %3506, label %3529

3506:                                             ; preds = %3502
  %3507 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3508 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3509 = icmp eq i32 %3507, %3508
  br i1 %3509, label %3510, label %3529

3510:                                             ; preds = %3506
  %3511 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3512 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3513 = icmp sgt i32 %3512, %3511
  br i1 %3513, label %3514, label %3529

3514:                                             ; preds = %3510
  %3515 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %3515, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3516 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3517 = add nsw i32 %3516, -4
  store volatile i32 %3517, ptr @P2_is_marked, align 4, !tbaa !6
  %3518 = add nsw i32 %3512, %3511
  %3519 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3520 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3519
  store volatile i32 %3511, ptr %3520, align 4, !tbaa !10
  %3521 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3522 = getelementptr i32, ptr @P3_marking_member_0, i32 %3521
  %3523 = getelementptr i8, ptr %3522, i32 4
  store volatile i32 %3512, ptr %3523, align 4, !tbaa !10
  %3524 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3525 = getelementptr i32, ptr @P3_marking_member_0, i32 %3524
  %3526 = getelementptr i8, ptr %3525, i32 8
  store volatile i32 %3518, ptr %3526, align 4, !tbaa !10
  %3527 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3528 = add nsw i32 %3527, 3
  store volatile i32 %3528, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3529

3529:                                             ; preds = %3510, %3514, %3506, %3502, %3499, %3496
  %3530 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3531 = icmp sgt i32 %3530, 4
  br i1 %3531, label %3532, label %3562

3532:                                             ; preds = %3529
  %3533 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3534 = icmp slt i32 %3533, 4
  br i1 %3534, label %3535, label %3562

3535:                                             ; preds = %3532
  %3536 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3537 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3538 = icmp eq i32 %3536, %3537
  br i1 %3538, label %3539, label %3562

3539:                                             ; preds = %3535
  %3540 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3541 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3542 = icmp eq i32 %3540, %3541
  br i1 %3542, label %3543, label %3562

3543:                                             ; preds = %3539
  %3544 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3545 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3546 = icmp sgt i32 %3545, %3544
  br i1 %3546, label %3547, label %3562

3547:                                             ; preds = %3543
  %3548 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %3548, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3549 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3550 = add nsw i32 %3549, -4
  store volatile i32 %3550, ptr @P2_is_marked, align 4, !tbaa !6
  %3551 = add nsw i32 %3545, %3544
  %3552 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3553 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3552
  store volatile i32 %3544, ptr %3553, align 4, !tbaa !10
  %3554 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3555 = getelementptr i32, ptr @P3_marking_member_0, i32 %3554
  %3556 = getelementptr i8, ptr %3555, i32 4
  store volatile i32 %3545, ptr %3556, align 4, !tbaa !10
  %3557 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3558 = getelementptr i32, ptr @P3_marking_member_0, i32 %3557
  %3559 = getelementptr i8, ptr %3558, i32 8
  store volatile i32 %3551, ptr %3559, align 4, !tbaa !10
  %3560 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3561 = add nsw i32 %3560, 3
  store volatile i32 %3561, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3562

3562:                                             ; preds = %3543, %3547, %3539, %3535, %3532, %3529
  %3563 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3564 = icmp sgt i32 %3563, 4
  br i1 %3564, label %3565, label %3595

3565:                                             ; preds = %3562
  %3566 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3567 = icmp slt i32 %3566, 4
  br i1 %3567, label %3568, label %3595

3568:                                             ; preds = %3565
  %3569 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3570 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3571 = icmp eq i32 %3569, %3570
  br i1 %3571, label %3572, label %3595

3572:                                             ; preds = %3568
  %3573 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3574 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3575 = icmp eq i32 %3573, %3574
  br i1 %3575, label %3576, label %3595

3576:                                             ; preds = %3572
  %3577 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3578 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3579 = icmp sgt i32 %3578, %3577
  br i1 %3579, label %3580, label %3595

3580:                                             ; preds = %3576
  %3581 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %3581, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3582 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3583 = add nsw i32 %3582, -4
  store volatile i32 %3583, ptr @P2_is_marked, align 4, !tbaa !6
  %3584 = add nsw i32 %3578, %3577
  %3585 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3586 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3585
  store volatile i32 %3577, ptr %3586, align 4, !tbaa !10
  %3587 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3588 = getelementptr i32, ptr @P3_marking_member_0, i32 %3587
  %3589 = getelementptr i8, ptr %3588, i32 4
  store volatile i32 %3578, ptr %3589, align 4, !tbaa !10
  %3590 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3591 = getelementptr i32, ptr @P3_marking_member_0, i32 %3590
  %3592 = getelementptr i8, ptr %3591, i32 8
  store volatile i32 %3584, ptr %3592, align 4, !tbaa !10
  %3593 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3594 = add nsw i32 %3593, 3
  store volatile i32 %3594, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3595

3595:                                             ; preds = %3576, %3580, %3572, %3568, %3565, %3562
  %3596 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3597 = icmp sgt i32 %3596, 4
  br i1 %3597, label %3598, label %3627

3598:                                             ; preds = %3595
  %3599 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3600 = icmp slt i32 %3599, 4
  br i1 %3600, label %3601, label %3627

3601:                                             ; preds = %3598
  %3602 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3603 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3604 = icmp eq i32 %3602, %3603
  br i1 %3604, label %3605, label %3627

3605:                                             ; preds = %3601
  %3606 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3607 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3608 = icmp eq i32 %3606, %3607
  br i1 %3608, label %3609, label %3627

3609:                                             ; preds = %3605
  %3610 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3611 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3612 = icmp sgt i32 %3611, %3610
  br i1 %3612, label %3613, label %3627

3613:                                             ; preds = %3609
  %3614 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3615 = add nsw i32 %3614, -4
  store volatile i32 %3615, ptr @P2_is_marked, align 4, !tbaa !6
  %3616 = add nsw i32 %3611, %3610
  %3617 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3618 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3617
  store volatile i32 %3610, ptr %3618, align 4, !tbaa !10
  %3619 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3620 = getelementptr i32, ptr @P3_marking_member_0, i32 %3619
  %3621 = getelementptr i8, ptr %3620, i32 4
  store volatile i32 %3611, ptr %3621, align 4, !tbaa !10
  %3622 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3623 = getelementptr i32, ptr @P3_marking_member_0, i32 %3622
  %3624 = getelementptr i8, ptr %3623, i32 8
  store volatile i32 %3616, ptr %3624, align 4, !tbaa !10
  %3625 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3626 = add nsw i32 %3625, 3
  store volatile i32 %3626, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3627

3627:                                             ; preds = %3609, %3613, %3605, %3601, %3598, %3595
  %3628 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3629 = icmp sgt i32 %3628, 4
  br i1 %3629, label %3630, label %3660

3630:                                             ; preds = %3627
  %3631 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3632 = icmp slt i32 %3631, 4
  br i1 %3632, label %3633, label %3660

3633:                                             ; preds = %3630
  %3634 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3635 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3636 = icmp eq i32 %3634, %3635
  br i1 %3636, label %3637, label %3660

3637:                                             ; preds = %3633
  %3638 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3639 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3640 = icmp eq i32 %3638, %3639
  br i1 %3640, label %3641, label %3660

3641:                                             ; preds = %3637
  %3642 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3643 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3644 = icmp sgt i32 %3643, %3642
  br i1 %3644, label %3645, label %3660

3645:                                             ; preds = %3641
  %3646 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %3646, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3647 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3648 = add nsw i32 %3647, -4
  store volatile i32 %3648, ptr @P2_is_marked, align 4, !tbaa !6
  %3649 = add nsw i32 %3643, %3642
  %3650 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3651 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3650
  store volatile i32 %3642, ptr %3651, align 4, !tbaa !10
  %3652 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3653 = getelementptr i32, ptr @P3_marking_member_0, i32 %3652
  %3654 = getelementptr i8, ptr %3653, i32 4
  store volatile i32 %3643, ptr %3654, align 4, !tbaa !10
  %3655 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3656 = getelementptr i32, ptr @P3_marking_member_0, i32 %3655
  %3657 = getelementptr i8, ptr %3656, i32 8
  store volatile i32 %3649, ptr %3657, align 4, !tbaa !10
  %3658 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3659 = add nsw i32 %3658, 3
  store volatile i32 %3659, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3660

3660:                                             ; preds = %3641, %3645, %3637, %3633, %3630, %3627
  %3661 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3662 = icmp sgt i32 %3661, 4
  br i1 %3662, label %3663, label %3692

3663:                                             ; preds = %3660
  %3664 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3665 = icmp slt i32 %3664, 4
  br i1 %3665, label %3666, label %3692

3666:                                             ; preds = %3663
  %3667 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3668 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3669 = icmp eq i32 %3667, %3668
  br i1 %3669, label %3670, label %3692

3670:                                             ; preds = %3666
  %3671 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3672 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3673 = icmp eq i32 %3671, %3672
  br i1 %3673, label %3674, label %3692

3674:                                             ; preds = %3670
  %3675 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3676 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3677 = icmp sgt i32 %3676, %3675
  br i1 %3677, label %3678, label %3692

3678:                                             ; preds = %3674
  %3679 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3680 = add nsw i32 %3679, -4
  store volatile i32 %3680, ptr @P2_is_marked, align 4, !tbaa !6
  %3681 = add nsw i32 %3676, %3675
  %3682 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3683 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3682
  store volatile i32 %3675, ptr %3683, align 4, !tbaa !10
  %3684 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3685 = getelementptr i32, ptr @P3_marking_member_0, i32 %3684
  %3686 = getelementptr i8, ptr %3685, i32 4
  store volatile i32 %3676, ptr %3686, align 4, !tbaa !10
  %3687 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3688 = getelementptr i32, ptr @P3_marking_member_0, i32 %3687
  %3689 = getelementptr i8, ptr %3688, i32 8
  store volatile i32 %3681, ptr %3689, align 4, !tbaa !10
  %3690 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3691 = add nsw i32 %3690, 3
  store volatile i32 %3691, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3692

3692:                                             ; preds = %3674, %3678, %3670, %3666, %3663, %3660
  %3693 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3694 = icmp sgt i32 %3693, 4
  br i1 %3694, label %3695, label %3725

3695:                                             ; preds = %3692
  %3696 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3697 = icmp slt i32 %3696, 4
  br i1 %3697, label %3698, label %3725

3698:                                             ; preds = %3695
  %3699 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3700 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3701 = icmp eq i32 %3699, %3700
  br i1 %3701, label %3702, label %3725

3702:                                             ; preds = %3698
  %3703 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3704 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3705 = icmp eq i32 %3703, %3704
  br i1 %3705, label %3706, label %3725

3706:                                             ; preds = %3702
  %3707 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3708 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3709 = icmp sgt i32 %3708, %3707
  br i1 %3709, label %3710, label %3725

3710:                                             ; preds = %3706
  %3711 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %3711, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3712 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3713 = add nsw i32 %3712, -4
  store volatile i32 %3713, ptr @P2_is_marked, align 4, !tbaa !6
  %3714 = add nsw i32 %3708, %3707
  %3715 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3716 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3715
  store volatile i32 %3707, ptr %3716, align 4, !tbaa !10
  %3717 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3718 = getelementptr i32, ptr @P3_marking_member_0, i32 %3717
  %3719 = getelementptr i8, ptr %3718, i32 4
  store volatile i32 %3708, ptr %3719, align 4, !tbaa !10
  %3720 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3721 = getelementptr i32, ptr @P3_marking_member_0, i32 %3720
  %3722 = getelementptr i8, ptr %3721, i32 8
  store volatile i32 %3714, ptr %3722, align 4, !tbaa !10
  %3723 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3724 = add nsw i32 %3723, 3
  store volatile i32 %3724, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3725

3725:                                             ; preds = %3706, %3710, %3702, %3698, %3695, %3692
  %3726 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3727 = icmp sgt i32 %3726, 4
  br i1 %3727, label %3728, label %3758

3728:                                             ; preds = %3725
  %3729 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3730 = icmp slt i32 %3729, 4
  br i1 %3730, label %3731, label %3758

3731:                                             ; preds = %3728
  %3732 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3733 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3734 = icmp eq i32 %3732, %3733
  br i1 %3734, label %3735, label %3758

3735:                                             ; preds = %3731
  %3736 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3737 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3738 = icmp eq i32 %3736, %3737
  br i1 %3738, label %3739, label %3758

3739:                                             ; preds = %3735
  %3740 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3741 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3742 = icmp sgt i32 %3741, %3740
  br i1 %3742, label %3743, label %3758

3743:                                             ; preds = %3739
  %3744 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %3744, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3745 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3746 = add nsw i32 %3745, -4
  store volatile i32 %3746, ptr @P2_is_marked, align 4, !tbaa !6
  %3747 = add nsw i32 %3741, %3740
  %3748 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3749 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3748
  store volatile i32 %3740, ptr %3749, align 4, !tbaa !10
  %3750 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3751 = getelementptr i32, ptr @P3_marking_member_0, i32 %3750
  %3752 = getelementptr i8, ptr %3751, i32 4
  store volatile i32 %3741, ptr %3752, align 4, !tbaa !10
  %3753 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3754 = getelementptr i32, ptr @P3_marking_member_0, i32 %3753
  %3755 = getelementptr i8, ptr %3754, i32 8
  store volatile i32 %3747, ptr %3755, align 4, !tbaa !10
  %3756 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3757 = add nsw i32 %3756, 3
  store volatile i32 %3757, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3758

3758:                                             ; preds = %3739, %3743, %3735, %3731, %3728, %3725
  %3759 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3760 = icmp sgt i32 %3759, 4
  br i1 %3760, label %3761, label %3791

3761:                                             ; preds = %3758
  %3762 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3763 = icmp slt i32 %3762, 4
  br i1 %3763, label %3764, label %3791

3764:                                             ; preds = %3761
  %3765 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3766 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3767 = icmp eq i32 %3765, %3766
  br i1 %3767, label %3768, label %3791

3768:                                             ; preds = %3764
  %3769 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3770 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3771 = icmp eq i32 %3769, %3770
  br i1 %3771, label %3772, label %3791

3772:                                             ; preds = %3768
  %3773 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3774 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3775 = icmp sgt i32 %3774, %3773
  br i1 %3775, label %3776, label %3791

3776:                                             ; preds = %3772
  %3777 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  store volatile i32 %3777, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3778 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3779 = add nsw i32 %3778, -4
  store volatile i32 %3779, ptr @P2_is_marked, align 4, !tbaa !6
  %3780 = add nsw i32 %3774, %3773
  %3781 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3782 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3781
  store volatile i32 %3773, ptr %3782, align 4, !tbaa !10
  %3783 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3784 = getelementptr i32, ptr @P3_marking_member_0, i32 %3783
  %3785 = getelementptr i8, ptr %3784, i32 4
  store volatile i32 %3774, ptr %3785, align 4, !tbaa !10
  %3786 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3787 = getelementptr i32, ptr @P3_marking_member_0, i32 %3786
  %3788 = getelementptr i8, ptr %3787, i32 8
  store volatile i32 %3780, ptr %3788, align 4, !tbaa !10
  %3789 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3790 = add nsw i32 %3789, 3
  store volatile i32 %3790, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3791

3791:                                             ; preds = %3772, %3776, %3768, %3764, %3761, %3758
  %3792 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3793 = icmp sgt i32 %3792, 4
  br i1 %3793, label %3794, label %3823

3794:                                             ; preds = %3791
  %3795 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3796 = icmp slt i32 %3795, 4
  br i1 %3796, label %3797, label %3823

3797:                                             ; preds = %3794
  %3798 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3799 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3800 = icmp eq i32 %3798, %3799
  br i1 %3800, label %3801, label %3823

3801:                                             ; preds = %3797
  %3802 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3803 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3804 = icmp eq i32 %3802, %3803
  br i1 %3804, label %3805, label %3823

3805:                                             ; preds = %3801
  %3806 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3807 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3808 = icmp sgt i32 %3807, %3806
  br i1 %3808, label %3809, label %3823

3809:                                             ; preds = %3805
  %3810 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3811 = add nsw i32 %3810, -4
  store volatile i32 %3811, ptr @P2_is_marked, align 4, !tbaa !6
  %3812 = add nsw i32 %3807, %3806
  %3813 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3814 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3813
  store volatile i32 %3806, ptr %3814, align 4, !tbaa !10
  %3815 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3816 = getelementptr i32, ptr @P3_marking_member_0, i32 %3815
  %3817 = getelementptr i8, ptr %3816, i32 4
  store volatile i32 %3807, ptr %3817, align 4, !tbaa !10
  %3818 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3819 = getelementptr i32, ptr @P3_marking_member_0, i32 %3818
  %3820 = getelementptr i8, ptr %3819, i32 8
  store volatile i32 %3812, ptr %3820, align 4, !tbaa !10
  %3821 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3822 = add nsw i32 %3821, 3
  store volatile i32 %3822, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3823

3823:                                             ; preds = %3805, %3809, %3801, %3797, %3794, %3791
  %3824 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3825 = icmp sgt i32 %3824, 4
  br i1 %3825, label %3826, label %3856

3826:                                             ; preds = %3823
  %3827 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3828 = icmp slt i32 %3827, 4
  br i1 %3828, label %3829, label %3856

3829:                                             ; preds = %3826
  %3830 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3831 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3832 = icmp eq i32 %3830, %3831
  br i1 %3832, label %3833, label %3856

3833:                                             ; preds = %3829
  %3834 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3835 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3836 = icmp eq i32 %3834, %3835
  br i1 %3836, label %3837, label %3856

3837:                                             ; preds = %3833
  %3838 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3839 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3840 = icmp sgt i32 %3839, %3838
  br i1 %3840, label %3841, label %3856

3841:                                             ; preds = %3837
  %3842 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %3842, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3843 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3844 = add nsw i32 %3843, -4
  store volatile i32 %3844, ptr @P2_is_marked, align 4, !tbaa !6
  %3845 = add nsw i32 %3839, %3838
  %3846 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3847 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3846
  store volatile i32 %3838, ptr %3847, align 4, !tbaa !10
  %3848 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3849 = getelementptr i32, ptr @P3_marking_member_0, i32 %3848
  %3850 = getelementptr i8, ptr %3849, i32 4
  store volatile i32 %3839, ptr %3850, align 4, !tbaa !10
  %3851 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3852 = getelementptr i32, ptr @P3_marking_member_0, i32 %3851
  %3853 = getelementptr i8, ptr %3852, i32 8
  store volatile i32 %3845, ptr %3853, align 4, !tbaa !10
  %3854 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3855 = add nsw i32 %3854, 3
  store volatile i32 %3855, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3856

3856:                                             ; preds = %3837, %3841, %3833, %3829, %3826, %3823
  %3857 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3858 = icmp sgt i32 %3857, 4
  br i1 %3858, label %3859, label %3888

3859:                                             ; preds = %3856
  %3860 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3861 = icmp slt i32 %3860, 4
  br i1 %3861, label %3862, label %3888

3862:                                             ; preds = %3859
  %3863 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3864 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3865 = icmp eq i32 %3863, %3864
  br i1 %3865, label %3866, label %3888

3866:                                             ; preds = %3862
  %3867 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3868 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3869 = icmp eq i32 %3867, %3868
  br i1 %3869, label %3870, label %3888

3870:                                             ; preds = %3866
  %3871 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3872 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3873 = icmp sgt i32 %3872, %3871
  br i1 %3873, label %3874, label %3888

3874:                                             ; preds = %3870
  %3875 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3876 = add nsw i32 %3875, -4
  store volatile i32 %3876, ptr @P2_is_marked, align 4, !tbaa !6
  %3877 = add nsw i32 %3872, %3871
  %3878 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3879 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3878
  store volatile i32 %3871, ptr %3879, align 4, !tbaa !10
  %3880 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3881 = getelementptr i32, ptr @P3_marking_member_0, i32 %3880
  %3882 = getelementptr i8, ptr %3881, i32 4
  store volatile i32 %3872, ptr %3882, align 4, !tbaa !10
  %3883 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3884 = getelementptr i32, ptr @P3_marking_member_0, i32 %3883
  %3885 = getelementptr i8, ptr %3884, i32 8
  store volatile i32 %3877, ptr %3885, align 4, !tbaa !10
  %3886 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3887 = add nsw i32 %3886, 3
  store volatile i32 %3887, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3888

3888:                                             ; preds = %3870, %3874, %3866, %3862, %3859, %3856
  %3889 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3890 = icmp sgt i32 %3889, 4
  br i1 %3890, label %3891, label %3921

3891:                                             ; preds = %3888
  %3892 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3893 = icmp slt i32 %3892, 4
  br i1 %3893, label %3894, label %3921

3894:                                             ; preds = %3891
  %3895 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3896 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3897 = icmp eq i32 %3895, %3896
  br i1 %3897, label %3898, label %3921

3898:                                             ; preds = %3894
  %3899 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3900 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3901 = icmp eq i32 %3899, %3900
  br i1 %3901, label %3902, label %3921

3902:                                             ; preds = %3898
  %3903 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3904 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3905 = icmp sgt i32 %3904, %3903
  br i1 %3905, label %3906, label %3921

3906:                                             ; preds = %3902
  %3907 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %3907, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3908 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3909 = add nsw i32 %3908, -4
  store volatile i32 %3909, ptr @P2_is_marked, align 4, !tbaa !6
  %3910 = add nsw i32 %3904, %3903
  %3911 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3912 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3911
  store volatile i32 %3903, ptr %3912, align 4, !tbaa !10
  %3913 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3914 = getelementptr i32, ptr @P3_marking_member_0, i32 %3913
  %3915 = getelementptr i8, ptr %3914, i32 4
  store volatile i32 %3904, ptr %3915, align 4, !tbaa !10
  %3916 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3917 = getelementptr i32, ptr @P3_marking_member_0, i32 %3916
  %3918 = getelementptr i8, ptr %3917, i32 8
  store volatile i32 %3910, ptr %3918, align 4, !tbaa !10
  %3919 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3920 = add nsw i32 %3919, 3
  store volatile i32 %3920, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3921

3921:                                             ; preds = %3902, %3906, %3898, %3894, %3891, %3888
  %3922 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3923 = icmp sgt i32 %3922, 4
  br i1 %3923, label %3924, label %3954

3924:                                             ; preds = %3921
  %3925 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3926 = icmp slt i32 %3925, 4
  br i1 %3926, label %3927, label %3954

3927:                                             ; preds = %3924
  %3928 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3929 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3930 = icmp eq i32 %3928, %3929
  br i1 %3930, label %3931, label %3954

3931:                                             ; preds = %3927
  %3932 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3933 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %3934 = icmp eq i32 %3932, %3933
  br i1 %3934, label %3935, label %3954

3935:                                             ; preds = %3931
  %3936 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3937 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3938 = icmp sgt i32 %3937, %3936
  br i1 %3938, label %3939, label %3954

3939:                                             ; preds = %3935
  %3940 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %3940, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3941 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3942 = add nsw i32 %3941, -4
  store volatile i32 %3942, ptr @P2_is_marked, align 4, !tbaa !6
  %3943 = add nsw i32 %3937, %3936
  %3944 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3945 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3944
  store volatile i32 %3936, ptr %3945, align 4, !tbaa !10
  %3946 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3947 = getelementptr i32, ptr @P3_marking_member_0, i32 %3946
  %3948 = getelementptr i8, ptr %3947, i32 4
  store volatile i32 %3937, ptr %3948, align 4, !tbaa !10
  %3949 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3950 = getelementptr i32, ptr @P3_marking_member_0, i32 %3949
  %3951 = getelementptr i8, ptr %3950, i32 8
  store volatile i32 %3943, ptr %3951, align 4, !tbaa !10
  %3952 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3953 = add nsw i32 %3952, 3
  store volatile i32 %3953, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3954

3954:                                             ; preds = %3935, %3939, %3931, %3927, %3924, %3921
  %3955 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3956 = icmp sgt i32 %3955, 4
  br i1 %3956, label %3957, label %3987

3957:                                             ; preds = %3954
  %3958 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3959 = icmp slt i32 %3958, 4
  br i1 %3959, label %3960, label %3987

3960:                                             ; preds = %3957
  %3961 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3962 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3963 = icmp eq i32 %3961, %3962
  br i1 %3963, label %3964, label %3987

3964:                                             ; preds = %3960
  %3965 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3966 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3967 = icmp eq i32 %3965, %3966
  br i1 %3967, label %3968, label %3987

3968:                                             ; preds = %3964
  %3969 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %3970 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3971 = icmp sgt i32 %3970, %3969
  br i1 %3971, label %3972, label %3987

3972:                                             ; preds = %3968
  %3973 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  store volatile i32 %3973, ptr @P2_marking_member_0, align 4, !tbaa !10
  %3974 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3975 = add nsw i32 %3974, -4
  store volatile i32 %3975, ptr @P2_is_marked, align 4, !tbaa !6
  %3976 = add nsw i32 %3970, %3969
  %3977 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3978 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %3977
  store volatile i32 %3969, ptr %3978, align 4, !tbaa !10
  %3979 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3980 = getelementptr i32, ptr @P3_marking_member_0, i32 %3979
  %3981 = getelementptr i8, ptr %3980, i32 4
  store volatile i32 %3970, ptr %3981, align 4, !tbaa !10
  %3982 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3983 = getelementptr i32, ptr @P3_marking_member_0, i32 %3982
  %3984 = getelementptr i8, ptr %3983, i32 8
  store volatile i32 %3976, ptr %3984, align 4, !tbaa !10
  %3985 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3986 = add nsw i32 %3985, 3
  store volatile i32 %3986, ptr @P3_is_marked, align 4, !tbaa !6
  br label %3987

3987:                                             ; preds = %3968, %3972, %3964, %3960, %3957, %3954
  %3988 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %3989 = icmp sgt i32 %3988, 4
  br i1 %3989, label %3990, label %4019

3990:                                             ; preds = %3987
  %3991 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %3992 = icmp slt i32 %3991, 4
  br i1 %3992, label %3993, label %4019

3993:                                             ; preds = %3990
  %3994 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3995 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %3996 = icmp eq i32 %3994, %3995
  br i1 %3996, label %3997, label %4019

3997:                                             ; preds = %3993
  %3998 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %3999 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %4000 = icmp eq i32 %3998, %3999
  br i1 %4000, label %4001, label %4019

4001:                                             ; preds = %3997
  %4002 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %4003 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %4004 = icmp sgt i32 %4003, %4002
  br i1 %4004, label %4005, label %4019

4005:                                             ; preds = %4001
  %4006 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %4007 = add nsw i32 %4006, -4
  store volatile i32 %4007, ptr @P2_is_marked, align 4, !tbaa !6
  %4008 = add nsw i32 %4003, %4002
  %4009 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %4010 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %4009
  store volatile i32 %4002, ptr %4010, align 4, !tbaa !10
  %4011 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %4012 = getelementptr i32, ptr @P3_marking_member_0, i32 %4011
  %4013 = getelementptr i8, ptr %4012, i32 4
  store volatile i32 %4003, ptr %4013, align 4, !tbaa !10
  %4014 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %4015 = getelementptr i32, ptr @P3_marking_member_0, i32 %4014
  %4016 = getelementptr i8, ptr %4015, i32 8
  store volatile i32 %4008, ptr %4016, align 4, !tbaa !10
  %4017 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %4018 = add nsw i32 %4017, 3
  store volatile i32 %4018, ptr @P3_is_marked, align 4, !tbaa !6
  br label %4019

4019:                                             ; preds = %4001, %4005, %3997, %3993, %3990, %3987
  %4020 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %4021 = icmp sgt i32 %4020, 4
  br i1 %4021, label %4022, label %4052

4022:                                             ; preds = %4019
  %4023 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %4024 = icmp slt i32 %4023, 4
  br i1 %4024, label %4025, label %4052

4025:                                             ; preds = %4022
  %4026 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %4027 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %4028 = icmp eq i32 %4026, %4027
  br i1 %4028, label %4029, label %4052

4029:                                             ; preds = %4025
  %4030 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %4031 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %4032 = icmp eq i32 %4030, %4031
  br i1 %4032, label %4033, label %4052

4033:                                             ; preds = %4029
  %4034 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %4035 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %4036 = icmp sgt i32 %4035, %4034
  br i1 %4036, label %4037, label %4052

4037:                                             ; preds = %4033
  %4038 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  store volatile i32 %4038, ptr @P2_marking_member_0, align 4, !tbaa !10
  %4039 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %4040 = add nsw i32 %4039, -4
  store volatile i32 %4040, ptr @P2_is_marked, align 4, !tbaa !6
  %4041 = add nsw i32 %4035, %4034
  %4042 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %4043 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %4042
  store volatile i32 %4034, ptr %4043, align 4, !tbaa !10
  %4044 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %4045 = getelementptr i32, ptr @P3_marking_member_0, i32 %4044
  %4046 = getelementptr i8, ptr %4045, i32 4
  store volatile i32 %4035, ptr %4046, align 4, !tbaa !10
  %4047 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %4048 = getelementptr i32, ptr @P3_marking_member_0, i32 %4047
  %4049 = getelementptr i8, ptr %4048, i32 8
  store volatile i32 %4041, ptr %4049, align 4, !tbaa !10
  %4050 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %4051 = add nsw i32 %4050, 3
  store volatile i32 %4051, ptr @P3_is_marked, align 4, !tbaa !6
  br label %4052

4052:                                             ; preds = %4033, %4037, %4029, %4025, %4022, %4019
  %4053 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %4054 = icmp sgt i32 %4053, 4
  br i1 %4054, label %4055, label %4084

4055:                                             ; preds = %4052
  %4056 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %4057 = icmp slt i32 %4056, 4
  br i1 %4057, label %4058, label %4084

4058:                                             ; preds = %4055
  %4059 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %4060 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %4061 = icmp eq i32 %4059, %4060
  br i1 %4061, label %4062, label %4084

4062:                                             ; preds = %4058
  %4063 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %4064 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %4065 = icmp eq i32 %4063, %4064
  br i1 %4065, label %4066, label %4084

4066:                                             ; preds = %4062
  %4067 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %4068 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %4069 = icmp sgt i32 %4068, %4067
  br i1 %4069, label %4070, label %4084

4070:                                             ; preds = %4066
  %4071 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %4072 = add nsw i32 %4071, -4
  store volatile i32 %4072, ptr @P2_is_marked, align 4, !tbaa !6
  %4073 = add nsw i32 %4068, %4067
  %4074 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %4075 = getelementptr inbounds i32, ptr @P3_marking_member_0, i32 %4074
  store volatile i32 %4067, ptr %4075, align 4, !tbaa !10
  %4076 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %4077 = getelementptr i32, ptr @P3_marking_member_0, i32 %4076
  %4078 = getelementptr i8, ptr %4077, i32 4
  store volatile i32 %4068, ptr %4078, align 4, !tbaa !10
  %4079 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %4080 = getelementptr i32, ptr @P3_marking_member_0, i32 %4079
  %4081 = getelementptr i8, ptr %4080, i32 8
  store volatile i32 %4073, ptr %4081, align 4, !tbaa !10
  %4082 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %4083 = add nsw i32 %4082, 3
  store volatile i32 %4083, ptr @P3_is_marked, align 4, !tbaa !6
  br label %4084

4084:                                             ; preds = %4066, %4070, %4052, %4055, %4058, %4062
  %4085 = add nuw nsw i32 %4, 1
  %4086 = icmp eq i32 %4085, %0
  br i1 %4086, label %4087, label %3, !llvm.loop !12

4087:                                             ; preds = %4084, %1
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind memory(readwrite, target_mem0: none, target_mem1: none)
define dso_local noundef i32 @benchmark() local_unnamed_addr #3 {
  tail call fastcc void @benchmark_body(i32 noundef 1231) #5
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(readwrite, argmem: none, target_mem0: none, target_mem1: none)
define dso_local range(i32 0, 2) i32 @verify_benchmark(i32 noundef %0) local_unnamed_addr #4 {
  %2 = load volatile i32, ptr @P1_is_marked, align 4, !tbaa !6
  %3 = icmp eq i32 %2, 3
  br i1 %3, label %4, label %53

4:                                                ; preds = %1
  %5 = load volatile i32, ptr @P2_is_marked, align 4, !tbaa !6
  %6 = icmp eq i32 %5, 5
  br i1 %6, label %7, label %53

7:                                                ; preds = %4
  %8 = load volatile i32, ptr @P3_is_marked, align 4, !tbaa !6
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %53

10:                                               ; preds = %7
  %11 = load volatile i32, ptr @P1_marking_member_0, align 4, !tbaa !10
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %34, label %53

13:                                               ; preds = %37
  %14 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 4), align 4, !tbaa !10
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %53

16:                                               ; preds = %13
  %17 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 4), align 4, !tbaa !10
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %53

19:                                               ; preds = %16
  %20 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P3_marking_member_0, i32 4), align 4, !tbaa !10
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %53

22:                                               ; preds = %19
  %23 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P1_marking_member_0, i32 8), align 4, !tbaa !10
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %53

25:                                               ; preds = %22
  %26 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 8), align 4, !tbaa !10
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %53

28:                                               ; preds = %25
  %29 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P3_marking_member_0, i32 8), align 4, !tbaa !10
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %53

31:                                               ; preds = %28
  %32 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 12), align 4, !tbaa !10
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %50, label %53

34:                                               ; preds = %10
  %35 = load volatile i32, ptr @P2_marking_member_0, align 4, !tbaa !10
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %53

37:                                               ; preds = %34
  %38 = load volatile i32, ptr @P3_marking_member_0, align 4, !tbaa !10
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %13, label %53

40:                                               ; preds = %50
  %41 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P2_marking_member_0, i32 16), align 4, !tbaa !10
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %43, label %53

43:                                               ; preds = %40
  %44 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P3_marking_member_0, i32 16), align 4, !tbaa !10
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %53

46:                                               ; preds = %43
  %47 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P3_marking_member_0, i32 20), align 4, !tbaa !10
  %48 = icmp eq i32 %47, 0
  %49 = zext i1 %48 to i32
  br label %53, !llvm.loop !14

50:                                               ; preds = %31
  %51 = load volatile i32, ptr getelementptr inbounds nuw (i8, ptr @P3_marking_member_0, i32 12), align 4, !tbaa !10
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %40, label %53

53:                                               ; preds = %46, %10, %34, %37, %13, %16, %19, %22, %25, %28, %31, %50, %40, %43, %1, %4, %7
  %54 = phi i32 [ 0, %4 ], [ 0, %1 ], [ %49, %46 ], [ 0, %31 ], [ 0, %7 ], [ 0, %10 ], [ 0, %43 ], [ 0, %40 ], [ 0, %50 ], [ 0, %28 ], [ 0, %25 ], [ 0, %22 ], [ 0, %19 ], [ 0, %16 ], [ 0, %13 ], [ 0, %37 ], [ 0, %34 ]
  ret i32 %54
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nofree norecurse nounwind memory(readwrite, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { nofree noinline norecurse nounwind memory(readwrite, argmem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { nofree noinline norecurse nounwind memory(readwrite, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { mustprogress nofree norecurse nounwind willreturn memory(readwrite, argmem: none, target_mem0: none, target_mem1: none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #5 = { nobuiltin "no-builtins" }

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
