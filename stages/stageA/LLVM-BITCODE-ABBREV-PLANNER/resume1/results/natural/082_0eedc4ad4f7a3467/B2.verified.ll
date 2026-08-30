; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\082_0eedc4ad4f7a3467\B2.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\20030715-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"inetd\00", align 1
@ap_standalone = dso_local local_unnamed_addr global i32 0, align 4
@.str.1 = private unnamed_addr constant [11 x i8] c"standalone\00", align 1
@.str.2 = private unnamed_addr constant [50 x i8] c"ServerType must be either 'inetd' or 'standalone'\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noalias noundef ptr @ap_check_cmd_context(ptr noundef readnone captures(none) %a, i32 noundef %b) local_unnamed_addr #0 {
entry:
  ret ptr null
}

; Function Attrs: nounwind
define dso_local noundef ptr @server_type(ptr noundef readnone captures(none) %a, ptr noundef readnone captures(none) %b, ptr noundef %arg) local_unnamed_addr #1 {
entry:
  %call1 = tail call i32 @strcmp(ptr noundef %arg, ptr noundef nonnull @.str) #3
  %tobool2.not = icmp eq i32 %call1, 0
  br i1 %tobool2.not, label %if.end9, label %if.else

if.else:                                          ; preds = %entry
  %call4 = tail call i32 @strcmp(ptr noundef %arg, ptr noundef nonnull @.str.1) #3
  %tobool5.not = icmp eq i32 %call4, 0
  br i1 %tobool5.not, label %if.end9, label %cleanup

if.end9:                                          ; preds = %if.else, %entry
  %storemerge = phi i32 [ 0, %entry ], [ 1, %if.else ]
  store i32 %storemerge, ptr @ap_standalone, align 4, !tbaa !4
  br label %cleanup

cleanup:                                          ; preds = %if.else, %if.end9
  %retval.0 = phi ptr [ null, %if.end9 ], [ @.str.2, %if.else ]
  ret ptr %retval.0
}

declare i32 @strcmp(ptr noundef, ptr noundef) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #1 {
entry:
  %call1.i = tail call i32 @strcmp(ptr noundef nonnull @.str.1, ptr noundef nonnull @.str) #3
  %tobool2.not.i = icmp eq i32 %call1.i, 0
  br i1 %tobool2.not.i, label %if.end9.i, label %if.else.i

if.else.i:                                        ; preds = %entry
  %call4.i = tail call i32 @strcmp(ptr noundef nonnull @.str.1, ptr noundef nonnull @.str.1) #3
  %tobool5.not.i = icmp eq i32 %call4.i, 0
  br i1 %tobool5.not.i, label %if.end9.i, label %server_type.exit

if.end9.i:                                        ; preds = %if.else.i, %entry
  %storemerge.i = phi i32 [ 0, %entry ], [ 1, %if.else.i ]
  store i32 %storemerge.i, ptr @ap_standalone, align 4, !tbaa !4
  br label %server_type.exit

server_type.exit:                                 ; preds = %if.else.i, %if.end9.i
  ret i32 0
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind "no-builtins" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}
!llvm.errno.tbaa = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
