; ModuleID = 'break.c'
source_filename = "break.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local i32 @f(i32 %0) local_unnamed_addr #0 {
  %2 = icmp sgt i32 %0, 0
  %3 = select i1 %2, i32 %0, i32 0
  br label %4

4:                                                ; preds = %9, %1
  %5 = phi i32 [ %0, %1 ], [ %7, %9 ]
  %6 = phi i32 [ 0, %1 ], [ %10, %9 ]
  %7 = add nsw i32 %5, -1
  %8 = icmp eq i32 %6, %3
  br i1 %8, label %12, label %9

9:                                                ; preds = %4
  %10 = add nuw i32 %6, 1
  %11 = icmp eq i32 %7, 10
  br i1 %11, label %12, label %4, !llvm.loop !2

12:                                               ; preds = %4, %9
  %13 = phi i32 [ %10, %9 ], [ %6, %4 ]
  ret i32 %13
}

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.unroll.disable"}
