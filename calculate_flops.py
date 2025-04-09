import os
import numpy as np
import time


# Set number of threads (try changing this to 1, 2, 4, 8, etc.)
# os.environ["OMP_NUM_THREADS"] = "4"  # Example: 4 threads

# Define matrix size
N = 1000

# Create two random N x N matrices
A = np.random.rand(N, N)
B = np.random.rand(N, N)

# Warm-up
C = np.dot(A, B)

# Time the dot product
start_time = time.time()
C = np.dot(A, B)
end_time = time.time()

# Calculate time taken
elapsed_time = end_time - start_time

# Calculate FLOPs
# Matrix multiplication of (N x N) * (N x N) => 2 * N^3 floating point operations
flops = 2 * (N ** 3)
gflops = flops / (elapsed_time * 1e9)

print(f"Time taken: {elapsed_time:.6f} seconds")
print(f"Estimated FLOPs: {flops:.2e}")
print(f"Performance: {gflops:.2f} GFLOPs")
