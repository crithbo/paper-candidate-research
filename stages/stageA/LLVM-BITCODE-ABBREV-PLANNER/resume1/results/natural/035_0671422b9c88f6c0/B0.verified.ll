; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\035_0671422b9c88f6c0\B0.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\simd-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.anon = type { <4 x i32> }

@i = dso_local local_unnamed_addr global <4 x i32> <i32 150, i32 100, i32 150, i32 200>, align 16
@j = dso_local local_unnamed_addr global <4 x i32> <i32 10, i32 13, i32 20, i32 30>, align 16
@k = dso_local local_unnamed_addr global <4 x i32> zeroinitializer, align 16
@res = dso_local local_unnamed_addr global %union.anon zeroinitializer, align 16

; Function Attrs: nounwind
define dso_local void @verify(i32 noundef %a1, i32 noundef %a2, i32 noundef %a3, i32 noundef %a4, i32 noundef %b1, i32 noundef %b2, i32 noundef %b3, i32 noundef %b4) local_unnamed_addr #0 {
entry:
  %cmp.not = icmp eq i32 %a1, %b1
  %cmp1.not = icmp eq i32 %a2, %b2
  %or.cond = and i1 %cmp.not, %cmp1.not
  %cmp3.not = icmp eq i32 %a3, %b3
  %or.cond6 = and i1 %or.cond, %cmp3.not
  %cmp5.not = icmp eq i32 %a4, %b4
  %or.cond7 = and i1 %or.cond6, %cmp5.not
  br i1 %or.cond7, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call = tail call i32 (...) @abort() #2
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  ret void
}

declare i32 @abort(...) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %0 = load <4 x i32>, ptr @i, align 16, !tbaa !8
  %1 = load <4 x i32>, ptr @j, align 16, !tbaa !8
  %add = add <4 x i32> %1, %0
  store <4 x i32> %add, ptr @k, align 16, !tbaa !8
  store <4 x i32> %add, ptr @res, align 16, !tbaa !8
  %2 = icmp ne <4 x i32> %add, <i32 160, i32 113, i32 170, i32 230>
  %3 = bitcast <4 x i1> %2 to i4
  %4 = icmp eq i4 %3, 0
  br i1 %4, label %verify.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call.i = tail call i32 (...) @abort() #2
  %.pre = load <4 x i32>, ptr @i, align 16, !tbaa !8
  %.pre71 = load <4 x i32>, ptr @j, align 16, !tbaa !8
  br label %verify.exit

verify.exit:                                      ; preds = %entry, %if.then.i
  %5 = phi <4 x i32> [ %1, %entry ], [ %.pre71, %if.then.i ]
  %6 = phi <4 x i32> [ %0, %entry ], [ %.pre, %if.then.i ]
  %mul = mul <4 x i32> %5, %6
  store <4 x i32> %mul, ptr @k, align 16, !tbaa !8
  store <4 x i32> %mul, ptr @res, align 16, !tbaa !8
  %7 = icmp ne <4 x i32> %mul, <i32 1500, i32 1300, i32 3000, i32 6000>
  %8 = bitcast <4 x i1> %7 to i4
  %9 = icmp eq i4 %8, 0
  br i1 %9, label %verify.exit10, label %if.then.i8

if.then.i8:                                       ; preds = %verify.exit
  %call.i9 = tail call i32 (...) @abort() #2
  %.pre72 = load <4 x i32>, ptr @i, align 16, !tbaa !8
  %.pre73 = load <4 x i32>, ptr @j, align 16, !tbaa !8
  br label %verify.exit10

verify.exit10:                                    ; preds = %verify.exit, %if.then.i8
  %10 = phi <4 x i32> [ %5, %verify.exit ], [ %.pre73, %if.then.i8 ]
  %11 = phi <4 x i32> [ %6, %verify.exit ], [ %.pre72, %if.then.i8 ]
  %div = sdiv <4 x i32> %11, %10
  store <4 x i32> %div, ptr @k, align 16, !tbaa !8
  store <4 x i32> %div, ptr @res, align 16, !tbaa !8
  %12 = icmp ne <4 x i32> %div, <i32 15, i32 7, i32 7, i32 6>
  %13 = bitcast <4 x i1> %12 to i4
  %14 = icmp eq i4 %13, 0
  br i1 %14, label %verify.exit20, label %if.then.i18

if.then.i18:                                      ; preds = %verify.exit10
  %call.i19 = tail call i32 (...) @abort() #2
  %.pre74 = load <4 x i32>, ptr @i, align 16, !tbaa !8
  %.pre75 = load <4 x i32>, ptr @j, align 16, !tbaa !8
  br label %verify.exit20

