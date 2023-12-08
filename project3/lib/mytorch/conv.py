from .base import Functional, c_dll
from ctypes import *

from ..util import global_config
import numpy as np
import time
from pynq import Overlay
from ..util import RunMode


# >>>>>>>>>>>>>>>>>>>> STEP5 >>>>>>>>>>>>>>>>>>>>
# you can define global variable

ol = None
bram_sp_arr = None
bram_a_arr = None
bram_w_arr = None
bram_o_arr = None
# <<<<<<<<<<<<<<<<<<<< STEP5 <<<<<<<<<<<<<<<<<<<<

def init_FPGA(file_name):
    # >>>>>>>>>>>>>>>>>>>> STEP5 >>>>>>>>>>>>>>>>>>>>
    # implement initialization for FPGA
    # it is up to design which things are needed
    global ol, bram_sp_arr, bram_a_arr, bram_w_arr, bram_o_arr
    
    ol = Overlay(file_name)
    
    bram_sp_arr = ol.axi_bram_ctrl_0.mmio.array
    bram_a_arr = ol.axi_bram_ctrl_1.mmio.array
    bram_w_arr = ol.axi_bram_ctrl_2.mmio.array
    bram_o_arr = ol.axi_bram_ctrl_3.mmio.array
    
    import pynq
    # You can change the clock frequency #
    pynq.ps.Clocks.fclk0_mhz = 25 #(unit: MHz)
    
    # <<<<<<<<<<<<<<<<<<<< STEP5 <<<<<<<<<<<<<<<<<<<<

