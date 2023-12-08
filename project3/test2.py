import numpy as np
import sys

def matmul_CPU_tiling(mat1, mat2, bias=None):
        SW_TILE_SIZE = 8
        
        M, K = mat1.shape
        K, N = mat2.shape
        
        out = np.zeros((M, N))
        
        # if np.isnan(mat1).any() or np.isnan(mat2).any():
        #     print("NaN encountered!")
        
        # >>>>>>>>>>>>>>>>>>>> STEP3 >>>>>>>>>>>>>>>>>>>>
        # implement software wise tiling
        # when doing tile multiplication, you can use self.matmul(mat1, mat2) in STEP3
        
        # num_tile_m, num_tile_n, num_tile_k = M // SW_TILE_SIZE + (M % SW_TILE_SIZE != 0), N // SW_TILE_SIZE + (N % SW_TILE_SIZE != 0), K // SW_TILE_SIZE + (K % SW_TILE_SIZE != 0)
        # # print("tiled m,k,n:", num_tile_m, num_tile_n, num_tile_n)
        # for i in range(num_tile_m):
        #     for j in range(num_tile_n):
        #         acc = np.zeros((min(SW_TILE_SIZE, M - i * SW_TILE_SIZE), min(SW_TILE_SIZE, N - j * SW_TILE_SIZE)))
        #         for k in range(num_tile_k):
        #             tiled_mat1 = mat1[i * SW_TILE_SIZE : min((i + 1) * SW_TILE_SIZE, M), k * SW_TILE_SIZE : min((k + 1) * SW_TILE_SIZE, K)]
        #             tiled_mat2 = mat2[k * SW_TILE_SIZE : min((k + 1) * SW_TILE_SIZE, K), j * SW_TILE_SIZE : min((j + 1) * SW_TILE_SIZE, N)]
        #             # if np.isnan(tiled_mat1).any() or np.isnan(tiled_mat2).any() or np.isnan(self.matmul(tiled_mat1, tiled_mat2)).any():
        #             #     print("tiled_mat1:\n", tiled_mat1)
        #             #     print("tiled_mat2:\n", tiled_mat2)
        #             #     exit(0)
        #             acc += np.dot(tiled_mat1, tiled_mat2)
        #         out[i * SW_TILE_SIZE : min((i + 1) * SW_TILE_SIZE, M), j * SW_TILE_SIZE : min((j + 1) * SW_TILE_SIZE, N)] = acc
        
        for i in range(0, M, SW_TILE_SIZE):
            for j in range(0, N, SW_TILE_SIZE):
                for k in range(0, K, SW_TILE_SIZE):
                    # Multiply and accumulate tile
                    out[i:i+SW_TILE_SIZE, j:j+SW_TILE_SIZE] += np.dot(mat1[i:i+SW_TILE_SIZE, k:k+SW_TILE_SIZE], mat2[k:k+SW_TILE_SIZE, j:j+SW_TILE_SIZE])
    
        # <<<<<<<<<<<<<<<<<<<< STEP3 <<<<<<<<<<<<<<<<<<<<
        
        if bias is not None: out += bias
        
        # if np.isnan(out).any():
        #     print("NaN encountered!2")
            
        return out      
    

# mat1 = np.random.randint(-1000, 1000, (100,200)) 
# mat2 = np.random.randint(-1000, 1000,(200,300))

mat1 = np.random.rand(100,200)
mat2 = np.random.rand(200,300)

true = np.dot(mat1, mat2)
tiled = matmul_CPU_tiling(mat1, mat2)
print(true, '\n')
print(tiled, '\n')
print(true - tiled)