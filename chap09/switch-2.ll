; ModuleID = 'switch-2.c'
source_filename = "switch-2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@str = private unnamed_addr constant [7 x i8] c"Sunday\00", align 1
@str.8 = private unnamed_addr constant [9 x i8] c"Saturday\00", align 1
@str.9 = private unnamed_addr constant [7 x i8] c"Friday\00", align 1
@str.10 = private unnamed_addr constant [9 x i8] c"Thursday\00", align 1
@str.11 = private unnamed_addr constant [10 x i8] c"Wednesday\00", align 1
@str.12 = private unnamed_addr constant [8 x i8] c"Tuesday\00", align 1
@str.13 = private unnamed_addr constant [7 x i8] c"Monday\00", align 1
@str.14 = private unnamed_addr constant [6 x i8] c"error\00", align 1
@switch.table.f = private unnamed_addr constant [7 x i8*] [i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.13, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @str.12, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @str.11, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str.10, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.9, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str.8, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str, i64 0, i64 0)], align 8

; Function Attrs: nofree nounwind uwtable
define dso_local void @f(i32 %0) local_unnamed_addr #0 {
  %2 = add i32 %0, -1
  %3 = icmp ult i32 %2, 7
  br i1 %3, label %4, label %8

4:                                                ; preds = %1
  %5 = sext i32 %2 to i64
  %6 = getelementptr inbounds [7 x i8*], [7 x i8*]* @switch.table.f, i64 0, i64 %5
  %7 = load i8*, i8** %6, align 8
  br label %8

8:                                                ; preds = %1, %4
  %9 = phi i8* [ %7, %4 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @str.14, i64 0, i64 0), %1 ]
  %10 = call i32 @puts(i8* nonnull dereferenceable(1) %9)
  ret void
}

; Function Attrs: nofree nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #1

attributes #0 = { nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
