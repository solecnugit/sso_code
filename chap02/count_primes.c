#include <stdio.h>
#include <stdlib.h>

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
        int count = count_prime(start, end);
        printf("Found %d prime(s) in interval [%d, %d].\n", count, start, end);
    }
}