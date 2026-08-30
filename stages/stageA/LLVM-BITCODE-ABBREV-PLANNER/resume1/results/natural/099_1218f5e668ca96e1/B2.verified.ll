; ModuleID = 'D:\project\writing\reserch\stages\stageA\LLVM-BITCODE-ABBREV-PLANNER\resume1\results\natural\099_1218f5e668ca96e1\B2.bc'
source_filename = "D:\\project\\writing\\reserch\\stages\\stageA\\LLVM-BITCODE-ABBREV-PLANNER\\resume1\\inputs\\corpus\\llvm-test-suite-selected\\SingleSource\\Regression\\C\\gcc-c-torture\\execute\\builtins\\memmove-chk.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type { ptr, double, i64 }
%struct.bar = type { ptr, [3 x %struct.foo] }
%union.anon = type { x86_fp80, [80 x i8] }
%struct.A = type { [10 x i8], [10 x i8] }
%struct.A.0 = type { [10 x i8], [10 x i8] }

@s1 = dso_local constant [4 x i8] c"123\00", align 1
@p = dso_local global [32 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [5 x i8] c"defg\00", align 1
@s2 = dso_local local_unnamed_addr global ptr @.str, align 8
@.str.1 = private unnamed_addr constant [4 x i8] c"FGH\00", align 1
@s3 = dso_local local_unnamed_addr global ptr @.str.1, align 8
@l1 = dso_local global i64 1, align 8
@memmove_disallowed = external global i32, align 4
@memcpy_disallowed = external global i32, align 4
@chk_calls = external global i32, align 4
@.str.2 = private unnamed_addr constant [6 x i8] c"ABCDE\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"WX\00\00\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"A\00CDE\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"A\00CFGHI\00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"qrstu\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"QRSTU\00", align 1
@.str.11 = private unnamed_addr constant [6 x i8] c"Q123U\00", align 1
@.str.14 = private unnamed_addr constant [8 x i8] c"abcdefg\00", align 1
@.str.15 = private unnamed_addr constant [8 x i8] c"ABCDEFg\00", align 1
@.str.16 = private unnamed_addr constant [8 x i8] c"ABCDEF2\00", align 1
@buf1 = dso_local global [64 x i64] zeroinitializer, align 16
@buf2 = dso_local local_unnamed_addr global ptr getelementptr inbounds nuw (i8, ptr @buf1, i64 256), align 8
@.str.17 = private unnamed_addr constant [10 x i8] c"ABCDEFGHI\00", align 1
@.str.18 = private unnamed_addr constant [11 x i8] c"ABCDEFGHI\00\00", align 1
@.str.19 = private unnamed_addr constant [18 x i8] c"abcdefghijklmnopq\00", align 1
@.str.20 = private unnamed_addr constant [19 x i8] c"abcdefghijklmnopq\00\00", align 1
@.str.21 = private unnamed_addr constant [7 x i8] c"ABCDEF\00", align 1
@.str.22 = private unnamed_addr constant [19 x i8] c"ABCDEFghijklmnopq\00\00", align 1
@.str.23 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.24 = private unnamed_addr constant [19 x i8] c"aBCDEFghijklmnopq\00\00", align 1
@.str.25 = private unnamed_addr constant [4 x i8] c"bcd\00", align 1
@.str.26 = private unnamed_addr constant [19 x i8] c"aBcdEFghijklmnopq\00\00", align 1
@buf5 = dso_local global [20 x i64] zeroinitializer, align 16
@.str.27 = private unnamed_addr constant [19 x i8] c"aBcdRSTUVWklmnopq\00\00", align 1
@.str.28 = private unnamed_addr constant [19 x i8] c"aBcdRSTUVWSlmnopq\00\00", align 1
@.str.29 = private unnamed_addr constant [19 x i8] c"aBcdRSTUVWSlmnrsq\00\00", align 1
@.str.30 = private unnamed_addr constant [19 x i8] c"RSTUVWXYVWSlmnrsq\00\00", align 1
@.str.31 = private unnamed_addr constant [19 x i8] c"RSTUVWXYZ01234567\00\00", align 1
@.str.32 = private unnamed_addr constant [19 x i8] c"aBcdRSTUVWkSmnopq\00\00", align 1
@.str.33 = private unnamed_addr constant [19 x i8] c"aBcdRSTUVWkSmnrsq\00\00", align 1
@buf7 = dso_local global [20 x i8] zeroinitializer, align 16
@.str.34 = private unnamed_addr constant [20 x i8] c"RSTUVWXYZ0123456789\00", align 1
@.str.35 = private unnamed_addr constant [10 x i8] c"rstuvwxyz\00", align 1
@foo = internal constant [6 x %struct.foo] [%struct.foo { ptr @.str.43, double 3.141590e+00, i64 101 }, %struct.foo { ptr @.str.44, double 3.141590e+00, i64 102 }, %struct.foo { ptr @.str.45, double 3.141590e+00, i64 103 }, %struct.foo { ptr @.str.46, double 3.141590e+00, i64 104 }, %struct.foo { ptr @.str.47, double 3.141590e+00, i64 105 }, %struct.foo { ptr @.str.48, double 3.141590e+00, i64 106 }], align 16
@bar = internal constant [2 x %struct.bar] [%struct.bar { ptr @.str.49, [3 x %struct.foo] [%struct.foo { ptr @.str.50, double 3.141590e+00, i64 201 }, %struct.foo { ptr @.str.51, double 3.141590e+00, i64 202 }, %struct.foo { ptr @.str.52, double 3.141590e+00, i64 203 }] }, %struct.bar { ptr @.str.53, [3 x %struct.foo] [%struct.foo { ptr @.str.54, double 3.141590e+00, i64 204 }, %struct.foo { ptr @.str.55, double 3.141590e+00, i64 205 }, %struct.foo { ptr @.str.56, double 3.141590e+00, i64 206 }] }], align 16
@baz = internal constant [10 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 0], align 16
@.str.36 = private unnamed_addr constant [6 x i8] c"abcde\00", align 1
@.str.37 = private unnamed_addr constant [6 x i8] c"abc\00e\00", align 1
@.str.39 = private unnamed_addr constant [7 x i8] c"abfghi\00", align 1
@.str.40 = private unnamed_addr constant [7 x i8] c"abfgAi\00", align 1
@.str.41 = private unnamed_addr constant [7 x i8] c"abggAi\00", align 1
@chk_fail_allowed = external global i32, align 4
@chk_fail_buf = external global [0 x ptr], align 8
@.str.42 = private unnamed_addr constant [3 x i8] c"ab\00", align 1
@u1 = internal global %union.anon zeroinitializer, align 16
@u2 = internal global %union.anon zeroinitializer, align 16
@srcb = dso_local global [80 x i8] zeroinitializer, align 16
@dstb = dso_local global [80 x i8] zeroinitializer, align 16
@.str.43 = private unnamed_addr constant [13 x i8] c"hello world1\00", align 1
@.str.44 = private unnamed_addr constant [13 x i8] c"hello world2\00", align 1
@.str.45 = private unnamed_addr constant [13 x i8] c"hello world3\00", align 1
@.str.46 = private unnamed_addr constant [13 x i8] c"hello world4\00", align 1
@.str.47 = private unnamed_addr constant [13 x i8] c"hello world5\00", align 1
@.str.48 = private unnamed_addr constant [13 x i8] c"hello world6\00", align 1
@.str.49 = private unnamed_addr constant [14 x i8] c"hello world10\00", align 1
@.str.50 = private unnamed_addr constant [7 x i8] c"hello1\00", align 1
@.str.51 = private unnamed_addr constant [7 x i8] c"hello2\00", align 1
@.str.52 = private unnamed_addr constant [7 x i8] c"hello3\00", align 1
@.str.53 = private unnamed_addr constant [14 x i8] c"hello world11\00", align 1
@.str.54 = private unnamed_addr constant [7 x i8] c"hello4\00", align 1
@.str.55 = private unnamed_addr constant [7 x i8] c"hello5\00", align 1
@.str.56 = private unnamed_addr constant [7 x i8] c"hello6\00", align 1

; Function Attrs: noinline nounwind
define dso_local void @test1() local_unnamed_addr #0 {
entry:
  store volatile i32 1, ptr @memmove_disallowed, align 4, !tbaa !4
  store volatile i32 1, ptr @memcpy_disallowed, align 4, !tbaa !4
  store volatile i32 0, ptr @chk_calls, align 4, !tbaa !4
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(6) @p, ptr noundef nonnull align 1 dereferenceable(6) @.str.2, i64 6, i1 false)
  %call = tail call i32 @memcmp(ptr noundef nonnull @p, ptr noundef nonnull @.str.2, i64 noundef 6) #10
  %tobool.not = icmp eq i32 %call, 0
  br i1 %tobool.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() #10
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i16 22615, ptr getelementptr inbounds nuw (i8, ptr @p, i64 16), align 16
  %call2 = tail call i32 @memcmp(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @p, i64 16), ptr noundef nonnull @.str.4, i64 noundef 5) #10
  %tobool3.not = icmp eq i32 %call2, 0
  br i1 %tobool3.not, label %if.end5, label %if.then4

if.then4:                                         ; preds = %if.end
  tail call void @abort() #10
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  store i8 0, ptr getelementptr inbounds nuw (i8, ptr @p, i64 1), align 1
  %call7 = tail call i32 @memcmp(ptr noundef nonnull @p, ptr noundef nonnull @.str.6, i64 noundef 6) #10
  %tobool8.not = icmp eq i32 %call7, 0
  br i1 %tobool8.not, label %if.end10, label %if.then9

if.then9:                                         ; preds = %if.end5
  tail call void @abort() #10
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.end5
  store i32 1229473606, ptr getelementptr inbounds nuw (i8, ptr @p, i64 3), align 1
  %call12 = tail call i32 @memcmp(ptr noundef nonnull @p, ptr noundef nonnull @.str.8, i64 noundef 8) #10
  %tobool13.not = icmp eq i32 %call12, 0
  br i1 %tobool13.not, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.end10
  tail call void @abort() #10
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end10
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 4 dereferenceable(6) getelementptr inbounds nuw (i8, ptr @p, i64 20), ptr noundef nonnull align 1 dereferenceable(6) @.str.9, i64 6, i1 false)
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(6) getelementptr inbounds nuw (i8, ptr @p, i64 25), ptr noundef nonnull align 1 dereferenceable(6) @.str.10, i64 6, i1 false)
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 2 dereferenceable(3) getelementptr inbounds nuw (i8, ptr @p, i64 26), ptr noundef nonnull align 1 dereferenceable(3) @s1, i64 3, i1 false)
  %call17 = tail call i32 @memcmp(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @p, i64 25), ptr noundef nonnull @.str.11, i64 noundef 6) #10
  %tobool18.not = icmp eq i32 %call17, 0
  br i1 %tobool18.not, label %if.end20, label %if.then19

