import random
from time import *

n = 4096

A = [[random.random() 
      for row in range(n)]
    for col in range(n)]

B = [[random.random() 
      for row in range(n)]
    for col in range(n)]

C = [[0 for row in range(n)]
    for col in range(n)]


start = time()
for i in range(n):
    for j in range(n):
        for k in range(n):
            C[i][j] += A[i][k] * B[k][i]
end = time()

print("%.2f" % (end - start))