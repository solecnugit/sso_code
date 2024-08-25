#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <omp.h>
#include <immintrin.h>

// 二级循环分块的参数大小，下面程序已进行替换
#define S 128
#define T 16

#define n 4096
double A[n][n] __attribute__((aligned(32)));
double B[n][n] __attribute__((aligned(32)));
double C[n][n] __attribute__((aligned(32)));

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
    __m256d packedA, packedB, packedC;
    gettimeofday(&start, NULL);
    
    #pragma omp parallel for shared(A, B, C) schedule(static) collapse(2)
    for (ih = 0; ih < n; ih += 128)
        for (jh = 0; jh < n; jh += 128)
            for (kh = 0; kh < n; kh += 128)
                for (im = 0; im < 128; im += 16)
                    for (jm = 0; jm < 128; jm += 16)
                        for (km = 0; km < 128; km += 16)
                            for (il = 0; il < 16; ++il) {
                                for (kl = 0; kl < 16; ++kl) {
                                    // 将 AVX 寄存器设置为 4 个 A[ih + im + il][kh + km + kl]
                                    packedA = _mm256_set1_pd(A[ih + im + il][kh + km + kl]);
                                    for (jl = 0; jl < 16; jl += 4) {
                                        // 加载 C[ih + im + il][kh + km + kl] ~ C[ih + im + il][kh + km + kl + 3]
                                        packedC = _mm256_load_pd(&C[ih + im + il][jh + jm + jl]);
                                        // 加载 B[kh + km + kl][jh + jm + jl] ~ B[kh + km + kl][jh + jm + jl + 3]
                                        packedB = _mm256_load_pd(&B[kh + km + kl][jh + jm + jl]);
                                        // packedC += packedA * packedB
                                        packedC = _mm256_fmadd_pd(packedA, packedB, packedC);
                                        // 将 packedC 写入内存
                                        _mm256_store_pd(&C[ih + im + il][jh + jm + jl], packedC);
                                    }
                                }
                            }
    gettimeofday(&end, NULL);

    printf("%.2f\n", tdiff(&start, &end));
    return 0;
}