if.then19:                                        ; preds = %if.end15
  tail call void @abort() #10
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %if.end15
  store i32 1684234849, ptr @p, align 16
  store i32 6776421, ptr getelementptr inbounds nuw (i8, ptr @p, i64 4), align 4
  %call22 = tail call i32 @memcmp(ptr noundef nonnull @p, ptr noundef nonnull @.str.14, i64 noundef 8) #10
  %tobool23.not = icmp eq i32 %call22, 0
  br i1 %tobool23.not, label %if.end25, label %if.then24

if.then24:                                        ; preds = %if.end20
  tail call void @abort() #10
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %if.end20
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(6) @p, ptr noundef nonnull align 1 dereferenceable(6) @.str.2, i64 6, i1 false)
  %call27 = tail call i32 @memcmp(ptr noundef nonnull @p, ptr noundef nonnull @.str.2, i64 noundef 6) #10
  %tobool28.not = icmp eq i32 %call27, 0
  br i1 %tobool28.not, label %if.end30, label %if.then29

if.then29:                                        ; preds = %if.end25
  tail call void @abort() #10
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %if.end25
  %0 = load ptr, ptr @s3, align 8, !tbaa !8
  %1 = load i8, ptr %0, align 1
  store i8 %1, ptr getelementptr inbounds nuw (i8, ptr @p, i64 5), align 1
  %call31 = tail call i32 @memcmp(ptr noundef nonnull @p, ptr noundef nonnull @.str.15, i64 noundef 8) #10
  %tobool32.not = icmp eq i32 %call31, 0
  br i1 %tobool32.not, label %if.end34, label %if.then33

if.then33:                                        ; preds = %if.end30
  tail call void @abort() #10
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %if.end30
  store volatile i32 0, ptr @memmove_disallowed, align 4, !tbaa !4
  store volatile i32 0, ptr @memcpy_disallowed, align 4, !tbaa !4
  %2 = load volatile i32, ptr @chk_calls, align 4, !tbaa !4
  %tobool35.not = icmp eq i32 %2, 0
  br i1 %tobool35.not, label %if.end37, label %if.then36

if.then36:                                        ; preds = %if.end34
  tail call void @abort() #10
  br label %if.end37

if.end37:                                         ; preds = %if.then36, %if.end34
  store volatile i32 0, ptr @chk_calls, align 4, !tbaa !4
  %3 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %call38 = tail call ptr @__memmove_chk(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @p, i64 6), ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @s1, i64 1), i64 noundef %3, i64 noundef 26) #10
  %call39 = tail call i32 @memcmp(ptr noundef nonnull @p, ptr noundef nonnull @.str.16, i64 noundef 8) #10
  %tobool40.not = icmp eq i32 %call39, 0
  br i1 %tobool40.not, label %if.end42, label %if.then41

if.then41:                                        ; preds = %if.end37
  tail call void @abort() #10
  br label %if.end42

if.end42:                                         ; preds = %if.then41, %if.end37
  %4 = load volatile i32, ptr @chk_calls, align 4, !tbaa !4
  %cmp.not = icmp eq i32 %4, 1
  br i1 %cmp.not, label %if.end44, label %if.then43

if.then43:                                        ; preds = %if.end42
  tail call void @abort() #10
  br label %if.end44

if.end44:                                         ; preds = %if.then43, %if.end42
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef) local_unnamed_addr #2

declare void @abort() local_unnamed_addr #2

; Function Attrs: nounwind
declare ptr @__memmove_chk(ptr noundef, ptr noundef, i64 noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: noinline nounwind
define dso_local void @test2_sub(ptr noundef %buf3, ptr noundef %buf4, ptr noundef %buf6, i32 noundef %n) local_unnamed_addr #0 {
entry:
  store volatile i32 0, ptr @chk_calls, align 4, !tbaa !4
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(9) @buf1, ptr noundef nonnull align 1 dereferenceable(9) @.str.17, i64 9, i1 false)
  %call = tail call i32 @memcmp(ptr noundef nonnull @buf1, ptr noundef nonnull @.str.18, i64 noundef 11) #10
  %tobool.not = icmp eq i32 %call, 0
  br i1 %tobool.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() #10
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(17) @buf1, ptr noundef nonnull align 1 dereferenceable(17) @.str.19, i64 17, i1 false)
  %call2 = tail call i32 @memcmp(ptr noundef nonnull @buf1, ptr noundef nonnull @.str.20, i64 noundef 19) #10
  %tobool3.not = icmp eq i32 %call2, 0
  br i1 %tobool3.not, label %if.end5, label %if.then4

if.then4:                                         ; preds = %if.end
  tail call void @abort() #10
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  %call6 = tail call ptr @__memmove_chk(ptr noundef %buf3, ptr noundef nonnull @.str.21, i64 noundef 6, i64 noundef -1) #10
  %cmp.not = icmp eq ptr %call6, @buf1
  br i1 %cmp.not, label %lor.lhs.false7, label %if.then10

lor.lhs.false7:                                   ; preds = %if.end5
  %call8 = tail call i32 @memcmp(ptr noundef nonnull @buf1, ptr noundef nonnull @.str.22, i64 noundef 19) #10
  %tobool9.not = icmp eq i32 %call8, 0
  br i1 %tobool9.not, label %if.end11, label %if.then10

if.then10:                                        ; preds = %lor.lhs.false7, %if.end5
  tail call void @abort() #10
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %lor.lhs.false7
  %call12 = tail call ptr @__memmove_chk(ptr noundef %buf3, ptr noundef nonnull @.str.23, i64 noundef 1, i64 noundef -1) #10
  %cmp13.not = icmp eq ptr %call12, @buf1
  br i1 %cmp13.not, label %lor.lhs.false14, label %if.then17

lor.lhs.false14:                                  ; preds = %if.end11
  %call15 = tail call i32 @memcmp(ptr noundef nonnull @buf1, ptr noundef nonnull @.str.24, i64 noundef 19) #10
  %tobool16.not = icmp eq i32 %call15, 0
  br i1 %tobool16.not, label %if.end18, label %if.then17

if.then17:                                        ; preds = %lor.lhs.false14, %if.end11
  tail call void @abort() #10
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %lor.lhs.false14
  %add.ptr = getelementptr inbounds nuw i8, ptr %buf3, i64 2
  %call21 = tail call ptr @__memmove_chk(ptr noundef nonnull %add.ptr, ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @.str.25, i64 1), i64 noundef 2, i64 noundef -1) #10
  %cmp22.not = icmp eq ptr %call21, getelementptr inbounds nuw (i8, ptr @buf1, i64 2)
  br i1 %cmp22.not, label %lor.lhs.false23, label %if.then28

lor.lhs.false23:                                  ; preds = %if.end18
  %call24 = tail call i32 @memcmp(ptr noundef nonnull @buf1, ptr noundef nonnull @.str.26, i64 noundef 19) #10
  %tobool25.not = icmp eq i32 %call24, 0
  br i1 %tobool25.not, label %if.end29, label %if.then28

if.then28:                                        ; preds = %lor.lhs.false23, %if.end18
  tail call void @abort() #10
  br label %if.end29

if.end29:                                         ; preds = %lor.lhs.false23, %if.then28
  %add.ptr30 = getelementptr inbounds nuw i8, ptr %buf3, i64 4
  %call32 = tail call ptr @__memmove_chk(ptr noundef nonnull %add.ptr30, ptr noundef nonnull @buf5, i64 noundef 6, i64 noundef -1) #10
  %cmp33.not = icmp eq ptr %call32, getelementptr inbounds nuw (i8, ptr @buf1, i64 4)
  br i1 %cmp33.not, label %lor.lhs.false34, label %if.then37

lor.lhs.false34:                                  ; preds = %if.end29
  %call35 = tail call i32 @memcmp(ptr noundef nonnull @buf1, ptr noundef nonnull @.str.27, i64 noundef 19) #10
  %tobool36.not = icmp eq i32 %call35, 0
  br i1 %tobool36.not, label %if.end38, label %if.then37

if.then37:                                        ; preds = %lor.lhs.false34, %if.end29
  tail call void @abort() #10
  br label %if.end38

if.end38:                                         ; preds = %if.then37, %lor.lhs.false34
  %0 = load i8, ptr getelementptr inbounds nuw (i8, ptr @buf5, i64 1), align 1
  store i8 %0, ptr getelementptr inbounds nuw (i8, ptr @buf1, i64 10), align 2
  %call45 = tail call i32 @memcmp(ptr noundef nonnull @buf1, ptr noundef nonnull @.str.28, i64 noundef 19) #10
  %tobool46.not = icmp eq i32 %call45, 0
  br i1 %tobool46.not, label %if.end50, label %if.then49

if.then49:                                        ; preds = %if.end38
  tail call void @abort() #10
  br label %if.end50

if.end50:                                         ; preds = %if.end38, %if.then49
  %add.ptr51 = getelementptr inbounds nuw i8, ptr %buf3, i64 14
  %call53 = tail call ptr @__memmove_chk(ptr noundef nonnull %add.ptr51, ptr noundef %buf6, i64 noundef 2, i64 noundef -1) #10
  %cmp54.not = icmp eq ptr %call53, getelementptr inbounds nuw (i8, ptr @buf1, i64 14)
  br i1 %cmp54.not, label %lor.lhs.false55, label %if.then58

lor.lhs.false55:                                  ; preds = %if.end50
  %call56 = tail call i32 @memcmp(ptr noundef nonnull @buf1, ptr noundef nonnull @.str.29, i64 noundef 19) #10
  %tobool57.not = icmp eq i32 %call56, 0
  br i1 %tobool57.not, label %if.end59, label %if.then58

if.then58:                                        ; preds = %lor.lhs.false55, %if.end50
  tail call void @abort() #10
  br label %if.end59

if.end59:                                         ; preds = %if.then58, %lor.lhs.false55
  %call60 = tail call ptr @__memmove_chk(ptr noundef nonnull %buf3, ptr noundef nonnull @buf5, i64 noundef 8, i64 noundef -1) #10
  %cmp61.not = icmp eq ptr %call60, @buf1
  br i1 %cmp61.not, label %lor.lhs.false62, label %if.then65

lor.lhs.false62:                                  ; preds = %if.end59
  %call63 = tail call i32 @memcmp(ptr noundef nonnull @buf1, ptr noundef nonnull @.str.30, i64 noundef 19) #10
  %tobool64.not = icmp eq i32 %call63, 0
  br i1 %tobool64.not, label %if.end66, label %if.then65

if.then65:                                        ; preds = %lor.lhs.false62, %if.end59
  tail call void @abort() #10
  br label %if.end66

if.end66:                                         ; preds = %if.then65, %lor.lhs.false62
  %call67 = tail call ptr @__memmove_chk(ptr noundef nonnull %buf3, ptr noundef nonnull @buf5, i64 noundef 17, i64 noundef -1) #10
  %cmp68.not = icmp eq ptr %call67, @buf1
  br i1 %cmp68.not, label %lor.lhs.false69, label %if.then72

