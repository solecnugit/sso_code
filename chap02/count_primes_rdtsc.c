#include <stdio.h>
#include <stdlib.h>

double const BASE_FREQ = 2900000000;

static __inline__ unsigned long long rdtsc(void) {
    unsigned hi, lo;
    __asm__ __volatile__ ("rdtsc" : "=a"(lo), "=d"(hi));
    return ( ((unsigned long long)lo) | (((unsigned long long)hi) << 32) );
}

int is_prime(int n)
{
    if (n <= 1)
        return 0;
    if (n <= 3)
        return 1;
    if (n % 2 == 0 || n % 3 == 0)
        return 0;
    int i = 5;
    while (i * i <= n)
    {
        if (n % i == 0)
            return 0;
        i++;
    }
    return 1;
}

int count_prime(int start, int end)
{
    int num, count = 0;
    for (num = start; num <= end; num++)
        if (is_prime(num) == 1)
            count++;
    return count;
}

int main(int argc, char *argv[])
{
    if (argc != 3)
        printf("This program should be called with 2 arguments.\n");
    else
    {
        int start = atoi(argv[1]);
        int end = atoi(argv[2]); 

        unsigned long long t_start, t_end;
        t_start = rdtsc();
        int count = count_prime(start, end);
        t_end = rdtsc();

        printf("Found %d prime(s) in interval [%d, %d].\n", count, start, end);

        double t_diff = (t_end - t_start) / BASE_FREQ;
        printf("time: %.9lf\n", t_diff);
    }
}