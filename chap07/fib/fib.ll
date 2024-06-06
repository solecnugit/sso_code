; ModuleID = 'fib.c'
source_filename = "fib.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define dso_local i64 @fib(i64 %0) local_unnamed_addr #0 !dbg !6 {
  %2 = icmp slt i64 %0, 2, !dbg !8
  br i1 %2, label %11, label %3, !dbg !9

3:                                                ; preds = %1, %3
  %4 = phi i64 [ %8, %3 ], [ %0, %1 ]
  %5 = phi i64 [ %9, %3 ], [ 0, %1 ]
  %6 = add nsw i64 %4, -1, !dbg !10
  %7 = tail call i64 @fib(i64 %6), !dbg !11
  %8 = add nsw i64 %4, -2, !dbg !12
  %9 = add nsw i64 %7, %5, !dbg !13
  %10 = icmp slt i64 %4, 4, !dbg !8
  br i1 %10, label %11, label %3, !dbg !9

11:                                               ; preds = %3, %1
  %12 = phi i64 [ 0, %1 ], [ %9, %3 ]
  %13 = phi i64 [ %0, %1 ], [ %8, %3 ]
  %14 = add nsw i64 %13, %12, !dbg !13
  ret i64 %14, !dbg !14
}

attributes #0 = { nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 11.0.0-2~ubuntu20.04.1", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "fib.c", directory: "/home/bhuang/Courses/fib")
!2 = !{}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!6 = distinct !DISubprogram(name: "fib", scope: !1, file: !1, line: 3, type: !7, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!7 = !DISubroutineType(types: !2)
!8 = !DILocation(line: 4, column: 11, scope: !6)
!9 = !DILocation(line: 4, column: 9, scope: !6)
!10 = !DILocation(line: 6, column: 18, scope: !6)
!11 = !DILocation(line: 6, column: 13, scope: !6)
!12 = !DILocation(line: 6, column: 29, scope: !6)
!13 = !DILocation(line: 6, column: 22, scope: !6)
!14 = !DILocation(line: 7, column: 1, scope: !6)
