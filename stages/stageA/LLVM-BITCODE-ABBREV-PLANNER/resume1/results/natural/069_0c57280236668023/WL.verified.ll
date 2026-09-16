; ModuleID = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\069_0c57280236668023\WL.bc'
source_filename = "<LEGACY_LOCAL_PROJECT_ROOT>\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\strncmp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"hello world\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"hello\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"d\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"aaaaa\00", align 1
@.str.4 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"ozz\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"rzz\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local void @main_test() #0 {
entry:
  %s1 = alloca ptr, align 8
  %s2 = alloca ptr, align 8
  %s3 = alloca ptr, align 8
  store ptr @.str, ptr %s1, align 8
  %call = call i32 @strncmp(ptr noundef @.str, ptr noundef @.str, i64 noundef 12) #2
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() #2
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @strncmp(ptr noundef @.str, ptr noundef @.str, i64 noundef 12) #2
  %cmp2 = icmp ne i32 %call1, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() #2
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %call5 = call i32 @strncmp(ptr noundef @.str.1, ptr noundef @.str.1, i64 noundef 6) #2
  %cmp6 = icmp ne i32 %call5, 0
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() #2
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end4
  %call9 = call i32 @strncmp(ptr noundef @.str.1, ptr noundef @.str.1, i64 noundef 2) #2
  %cmp10 = icmp ne i32 %call9, 0
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() #2
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end8
  %call13 = call i32 @strncmp(ptr noundef @.str.1, ptr noundef @.str.1, i64 noundef 100) #2
  %cmp14 = icmp ne i32 %call13, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() #2
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %if.end12
  %call17 = call i32 @strncmp(ptr noundef getelementptr inbounds (i8, ptr @.str, i64 10), ptr noundef @.str.2, i64 noundef 100) #2
  %cmp18 = icmp ne i32 %call17, 0
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  call void @abort() #2
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %if.end16
  %call21 = call i32 @strncmp(ptr noundef getelementptr inbounds (i8, ptr @.str, i64 10), ptr noundef @.str.2, i64 noundef 100) #2
  %cmp22 = icmp ne i32 %call21, 0
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() #2
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.end20
  %call25 = call i32 @strncmp(ptr noundef @.str.2, ptr noundef getelementptr inbounds (i8, ptr @.str, i64 10), i64 noundef 1) #2
  %cmp26 = icmp ne i32 %call25, 0
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  call void @abort() #2
  br label %if.end28

if.end28:                                         ; preds = %if.then27, %if.end24
  %call29 = call i32 @strncmp(ptr noundef @.str.2, ptr noundef getelementptr inbounds (i8, ptr @.str, i64 10), i64 noundef 1) #2
  %cmp30 = icmp ne i32 %call29, 0
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end28
  call void @abort() #2
  br label %if.end32

if.end32:                                         ; preds = %if.then31, %if.end28
  %call33 = call i32 @strncmp(ptr noundef @.str.1, ptr noundef @.str.3, i64 noundef 100) #2
  %cmp34 = icmp sle i32 %call33, 0
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end32
  call void @abort() #2
  br label %if.end36

if.end36:                                         ; preds = %if.then35, %if.end32
  %call37 = call i32 @strncmp(ptr noundef @.str.3, ptr noundef @.str.1, i64 noundef 100) #2
  %cmp38 = icmp sge i32 %call37, 0
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end36
  call void @abort() #2
  br label %if.end40

if.end40:                                         ; preds = %if.then39, %if.end36
  %call41 = call i32 @strncmp(ptr noundef @.str.1, ptr noundef @.str.3, i64 noundef 1) #2
  %cmp42 = icmp sle i32 %call41, 0
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end40
  call void @abort() #2
  br label %if.end44

if.end44:                                         ; preds = %if.then43, %if.end40
  %call45 = call i32 @strncmp(ptr noundef @.str.3, ptr noundef @.str.1, i64 noundef 1) #2
  %cmp46 = icmp sge i32 %call45, 0
  br i1 %cmp46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.end44
  call void @abort() #2
  br label %if.end48