lor.lhs.false69:                                  ; preds = %if.end66
  %call70 = tail call i32 @memcmp(ptr noundef nonnull @buf1, ptr noundef nonnull @.str.31, i64 noundef 19) #10
  %tobool71.not = icmp eq i32 %call70, 0
  br i1 %tobool71.not, label %if.end73, label %if.then72

if.then72:                                        ; preds = %lor.lhs.false69, %if.end66
  tail call void @abort() #10
  br label %if.end73

if.end73:                                         ; preds = %if.then72, %lor.lhs.false69
  %call74 = tail call ptr @__memmove_chk(ptr noundef nonnull %buf3, ptr noundef nonnull @.str.26, i64 noundef 19, i64 noundef -1) #10
  %add = add nsw i32 %n, 6
  %conv = sext i32 %add to i64
  %call77 = tail call ptr @__memmove_chk(ptr noundef nonnull %add.ptr30, ptr noundef nonnull @buf5, i64 noundef %conv, i64 noundef -1) #10
  %cmp78.not = icmp eq ptr %call77, getelementptr inbounds nuw (i8, ptr @buf1, i64 4)
  br i1 %cmp78.not, label %lor.lhs.false80, label %if.then83

lor.lhs.false80:                                  ; preds = %if.end73
  %call81 = tail call i32 @memcmp(ptr noundef nonnull @buf1, ptr noundef nonnull @.str.27, i64 noundef 19) #10
  %tobool82.not = icmp eq i32 %call81, 0
  br i1 %tobool82.not, label %if.end84, label %if.then83

if.then83:                                        ; preds = %lor.lhs.false80, %if.end73
  tail call void @abort() #10
  br label %if.end84

if.end84:                                         ; preds = %if.then83, %lor.lhs.false80
  %add89 = add nsw i32 %n, 1
  %conv90 = sext i32 %add89 to i64
  %call91 = tail call ptr @__memmove_chk(ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @buf1, i64 11), ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @buf5, i64 1), i64 noundef %conv90, i64 noundef -1) #10
  %cmp92.not = icmp eq ptr %call91, getelementptr inbounds nuw (i8, ptr @buf1, i64 11)
  br i1 %cmp92.not, label %lor.lhs.false94, label %if.then100

lor.lhs.false94:                                  ; preds = %if.end84
  %call95 = tail call i32 @memcmp(ptr noundef nonnull @buf1, ptr noundef nonnull @.str.32, i64 noundef 19) #10
  %tobool96.not = icmp eq i32 %call95, 0
  br i1 %tobool96.not, label %if.end101, label %if.then100

if.then100:                                       ; preds = %lor.lhs.false94, %if.end84
  tail call void @abort() #10
  br label %if.end101

if.end101:                                        ; preds = %lor.lhs.false94, %if.then100
  %add103 = add nsw i32 %n, 2
  %conv104 = sext i32 %add103 to i64
  %call106 = tail call ptr @__memmove_chk(ptr noundef nonnull %add.ptr51, ptr noundef %buf6, i64 noundef %conv104, i64 noundef -1) #10
  %cmp107.not = icmp eq ptr %call106, getelementptr inbounds nuw (i8, ptr @buf1, i64 14)
  br i1 %cmp107.not, label %lor.lhs.false109, label %if.then112

lor.lhs.false109:                                 ; preds = %if.end101
  %call110 = tail call i32 @memcmp(ptr noundef nonnull @buf1, ptr noundef nonnull @.str.33, i64 noundef 19) #10
  %tobool111.not = icmp eq i32 %call110, 0
  br i1 %tobool111.not, label %if.end113, label %if.then112

if.then112:                                       ; preds = %lor.lhs.false109, %if.end101
  tail call void @abort() #10
  br label %if.end113

if.end113:                                        ; preds = %if.then112, %lor.lhs.false109
  %1 = load ptr, ptr @buf2, align 8, !tbaa !8
  %call114 = tail call ptr @__memmove_chk(ptr noundef %1, ptr noundef nonnull @.str.17, i64 noundef 9, i64 noundef -1) #10
  %2 = load ptr, ptr @buf2, align 8, !tbaa !8
  %cmp115.not = icmp eq ptr %call114, %2
  br i1 %cmp115.not, label %lor.lhs.false117, label %if.then120

lor.lhs.false117:                                 ; preds = %if.end113
  %call118 = tail call i32 @memcmp(ptr noundef %2, ptr noundef nonnull @.str.18, i64 noundef 11) #10
  %tobool119.not = icmp eq i32 %call118, 0
  br i1 %tobool119.not, label %if.end121, label %if.then120

if.then120:                                       ; preds = %lor.lhs.false117, %if.end113
  tail call void @abort() #10
  br label %if.end121

if.end121:                                        ; preds = %if.then120, %lor.lhs.false117
  %3 = load ptr, ptr @buf2, align 8, !tbaa !8
  %call122 = tail call ptr @__memmove_chk(ptr noundef %3, ptr noundef nonnull @.str.19, i64 noundef 17, i64 noundef -1) #10
  %4 = load ptr, ptr @buf2, align 8, !tbaa !8
  %cmp123.not = icmp eq ptr %call122, %4
  br i1 %cmp123.not, label %lor.lhs.false125, label %if.then128

lor.lhs.false125:                                 ; preds = %if.end121
  %call126 = tail call i32 @memcmp(ptr noundef %4, ptr noundef nonnull @.str.20, i64 noundef 19) #10
  %tobool127.not = icmp eq i32 %call126, 0
  br i1 %tobool127.not, label %if.end129, label %if.then128

if.then128:                                       ; preds = %lor.lhs.false125, %if.end121
  tail call void @abort() #10
  br label %if.end129

if.end129:                                        ; preds = %if.then128, %lor.lhs.false125
  %call130 = tail call ptr @__memmove_chk(ptr noundef %buf4, ptr noundef nonnull @.str.21, i64 noundef 6, i64 noundef -1) #10
  %5 = load ptr, ptr @buf2, align 8, !tbaa !8
  %cmp131.not = icmp eq ptr %call130, %5
  br i1 %cmp131.not, label %lor.lhs.false133, label %if.then136

lor.lhs.false133:                                 ; preds = %if.end129
  %call134 = tail call i32 @memcmp(ptr noundef %5, ptr noundef nonnull @.str.22, i64 noundef 19) #10
  %tobool135.not = icmp eq i32 %call134, 0
  br i1 %tobool135.not, label %if.end137, label %if.then136

if.then136:                                       ; preds = %lor.lhs.false133, %if.end129
  tail call void @abort() #10
  br label %if.end137

if.end137:                                        ; preds = %if.then136, %lor.lhs.false133
  %call138 = tail call ptr @__memmove_chk(ptr noundef %buf4, ptr noundef nonnull @.str.23, i64 noundef 1, i64 noundef -1) #10
  %6 = load ptr, ptr @buf2, align 8, !tbaa !8
  %cmp139.not = icmp eq ptr %call138, %6
  br i1 %cmp139.not, label %lor.lhs.false141, label %if.then144

lor.lhs.false141:                                 ; preds = %if.end137
  %call142 = tail call i32 @memcmp(ptr noundef %6, ptr noundef nonnull @.str.24, i64 noundef 19) #10
  %tobool143.not = icmp eq i32 %call142, 0
  br i1 %tobool143.not, label %if.end145, label %if.then144

if.then144:                                       ; preds = %lor.lhs.false141, %if.end137
  tail call void @abort() #10
  br label %if.end145

if.end145:                                        ; preds = %if.then144, %lor.lhs.false141
  %add.ptr146 = getelementptr inbounds nuw i8, ptr %buf4, i64 2
  %call151 = tail call ptr @__memmove_chk(ptr noundef nonnull %add.ptr146, ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @.str.25, i64 1), i64 noundef 2, i64 noundef -1) #10
  %7 = load ptr, ptr @buf2, align 8, !tbaa !8
  %add.ptr152 = getelementptr inbounds nuw i8, ptr %7, i64 2
  %cmp153.not = icmp eq ptr %call151, %add.ptr152
  br i1 %cmp153.not, label %lor.lhs.false155, label %if.then161

lor.lhs.false155:                                 ; preds = %if.end145
  %call156 = tail call i32 @memcmp(ptr noundef %7, ptr noundef nonnull @.str.26, i64 noundef 19) #10
  %tobool157.not = icmp eq i32 %call156, 0
  br i1 %tobool157.not, label %if.end162, label %if.then161

if.then161:                                       ; preds = %lor.lhs.false155, %if.end145
  tail call void @abort() #10
  br label %if.end162

if.end162:                                        ; preds = %lor.lhs.false155, %if.then161
  %add.ptr163 = getelementptr inbounds nuw i8, ptr %buf4, i64 4
  %call165 = tail call ptr @__memmove_chk(ptr noundef nonnull %add.ptr163, ptr noundef nonnull @buf7, i64 noundef 6, i64 noundef -1) #10
  %8 = load ptr, ptr @buf2, align 8, !tbaa !8
  %add.ptr166 = getelementptr inbounds nuw i8, ptr %8, i64 4
  %cmp167.not = icmp eq ptr %call165, %add.ptr166
  br i1 %cmp167.not, label %lor.lhs.false169, label %if.then172

lor.lhs.false169:                                 ; preds = %if.end162
  %call170 = tail call i32 @memcmp(ptr noundef %8, ptr noundef nonnull @.str.27, i64 noundef 19) #10
  %tobool171.not = icmp eq i32 %call170, 0
  br i1 %tobool171.not, label %if.end173, label %if.then172

if.then172:                                       ; preds = %lor.lhs.false169, %if.end162
  tail call void @abort() #10
  br label %if.end173

if.end173:                                        ; preds = %if.then172, %lor.lhs.false169
  %9 = load ptr, ptr @buf2, align 8, !tbaa !8
  %add.ptr177 = getelementptr inbounds nuw i8, ptr %9, i64 10
  %10 = load i8, ptr getelementptr inbounds nuw (i8, ptr @buf7, i64 1), align 1
  store i8 %10, ptr %add.ptr177, align 1
  %call182 = tail call i32 @memcmp(ptr noundef %9, ptr noundef nonnull @.str.28, i64 noundef 19) #10
  %tobool183.not = icmp eq i32 %call182, 0
  br i1 %tobool183.not, label %if.end188, label %if.then187

if.then187:                                       ; preds = %if.end173
  tail call void @abort() #10
  br label %if.end188

if.end188:                                        ; preds = %if.end173, %if.then187
  %add.ptr189 = getelementptr inbounds nuw i8, ptr %buf4, i64 14
  %call191 = tail call ptr @__memmove_chk(ptr noundef nonnull %add.ptr189, ptr noundef %buf6, i64 noundef 2, i64 noundef -1) #10
  %11 = load ptr, ptr @buf2, align 8, !tbaa !8
  %add.ptr192 = getelementptr inbounds nuw i8, ptr %11, i64 14
  %cmp193.not = icmp eq ptr %call191, %add.ptr192
  br i1 %cmp193.not, label %lor.lhs.false195, label %if.then198

