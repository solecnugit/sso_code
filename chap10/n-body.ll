; ModuleID = 'n-body.c'
source_filename = "n-body.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.body_t = type { %struct.vec_t, %struct.vec_t, %struct.vec_t, double }
%struct.vec_t = type { double, double }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @update_positions(i32 %0, %struct.body_t* %1, double %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.body_t*, align 8
  %6 = alloca double, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.vec_t, align 8
  %9 = alloca %struct.vec_t, align 8
  %10 = alloca %struct.vec_t, align 8
  %11 = alloca %struct.vec_t, align 8
  store i32 %0, i32* %4, align 4
  store %struct.body_t* %1, %struct.body_t** %5, align 8
  store double %2, double* %6, align 8
  store i32 0, i32* %7, align 4
  br label %12

12:                                               ; preds = %110, %3
  %13 = load i32, i32* %7, align 4
  %14 = load i32, i32* %4, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %113

16:                                               ; preds = %12
  %17 = load %struct.body_t*, %struct.body_t** %5, align 8
  %18 = load i32, i32* %7, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds %struct.body_t, %struct.body_t* %17, i64 %19
  %21 = getelementptr inbounds %struct.body_t, %struct.body_t* %20, i32 0, i32 2
  %22 = load double, double* %6, align 8
  %23 = load %struct.body_t*, %struct.body_t** %5, align 8
  %24 = load i32, i32* %7, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.body_t, %struct.body_t* %23, i64 %25
  %27 = getelementptr inbounds %struct.body_t, %struct.body_t* %26, i32 0, i32 3
  %28 = load double, double* %27, align 8
  %29 = fdiv double %22, %28
  %30 = bitcast %struct.vec_t* %21 to { double, double }*
  %31 = getelementptr inbounds { double, double }, { double, double }* %30, i32 0, i32 0
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds { double, double }, { double, double }* %30, i32 0, i32 1
  %34 = load double, double* %33, align 8
  %35 = call { double, double } @vec_scale(double %32, double %34, double %29)
  %36 = bitcast %struct.vec_t* %8 to { double, double }*
  %37 = getelementptr inbounds { double, double }, { double, double }* %36, i32 0, i32 0
  %38 = extractvalue { double, double } %35, 0
  store double %38, double* %37, align 8
  %39 = getelementptr inbounds { double, double }, { double, double }* %36, i32 0, i32 1
  %40 = extractvalue { double, double } %35, 1
  store double %40, double* %39, align 8
  %41 = load %struct.body_t*, %struct.body_t** %5, align 8
  %42 = load i32, i32* %7, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds %struct.body_t, %struct.body_t* %41, i64 %43
  %45 = getelementptr inbounds %struct.body_t, %struct.body_t* %44, i32 0, i32 0
  %46 = load %struct.body_t*, %struct.body_t** %5, align 8
  %47 = load i32, i32* %7, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds %struct.body_t, %struct.body_t* %46, i64 %48
  %50 = getelementptr inbounds %struct.body_t, %struct.body_t* %49, i32 0, i32 0
  %51 = load %struct.body_t*, %struct.body_t** %5, align 8
  %52 = load i32, i32* %7, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds %struct.body_t, %struct.body_t* %51, i64 %53
  %55 = getelementptr inbounds %struct.body_t, %struct.body_t* %54, i32 0, i32 1
  %56 = bitcast %struct.vec_t* %55 to { double, double }*
  %57 = getelementptr inbounds { double, double }, { double, double }* %56, i32 0, i32 0
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds { double, double }, { double, double }* %56, i32 0, i32 1
  %60 = load double, double* %59, align 8
  %61 = bitcast %struct.vec_t* %8 to { double, double }*
  %62 = getelementptr inbounds { double, double }, { double, double }* %61, i32 0, i32 0
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds { double, double }, { double, double }* %61, i32 0, i32 1
  %65 = load double, double* %64, align 8
  %66 = call { double, double } @vec_add(double %58, double %60, double %63, double %65)
  %67 = bitcast %struct.vec_t* %11 to { double, double }*
  %68 = getelementptr inbounds { double, double }, { double, double }* %67, i32 0, i32 0
  %69 = extractvalue { double, double } %66, 0
  store double %69, double* %68, align 8
  %70 = getelementptr inbounds { double, double }, { double, double }* %67, i32 0, i32 1
  %71 = extractvalue { double, double } %66, 1
  store double %71, double* %70, align 8
  %72 = load double, double* %6, align 8
  %73 = fdiv double %72, 2.000000e+00
  %74 = bitcast %struct.vec_t* %11 to { double, double }*
  %75 = getelementptr inbounds { double, double }, { double, double }* %74, i32 0, i32 0
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds { double, double }, { double, double }* %74, i32 0, i32 1
  %78 = load double, double* %77, align 8
  %79 = call { double, double } @vec_scale(double %76, double %78, double %73)
  %80 = bitcast %struct.vec_t* %10 to { double, double }*
  %81 = getelementptr inbounds { double, double }, { double, double }* %80, i32 0, i32 0
  %82 = extractvalue { double, double } %79, 0
  store double %82, double* %81, align 8
  %83 = getelementptr inbounds { double, double }, { double, double }* %80, i32 0, i32 1
  %84 = extractvalue { double, double } %79, 1
  store double %84, double* %83, align 8
  %85 = bitcast %struct.vec_t* %50 to { double, double }*
  %86 = getelementptr inbounds { double, double }, { double, double }* %85, i32 0, i32 0
  %87 = load double, double* %86, align 8
  %88 = getelementptr inbounds { double, double }, { double, double }* %85, i32 0, i32 1
  %89 = load double, double* %88, align 8
  %90 = bitcast %struct.vec_t* %10 to { double, double }*
  %91 = getelementptr inbounds { double, double }, { double, double }* %90, i32 0, i32 0
  %92 = load double, double* %91, align 8
  %93 = getelementptr inbounds { double, double }, { double, double }* %90, i32 0, i32 1
  %94 = load double, double* %93, align 8
  %95 = call { double, double } @vec_add(double %87, double %89, double %92, double %94)
  %96 = bitcast %struct.vec_t* %9 to { double, double }*
  %97 = getelementptr inbounds { double, double }, { double, double }* %96, i32 0, i32 0
  %98 = extractvalue { double, double } %95, 0
  store double %98, double* %97, align 8
  %99 = getelementptr inbounds { double, double }, { double, double }* %96, i32 0, i32 1
  %100 = extractvalue { double, double } %95, 1
  store double %100, double* %99, align 8
  %101 = bitcast %struct.vec_t* %45 to i8*
  %102 = bitcast %struct.vec_t* %9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %101, i8* align 8 %102, i64 16, i1 false)
  %103 = load %struct.body_t*, %struct.body_t** %5, align 8
  %104 = load i32, i32* %7, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds %struct.body_t, %struct.body_t* %103, i64 %105
  %107 = getelementptr inbounds %struct.body_t, %struct.body_t* %106, i32 0, i32 1
  %108 = bitcast %struct.vec_t* %107 to i8*
  %109 = bitcast %struct.vec_t* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %108, i8* align 8 %109, i64 16, i1 false)
  br label %110