if.end48:                                         ; preds = %if.then47, %if.end44
  store ptr @.str, ptr %s2, align 8
  store ptr getelementptr inbounds (i8, ptr @.str, i64 4), ptr %s3, align 8
  %0 = load ptr, ptr %s2, align 8
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %0, i32 1
  store ptr %incdec.ptr, ptr %s2, align 8
  %1 = load ptr, ptr %s3, align 8
  %incdec.ptr49 = getelementptr inbounds nuw i8, ptr %1, i32 1
  store ptr %incdec.ptr49, ptr %s3, align 8
  %call50 = call i32 @strncmp(ptr noundef %incdec.ptr, ptr noundef %incdec.ptr49, i64 noundef 0) #2
  %cmp51 = icmp ne i32 %call50, 0
  br i1 %cmp51, label %if.then55, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end48
  %2 = load ptr, ptr %s2, align 8
  %cmp52 = icmp ne ptr %2, getelementptr inbounds (i8, ptr @.str, i64 1)
  br i1 %cmp52, label %if.then55, label %lor.lhs.false53

lor.lhs.false53:                                  ; preds = %lor.lhs.false
  %3 = load ptr, ptr %s3, align 8
  %cmp54 = icmp ne ptr %3, getelementptr inbounds (i8, ptr @.str, i64 5)
  br i1 %cmp54, label %if.then55, label %if.end56

if.then55:                                        ; preds = %lor.lhs.false53, %lor.lhs.false, %if.end48
  call void @abort() #2
  br label %if.end56

if.end56:                                         ; preds = %if.then55, %lor.lhs.false53
  store ptr @.str, ptr %s2, align 8
  %4 = load ptr, ptr %s2, align 8
  %incdec.ptr57 = getelementptr inbounds nuw i8, ptr %4, i32 1
  store ptr %incdec.ptr57, ptr %s2, align 8
  %call58 = call i32 @strncmp(ptr noundef %incdec.ptr57, ptr noundef @.str.4, i64 noundef 1) #2
  %cmp59 = icmp sle i32 %call58, 0
  br i1 %cmp59, label %if.then62, label %lor.lhs.false60

lor.lhs.false60:                                  ; preds = %if.end56
  %5 = load ptr, ptr %s2, align 8
  %cmp61 = icmp ne ptr %5, getelementptr inbounds (i8, ptr @.str, i64 1)
  br i1 %cmp61, label %if.then62, label %if.end63

if.then62:                                        ; preds = %lor.lhs.false60, %if.end56
  call void @abort() #2
  br label %if.end63

if.end63:                                         ; preds = %if.then62, %lor.lhs.false60
  %6 = load ptr, ptr %s2, align 8
  %incdec.ptr64 = getelementptr inbounds nuw i8, ptr %6, i32 1
  store ptr %incdec.ptr64, ptr %s2, align 8
  %call65 = call i32 @strncmp(ptr noundef @.str.4, ptr noundef %incdec.ptr64, i64 noundef 1) #2
  %cmp66 = icmp sge i32 %call65, 0
  br i1 %cmp66, label %if.then69, label %lor.lhs.false67

lor.lhs.false67:                                  ; preds = %if.end63
  %7 = load ptr, ptr %s2, align 8
  %cmp68 = icmp ne ptr %7, getelementptr inbounds (i8, ptr @.str, i64 2)
  br i1 %cmp68, label %if.then69, label %if.end70

if.then69:                                        ; preds = %lor.lhs.false67, %if.end63
  call void @abort() #2
  br label %if.end70

