; ModuleID = 'loop-1.c'
source_filename = "loop-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @dax(double* noalias nocapture %0, double %1, double* noalias nocapture readonly %2, i64 %3) local_unnamed_addr #0 {
  %5 = icmp sgt i64 %3, 0
  br i1 %5, label %7, label %6

6:                                                ; preds = %7, %4
  ret void

7:                                                ; preds = %4, %7
  %8 = phi i64 [ %13, %7 ], [ 0, %4 ]
  %9 = getelementptr inbounds double, double* %2, i64 %8
  %10 = load double, double* %9, align 8, !tbaa !2
  %11 = fmul double %10, %1
  %12 = getelementptr inbounds double, double* %0, i64 %8
  store double %11, double* %12, align 8, !tbaa !2
  %13 = add nuw nsw i64 %8, 1
  %14 = icmp eq i64 %13, %3
  br i1 %14, label %6, label %7, !llvm.loop !6
}

attributes #0 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.unroll.disable"}