lor.lhs.false195:                                 ; preds = %if.end188
  %call196 = tail call i32 @memcmp(ptr noundef %11, ptr noundef nonnull @.str.29, i64 noundef 19) #10
  %tobool197.not = icmp eq i32 %call196, 0
  br i1 %tobool197.not, label %if.end199, label %if.then198

if.then198:                                       ; preds = %lor.lhs.false195, %if.end188
  tail call void @abort() #10
  br label %if.end199

if.end199:                                        ; preds = %if.then198, %lor.lhs.false195
  %call200 = tail call ptr @__memmove_chk(ptr noundef nonnull %buf4, ptr noundef nonnull @.str.26, i64 noundef 19, i64 noundef -1) #10
  %call205 = tail call ptr @__memmove_chk(ptr noundef nonnull %add.ptr163, ptr noundef nonnull @buf7, i64 noundef %conv, i64 noundef -1) #10
  %12 = load ptr, ptr @buf2, align 8, !tbaa !8
  %add.ptr206 = getelementptr inbounds nuw i8, ptr %12, i64 4
  %cmp207.not = icmp eq ptr %call205, %add.ptr206
  br i1 %cmp207.not, label %lor.lhs.false209, label %if.then212

lor.lhs.false209:                                 ; preds = %if.end199
  %call210 = tail call i32 @memcmp(ptr noundef %12, ptr noundef nonnull @.str.27, i64 noundef 19) #10
  %tobool211.not = icmp eq i32 %call210, 0
  br i1 %tobool211.not, label %if.end213, label %if.then212

if.then212:                                       ; preds = %lor.lhs.false209, %if.end199
  tail call void @abort() #10
  br label %if.end213

if.end213:                                        ; preds = %if.then212, %lor.lhs.false209
  %13 = load ptr, ptr @buf2, align 8, !tbaa !8
  %add.ptr217 = getelementptr inbounds nuw i8, ptr %13, i64 11
  %call220 = tail call ptr @__memmove_chk(ptr noundef nonnull %add.ptr217, ptr noundef nonnull getelementptr inbounds nuw (i8, ptr @buf7, i64 1), i64 noundef %conv90, i64 noundef -1) #10
  %14 = load ptr, ptr @buf2, align 8, !tbaa !8
  %add.ptr221 = getelementptr inbounds nuw i8, ptr %14, i64 11
  %cmp222.not = icmp eq ptr %call220, %add.ptr221
  br i1 %cmp222.not, label %lor.lhs.false224, label %if.then230

lor.lhs.false224:                                 ; preds = %if.end213
  %call225 = tail call i32 @memcmp(ptr noundef %14, ptr noundef nonnull @.str.32, i64 noundef 19) #10
  %tobool226.not = icmp eq i32 %call225, 0
  br i1 %tobool226.not, label %if.end231, label %if.then230

if.then230:                                       ; preds = %lor.lhs.false224, %if.end213
  tail call void @abort() #10
  br label %if.end231

if.end231:                                        ; preds = %lor.lhs.false224, %if.then230
  %call236 = tail call ptr @__memmove_chk(ptr noundef nonnull %add.ptr189, ptr noundef %buf6, i64 noundef %conv104, i64 noundef -1) #10
  %15 = load ptr, ptr @buf2, align 8, !tbaa !8
  %add.ptr237 = getelementptr inbounds nuw i8, ptr %15, i64 14
  %cmp238.not = icmp eq ptr %call236, %add.ptr237
  br i1 %cmp238.not, label %lor.lhs.false240, label %if.then243

lor.lhs.false240:                                 ; preds = %if.end231
  %call241 = tail call i32 @memcmp(ptr noundef %15, ptr noundef nonnull @.str.33, i64 noundef 19) #10
  %tobool242.not = icmp eq i32 %call241, 0
  br i1 %tobool242.not, label %if.end244, label %if.then243

if.then243:                                       ; preds = %lor.lhs.false240, %if.end231
  tail call void @abort() #10
  br label %if.end244

if.end244:                                        ; preds = %if.then243, %lor.lhs.false240
  %16 = load volatile i32, ptr @chk_calls, align 4, !tbaa !4
  %tobool245.not = icmp eq i32 %16, 0
  br i1 %tobool245.not, label %if.end247, label %if.then246

if.then246:                                       ; preds = %if.end244
  tail call void @abort() #10
  br label %if.end247

if.end247:                                        ; preds = %if.then246, %if.end244
  ret void
}

; Function Attrs: noinline nounwind
define dso_local void @test2() local_unnamed_addr #0 {
entry:
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(20) @buf5, ptr noundef nonnull align 1 dereferenceable(20) @.str.34, i64 20, i1 false)
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(20) @buf7, ptr noundef nonnull align 1 dereferenceable(20) @.str.34, i64 20, i1 false)
  %0 = tail call ptr asm "", "=r,0,~{dirflag},~{fpsr},~{flags}"(ptr nonnull @buf1) #11, !srcloc !13
  %1 = load ptr, ptr @buf2, align 8, !tbaa !8
  %2 = tail call ptr asm "", "=r,0,~{dirflag},~{fpsr},~{flags}"(ptr %1) #11, !srcloc !14
  %3 = tail call i32 asm "", "=r,0,~{dirflag},~{fpsr},~{flags}"(i32 0) #11, !srcloc !15
  tail call void @test2_sub(ptr noundef %0, ptr noundef %2, ptr noundef nonnull @.str.35, i32 noundef %3) #12
  ret void
}

; Function Attrs: noinline nounwind
define dso_local void @test3() local_unnamed_addr #0 {
entry:
  %f1 = alloca [6 x %struct.foo], align 16
  %b1 = alloca [2 x %struct.bar], align 16
  %bz = alloca [10 x i32], align 16
  call void @llvm.lifetime.start.p0(ptr nonnull %f1) #6
  call void @llvm.lifetime.start.p0(ptr nonnull %b1) #6
  call void @llvm.lifetime.start.p0(ptr nonnull %bz) #6
  store volatile i32 0, ptr @chk_calls, align 4, !tbaa !4
  store volatile i32 1, ptr @memmove_disallowed, align 4, !tbaa !4
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(144) %f1, ptr noundef nonnull align 16 dereferenceable(144) @foo, i64 144, i1 false)
  %call = call i32 @memcmp(ptr noundef nonnull %f1, ptr noundef nonnull @foo, i64 noundef 144) #10
  %tobool.not = icmp eq i32 %call, 0
  br i1 %tobool.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() #10
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(160) %b1, ptr noundef nonnull align 16 dereferenceable(160) @bar, i64 160, i1 false)
  %call8 = call i32 @memcmp(ptr noundef nonnull %b1, ptr noundef nonnull @bar, i64 noundef 160) #10
  %tobool9.not = icmp eq i32 %call8, 0
  br i1 %tobool9.not, label %if.end11, label %if.then10

if.then10:                                        ; preds = %if.end
  call void @abort() #10
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(40) %bz, ptr noundef nonnull align 16 dereferenceable(40) @baz, i64 40, i1 false)
  %call14 = call i32 @memcmp(ptr noundef nonnull %bz, ptr noundef nonnull @baz, i64 noundef 40) #10
  %tobool15.not = icmp eq i32 %call14, 0
  br i1 %tobool15.not, label %if.end17, label %if.then16

if.then16:                                        ; preds = %if.end11
  call void @abort() #10
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %if.end11
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(6) @p, ptr noundef nonnull align 1 dereferenceable(6) @.str.36, i64 6, i1 false)
  %call19 = call i32 @memcmp(ptr noundef nonnull @p, ptr noundef nonnull @.str.36, i64 noundef 6) #10
  %tobool20.not = icmp eq i32 %call19, 0
  br i1 %tobool20.not, label %if.end22, label %if.then21

if.then21:                                        ; preds = %if.end17
  call void @abort() #10
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %if.end17
  %call24 = call i32 @memcmp(ptr noundef nonnull @p, ptr noundef nonnull @.str.36, i64 noundef 6) #10
  %tobool25.not = icmp eq i32 %call24, 0
  br i1 %tobool25.not, label %if.end29, label %if.then28

if.then28:                                        ; preds = %if.end22
  call void @abort() #10
  br label %if.end29

if.end29:                                         ; preds = %if.end22, %if.then28
  store i8 0, ptr getelementptr inbounds nuw (i8, ptr @p, i64 3), align 1
  %call31 = call i32 @memcmp(ptr noundef nonnull @p, ptr noundef nonnull @.str.37, i64 noundef 6) #10
  %tobool32.not = icmp eq i32 %call31, 0
  br i1 %tobool32.not, label %if.end34, label %if.then33

if.then33:                                        ; preds = %if.end29
  call void @abort() #10
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %if.end29
  store i32 1768449894, ptr getelementptr inbounds nuw (i8, ptr @p, i64 2), align 2
  %call35 = call i32 @memcmp(ptr noundef nonnull @p, ptr noundef nonnull @.str.39, i64 noundef 7) #10
  %tobool36.not = icmp eq i32 %call35, 0
  br i1 %tobool36.not, label %if.end38, label %if.then37

if.then37:                                        ; preds = %if.end34
  call void @abort() #10
  br label %if.end38

if.end38:                                         ; preds = %if.then37, %if.end34
  %call40 = call i32 @memcmp(ptr noundef nonnull @p, ptr noundef nonnull @.str.39, i64 noundef 7) #10
  %tobool41.not = icmp eq i32 %call40, 0
  br i1 %tobool41.not, label %if.end45, label %if.then44

if.then44:                                        ; preds = %if.end38
  call void @abort() #10
  br label %if.end45

if.end45:                                         ; preds = %if.end38, %if.then44
  store i8 65, ptr getelementptr inbounds nuw (i8, ptr @p, i64 4), align 4
  %call46 = call i32 @memcmp(ptr noundef nonnull @p, ptr noundef nonnull @.str.40, i64 noundef 7) #10
  %tobool47.not = icmp eq i32 %call46, 0
  br i1 %tobool47.not, label %if.end49, label %if.then48

if.then48:                                        ; preds = %if.end45
  call void @abort() #10
  br label %if.end49

if.end49:                                         ; preds = %if.then48, %if.end45
  %0 = load i8, ptr getelementptr inbounds nuw (i8, ptr @p, i64 3), align 1
  store i8 %0, ptr getelementptr inbounds nuw (i8, ptr @p, i64 2), align 2
  %call52 = call i32 @memcmp(ptr noundef nonnull @p, ptr noundef nonnull @.str.41, i64 noundef 7) #10
  %tobool53.not = icmp eq i32 %call52, 0
  br i1 %tobool53.not, label %if.end55, label %if.then54

if.then54:                                        ; preds = %if.end49
  call void @abort() #10
  br label %if.end55

if.end55:                                         ; preds = %if.then54, %if.end49
  %1 = load volatile i32, ptr @chk_calls, align 4, !tbaa !4
  %tobool56.not = icmp eq i32 %1, 0
  br i1 %tobool56.not, label %if.end58, label %if.then57

if.then57:                                        ; preds = %if.end55
  call void @abort() #10
  br label %if.end58

