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
    1e-6*(end->tv_usec - start->tv_usec);
}

int main(int argc, const char* argv[]) {

    int i, j, k;

    int num_threads = 0;
    
    for(i=0;i<n;i++) {
        for(j=0;j<n;j++) {
            A[i][j] = (double)rand() / (double)RAND_MAX;
            B[i][j] = (double)rand() / (double)RAND_MAX;
            C[i][j] = 0;
        }
    }

    struct timeval start, end;

    gettimeofday(&start, NULL);

#pragma omp parallel shared(A, B, C)
{
    #pragma omp single
    {
        num_threads += omp_get_num_threads();
    }
    #pragma omp for schedule(static) 
        for(i=0;i<n;i++) {
            for(k=0;k<n;k++) {
                for(j=0;j<n;j++) {
                    C[i][j] += A[i][k] * B[k][j];
                }
            }
        }
}

    gettimeofday(&end, NULL);
    printf("%.2f\n", tdiff(&start, &end));
    printf("%d\n", num_threads);
    return 0;
}