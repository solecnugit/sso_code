#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <omp.h>

#define n 4096
double A[n][n];
double B[n][n];
double C[n][n];

float tdiff(struct timeval *start, struct timeval *end) {
    return (end->tv_sec - start->tv_sec) +
           1e-6 * (end->tv_usec - start->tv_usec);
}

int main(int argc, const char *argv[]) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            A[i][j] = (double)rand() / (double)RAND_MAX;
            B[i][j] = (double)rand() / (double)RAND_MAX;
            C[i][j] = 0;
        }
    }

    struct timeval start, end;
    int ih, il, im, jh, jl, jm, kh, kl, km;
    gettimeofday(&start, NULL);
    
    // S 和 T 为多层拆分后的子矩阵的维度，编译时通过命令行传入
    #pragma omp parallel for shared(A, B, C) schedule(static) collapse(2)
    for (ih = 0; ih < n; ih += S)
        for (jh = 0; jh < n; jh += S)
            for (kh = 0; kh < n; kh += S)
                for (im = 0; im < S; im += T)
                    for (jm = 0; jm < S; jm += T)
                        for (km = 0; km < S; km += T)
                            for (il = 0; il < T; ++il)
                                for (kl = 0; kl < T; ++kl)
                                    for (jl = 0; jl < T; ++jl)
                                        C[ih + im + il][jh + jm + jl] +=
                                            A[ih + im + il][kh + km + kl] * B[kh + km + kl][jh + jm + jl];
    gettimeofday(&end, NULL);
    
    printf("%.2f\n", tdiff(&start, &end));
    return 0;
}