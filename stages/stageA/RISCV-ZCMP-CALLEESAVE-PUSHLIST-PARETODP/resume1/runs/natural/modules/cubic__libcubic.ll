; ModuleID = 'D:\project\writing\reserch\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1\resources\corpus\embench\src\cubic\libcubic.c'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\\resume1\\resources\\corpus\\embench\\src\\cubic\\libcubic.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

; Function Attrs: nounwind
define dso_local void @SolveCubic(double noundef %0, double noundef %1, double noundef %2, double noundef %3, ptr noundef writeonly captures(none) initializes((0, 4)) %4, ptr noundef writeonly captures(none) initializes((0, 8)) %5) local_unnamed_addr #0 {
  %7 = fdiv double %1, %0
  %8 = fpext double %7 to fp128
  %9 = fdiv double %2, %0
  %10 = fpext double %9 to fp128
  %11 = fdiv double %3, %0
  %12 = fpext double %11 to fp128
  %13 = fmul fp128 %10, 0xL0000000000000000C000800000000000
  %14 = tail call fp128 @llvm.fmuladd.f128(fp128 %8, fp128 %8, fp128 %13)
  %15 = fdiv fp128 %14, 0xL00000000000000004002200000000000
  %16 = fmul fp128 %8, 0xL00000000000000004000000000000000
  %17 = fmul fp128 %16, %8
  %18 = fmul fp128 %8, 0xL00000000000000004002200000000000
  %19 = fneg fp128 %10
  %20 = fmul fp128 %18, %19
  %21 = tail call fp128 @llvm.fmuladd.f128(fp128 %17, fp128 %8, fp128 %20)
  %22 = tail call fp128 @llvm.fmuladd.f128(fp128 %12, fp128 0xL00000000000000004003B00000000000, fp128 %21)
  %23 = fdiv fp128 %22, 0xL00000000000000004004B00000000000
  %24 = fmul fp128 %15, %15
  %25 = fmul fp128 %15, %24
  %26 = fneg fp128 %25
  %27 = tail call fp128 @llvm.fmuladd.f128(fp128 %23, fp128 %23, fp128 %26)
  %28 = fcmp ugt fp128 %27, 0xL00000000000000003BCC000000000000
  br i1 %28, label %69, label %29

29:                                               ; preds = %6
  store i32 3, ptr %4, align 4, !tbaa !6
  %30 = fptrunc fp128 %23 to double
  %31 = fptrunc fp128 %25 to double
  %32 = tail call double @sqrt(double noundef %31) #3
  %33 = fdiv double %30, %32
  %34 = tail call double @acos(double noundef %33) #3
  %35 = fptrunc fp128 %15 to double
  %36 = tail call double @sqrt(double noundef %35) #3
  %37 = fmul double %36, -2.000000e+00
  %38 = fdiv double %34, 3.000000e+00
  %39 = tail call double @cos(double noundef %38) #3
  %40 = fmul double %37, %39
  %41 = fpext double %40 to fp128
  %42 = fdiv fp128 %8, 0xL00000000000000004000800000000000
  %43 = fsub fp128 %41, %42
  %44 = fptrunc fp128 %43 to double
  store double %44, ptr %5, align 8, !tbaa !10
  %45 = tail call double @sqrt(double noundef %35) #3
  %46 = fmul double %45, -2.000000e+00
  %47 = tail call double @atan(double noundef 1.000000e+00) #3
  %48 = fmul double %47, 4.000000e+00
  %49 = tail call double @llvm.fmuladd.f64(double %48, double 2.000000e+00, double %34)
  %50 = fdiv double %49, 3.000000e+00
  %51 = tail call double @cos(double noundef %50) #3
  %52 = fmul double %46, %51
  %53 = fpext double %52 to fp128
  %54 = fsub fp128 %53, %42
  %55 = fptrunc fp128 %54 to double
  %56 = getelementptr inbounds nuw i8, ptr %5, i32 8
  store double %55, ptr %56, align 8, !tbaa !10
  %57 = tail call double @sqrt(double noundef %35) #3
  %58 = fmul double %57, -2.000000e+00
  %59 = tail call double @atan(double noundef 1.000000e+00) #3
  %60 = fmul double %59, 4.000000e+00
  %61 = tail call double @llvm.fmuladd.f64(double %60, double 4.000000e+00, double %34)
  %62 = fdiv double %61, 3.000000e+00
  %63 = tail call double @cos(double noundef %62) #3
  %64 = fmul double %58, %63
  %65 = fpext double %64 to fp128
  %66 = fsub fp128 %65, %42
  %67 = fptrunc fp128 %66 to double
  %68 = getelementptr inbounds nuw i8, ptr %5, i32 16
  store double %67, ptr %68, align 8, !tbaa !10
  br label %84

69:                                               ; preds = %6
  %70 = fptrunc fp128 %27 to double
  store i32 1, ptr %4, align 4, !tbaa !6
  %71 = tail call double @sqrt(double noundef %70) #3
  %72 = fptrunc fp128 %23 to double
  %73 = tail call double @fabs(double noundef %72) #3
  %74 = fadd double %71, %73
  %75 = tail call double @pow(double noundef %74, double noundef 0x3FD5555555555555) #3
  %76 = fptrunc fp128 %15 to double
  %77 = fdiv double %76, %75
  %78 = fadd double %75, %77
  %79 = fcmp olt fp128 %23, 0xL00000000000000000000000000000000
  %80 = fneg double %78
  %81 = select i1 %79, double %78, double %80
  %82 = fdiv double %7, 3.000000e+00
  %83 = fsub double %81, %82
  store double %83, ptr %5, align 8, !tbaa !10
  br label %84

84:                                               ; preds = %69, %29
  ret void
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.fmuladd.f128(fp128, fp128, fp128) #1

declare dso_local double @acos(double noundef) local_unnamed_addr #2

declare dso_local double @sqrt(double noundef) local_unnamed_addr #2

declare dso_local double @cos(double noundef) local_unnamed_addr #2

declare dso_local double @atan(double noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

declare dso_local double @pow(double noundef, double noundef) local_unnamed_addr #2

declare dso_local double @fabs(double noundef) local_unnamed_addr #2

attributes #0 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zcmp,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xrivosvisni,-experimental-xrivosvizip,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvbc32e,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvkgs,-experimental-zvqdotq,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svvptc,-v,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { nobuiltin nounwind "no-builtins" }

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
!11 = !{!"double", !8, i64 0}
