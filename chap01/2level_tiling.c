#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <omp.h>
#include <math.h>

#define n 4096
double A[n][n];
double B[n][n];
double C[n][n];
double D[n][n];

float tdiff(struct timeval *start, struct timeval *end) {
    return (end->tv_sec - start->tv_sec) + 
    1e-6*(end->tv_usec - start->tv_usec);
}

int main(int argc, const char* argv[]) {

    for(int i=0;i<n;i++) {
        for(int j=0;j<n;j++) {
            A[i][j] = (double)rand() / (double)RAND_MAX;
            B[i][j] = (double)rand() / (double)RAND_MAX;
            C[i][j] = 0;
            D[i][j] = 0;
        }
    }

    struct timeval start, end;
    
    int ih, il, im, jh, jl, jm, kh, kl, km;

    gettimeofday(&start, NULL);

// // S & T are variables to be tuned
#pragma omp parallel for shared(A, B, C) \
    schedule(static) collapse(2)
    for(ih = 0;ih < n;ih += S)   
        for(jh = 0;jh < n;jh += S)
            for(kh = 0;kh < n ;kh += S)
                for(im = 0;im < S;im +=T)
                    for(jm = 0;jm < S;jm += T)
                        for(km = 0;km < S;km += T)
                            for(il = 0;il < T;++il)
                                for(kl = 0;kl < T;++kl)
                                    for(jl = 0;jl < T;++jl)
                                        C[ih+im+il][jh+jm+jl] += A[ih+im+il][kh+km+kl] * B[kh+km+kl][jh+jm+jl];

    gettimeofday(&end, NULL);
    printf("%.2f\n", tdiff(&start, &end));

    int i,k,j;
    #pragma omp parallel for schedule(static) shared(A, B, C)
    for(i=0;i<n;i++) {
        for(k=0;k<n;k++) {
            for(j=0;j<n;j++) {
                D[i][j] += A[i][k] * B[k][j];
            }
        }
    }

    int count = 0;
    for(i=0;i<n;i++) {
        for(j=0;j<n;j++) {
            if(fabs(C[i][j] - D[i][j]) >= 1) {
                // printf("%d,%d\n", i, j);
                // printf("%f,%f\n", C[i][j], D[i][j]);
                count++;
            }
        }
    }
    printf("%f,%f\n", A[0][0], B[0][0]);
    printf("%f,%f\n", C[0][0], D[0][0]);
    printf("%d\n", count);

    return 0;
}