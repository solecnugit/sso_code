import time
import os

test_num = 100
execution_times = []

for i in range(1, test_num + 1):
    start_time = time.time()
    ret_code = os.system("mpirun -np 16 --bind-to core ./prime_parallel 1 20000000")   # edit here
    if ret_code != 0:
        break
    end_time = time.time()

    execution_time = end_time - start_time
    execution_times.append(execution_time)

    print(f"Test #{i} | Execution Time: {execution_time} sec.")

with open("./data/exec_times_parallel_bind_htoff.txt","w") as file:    # edit here
    for execution_time in execution_times:
        file.write(str(execution_time) + "\n")
