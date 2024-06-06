#include <mpi.h>
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
    {
        if (is_prime(num) == 1)
            count++;
    }
    return count;
}

int main(int argc, char *argv[])
{
    if (argc != 3)
        printf("This program should be called with 2 arguments.\n");
    else
    {   
        int my_rank, comm_sz, block_size, local_start_1, local_end_1, local_start_2, local_end_2, local_count, source, total_count;
        
        int start = atoi(argv[1]);
        int end = atoi(argv[2]);

        MPI_Init(NULL, NULL);
        MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);
        MPI_Comm_size(MPI_COMM_WORLD, &comm_sz);

        block_size = (end - start) / (comm_sz * 2);

        local_start_1 = start + block_size * my_rank;
        local_end_1 = local_start_1 + block_size - 1;
        local_end_2 = end - block_size * my_rank;
        local_start_2 = local_end_2 - block_size + 1;
        
        if (my_rank == comm_sz - 1)
        {
            local_count = count_prime(local_start_1, local_end_2);
            // printf("Node %d | Interval [%d, %d]              | Found %d prime(s)\n", my_rank, local_start_1, local_end_2, local_count);
        }
        else
        {
            local_count = count_prime(local_start_1, local_end_1) + count_prime(local_start_2, local_end_2);
            // printf("Node %d | Interval [%d, %d] and [%d, %d] | Found %d prime(s)\n", my_rank, local_start_1, local_end_1, local_start_2, local_end_2, local_count);
        }

        if (my_rank != 0)
            MPI_Send(&local_count, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
        else
        {
            total_count = local_count;
            for (source = 1; source < comm_sz; source++)
            {
                MPI_Recv(&local_count, 1, MPI_INT, source, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
                total_count += local_count;
            }
            printf("Found %d prime(s) in interval [%d, %d].\n", total_count, start, end);
        }

        MPI_Finalize();
    }
    return 0;
}