if.end70:                                         ; preds = %if.then69, %lor.lhs.false67
  %8 = load ptr, ptr %s2, align 8
  %incdec.ptr71 = getelementptr inbounds nuw i8, ptr %8, i32 1
  store ptr %incdec.ptr71, ptr %s2, align 8
  %call72 = call i32 @strncmp(ptr noundef %incdec.ptr71, ptr noundef @.str.4, i64 noundef 100) #2
  %cmp73 = icmp sle i32 %call72, 0
  br i1 %cmp73, label %if.then76, label %lor.lhs.false74

lor.lhs.false74:                                  ; preds = %if.end70
  %9 = load ptr, ptr %s2, align 8
  %cmp75 = icmp ne ptr %9, getelementptr inbounds (i8, ptr @.str, i64 3)
  br i1 %cmp75, label %if.then76, label %if.end77

if.then76:                                        ; preds = %lor.lhs.false74, %if.end70
  call void @abort() #2
  br label %if.end77

if.end77:                                         ; preds = %if.then76, %lor.lhs.false74
  %10 = load ptr, ptr %s2, align 8
  %incdec.ptr78 = getelementptr inbounds nuw i8, ptr %10, i32 1
  store ptr %incdec.ptr78, ptr %s2, align 8
  %call79 = call i32 @strncmp(ptr noundef @.str.4, ptr noundef %incdec.ptr78, i64 noundef 100) #2
  %cmp80 = icmp sge i32 %call79, 0
  br i1 %cmp80, label %if.then83, label %lor.lhs.false81

lor.lhs.false81:                                  ; preds = %if.end77
  %11 = load ptr, ptr %s2, align 8
  %cmp82 = icmp ne ptr %11, getelementptr inbounds (i8, ptr @.str, i64 4)
  br i1 %cmp82, label %if.then83, label %if.end84

if.then83:                                        ; preds = %lor.lhs.false81, %if.end77
  call void @abort() #2
  br label %if.end84

if.end84:                                         ; preds = %if.then83, %lor.lhs.false81
  %12 = load ptr, ptr %s2, align 8
  %incdec.ptr85 = getelementptr inbounds nuw i8, ptr %12, i32 1
  store ptr %incdec.ptr85, ptr %s2, align 8
  %add.ptr = getelementptr inbounds i8, ptr %incdec.ptr85, i64 6
  %call86 = call i32 @strncmp(ptr noundef %add.ptr, ptr noundef @.str.4, i64 noundef 100) #2
  %cmp87 = icmp ne i32 %call86, 0
  br i1 %cmp87, label %if.then90, label %lor.lhs.false88

lor.lhs.false88:                                  ; preds = %if.end84
  %13 = load ptr, ptr %s2, align 8
  %cmp89 = icmp ne ptr %13, getelementptr inbounds (i8, ptr @.str, i64 5)
  br i1 %cmp89, label %if.then90, label %if.end91

if.then90:                                        ; preds = %lor.lhs.false88, %if.end84
  call void @abort() #2
  br label %if.end91

if.end91:                                         ; preds = %if.then90, %lor.lhs.false88
  %14 = load ptr, ptr %s2, align 8
  %incdec.ptr92 = getelementptr inbounds nuw i8, ptr %14, i32 1
  store ptr %incdec.ptr92, ptr %s2, align 8
  %add.ptr93 = getelementptr inbounds i8, ptr %incdec.ptr92, i64 5
  %call94 = call i32 @strncmp(ptr noundef @.str.4, ptr noundef %add.ptr93, i64 noundef 100) #2
  %cmp95 = icmp ne i32 %call94, 0
  br i1 %cmp95, label %if.then98, label %lor.lhs.false96

lor.lhs.false96:                                  ; preds = %if.end91
  %15 = load ptr, ptr %s2, align 8
  %cmp97 = icmp ne ptr %15, getelementptr inbounds (i8, ptr @.str, i64 6)
  br i1 %cmp97, label %if.then98, label %if.end99

if.then98:                                        ; preds = %lor.lhs.false96, %if.end91
  call void @abort() #2
  br label %if.end99

