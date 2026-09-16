; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\057_0a0db43f200745a9\B2.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\pr34971.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type { i64 }

@x = dso_local local_unnamed_addr global %struct.foo zeroinitializer, align 8

; Function Attrs: nounwind
define dso_local void @test1(i64 noundef %res) local_unnamed_addr #0 {
entry:
  %bf.load = load i64, ptr @x, align 8
  %bf.clear = and i64 %bf.load, 1099511627775
  %shl = shl nuw nsw i64 %bf.clear, 8
  %shr = lshr i64 %bf.clear, 32
  %add = or disjoint i64 %shl, %shr
  %cmp.not = icmp eq i64 %add, %res
  br i1 %cmp.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() #2
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare void @abort() local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
test1.exit11:
  %bf.load = load i64, ptr @x, align 8
  %bf.clear = and i64 %bf.load, -1099511627776
  %bf.set = or disjoint i64 %bf.clear, 4294967297
  store i64 %bf.set, ptr @x, align 8
  tail call void @abort() #2
  %bf.load1 = load i64, ptr @x, align 8
  %bf.clear2 = and i64 %bf.load1, -1099511627776
  %bf.set3 = or disjoint i64 %bf.clear2, 4294967296
  store i64 %bf.set3, ptr @x, align 8
  tail call void @abort() #2
  ret i32 0
}

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