if.end58:                                         ; preds = %if.then57, %if.end55
  store volatile i32 0, ptr @memmove_disallowed, align 4, !tbaa !4
  call void @llvm.lifetime.end.p0(ptr nonnull %bz) #6
  call void @llvm.lifetime.end.p0(ptr nonnull %b1) #6
  call void @llvm.lifetime.end.p0(ptr nonnull %f1) #6
  ret void
}

; Function Attrs: noinline nounwind
define dso_local void @test4() local_unnamed_addr #0 {
entry:
  %a = alloca %struct.A, align 1
  %buf3 = alloca [20 x i8], align 16
  call void @llvm.lifetime.start.p0(ptr nonnull %a) #6
  %0 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp = icmp eq i64 %0, 1
  %cond.v.sroa.sel.v.sroa.sel.v.sroa.sel.v = select i1 %cmp, i64 5, i64 14
  %cond.v.sroa.sel.v.sroa.sel.v.sroa.sel = getelementptr inbounds nuw i8, ptr %a, i64 %cond.v.sroa.sel.v.sroa.sel.v.sroa.sel.v
  call void @llvm.lifetime.start.p0(ptr nonnull %buf3) #6
  store volatile i32 0, ptr @chk_calls, align 4, !tbaa !4
  %add.ptr = getelementptr inbounds nuw i8, ptr %a, i64 2
  %1 = load ptr, ptr @s3, align 8, !tbaa !8
  %2 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %call = call ptr @__memmove_chk(ptr noundef nonnull %add.ptr, ptr noundef %1, i64 noundef %2, i64 noundef 18) #10
  %3 = load ptr, ptr @s3, align 8, !tbaa !8
  %4 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %add = add i64 %4, 1
  %call3 = call ptr @__memmove_chk(ptr noundef nonnull %cond.v.sroa.sel.v.sroa.sel.v.sroa.sel, ptr noundef %3, i64 noundef %add, i64 noundef 15) #10
  %5 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp4 = icmp eq i64 %5, 1
  br i1 %cmp4, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %entry
  %6 = alloca [4 x i8], align 16
  br label %cond.end9

cond.false6:                                      ; preds = %entry
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %a, i64 17
  br label %cond.end9

cond.end9:                                        ; preds = %cond.false6, %cond.true5
  %cond10 = phi ptr [ %6, %cond.true5 ], [ %arrayidx8, %cond.false6 ]
  %7 = load ptr, ptr @s2, align 8, !tbaa !8
  %8 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %add11 = add i64 %8, 2
  %call12 = call ptr @__memmove_chk(ptr noundef nonnull %cond10, ptr noundef %7, i64 noundef %add11, i64 noundef 4) #10
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %cond10, i64 2
  %9 = load ptr, ptr @s3, align 8, !tbaa !8
  %10 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %call15 = call ptr @__memmove_chk(ptr noundef nonnull %add.ptr13, ptr noundef %9, i64 noundef %10, i64 noundef 2) #10
  %arrayidx42 = getelementptr inbounds nuw i8, ptr %a, i64 9
  %arrayidx34 = getelementptr inbounds nuw i8, ptr %buf3, i64 5
  %arrayidx27 = getelementptr inbounds nuw i8, ptr %a, i64 17
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %a, i64 1
  %11 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp18 = icmp eq i64 %11, 1
  br i1 %cmp18, label %for.inc, label %if.else

if.else:                                          ; preds = %cond.end9
  %12 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp23 = icmp eq i64 %12, 0
  br i1 %cmp23, label %for.inc, label %if.else28

if.else28:                                        ; preds = %if.else
  %13 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp31 = icmp eq i64 %13, -1
  br i1 %cmp31, label %for.inc, label %if.else35

if.else35:                                        ; preds = %if.else28
  %14 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp38 = icmp eq i64 %14, -2
  %spec.select = select i1 %cmp38, ptr %arrayidx42, ptr %buf3
  br label %for.inc

for.inc:                                          ; preds = %if.else28, %if.else, %cond.end9, %if.else35
  %r.1 = phi ptr [ %spec.select, %if.else35 ], [ %arrayidx21, %cond.end9 ], [ %arrayidx27, %if.else ], [ %arrayidx34, %if.else28 ]
  %15 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp18.1 = icmp eq i64 %15, 2
  br i1 %cmp18.1, label %for.inc.1, label %if.else.1

if.else.1:                                        ; preds = %for.inc
  %16 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp23.1 = icmp eq i64 %16, 1
  br i1 %cmp23.1, label %for.inc.1, label %if.else28.1

if.else28.1:                                      ; preds = %if.else.1
  %17 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp31.1 = icmp eq i64 %17, 0
  br i1 %cmp31.1, label %for.inc.1, label %if.else35.1

if.else35.1:                                      ; preds = %if.else28.1
  %18 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp38.1 = icmp eq i64 %18, -1
  %spec.select.1 = select i1 %cmp38.1, ptr %arrayidx42, ptr %r.1
  br label %for.inc.1

for.inc.1:                                        ; preds = %if.else35.1, %if.else28.1, %if.else.1, %for.inc
  %r.1.1 = phi ptr [ %spec.select.1, %if.else35.1 ], [ %arrayidx21, %for.inc ], [ %arrayidx27, %if.else.1 ], [ %arrayidx34, %if.else28.1 ]
  %19 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp18.2 = icmp eq i64 %19, 3
  br i1 %cmp18.2, label %for.inc.2, label %if.else.2

if.else.2:                                        ; preds = %for.inc.1
  %20 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp23.2 = icmp eq i64 %20, 2
  br i1 %cmp23.2, label %for.inc.2, label %if.else28.2

if.else28.2:                                      ; preds = %if.else.2
  %21 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp31.2 = icmp eq i64 %21, 1
  br i1 %cmp31.2, label %for.inc.2, label %if.else35.2

if.else35.2:                                      ; preds = %if.else28.2
  %22 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp38.2 = icmp eq i64 %22, 0
  %spec.select.2 = select i1 %cmp38.2, ptr %arrayidx42, ptr %r.1.1
  br label %for.inc.2

for.inc.2:                                        ; preds = %if.else35.2, %if.else28.2, %if.else.2, %for.inc.1
  %r.1.2 = phi ptr [ %spec.select.2, %if.else35.2 ], [ %arrayidx21, %for.inc.1 ], [ %arrayidx27, %if.else.2 ], [ %arrayidx34, %if.else28.2 ]
  %23 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp18.3 = icmp eq i64 %23, 4
  br i1 %cmp18.3, label %for.inc.3, label %if.else.3

if.else.3:                                        ; preds = %for.inc.2
  %24 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp23.3 = icmp eq i64 %24, 3
  br i1 %cmp23.3, label %for.inc.3, label %if.else28.3

if.else28.3:                                      ; preds = %if.else.3
  %25 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp31.3 = icmp eq i64 %25, 2
  br i1 %cmp31.3, label %for.inc.3, label %if.else35.3

if.else35.3:                                      ; preds = %if.else28.3
  %26 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp38.3 = icmp eq i64 %26, 1
  %spec.select.3 = select i1 %cmp38.3, ptr %arrayidx42, ptr %r.1.2
  br label %for.inc.3

for.inc.3:                                        ; preds = %if.else35.3, %if.else28.3, %if.else.3, %for.inc.2
  %r.1.3 = phi ptr [ %spec.select.3, %if.else35.3 ], [ %arrayidx21, %for.inc.2 ], [ %arrayidx27, %if.else.3 ], [ %arrayidx34, %if.else28.3 ]
  %27 = load ptr, ptr @s2, align 8, !tbaa !8
  %28 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %call46 = call ptr @__memmove_chk(ptr noundef nonnull %r.1.3, ptr noundef %27, i64 noundef %28, i64 noundef 20) #10
  %29 = load volatile i32, ptr @chk_calls, align 4, !tbaa !4
  %cmp47.not = icmp eq i32 %29, 5
  br i1 %cmp47.not, label %if.end50, label %if.then49

if.then49:                                        ; preds = %for.inc.3
  call void @abort() #10
  br label %if.end50

if.end50:                                         ; preds = %if.then49, %for.inc.3
  store volatile i32 0, ptr @chk_calls, align 4, !tbaa !4
  %30 = load ptr, ptr @s3, align 8, !tbaa !8
  %31 = load i8, ptr %30, align 1
  store i8 %31, ptr %add.ptr, align 1
  %call54 = call ptr @__memmove_chk(ptr noundef nonnull %r.1.3, ptr noundef nonnull %30, i64 noundef 2, i64 noundef 20) #10
  %32 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp55 = icmp eq i64 %32, 1
  br i1 %cmp55, label %cond.true57, label %cond.end61

cond.true57:                                      ; preds = %if.end50
  %33 = alloca [4 x i8], align 16
  br label %cond.end61

cond.end61:                                       ; preds = %if.end50, %cond.true57
  %cond62 = phi ptr [ %33, %cond.true57 ], [ %arrayidx27, %if.end50 ]
  %34 = load ptr, ptr @s2, align 8, !tbaa !8
  %call63 = call ptr @__memmove_chk(ptr noundef nonnull %cond62, ptr noundef %34, i64 noundef 3, i64 noundef 4) #10
  %35 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp71 = icmp eq i64 %35, 1
  br i1 %cmp71, label %for.inc102, label %if.else76

if.else76:                                        ; preds = %cond.end61
  %36 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp78 = icmp eq i64 %36, 0
  br i1 %cmp78, label %for.inc102, label %if.else83

if.else83:                                        ; preds = %if.else76
  %37 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp86 = icmp eq i64 %37, -1
  br i1 %cmp86, label %for.inc102, label %if.else90

if.else90:                                        ; preds = %if.else83
  %38 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp93 = icmp eq i64 %38, -2
  %spec.select134 = select i1 %cmp93, ptr %arrayidx42, ptr %buf3
  %spec.select135 = select i1 %cmp93, i64 1, i64 4
  br label %for.inc102

for.inc102:                                       ; preds = %if.else83, %if.else76, %cond.end61, %if.else90
  %r.3 = phi ptr [ %spec.select134, %if.else90 ], [ %arrayidx21, %cond.end61 ], [ %arrayidx27, %if.else76 ], [ %arrayidx34, %if.else83 ]
  %l.1 = phi i64 [ %spec.select135, %if.else90 ], [ 2, %cond.end61 ], [ 3, %if.else76 ], [ 4, %if.else83 ]
  %39 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp71.1 = icmp eq i64 %39, 2
  br i1 %cmp71.1, label %for.inc102.1, label %if.else76.1

if.else76.1:                                      ; preds = %for.inc102
  %40 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp78.1 = icmp eq i64 %40, 1
  br i1 %cmp78.1, label %for.inc102.1, label %if.else83.1

if.else83.1:                                      ; preds = %if.else76.1
  %41 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp86.1 = icmp eq i64 %41, 0
  br i1 %cmp86.1, label %for.inc102.1, label %if.else90.1

