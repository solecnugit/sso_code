; ModuleID = 'switch-3.c'
source_filename = "switch-3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local i32 @f(i32 %0) local_unnamed_addr #0 {
  switch i32 %0, label %10 [
    i32 2, label %2
    i32 4, label %5
    i32 8, label %8
  ]

2:                                                ; preds = %1
  %3 = add nsw i32 %0, 1
  %4 = call i32 @g(i32 %3) #2
  br label %12

5:                                                ; preds = %1
  %6 = add nsw i32 %0, 2
  %7 = call i32 @h(i32 %6) #2
  br label %12

8:                                                ; preds = %1
  %9 = add nsw i32 %0, 3
  br label %12

10:                                               ; preds = %1
  %11 = add nsw i32 %0, 10
  br label %12

12:                                               ; preds = %10, %8, %5, %2
  %13 = phi i32 [ %11, %10 ], [ %9, %8 ], [ %7, %5 ], [ %4, %2 ]
  ret i32 %13
}

declare dso_local i32 @g(i32) local_unnamed_addr #1

declare dso_local i32 @h(i32) local_unnamed_addr #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
