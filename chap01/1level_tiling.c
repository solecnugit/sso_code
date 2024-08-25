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
    int i, j, k;
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            A[i][j] = (double)rand() / (double)RAND_MAX;
            B[i][j] = (double)rand() / (double)RAND_MAX;
            C[i][j] = 0;
        }
    }

    struct timeval start, end;
    int ih, il, jh, jl, kh, kl;
    gettimeofday(&start, NULL);
    
    // S 为具体的分块大小，编译时通过命令行传入
    #pragma omp parallel for shared(A, B, C) schedule(static) collapse(2)
    for (ih = 0; ih < n; ih += S)
        for (jh = 0; jh < n; jh += S)
            for (kh = 0; kh < n; kh += S)
                for (il = 0; il < S; il++)
                    for (kl = 0; kl < S; kl++)
                        for (jl = 0; jl < S; jl++)
                            C[ih + il][jh + jl] += A[ih + il][kh + kl] * B[kh + kl][jh + jl];
    gettimeofday(&end, NULL);

    printf("%.2f\n", tdiff(&start, &end));
    return 0;
}