if.else90.1:                                      ; preds = %if.else83.1
  %42 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp93.1 = icmp eq i64 %42, -1
  %spec.select134.1 = select i1 %cmp93.1, ptr %arrayidx42, ptr %r.3
  %spec.select135.1 = select i1 %cmp93.1, i64 1, i64 %l.1
  br label %for.inc102.1

for.inc102.1:                                     ; preds = %if.else90.1, %if.else83.1, %if.else76.1, %for.inc102
  %r.3.1 = phi ptr [ %spec.select134.1, %if.else90.1 ], [ %arrayidx21, %for.inc102 ], [ %arrayidx27, %if.else76.1 ], [ %arrayidx34, %if.else83.1 ]
  %l.1.1 = phi i64 [ %spec.select135.1, %if.else90.1 ], [ 2, %for.inc102 ], [ 3, %if.else76.1 ], [ 4, %if.else83.1 ]
  %43 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp71.2 = icmp eq i64 %43, 3
  br i1 %cmp71.2, label %for.inc102.2, label %if.else76.2

if.else76.2:                                      ; preds = %for.inc102.1
  %44 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp78.2 = icmp eq i64 %44, 2
  br i1 %cmp78.2, label %for.inc102.2, label %if.else83.2

if.else83.2:                                      ; preds = %if.else76.2
  %45 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp86.2 = icmp eq i64 %45, 1
  br i1 %cmp86.2, label %for.inc102.2, label %if.else90.2

if.else90.2:                                      ; preds = %if.else83.2
  %46 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp93.2 = icmp eq i64 %46, 0
  %spec.select134.2 = select i1 %cmp93.2, ptr %arrayidx42, ptr %r.3.1
  %spec.select135.2 = select i1 %cmp93.2, i64 1, i64 %l.1.1
  br label %for.inc102.2

for.inc102.2:                                     ; preds = %if.else90.2, %if.else83.2, %if.else76.2, %for.inc102.1
  %r.3.2 = phi ptr [ %spec.select134.2, %if.else90.2 ], [ %arrayidx21, %for.inc102.1 ], [ %arrayidx27, %if.else76.2 ], [ %arrayidx34, %if.else83.2 ]
  %l.1.2 = phi i64 [ %spec.select135.2, %if.else90.2 ], [ 2, %for.inc102.1 ], [ 3, %if.else76.2 ], [ 4, %if.else83.2 ]
  %47 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp71.3 = icmp eq i64 %47, 4
  br i1 %cmp71.3, label %for.inc102.3, label %if.else76.3

if.else76.3:                                      ; preds = %for.inc102.2
  %48 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp78.3 = icmp eq i64 %48, 3
  br i1 %cmp78.3, label %for.inc102.3, label %if.else83.3

if.else83.3:                                      ; preds = %if.else76.3
  %49 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp86.3 = icmp eq i64 %49, 2
  br i1 %cmp86.3, label %for.inc102.3, label %if.else90.3

if.else90.3:                                      ; preds = %if.else83.3
  %50 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %cmp93.3 = icmp eq i64 %50, 1
  %spec.select134.3 = select i1 %cmp93.3, ptr %arrayidx42, ptr %r.3.2
  %spec.select135.3 = select i1 %cmp93.3, i64 1, i64 %l.1.2
  br label %for.inc102.3

for.inc102.3:                                     ; preds = %if.else90.3, %if.else83.3, %if.else76.3, %for.inc102.2
  %r.3.3 = phi ptr [ %spec.select134.3, %if.else90.3 ], [ %arrayidx21, %for.inc102.2 ], [ %arrayidx27, %if.else76.3 ], [ %arrayidx34, %if.else83.3 ]
  %l.1.3 = phi i64 [ %spec.select135.3, %if.else90.3 ], [ 2, %for.inc102.2 ], [ 3, %if.else76.3 ], [ 4, %if.else83.3 ]
  %51 = load ptr, ptr @s2, align 8, !tbaa !8
  %call105 = call ptr @__memmove_chk(ptr noundef nonnull %r.3.3, ptr noundef %51, i64 noundef 1, i64 noundef 20) #10
  %arrayidx106 = getelementptr inbounds nuw i8, ptr %buf3, i64 16
  %52 = load ptr, ptr @s2, align 8, !tbaa !8
  %call107 = call ptr @__memmove_chk(ptr noundef nonnull %arrayidx106, ptr noundef %52, i64 noundef %l.1.3, i64 noundef 4) #10
  %53 = load volatile i32, ptr @chk_calls, align 4, !tbaa !4
  %tobool.not = icmp eq i32 %53, 0
  br i1 %tobool.not, label %if.end109, label %if.then108

if.then108:                                       ; preds = %for.inc102.3
  call void @abort() #10
  br label %if.end109

if.end109:                                        ; preds = %if.then108, %for.inc102.3
  store volatile i32 0, ptr @chk_calls, align 4, !tbaa !4
  call void @llvm.lifetime.end.p0(ptr nonnull %buf3) #6
  call void @llvm.lifetime.end.p0(ptr nonnull %a) #6
  ret void
}

; Function Attrs: noinline nounwind
define dso_local void @test5() local_unnamed_addr #0 {
entry:
  %a = alloca %struct.A.0, align 1
  %buf3 = alloca [20 x i8], align 16
  call void @llvm.lifetime.start.p0(ptr nonnull %a) #6
  call void @llvm.lifetime.start.p0(ptr nonnull %buf3) #6
  store volatile i32 1, ptr @chk_fail_allowed, align 4, !tbaa !4
  %0 = tail call ptr @llvm.frameaddress.p0(i32 0)
  store ptr %0, ptr @chk_fail_buf, align 8
  %1 = tail call ptr @llvm.stacksave.p0()
  store ptr %1, ptr getelementptr inbounds nuw (i8, ptr @chk_fail_buf, i64 16), align 8
  %2 = tail call i32 @llvm.eh.sjlj.setjmp(ptr nonnull @chk_fail_buf)
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i64 19
  %3 = load ptr, ptr @s2, align 8, !tbaa !8
  %4 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %add = add i64 %4, 1
  %call = call ptr @__memmove_chk(ptr noundef nonnull %arrayidx, ptr noundef %3, i64 noundef %add, i64 noundef 1) #10
  call void @abort() #10
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store ptr %0, ptr @chk_fail_buf, align 8
  %5 = call ptr @llvm.stacksave.p0()
  store ptr %5, ptr getelementptr inbounds nuw (i8, ptr @chk_fail_buf, i64 16), align 8
  %6 = call i32 @llvm.eh.sjlj.setjmp(ptr nonnull @chk_fail_buf)
  %cmp1 = icmp eq i32 %6, 0
  br i1 %cmp1, label %if.then2, label %if.end8

if.then2:                                         ; preds = %if.end
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %a, i64 17
  %7 = load ptr, ptr @s3, align 8, !tbaa !8
  %call5 = call i64 @strlen(ptr noundef %7) #10
  %add6 = add i64 %call5, 1
  %call7 = call ptr @__memmove_chk(ptr noundef nonnull %arrayidx4, ptr noundef %7, i64 noundef %add6, i64 noundef 3) #10
  call void @abort() #10
  br label %if.end8

if.end8:                                          ; preds = %if.then2, %if.end
  store ptr %0, ptr @chk_fail_buf, align 8
  %8 = call ptr @llvm.stacksave.p0()
  store ptr %8, ptr getelementptr inbounds nuw (i8, ptr @chk_fail_buf, i64 16), align 8
  %9 = call i32 @llvm.eh.sjlj.setjmp(ptr nonnull @chk_fail_buf)
  %cmp9 = icmp eq i32 %9, 0
  br i1 %cmp9, label %if.then10, label %if.end13

if.then10:                                        ; preds = %if.end8
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %buf3, i64 19
  %call12 = call ptr @__memmove_chk(ptr noundef nonnull %arrayidx11, ptr noundef nonnull @.str.42, i64 noundef 2, i64 noundef 1) #10
  call void @abort() #10
  br label %if.end13

if.end13:                                         ; preds = %if.then10, %if.end8
  store volatile i32 0, ptr @chk_fail_allowed, align 4, !tbaa !4
  call void @llvm.lifetime.end.p0(ptr nonnull %buf3) #6
  call void @llvm.lifetime.end.p0(ptr nonnull %a) #6
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare ptr @llvm.frameaddress.p0(i32 immarg) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave.p0() #5

; Function Attrs: nounwind
declare i32 @llvm.eh.sjlj.setjmp(ptr) #6

declare i64 @strlen(ptr noundef) local_unnamed_addr #2

; Function Attrs: noinline nounwind
define dso_local void @test6() local_unnamed_addr #0 {
entry:
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %entry, %for.inc87
  %indvars.iv155 = phi i64 [ 0, %entry ], [ %indvars.iv.next156, %for.inc87 ]
  %indvars.iv137 = phi i32 [ -1, %entry ], [ %indvars.iv.next138, %for.inc87 ]
  %0 = zext i32 %indvars.iv137 to i64
  %scevgep = getelementptr i8, ptr getelementptr inbounds nuw (i8, ptr @u1, i64 1), i64 %0
  %scevgep139 = getelementptr i8, ptr @u1, i64 %0
  %add.ptr = getelementptr inbounds nuw i8, ptr @u1, i64 %indvars.iv155
  %cmp35123.not = icmp eq i64 %indvars.iv155, 0
  br label %for.cond7.preheader

for.cond7.preheader:                              ; preds = %for.cond2.preheader, %for.inc84
  %indvars.iv151 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next152, %for.inc84 ]
  %add.ptr24 = getelementptr inbounds nuw i8, ptr @u2, i64 %indvars.iv151
  %1 = trunc i64 %indvars.iv151 to i8
  %conv46 = add nuw nsw i8 %1, 65
  br label %for.cond12.preheader

for.cond12.preheader:                             ; preds = %for.cond7.preheader, %for.inc77.7
  %indvars.iv144 = phi i64 [ 0, %for.cond7.preheader ], [ %indvars.iv.next145, %for.inc77.7 ]
  %indvars.iv141 = phi i64 [ 1, %for.cond7.preheader ], [ %indvars.iv.next142, %for.inc77.7 ]
  br label %for.body16