class Conv2d(Functional):
    def matmul_OS (self, mat1: np.array, mat2: np.array):
        assert(mat1.shape[1] == mat2.shape[0])
        TILING = 8

        mat1_uint = mat1.astype(np.uint32)
        mat2_uint = mat2.astype(np.uint32)

        # ======matrix into BRAM ===== #
        M = ((mat1.shape[0] + TILING - 1) // TILING) * TILING
        K = ((mat1.shape[1] + TILING - 1) // TILING) * TILING
        N = ((mat2.shape[1] + TILING - 1) // TILING) * TILING
        mat1_pad = np.zeros((M, K)).astype(np.uint32)
        mat2_pad = np.zeros((K, N)).astype(np.uint32)
        mat1_pad[0:mat1.shape[0], 0:mat1.shape[1]] = mat1_uint
        mat2_pad[0:mat2.shape[0], 0:mat2.shape[1]] = mat2_uint
        bram_a_arr[0:M * K] = mat1_pad.flatten()
        bram_w_arr[0:K * N] = mat2_pad.flatten()

        
        #=============== HW RUNNIG ==================#
        # set Special Memory to specify M,K,N and mode (1: OS)    
        bram_sp_arr[1] = 1
        bram_sp_arr[2] = M
        bram_sp_arr[3] = K
        bram_sp_arr[4] = N
        # start (set sp(addr0) = 1)
        bram_sp_arr[0] = 1
        #while until sp(addr0) => 0 or sp(addr100) =>1 
        while(bram_sp_arr[25] != 1):
            pass
        # get data from BARM_O
        bram_sp_arr[25] = 0
        
        #=============== HW END =====================#


        return bram_o_arr[0:M * N].astype(np.int32).reshape(M, N)[0:mat1.shape[0], 0:mat2.shape[1]]

    def matmul_WS (self, mat1: np.array, mat2: np.array):
        assert(mat1.shape[1] == mat2.shape[0])
        TILING = 8

        mat1_uint = mat1.astype(np.uint32)
        mat2_uint = mat2.astype(np.uint32)

        # ======matrix into BRAM ===== #
        M = ((mat1.shape[0] + TILING - 1) // TILING) * TILING
        K = ((mat1.shape[1] + TILING - 1) // TILING) * TILING
        N = ((mat2.shape[1] + TILING - 1) // TILING) * TILING
        mat1_pad = np.zeros((M, K)).astype(np.uint32)
        mat2_pad = np.zeros((K, N)).astype(np.uint32)
        mat1_pad[0:mat1.shape[0], 0:mat1.shape[1]] = mat1_uint
        mat2_pad[0:mat2.shape[0], 0:mat2.shape[1]] = mat2_uint
        bram_a_arr[0:M * K] = mat1_pad.flatten()
        bram_w_arr[0:K * N] = mat2_pad.flatten()

        
        #=============== HW RUNNIG ==================#
        # set Special Memory to specify M,K,N and mode (1: OS)    
        bram_sp_arr[1] = 0
        bram_sp_arr[2] = M
        bram_sp_arr[3] = K
        bram_sp_arr[4] = N
        # start (set sp(addr0) = 1)
        bram_sp_arr[0] = 1
        #while until sp(addr0) => 0 or sp(addr100) =>1 
        while(bram_sp_arr[25] != 1):
            pass
        # get data from BARM_O
        bram_sp_arr[25] = 0
        
        #=============== HW END =====================#
        
        
        return bram_o_arr[0:M * N].astype(np.int32).reshape(M, N)[0:mat1.shape[0], 0:mat2.shape[1]]
        # <<<<<<<<<<<<<<<<<<<< STEP5 <<<<<<<<<<<<<<<<<<<<
        

    def matmul(self, mat1, mat2):
        return np.dot(mat1, mat2)
    
    def matmul_FPGA_tiling(self, mat1, mat2, bias):
        SW_TILE_SIZE = global_config["tile_size"]
        
        M, K = mat1.shape
        K, N = mat2.shape
        
        out = np.zeros((M, N)).astype(np.int32)
        
        # >>>>>>>>>>>>>>>>>>>> STEP5 >>>>>>>>>>>>>>>>>>>>
        # implement hardware wise tiling
        #
        # when doing tile multiplication, you should not use self.matmul(mat1, mat2) in STEP5
        # instead, you should call self.matmul_OS and self.matmul_WS
        #
        # furthermore, based on global_config["systolic_array_mode"], you should switch which mode will be run 
        
        matmul = self.matmul_WS if global_config["systolic_array_mode"] == 'WS' else self.matmul_OS
        
        for i in range(0, M, SW_TILE_SIZE):
            for j in range(0, N, SW_TILE_SIZE):
                for k in range(0, K, SW_TILE_SIZE):
                    out[i:i+SW_TILE_SIZE, j:j+SW_TILE_SIZE] += matmul(mat1[i:i+SW_TILE_SIZE, k:k+SW_TILE_SIZE], mat2[k:k+SW_TILE_SIZE, j:j+SW_TILE_SIZE])
        
        # <<<<<<<<<<<<<<<<<<<< STEP5 <<<<<<<<<<<<<<<<<<<<
        
        if bias is not None: out += bias
        
        return out

    def matmul_CPU_tiling(self, mat1, mat2, bias):
        SW_TILE_SIZE = 8
        
        M, K = mat1.shape
        K, N = mat2.shape
        
        
        out = np.zeros((M, N)).astype(np.float32)
        
        
        # >>>>>>>>>>>>>>>>>>>> STEP3 >>>>>>>>>>>>>>>>>>>>
        # implement software wise tiling
        # when doing tile multiplication, you can use self.matmul(mat1, mat2) in STEP3
   
        
        for i in range(0, M, SW_TILE_SIZE):
            for j in range(0, N, SW_TILE_SIZE):
                for k in range(0, K, SW_TILE_SIZE):
                    out[i:i+SW_TILE_SIZE, j:j+SW_TILE_SIZE] += self.matmul(mat1[i:i+SW_TILE_SIZE, k:k+SW_TILE_SIZE], mat2[k:k+SW_TILE_SIZE, j:j+SW_TILE_SIZE])
    
        # <<<<<<<<<<<<<<<<<<<< STEP3 <<<<<<<<<<<<<<<<<<<<
        
        if bias is not None: out += bias
        
        return out               
    
    def im2col(self, input_data, filter_h, filter_w, stride=1, pad=0):
        N, C, H, W = input_data.shape
        out_h = (H + 2*pad - filter_h) // stride + 1
        out_w = (W + 2*pad - filter_w) // stride + 1
        
        img = np.pad(input_data, [(0,0), (0,0), (pad, pad), (pad, pad)], 'constant')
        col = np.zeros((N, C, filter_h, filter_w, out_h, out_w), dtype=np.int32)
        
        for y in range(filter_h):
            y_max = y + stride*out_h
            for x in range(filter_w):
                x_max = x + stride*out_w
                col[:, :, y, x, :, :] = img[:, :, y:y_max:stride, x:x_max:stride]

        col = col.transpose(0, 4, 5, 1, 2, 3).reshape(N*out_h*out_w, -1)
        return col
    
    def c(self, activation, weight, bias, stride):
        n, ic, h, w = activation['shape']
        oc, _, kh, kw = weight['shape']
        s = stride
        oh = (h-kh)//s + 1
        ow = (w-kw)//s + 1
        
        activation_py = np.ctypeslib.as_array(activation["pointer"], activation["shape"])
        weight_py = np.ctypeslib.as_array(weight["pointer"], weight["shape"])
        bias_py = np.ctypeslib.as_array(bias["pointer"], bias["shape"]) if bias is not None else None
    
        activation_2d = self.im2col(activation_py, kh, kw, s)
        weight_2d = weight_py.reshape(oc, -1).T
        
        if global_config["current_step"] == 2:
            out = self.matmul(activation_2d, weight_2d)
            if bias_py is not None: out += bias_py
        elif global_config["current_step"] == 3:
            out = self.matmul_CPU_tiling(activation_2d, weight_2d, bias_py)
        elif global_config["current_step"] == 5:
            out = self.matmul_FPGA_tiling(activation_2d, weight_2d, bias_py)
        
        out = np.ascontiguousarray(out.reshape(n, oh, ow, -1).transpose(0, 3, 1, 2))
        return out, (n, oc, oh, ow)