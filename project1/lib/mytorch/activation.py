from .base import Functional, c_dll, cu_dll, cuo_dll
import torch
from ctypes import *
import numpy as np

class LeakyReLU(Functional):
    """
        Implement the LeakyReLU with C and CUDA backend.
        Under C or CUDA RunMode conditions, the array has a format below.
        Array: {
            'pointer'   : C pointer that can directly passed to c functions,
            'shape'     : python tuple of array
        }
    
        Inputs:
        - activation     : An array containing input data, of shape (N, c, h, w)
        - negative_slope : A python integer of LeakyReLU parameter
        
        Returns an array output:
        - out: output, of shape (N, c, h, w)
    """
    def torch(self, activation, negative_slope):
        return torch.nn.functional.leaky_relu(activation, negative_slope=negative_slope)

    def c(self, activation, negative_slope):
        c_activation_shape = (c_int * 2)(*activation['shape'])
        c_output_p = c_dll.leaky_relu(activation['pointer'], c_activation_shape, c_float(negative_slope))
        return (c_output_p, activation['shape'])
    
    def cuda(self, activation, negative_slope):
        c_activation_shape = (c_int * 2)(*activation['shape'])
        cu_output_p = cu_dll.leaky_relu(activation['pointer'], c_activation_shape, c_float(negative_slope))
        return (cu_output_p, activation['shape'])

    def cuda_optimized(self, activation, negative_slope):
        c_activation_shape = (c_int * 2)(*activation['shape'])
        cuo_output_p = cuo_dll.leaky_relu(activation['pointer'], c_activation_shape, c_float(negative_slope))
        return (cuo_output_p, activation['shape'])