110:                                              ; preds = %16
  %111 = load i32, i32* %7, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %7, align 4
  br label %12

113:                                              ; preds = %12
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal { double, double } @vec_scale(double %0, double %1, double %2) #0 {
  %4 = alloca %struct.vec_t, align 8
  %5 = alloca %struct.vec_t, align 8
  %6 = alloca double, align 8
  %7 = bitcast %struct.vec_t* %5 to { double, double }*
  %8 = getelementptr inbounds { double, double }, { double, double }* %7, i32 0, i32 0
  store double %0, double* %8, align 8
  %9 = getelementptr inbounds { double, double }, { double, double }* %7, i32 0, i32 1
  store double %1, double* %9, align 8
  store double %2, double* %6, align 8
  %10 = getelementptr inbounds %struct.vec_t, %struct.vec_t* %4, i32 0, i32 0
  %11 = getelementptr inbounds %struct.vec_t, %struct.vec_t* %5, i32 0, i32 0
  %12 = load double, double* %11, align 8
  %13 = load double, double* %6, align 8
  %14 = fmul double %12, %13
  store double %14, double* %10, align 8
  %15 = getelementptr inbounds %struct.vec_t, %struct.vec_t* %4, i32 0, i32 1
  %16 = getelementptr inbounds %struct.vec_t, %struct.vec_t* %5, i32 0, i32 1
  %17 = load double, double* %16, align 8
  %18 = load double, double* %6, align 8
  %19 = fmul double %17, %18
  store double %19, double* %15, align 8
  %20 = bitcast %struct.vec_t* %4 to { double, double }*
  %21 = load { double, double }, { double, double }* %20, align 8
  ret { double, double } %21
}

