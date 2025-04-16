import numpy as np
import time


np.random.seed(42)

# Increase matrix size
N = 1000
A = np.random.rand(N, N)
B = np.random.rand(N, N)

# Manual matrix multiplication
start_time = time.monotonic()
new_array = np.empty((N, N))
for i in range(N):
    for j in range(N):
        total = 0
        for k in range(N):
            total += A[i][k] * B[k][j]
        new_array[i][j] = total
end_time = time.monotonic()
print(f"Time - Manual Matrix Multiplication: {end_time - start_time} seconds")

# NumPy matrix multiplication (optimized)
start_time = time.monotonic()
new_array_np = np.dot(A, B)
end_time = time.monotonic()
print(f"Time - NumPy Matrix Multiplication: {end_time - start_time} seconds")
