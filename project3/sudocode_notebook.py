import numpy as np

# parameter setting

M = 21
K = 23
N = 12
mode = 0 # ws: 0 / os: 1

matrix_a = np.zeros((M,K))
matrix_w = np.zeros((K,N))

e = 0
for i in range(M):
    for j in range(K):
        matrix_a[i,j] = e
        e += 1

e = 0
for i in range(K):
    for j in range(N):
        matrix_w[i,j] = e
        e += 1

################
# Notebook area
################

a_bram = [0 for i in range(64)]
w_bram = [0 for i in range(64)]
o_bram = [0 for i in range(64)]

# 0: start / 1: mode / 2: M / 3: K / 4: N / 25: End
# 20: a load / 21: w load / 22: o pull
sp_bram = [0 for i in range(25)]

tile_m = M//8 +1
tile_k = K//8 +1
tile_n = N//8 +1

load_iters = max(tile_m*tile_k, tile_k*tile_n)


# ram_arr load
# load signal init
# 1: python load -> turn off / If it ended, dont turn off
# 0: FSM load -> turn on 
sp_bram[20] = 1 # a load
sp_bram[21] = 1 # w load
sp_bram[0] = 1 # 시작 신호 켜져도 HW에서는 로드 sig 따라 움직여야함

# ram_array에 넣을 순서대로 보냄

for iter in range(load_iters):

    # a_ram load
    if (iter+1) <= tile_m*tile_k:
        while sp_bram[20] == 0:
            pass
        a_bram = [0 for i in range(64)] # ram_arr padding때문에 0으로 초기화

        # ws  
        # 디자인 그림에서 1, 4, 7, 2 순서로 넣어줌
        if mode == 0:   
            x = iter // tile_m
            y = iter % tile_m
            a_bram = matrix_a[y:y+8 if y<(tile_m-1) else M%8, x:x+8 if x<(tile_k-1) else K%8].flatten()
        
        # os
        # 디자인 그림에서 1, 2, 3, 4 순서로 넣어줌
        else:          
            x = iter % tile_k
            y = iter // tile_k
            a_bram = matrix_a[y:y+8 if y<(tile_m-1) else M%8, x:x+8 if x<(tile_k-1) else K%8].flatten()
        sp_bram[20] = 0

    # w_ram load
    # 디자인 그림에서 a, b, c, d 순서로 넣어줌
    if (iter+1) <= tile_k*tile_n:
        while sp_bram[21] == 0:
            pass
        w_bram = [0 for i in range(64)] # ram_arr padding때문에 0으로 초기화

        x = iter // tile_k
        y = iter % tile_k
        w_bram = matrix_w[y:y+8 if y<(tile_k-1) else K%8, x:x+8 if x<(tile_n-1) else N%8].flatten()
        sp_bram[21] = 0

    
# O_ram data pulling
# start when o_pull signal
# end when iteration done
# iterate with o_pull signal
# 0: FSM bram load -> turn on
# 1: python matrix loadd -> turn off
pull_iter = tile_m * tile_n
output_matrix = np.zeros((M,N))

for iter in range(pull_iter):
    while sp_bram[22] == 0:
        pass
    
    x = iter // tile_m
    y = iter % tile_m
    for i in range(8):
        
        # pass when exceed matrix range
        # padding으로 넘어온 값 알아서 잘라줌
        if y == tile_m-1:
            if i+1 > M%8:
                continue
        
        for j in range(8):
            if x == tile_n-1:
                if j+1 > N%8:
                    continue
            
            # store data
            output_matrix[8*y + i, 8*x + j] = o_bram[8*i + j]

    sp_bram[22] = 0