if.end99:                                         ; preds = %if.then98, %lor.lhs.false96
  %16 = load ptr, ptr %s2, align 8
  %incdec.ptr100 = getelementptr inbounds nuw i8, ptr %16, i32 1
  store ptr %incdec.ptr100, ptr %s2, align 8
  %call101 = call i32 @strncmp(ptr noundef @.str.5, ptr noundef %incdec.ptr100, i64 noundef 1) #2
  %cmp102 = icmp ne i32 %call101, 0
  br i1 %cmp102, label %if.then105, label %lor.lhs.false103

lor.lhs.false103:                                 ; preds = %if.end99
  %17 = load ptr, ptr %s2, align 8
  %cmp104 = icmp ne ptr %17, getelementptr inbounds (i8, ptr @.str, i64 7)
  br i1 %cmp104, label %if.then105, label %if.end106

if.then105:                                       ; preds = %lor.lhs.false103, %if.end99
  call void @abort() #2
  br label %if.end106

if.end106:                                        ; preds = %if.then105, %lor.lhs.false103
  %18 = load ptr, ptr %s2, align 8
  %incdec.ptr107 = getelementptr inbounds nuw i8, ptr %18, i32 1
  store ptr %incdec.ptr107, ptr %s2, align 8
  %call108 = call i32 @strncmp(ptr noundef %incdec.ptr107, ptr noundef @.str.6, i64 noundef 1) #2
  %cmp109 = icmp ne i32 %call108, 0
  br i1 %cmp109, label %if.then112, label %lor.lhs.false110

lor.lhs.false110:                                 ; preds = %if.end106
  %19 = load ptr, ptr %s2, align 8
  %cmp111 = icmp ne ptr %19, getelementptr inbounds (i8, ptr @.str, i64 8)
  br i1 %cmp111, label %if.then112, label %if.end113

if.then112:                                       ; preds = %lor.lhs.false110, %if.end106
  call void @abort() #2
  br label %if.end113

if.end113:                                        ; preds = %if.then112, %lor.lhs.false110
  store ptr @.str, ptr %s2, align 8
  store ptr getelementptr inbounds (i8, ptr @.str, i64 4), ptr %s3, align 8
  %20 = load ptr, ptr %s2, align 8
  %incdec.ptr114 = getelementptr inbounds nuw i8, ptr %20, i32 1
  store ptr %incdec.ptr114, ptr %s2, align 8
  %21 = load ptr, ptr %s3, align 8
  %incdec.ptr115 = getelementptr inbounds nuw i8, ptr %21, i32 1
  store ptr %incdec.ptr115, ptr %s3, align 8
  %add.ptr116 = getelementptr inbounds i8, ptr %incdec.ptr115, i64 2
  %call117 = call i32 @strncmp(ptr noundef %incdec.ptr114, ptr noundef %add.ptr116, i64 noundef 1) #2
  %cmp118 = icmp sge i32 %call117, 0
  br i1 %cmp118, label %if.then123, label %lor.lhs.false119

lor.lhs.false119:                                 ; preds = %if.end113
  %22 = load ptr, ptr %s2, align 8
  %cmp120 = icmp ne ptr %22, getelementptr inbounds (i8, ptr @.str, i64 1)
  br i1 %cmp120, label %if.then123, label %lor.lhs.false121

lor.lhs.false121:                                 ; preds = %lor.lhs.false119
  %23 = load ptr, ptr %s3, align 8
  %cmp122 = icmp ne ptr %23, getelementptr inbounds (i8, ptr @.str, i64 5)
  br i1 %cmp122, label %if.then123, label %if.end124

if.then123:                                       ; preds = %lor.lhs.false121, %lor.lhs.false119, %if.end113
  call void @abort() #2
  br label %if.end124

if.end124:                                        ; preds = %if.then123, %lor.lhs.false121
  ret void
}

declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #1

declare void @abort() #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin "no-builtins" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"}
