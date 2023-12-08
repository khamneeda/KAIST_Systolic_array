sp_bram = []

###############
# Matmul system
###############

### Set parameters ###
mode = 0
M = 21
K = 23
N = 12


a_ram_arr
w_ram_arr

// 선택지가 있는데 각각 verilog랑 python에서 MKN으로 계산해서 로드 횟수 맞추는거랑
// 그냥 남는 sp_bram 써서 파이썬에서 로드 다 하면 시그널 주는게 있음
// 일단 첫번째걸로 짤게
### Load from bram ###
// wait start signal
if sp_bram[0] == 1 begin


tile_m = M/8 +1
tile_k = K/8 +1
tile_n = N/8 +1
a_load_iters = tile_m * tile_k
w_load_iters = tile_k * tile_n
a_load_idx = 0
w_load_idx = 0

// a_ram, w_ram 초기화
a_ram_arr_init
w_ram_arr_init
o_ram_arr_init

// ram_array에 넣을 때는 padding 있는게 좋을듯
// 일일이 index 기억 불가능 systolic 넣을때 어차피 m,n,k 구해주면 알아서 잘라주지않나

a_ram_start_addr는 a_load_index로 그때그때 구해주면 될듯

// a_ram load
if (a_load_idx < a_load_iters) begin
    if (sp_bram[20] == 0) begin
        
        모드 관계없이 쭉 넣어주면 됨
        padding도 관계없음 그냥 넣고 나중에 뺄때 mnk맞춰주면 됨

        a_ram_start_addr = 8*a_load_idx
        a_load()


        a_load_idx++
        sp_bram[20] = 1
    end 
end

// w_ram load
a와 동일함

### Systolic prepare ###



### Systolic ###
iter =0
m = 8
k = 8
n = 8
a_ram_start_addr = 0
w_ram_start_addr = 0
o_ram_start_addr = 0
a_x = 0
a_y = 0
w_x
accum = 0 // ws에서 1:같은 cell에 쌓음 0: 완성됨. systolic 이후 초기화
o_ram_bias = 0

// 그림 보면서 읽어야 이해될듯
// a_x == w_y
if ws
    while iter < tile_m * tile_k * tile_n
        // 매번 읽을 tile 위치 업데이트해줌
        if a_x >= tile_k begin
            a_x = 0
            a_y++
            o_ram_bias++
        end
        if a_y >= tile_m begin
            a_y = 0
            w_x++
        end

        
        //함수 호출 parameter 계산
        if a_x == tile_k -1:
            k = K%8
            accum = 0 // 언제 초기화하냐에 따라 다를거같은데, 여기에서는 sytolic 돌아간 이후로 생각함
            // z=0 일 때 초기화시키고 싶으면 a_x == 0 일 때로 하면 됨
        if a_y == tile_m -1:
            m = M%8
        if w_x == tile_n -1:
            n = N%8
        
        a_ram_start_addr = 8*(tile_m * a_x + a_y)
        w_ram_start_addr = 8*(a_x + tile_k * w_x)
        o_ram_start_addr = 8*iter

        //systolic module 호출
        sys_exec

        a_x++
        iter++

if os
    while iter < tile_m * tile_n
        if a_y >= tile_m begin
            a_y = 0
            w_x++
        end

        k = K
        if a_y == tile_m -1:
            m = M%8
        if w_x == tile_n -1:
            n = N%8
        

        a_ram_start_addr = 8*tile_k*a_y # padding값도 같이 빼줘야하므로 K 대신 tile_k
        w_ram_start_addr = 8*tile_k*w_x
        o_ram_start_addr = 8*iter

        a_y++
        iter++





### O_ram --> O_BRAM
// 순차적으로 꺼내주기만 하면 됨
iter = 0
if iter < tile_m * tile_n
    if (sp_bram[22] == 0) begin
        o_write(iter*8)
        #알아서 파이썬에서 정렬이랑 padding제거 해줌
        iter++
        sp_bram[22] = 1
    end

# end시그널 딱히 없어도 되긴 하는데
sp_bram[25] = 1


