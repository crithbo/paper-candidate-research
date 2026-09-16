; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\S5-OCCUPANCY-CLIFF-JOINTCODEGEN\resume3-r3d\natural\rocm-examples-269e9068d6fd6e68b1cc5a76eb77744f88af42ec\HIP-Doc\Programming-Guide\Porting-CUDA-code-to-HIP\load_module\vcpy.hip'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\S5-OCCUPANCY-CLIFF-JOINTCODEGEN\\resume3-r3d\\natural\\rocm-examples-269e9068d6fd6e68b1cc5a76eb77744f88af42ec\\HIP-Doc\\Programming-Guide\\Porting-CUDA-code-to-HIP\\load_module\\vcpy.hip"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_a24fa47171bd2951 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_a24fa47171bd2951 to ptr)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind uwtable
define protected amdgpu_kernel void @hello_world(ptr addrspace(1) nofree noundef writeonly captures(none) %A.coerce, ptr addrspace(1) nofree noundef writeonly captures(none) %B.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call align 8 dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !10, !invariant.load !11, !noundef !11
  %4 = zext nneg i16 %3 to i32
  %mul = mul i32 %0, %4
  %5 = tail call noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %5
  %cmp = icmp ult i32 %add, 65536
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %conv5 = zext nneg i32 %add to i64
  %arrayidx9 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %B.coerce, i64 %conv5
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %conv5
  %conv = uitofp contract nneg i32 %add to float
  %call.i16 = tail call contract noundef float @__ocml_sin_f32(float noundef %conv) #3
  store float %call.i16, ptr addrspace(1) %arrayidx, align 4, !tbaa !12
  %call.i17 = tail call contract noundef float @__ocml_cos_f32(float noundef %conv) #3
  store float %call.i17, ptr addrspace(1) %arrayidx9, align 4, !tbaa !12
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: convergent nounwind
declare hidden float @__ocml_sin_f32(float noundef) local_unnamed_addr #2

; Function Attrs: convergent nounwind
declare hidden float @__ocml_cos_f32(float noundef) local_unnamed_addr #2

attributes #0 = { convergent mustprogress norecurse nounwind uwtable "amdgpu-flat-work-group-size"="1,1024" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1100" "uniform-work-group-size" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1100" "uniform-work-group-size" }
attributes #3 = { convergent nounwind "uniform-work-group-size" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}
!llvm.errno.tbaa = !{!5}

!0 = !{i32 1, !"amdhsa_code_object_version", i32 600}
!1 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 24.0.0git"}
!5 = !{!6, !7, i64 0}
!6 = !{!"__libc_errno", !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{i16 1, i16 1025}
!11 = !{}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !8, i64 0}