for.body16:                                       ; preds = %for.body16, %for.cond12.preheader
  %indvars.iv = phi i64 [ 0, %for.cond12.preheader ], [ %indvars.iv.next.2, %for.body16 ]
  %c.0122 = phi i8 [ 65, %for.cond12.preheader ], [ %inc22.2, %for.body16 ]
  %arrayidx = getelementptr inbounds nuw i8, ptr @u1, i64 %indvars.iv
  store i8 97, ptr %arrayidx, align 1, !tbaa !16
  %cmp18 = icmp sgt i8 %c.0122, 95
  %spec.store.select = select i1 %cmp18, i8 65, i8 %c.0122
  %arrayidx21 = getelementptr inbounds nuw i8, ptr @u2, i64 %indvars.iv
  store i8 %spec.store.select, ptr %arrayidx21, align 1, !tbaa !16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %inc22 = add i8 %spec.store.select, 1
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr @u1, i64 %indvars.iv.next
  store i8 97, ptr %arrayidx.1, align 1, !tbaa !16
  %cmp18.1 = icmp sgt i8 %inc22, 95
  %spec.store.select.1 = select i1 %cmp18.1, i8 65, i8 %inc22
  %arrayidx21.1 = getelementptr inbounds nuw i8, ptr @u2, i64 %indvars.iv.next
  store i8 %spec.store.select.1, ptr %arrayidx21.1, align 1, !tbaa !16
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %inc22.1 = add i8 %spec.store.select.1, 1
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr @u1, i64 %indvars.iv.next.1
  store i8 97, ptr %arrayidx.2, align 1, !tbaa !16
  %cmp18.2 = icmp sgt i8 %inc22.1, 95
  %spec.store.select.2 = select i1 %cmp18.2, i8 65, i8 %inc22.1
  %arrayidx21.2 = getelementptr inbounds nuw i8, ptr @u2, i64 %indvars.iv.next.1
  store i8 %spec.store.select.2, ptr %arrayidx21.2, align 1, !tbaa !16
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %inc22.2 = add i8 %spec.store.select.2, 1
  %exitcond.not.2 = icmp eq i64 %indvars.iv.next.2, 96
  br i1 %exitcond.not.2, label %for.end, label %for.body16, !llvm.loop !17

for.end:                                          ; preds = %for.body16
  %call = tail call ptr @__memmove_chk(ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr24, i64 noundef %indvars.iv141, i64 noundef -1) #10
  %cmp30.not = icmp eq ptr %call, %add.ptr
  br i1 %cmp30.not, label %if.end33, label %if.then32

if.then32:                                        ; preds = %for.end
  tail call void @abort() #10
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %for.end
  br i1 %cmp35123.not, label %for.end45, label %for.body37

for.body37:                                       ; preds = %if.end33, %for.inc43
  %q.0125 = phi ptr [ %incdec.ptr, %for.inc43 ], [ @u1, %if.end33 ]
  %2 = load i8, ptr %q.0125, align 1, !tbaa !16
  %cmp39.not = icmp eq i8 %2, 97
  br i1 %cmp39.not, label %for.inc43, label %if.then41

if.then41:                                        ; preds = %for.body37
  tail call void @abort() #10
  br label %for.inc43

for.inc43:                                        ; preds = %for.body37, %if.then41
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %q.0125, i64 1
  %exitcond140.not = icmp eq ptr %q.0125, %scevgep139
  br i1 %exitcond140.not, label %for.end45, label %for.body37, !llvm.loop !19

for.end45:                                        ; preds = %for.inc43, %if.end33
  %q.0.lcssa = phi ptr [ @u1, %if.end33 ], [ %scevgep, %for.inc43 ]
  %scevgep146 = getelementptr i8, ptr %q.0.lcssa, i64 %indvars.iv144
  br label %for.body50

for.body50:                                       ; preds = %for.end45, %for.inc62
  %c.1128 = phi i8 [ %conv46, %for.end45 ], [ %inc65, %for.inc62 ]
  %q.1127 = phi ptr [ %q.0.lcssa, %for.end45 ], [ %incdec.ptr64, %for.inc62 ]
  %cmp52 = icmp sgt i8 %c.1128, 95
  %spec.store.select90 = select i1 %cmp52, i8 65, i8 %c.1128
  %3 = load i8, ptr %q.1127, align 1, !tbaa !16
  %cmp58.not = icmp eq i8 %3, %spec.store.select90
  br i1 %cmp58.not, label %for.inc62, label %if.then60

if.then60:                                        ; preds = %for.body50
  tail call void @abort() #10
  br label %for.inc62

for.inc62:                                        ; preds = %for.body50, %if.then60
  %incdec.ptr64 = getelementptr inbounds nuw i8, ptr %q.1127, i64 1
  %inc65 = add i8 %spec.store.select90, 1
  %exitcond147.not = icmp eq ptr %q.1127, %scevgep146
  br i1 %exitcond147.not, label %for.body71.preheader, label %for.body50, !llvm.loop !20

for.body71.preheader:                             ; preds = %for.inc62
  %scevgep143 = getelementptr i8, ptr %q.0.lcssa, i64 %indvars.iv141
  %4 = load i8, ptr %scevgep143, align 1, !tbaa !16
  %cmp73.not = icmp eq i8 %4, 97
  br i1 %cmp73.not, label %for.inc77, label %if.then75

if.then75:                                        ; preds = %for.body71.preheader
  tail call void @abort() #10
  br label %for.inc77

for.inc77:                                        ; preds = %for.body71.preheader, %if.then75
  %incdec.ptr79 = getelementptr inbounds nuw i8, ptr %scevgep143, i64 1
  %5 = load i8, ptr %incdec.ptr79, align 1, !tbaa !16
  %cmp73.not.1 = icmp eq i8 %5, 97
  br i1 %cmp73.not.1, label %for.inc77.1, label %if.then75.1

if.then75.1:                                      ; preds = %for.inc77
  tail call void @abort() #10
  br label %for.inc77.1

for.inc77.1:                                      ; preds = %if.then75.1, %for.inc77
  %incdec.ptr79.1 = getelementptr inbounds nuw i8, ptr %scevgep143, i64 2
  %6 = load i8, ptr %incdec.ptr79.1, align 1, !tbaa !16
  %cmp73.not.2 = icmp eq i8 %6, 97
  br i1 %cmp73.not.2, label %for.inc77.2, label %if.then75.2

if.then75.2:                                      ; preds = %for.inc77.1
  tail call void @abort() #10
  br label %for.inc77.2

for.inc77.2:                                      ; preds = %if.then75.2, %for.inc77.1
  %incdec.ptr79.2 = getelementptr inbounds nuw i8, ptr %scevgep143, i64 3
  %7 = load i8, ptr %incdec.ptr79.2, align 1, !tbaa !16
  %cmp73.not.3 = icmp eq i8 %7, 97
  br i1 %cmp73.not.3, label %for.inc77.3, label %if.then75.3

if.then75.3:                                      ; preds = %for.inc77.2
  tail call void @abort() #10
  br label %for.inc77.3

for.inc77.3:                                      ; preds = %if.then75.3, %for.inc77.2
  %incdec.ptr79.3 = getelementptr inbounds nuw i8, ptr %scevgep143, i64 4
  %8 = load i8, ptr %incdec.ptr79.3, align 1, !tbaa !16
  %cmp73.not.4 = icmp eq i8 %8, 97
  br i1 %cmp73.not.4, label %for.inc77.4, label %if.then75.4

if.then75.4:                                      ; preds = %for.inc77.3
  tail call void @abort() #10
  br label %for.inc77.4

for.inc77.4:                                      ; preds = %if.then75.4, %for.inc77.3
  %incdec.ptr79.4 = getelementptr inbounds nuw i8, ptr %scevgep143, i64 5
  %9 = load i8, ptr %incdec.ptr79.4, align 1, !tbaa !16
  %cmp73.not.5 = icmp eq i8 %9, 97
  br i1 %cmp73.not.5, label %for.inc77.5, label %if.then75.5

if.then75.5:                                      ; preds = %for.inc77.4
  tail call void @abort() #10
  br label %for.inc77.5

for.inc77.5:                                      ; preds = %if.then75.5, %for.inc77.4
  %incdec.ptr79.5 = getelementptr inbounds nuw i8, ptr %scevgep143, i64 6
  %10 = load i8, ptr %incdec.ptr79.5, align 1, !tbaa !16
  %cmp73.not.6 = icmp eq i8 %10, 97
  br i1 %cmp73.not.6, label %for.inc77.6, label %if.then75.6

if.then75.6:                                      ; preds = %for.inc77.5
  tail call void @abort() #10
  br label %for.inc77.6

for.inc77.6:                                      ; preds = %if.then75.6, %for.inc77.5
  %incdec.ptr79.6 = getelementptr inbounds nuw i8, ptr %scevgep143, i64 7
  %11 = load i8, ptr %incdec.ptr79.6, align 1, !tbaa !16
  %cmp73.not.7 = icmp eq i8 %11, 97
  br i1 %cmp73.not.7, label %for.inc77.7, label %if.then75.7

if.then75.7:                                      ; preds = %for.inc77.6
  tail call void @abort() #10
  br label %for.inc77.7

for.inc77.7:                                      ; preds = %if.then75.7, %for.inc77.6
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %exitcond150.not = icmp eq i64 %indvars.iv.next145, 79
  br i1 %exitcond150.not, label %for.inc84, label %for.cond12.preheader, !llvm.loop !21

for.inc84:                                        ; preds = %for.inc77.7
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %exitcond154.not = icmp eq i64 %indvars.iv.next152, 8
  br i1 %exitcond154.not, label %for.inc87, label %for.cond7.preheader, !llvm.loop !22

for.inc87:                                        ; preds = %for.inc84
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1
  %indvars.iv.next138 = add nsw i32 %indvars.iv137, 1
  %exitcond158.not = icmp eq i64 %indvars.iv.next156, 8
  br i1 %exitcond158.not, label %for.end89, label %for.cond2.preheader, !llvm.loop !23

for.end89:                                        ; preds = %for.inc87
  ret void
}