verify.exit20:                                    ; preds = %verify.exit10, %if.then.i18
  %15 = phi <4 x i32> [ %10, %verify.exit10 ], [ %.pre75, %if.then.i18 ]
  %16 = phi <4 x i32> [ %11, %verify.exit10 ], [ %.pre74, %if.then.i18 ]
  %and = and <4 x i32> %15, %16
  store <4 x i32> %and, ptr @k, align 16, !tbaa !8
  store <4 x i32> %and, ptr @res, align 16, !tbaa !8
  %17 = icmp ne <4 x i32> %and, <i32 2, i32 4, i32 20, i32 8>
  %18 = bitcast <4 x i1> %17 to i4
  %19 = icmp eq i4 %18, 0
  br i1 %19, label %verify.exit30, label %if.then.i28

if.then.i28:                                      ; preds = %verify.exit20
  %call.i29 = tail call i32 (...) @abort() #2
  %.pre76 = load <4 x i32>, ptr @i, align 16, !tbaa !8
  %.pre77 = load <4 x i32>, ptr @j, align 16, !tbaa !8
  br label %verify.exit30

verify.exit30:                                    ; preds = %verify.exit20, %if.then.i28
  %20 = phi <4 x i32> [ %15, %verify.exit20 ], [ %.pre77, %if.then.i28 ]
  %21 = phi <4 x i32> [ %16, %verify.exit20 ], [ %.pre76, %if.then.i28 ]
  %or = or <4 x i32> %20, %21
  store <4 x i32> %or, ptr @k, align 16, !tbaa !8
  store <4 x i32> %or, ptr @res, align 16, !tbaa !8
  %22 = icmp ne <4 x i32> %or, <i32 158, i32 109, i32 150, i32 222>
  %23 = bitcast <4 x i1> %22 to i4
  %24 = icmp eq i4 %23, 0
  br i1 %24, label %verify.exit40, label %if.then.i38

if.then.i38:                                      ; preds = %verify.exit30
  %call.i39 = tail call i32 (...) @abort() #2
  %.pre78 = load <4 x i32>, ptr @i, align 16, !tbaa !8
  %.pre79 = load <4 x i32>, ptr @j, align 16, !tbaa !8
  br label %verify.exit40

verify.exit40:                                    ; preds = %verify.exit30, %if.then.i38
  %25 = phi <4 x i32> [ %20, %verify.exit30 ], [ %.pre79, %if.then.i38 ]
  %26 = phi <4 x i32> [ %21, %verify.exit30 ], [ %.pre78, %if.then.i38 ]
  %xor = xor <4 x i32> %25, %26
  store <4 x i32> %xor, ptr @k, align 16, !tbaa !8
  store <4 x i32> %xor, ptr @res, align 16, !tbaa !8
  %27 = icmp ne <4 x i32> %xor, <i32 156, i32 105, i32 130, i32 214>
  %28 = bitcast <4 x i1> %27 to i4
  %29 = icmp eq i4 %28, 0
  br i1 %29, label %verify.exit50, label %if.then.i48

if.then.i48:                                      ; preds = %verify.exit40
  %call.i49 = tail call i32 (...) @abort() #2
  %.pre80 = load <4 x i32>, ptr @i, align 16, !tbaa !8
  br label %verify.exit50

verify.exit50:                                    ; preds = %verify.exit40, %if.then.i48
  %30 = phi <4 x i32> [ %26, %verify.exit40 ], [ %.pre80, %if.then.i48 ]
  %sub = sub <4 x i32> zeroinitializer, %30
  store <4 x i32> %sub, ptr @k, align 16, !tbaa !8
  store <4 x i32> %sub, ptr @res, align 16, !tbaa !8
  %31 = icmp ne <4 x i32> %sub, <i32 -150, i32 -100, i32 -150, i32 -200>
  %32 = bitcast <4 x i1> %31 to i4
  %33 = icmp eq i4 %32, 0
  br i1 %33, label %verify.exit60, label %if.then.i58

if.then.i58:                                      ; preds = %verify.exit50
  %call.i59 = tail call i32 (...) @abort() #2
  %.pre81 = load <4 x i32>, ptr @i, align 16, !tbaa !8
  br label %verify.exit60

verify.exit60:                                    ; preds = %verify.exit50, %if.then.i58
  %34 = phi <4 x i32> [ %30, %verify.exit50 ], [ %.pre81, %if.then.i58 ]
  %not = xor <4 x i32> %34, splat (i32 -1)
  store <4 x i32> %not, ptr @k, align 16, !tbaa !8
  store <4 x i32> %not, ptr @res, align 16, !tbaa !8
  %35 = icmp ne <4 x i32> %34, <i32 150, i32 100, i32 150, i32 200>
  %36 = bitcast <4 x i1> %35 to i4
  %37 = icmp eq i4 %36, 0
  br i1 %37, label %verify.exit70, label %if.then.i68

if.then.i68:                                      ; preds = %verify.exit60
  %call.i69 = tail call i32 (...) @abort() #2
  br label %verify.exit70

verify.exit70:                                    ; preds = %verify.exit60, %if.then.i68
  %call = tail call i32 (i32, ...) @exit(i32 noundef 0) #2
  ret i32 undef
}

declare i32 @exit(...) local_unnamed_addr #1

attributes #0 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind "no-builtins" }

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
!8 = !{!6, !6, i64 0}