; Function Attrs: noinline nounwind optnone uwtable
define internal { double, double } @vec_add(double %0, double %1, double %2, double %3) #0 {
  %5 = alloca %struct.vec_t, align 8
  %6 = alloca %struct.vec_t, align 8
  %7 = alloca %struct.vec_t, align 8
  %8 = bitcast %struct.vec_t* %6 to { double, double }*
  %9 = getelementptr inbounds { double, double }, { double, double }* %8, i32 0, i32 0
  store double %0, double* %9, align 8
  %10 = getelementptr inbounds { double, double }, { double, double }* %8, i32 0, i32 1
  store double %1, double* %10, align 8
  %11 = bitcast %struct.vec_t* %7 to { double, double }*
  %12 = getelementptr inbounds { double, double }, { double, double }* %11, i32 0, i32 0
  store double %2, double* %12, align 8
  %13 = getelementptr inbounds { double, double }, { double, double }* %11, i32 0, i32 1
  store double %3, double* %13, align 8
  %14 = getelementptr inbounds %struct.vec_t, %struct.vec_t* %5, i32 0, i32 0
  %15 = getelementptr inbounds %struct.vec_t, %struct.vec_t* %6, i32 0, i32 0
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds %struct.vec_t, %struct.vec_t* %7, i32 0, i32 0
  %18 = load double, double* %17, align 8
  %19 = fadd double %16, %18
  store double %19, double* %14, align 8
  %20 = getelementptr inbounds %struct.vec_t, %struct.vec_t* %5, i32 0, i32 1
  %21 = getelementptr inbounds %struct.vec_t, %struct.vec_t* %6, i32 0, i32 1
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds %struct.vec_t, %struct.vec_t* %7, i32 0, i32 1
  %24 = load double, double* %23, align 8
  %25 = fadd double %22, %24
  store double %25, double* %20, align 8
  %26 = bitcast %struct.vec_t* %5 to { double, double }*
  %27 = load { double, double }, { double, double }* %26, align 8
  ret { double, double } %27
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @calculate_forces(i32 %0, %struct.body_t* %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.body_t*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.vec_t, align 8
  store i32 %0, i32* %3, align 4
  store %struct.body_t* %1, %struct.body_t** %4, align 8
  store i32 0, i32* %5, align 4
  br label %8

8:                                                ; preds = %50, %2
  %9 = load i32, i32* %5, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %53

12:                                               ; preds = %8
  store i32 0, i32* %6, align 4
  br label %13

13:                                               ; preds = %46, %12
  %14 = load i32, i32* %6, align 4
  %15 = load i32, i32* %3, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %49

17:                                               ; preds = %13
  %18 = load i32, i32* %5, align 4
  %19 = load i32, i32* %6, align 4
  %20 = icmp eq i32 %18, %19
  br i1 %20, label %21, label %22

21:                                               ; preds = %17
  br label %46

22:                                               ; preds = %17
  %23 = load %struct.body_t*, %struct.body_t** %4, align 8
  %24 = load i32, i32* %5, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.body_t, %struct.body_t* %23, i64 %25
  %27 = load %struct.body_t*, %struct.body_t** %4, align 8
  %28 = load i32, i32* %5, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds %struct.body_t, %struct.body_t* %27, i64 %29
  %31 = load %struct.body_t*, %struct.body_t** %4, align 8
  %32 = load i32, i32* %6, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct.body_t, %struct.body_t* %31, i64 %33
  %35 = call { double, double } @calculate_force(%struct.body_t* %30, %struct.body_t* %34)
  %36 = bitcast %struct.vec_t* %7 to { double, double }*
  %37 = getelementptr inbounds { double, double }, { double, double }* %36, i32 0, i32 0
  %38 = extractvalue { double, double } %35, 0
  store double %38, double* %37, align 8
  %39 = getelementptr inbounds { double, double }, { double, double }* %36, i32 0, i32 1
  %40 = extractvalue { double, double } %35, 1
  store double %40, double* %39, align 8
  %41 = bitcast %struct.vec_t* %7 to { double, double }*
  %42 = getelementptr inbounds { double, double }, { double, double }* %41, i32 0, i32 0
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds { double, double }, { double, double }* %41, i32 0, i32 1
  %45 = load double, double* %44, align 8
  call void @add_force(%struct.body_t* %26, double %43, double %45)
  br label %46

46:                                               ; preds = %22, %21
  %47 = load i32, i32* %6, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %6, align 4
  br label %13

49:                                               ; preds = %13
  br label %50

50:                                               ; preds = %49
  %51 = load i32, i32* %5, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %5, align 4
  br label %8

53:                                               ; preds = %8
  ret void
}

declare dso_local void @add_force(%struct.body_t*, double, double) #2

declare dso_local { double, double } @calculate_force(%struct.body_t*, %struct.body_t*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @simulate(%struct.body_t* %0, i32 %1, i32 %2, i32 %3) #0 {
  %5 = alloca %struct.body_t*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct.body_t* %0, %struct.body_t** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  store i32 0, i32* %9, align 4
  br label %10

10:                                               ; preds = %21, %4
  %11 = load i32, i32* %9, align 4
  %12 = load i32, i32* %7, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %24

14:                                               ; preds = %10
  %15 = load i32, i32* %6, align 4
  %16 = load %struct.body_t*, %struct.body_t** %5, align 8
  call void @calculate_forces(i32 %15, %struct.body_t* %16)
  %17 = load i32, i32* %6, align 4
  %18 = load %struct.body_t*, %struct.body_t** %5, align 8
  %19 = load i32, i32* %8, align 4
  %20 = sitofp i32 %19 to double
  call void @update_positions(i32 %17, %struct.body_t* %18, double %20)
  br label %21

21:                                               ; preds = %14
  %22 = load i32, i32* %9, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %9, align 4
  br label %10

24:                                               ; preds = %10
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