; Function Attrs: noinline nounwind
define dso_local void @check(ptr noundef %test, ptr noundef %match, i32 noundef %n) local_unnamed_addr #0 {
entry:
  %conv = sext i32 %n to i64
  %call = tail call i32 @memcmp(ptr noundef %test, ptr noundef %match, i64 noundef %conv) #10
  %tobool.not = icmp eq i32 %call, 0
  br i1 %tobool.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() #10
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define dso_local void @test7() local_unnamed_addr #0 {
entry:
  store volatile i32 0, ptr @chk_calls, align 4, !tbaa !4
  store <16 x i8> <i8 97, i8 98, i8 99, i8 100, i8 101, i8 102, i8 103, i8 104, i8 105, i8 106, i8 107, i8 108, i8 109, i8 110, i8 111, i8 112>, ptr @srcb, align 16, !tbaa !16
  store <16 x i8> <i8 113, i8 114, i8 115, i8 116, i8 117, i8 118, i8 119, i8 120, i8 121, i8 122, i8 97, i8 98, i8 99, i8 100, i8 101, i8 102>, ptr getelementptr inbounds nuw (i8, ptr @srcb, i64 16), align 16, !tbaa !16
  store <16 x i8> <i8 103, i8 104, i8 105, i8 106, i8 107, i8 108, i8 109, i8 110, i8 111, i8 112, i8 113, i8 114, i8 115, i8 116, i8 117, i8 118>, ptr getelementptr inbounds nuw (i8, ptr @srcb, i64 32), align 16, !tbaa !16
  store <16 x i8> <i8 119, i8 120, i8 121, i8 122, i8 97, i8 98, i8 99, i8 100, i8 101, i8 102, i8 103, i8 104, i8 105, i8 106, i8 107, i8 108>, ptr getelementptr inbounds nuw (i8, ptr @srcb, i64 48), align 16, !tbaa !16
  store <16 x i8> <i8 109, i8 110, i8 111, i8 112, i8 113, i8 114, i8 115, i8 116, i8 117, i8 118, i8 119, i8 120, i8 121, i8 122, i8 97, i8 98>, ptr getelementptr inbounds nuw (i8, ptr @srcb, i64 64), align 16, !tbaa !16
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 0) #12
  %0 = load i8, ptr @srcb, align 16
  store i8 %0, ptr @dstb, align 16
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 1) #12
  %1 = load i16, ptr @srcb, align 16
  store i16 %1, ptr @dstb, align 16
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 2) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(3) @dstb, ptr noundef nonnull align 16 dereferenceable(3) @srcb, i64 3, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 3) #12
  %2 = load i32, ptr @srcb, align 16
  store i32 %2, ptr @dstb, align 16
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 4) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(5) @dstb, ptr noundef nonnull align 16 dereferenceable(5) @srcb, i64 5, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 5) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(6) @dstb, ptr noundef nonnull align 16 dereferenceable(6) @srcb, i64 6, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 6) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(7) @dstb, ptr noundef nonnull align 16 dereferenceable(7) @srcb, i64 7, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 7) #12
  %3 = load i64, ptr @srcb, align 16
  store i64 %3, ptr @dstb, align 16
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 8) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(9) @dstb, ptr noundef nonnull align 16 dereferenceable(9) @srcb, i64 9, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 9) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(10) @dstb, ptr noundef nonnull align 16 dereferenceable(10) @srcb, i64 10, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 10) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(11) @dstb, ptr noundef nonnull align 16 dereferenceable(11) @srcb, i64 11, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 11) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(12) @dstb, ptr noundef nonnull align 16 dereferenceable(12) @srcb, i64 12, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 12) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(13) @dstb, ptr noundef nonnull align 16 dereferenceable(13) @srcb, i64 13, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 13) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(14) @dstb, ptr noundef nonnull align 16 dereferenceable(14) @srcb, i64 14, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 14) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(15) @dstb, ptr noundef nonnull align 16 dereferenceable(15) @srcb, i64 15, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 15) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(16) @dstb, ptr noundef nonnull align 16 dereferenceable(16) @srcb, i64 16, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 16) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(17) @dstb, ptr noundef nonnull align 16 dereferenceable(17) @srcb, i64 17, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 17) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(18) @dstb, ptr noundef nonnull align 16 dereferenceable(18) @srcb, i64 18, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 18) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(19) @dstb, ptr noundef nonnull align 16 dereferenceable(19) @srcb, i64 19, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 19) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(20) @dstb, ptr noundef nonnull align 16 dereferenceable(20) @srcb, i64 20, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 20) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(21) @dstb, ptr noundef nonnull align 16 dereferenceable(21) @srcb, i64 21, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 21) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(22) @dstb, ptr noundef nonnull align 16 dereferenceable(22) @srcb, i64 22, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 22) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(23) @dstb, ptr noundef nonnull align 16 dereferenceable(23) @srcb, i64 23, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 23) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(24) @dstb, ptr noundef nonnull align 16 dereferenceable(24) @srcb, i64 24, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 24) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(25) @dstb, ptr noundef nonnull align 16 dereferenceable(25) @srcb, i64 25, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 25) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(26) @dstb, ptr noundef nonnull align 16 dereferenceable(26) @srcb, i64 26, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 26) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(27) @dstb, ptr noundef nonnull align 16 dereferenceable(27) @srcb, i64 27, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 27) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(28) @dstb, ptr noundef nonnull align 16 dereferenceable(28) @srcb, i64 28, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 28) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(29) @dstb, ptr noundef nonnull align 16 dereferenceable(29) @srcb, i64 29, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 29) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(30) @dstb, ptr noundef nonnull align 16 dereferenceable(30) @srcb, i64 30, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 30) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(31) @dstb, ptr noundef nonnull align 16 dereferenceable(31) @srcb, i64 31, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 31) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(32) @dstb, ptr noundef nonnull align 16 dereferenceable(32) @srcb, i64 32, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 32) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(33) @dstb, ptr noundef nonnull align 16 dereferenceable(33) @srcb, i64 33, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 33) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(34) @dstb, ptr noundef nonnull align 16 dereferenceable(34) @srcb, i64 34, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 34) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(35) @dstb, ptr noundef nonnull align 16 dereferenceable(35) @srcb, i64 35, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 35) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(36) @dstb, ptr noundef nonnull align 16 dereferenceable(36) @srcb, i64 36, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 36) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(37) @dstb, ptr noundef nonnull align 16 dereferenceable(37) @srcb, i64 37, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 37) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(38) @dstb, ptr noundef nonnull align 16 dereferenceable(38) @srcb, i64 38, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 38) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(39) @dstb, ptr noundef nonnull align 16 dereferenceable(39) @srcb, i64 39, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 39) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(40) @dstb, ptr noundef nonnull align 16 dereferenceable(40) @srcb, i64 40, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 40) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(41) @dstb, ptr noundef nonnull align 16 dereferenceable(41) @srcb, i64 41, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 41) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(42) @dstb, ptr noundef nonnull align 16 dereferenceable(42) @srcb, i64 42, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 42) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(43) @dstb, ptr noundef nonnull align 16 dereferenceable(43) @srcb, i64 43, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 43) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(44) @dstb, ptr noundef nonnull align 16 dereferenceable(44) @srcb, i64 44, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 44) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(45) @dstb, ptr noundef nonnull align 16 dereferenceable(45) @srcb, i64 45, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 45) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(46) @dstb, ptr noundef nonnull align 16 dereferenceable(46) @srcb, i64 46, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 46) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(47) @dstb, ptr noundef nonnull align 16 dereferenceable(47) @srcb, i64 47, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 47) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(48) @dstb, ptr noundef nonnull align 16 dereferenceable(48) @srcb, i64 48, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 48) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(49) @dstb, ptr noundef nonnull align 16 dereferenceable(49) @srcb, i64 49, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 49) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(50) @dstb, ptr noundef nonnull align 16 dereferenceable(50) @srcb, i64 50, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 50) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(51) @dstb, ptr noundef nonnull align 16 dereferenceable(51) @srcb, i64 51, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 51) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(52) @dstb, ptr noundef nonnull align 16 dereferenceable(52) @srcb, i64 52, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 52) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(53) @dstb, ptr noundef nonnull align 16 dereferenceable(53) @srcb, i64 53, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 53) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(54) @dstb, ptr noundef nonnull align 16 dereferenceable(54) @srcb, i64 54, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 54) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(55) @dstb, ptr noundef nonnull align 16 dereferenceable(55) @srcb, i64 55, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 55) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(56) @dstb, ptr noundef nonnull align 16 dereferenceable(56) @srcb, i64 56, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 56) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(57) @dstb, ptr noundef nonnull align 16 dereferenceable(57) @srcb, i64 57, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 57) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(58) @dstb, ptr noundef nonnull align 16 dereferenceable(58) @srcb, i64 58, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 58) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(59) @dstb, ptr noundef nonnull align 16 dereferenceable(59) @srcb, i64 59, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 59) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(60) @dstb, ptr noundef nonnull align 16 dereferenceable(60) @srcb, i64 60, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 60) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(61) @dstb, ptr noundef nonnull align 16 dereferenceable(61) @srcb, i64 61, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 61) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(62) @dstb, ptr noundef nonnull align 16 dereferenceable(62) @srcb, i64 62, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 62) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(63) @dstb, ptr noundef nonnull align 16 dereferenceable(63) @srcb, i64 63, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 63) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) @dstb, ptr noundef nonnull align 16 dereferenceable(64) @srcb, i64 64, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 64) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(65) @dstb, ptr noundef nonnull align 16 dereferenceable(65) @srcb, i64 65, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 65) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(66) @dstb, ptr noundef nonnull align 16 dereferenceable(66) @srcb, i64 66, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 66) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(67) @dstb, ptr noundef nonnull align 16 dereferenceable(67) @srcb, i64 67, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 67) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(68) @dstb, ptr noundef nonnull align 16 dereferenceable(68) @srcb, i64 68, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 68) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(69) @dstb, ptr noundef nonnull align 16 dereferenceable(69) @srcb, i64 69, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 69) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(70) @dstb, ptr noundef nonnull align 16 dereferenceable(70) @srcb, i64 70, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 70) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(71) @dstb, ptr noundef nonnull align 16 dereferenceable(71) @srcb, i64 71, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 71) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(72) @dstb, ptr noundef nonnull align 16 dereferenceable(72) @srcb, i64 72, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 72) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(73) @dstb, ptr noundef nonnull align 16 dereferenceable(73) @srcb, i64 73, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 73) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(74) @dstb, ptr noundef nonnull align 16 dereferenceable(74) @srcb, i64 74, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 74) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(75) @dstb, ptr noundef nonnull align 16 dereferenceable(75) @srcb, i64 75, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 75) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(76) @dstb, ptr noundef nonnull align 16 dereferenceable(76) @srcb, i64 76, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 76) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(77) @dstb, ptr noundef nonnull align 16 dereferenceable(77) @srcb, i64 77, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 77) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(78) @dstb, ptr noundef nonnull align 16 dereferenceable(78) @srcb, i64 78, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 78) #12
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(79) @dstb, ptr noundef nonnull align 16 dereferenceable(79) @srcb, i64 79, i1 false)
  tail call void @check(ptr noundef nonnull @dstb, ptr noundef nonnull @srcb, i32 noundef 79) #12
  %4 = load volatile i32, ptr @chk_calls, align 4, !tbaa !4
  %tobool.not = icmp eq i32 %4, 0
  br i1 %tobool.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() #10
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #7

; Function Attrs: nounwind
define dso_local void @main_test() local_unnamed_addr #8 {
entry:
  %0 = load volatile i64, ptr @l1, align 8, !tbaa !11
  %1 = tail call i64 asm "", "=r,0,~{dirflag},~{fpsr},~{flags}"(i64 %0) #11, !srcloc !24
  store volatile i64 %1, ptr @l1, align 8, !tbaa !11
  tail call void @test1() #12
  tail call void @test2() #12
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(32) @p, i8 0, i64 32, i1 false)
  tail call void @test3() #12
  tail call void @test4() #12
  tail call void @test5() #12
  tail call void @test6() #12
  tail call void @test7() #12
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #9

attributes #0 = { noinline nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #5 = { nocallback nofree nosync nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #8 = { nounwind "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #10 = { nobuiltin nounwind "no-builtins" }
attributes #11 = { nounwind memory(none) }
attributes #12 = { nobuiltin "no-builtins" }

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
!8 = !{!9, !9, i64 0}
!9 = !{!"p1 omnipotent char", !10, i64 0}
!10 = !{!"any pointer", !6, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !6, i64 0}
!13 = !{i64 7219}
!14 = !{i64 7256}
!15 = !{i64 7293}
!16 = !{!6, !6, i64 0}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = distinct !{!19, !18}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !18}
!22 = distinct !{!22, !18}
!23 = distinct !{!23, !18}
!24 = !{i64 14161}
