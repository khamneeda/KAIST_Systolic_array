from .base import Functional, c_dll, cu_dll, cuo_dll
import torch
from ctypes import *

class Conv2d(Functional):
    """
        Implement the Conv2d with C and CUDA backend.
        Note that this function runs in restricted conditions.
        Stride is a 1d variable, unlike original Conv2d, which can take a tuple input.
        Padding options are restricted. You should instead use a proper pad operation before conv2d.
        Also, under C or CUDA RunMode conditions, the array has a format below.
        Array: {
            'pointer'   : C pointer that can directly passed to c functions,
            'shape'     : python tuple of array
        }
    
        Inputs:
        - activation : An array containing input data, of shape (N, ic, h, w)
        - weight     : An array of weights, of shape (oc, ic, kh, kw)
        - bias       : None value, or an array of biases, of shape (oc)
        - stride     : A python integer of convolution stride

        Returns an array output:
        - out: output, of shape (N, oc, oh, ow)
               the expected height and width is at below
               oh = (h-kh)//s + 1
               ow = (w-kw)//s + 1
    """
    def torch(self, activation, weight, bias, stride):
        return torch.nn.functional.conv2d(activation, weight, bias=bias, stride=stride, padding='valid')

    def c(self, activation, weight, bias, stride):
        # TODO
        c_activation_shape = (c_int * 4)(*activation['shape'])
        c_weight_shape = (c_int * 4)(*weight['shape'])
        c_output_p = c_dll.conv2d(activation['pointer'], c_activation_shape, weight['pointer'], c_weight_shape, None if bias is None else bias['pointer'], c_int(stride))
        n = activation['shape'][0]
        oc = weight['shape'][0]
        oh = (activation['shape'][2] - weight['shape'][2]) // stride + 1
        ow = (activation['shape'][3] - weight['shape'][3]) // stride + 1
        c_output_shape = (n, oc, oh, ow)
        return (c_output_p, c_output_shape)
        

    def cuda(self, activation, weight, bias, stride):
        # TODO
        c_activation_shape = (c_int * 4)(*activation['shape'])
        c_weight_shape = (c_int * 4)(*weight['shape'])
        cu_output_p = cu_dll.conv2d(activation['pointer'], c_activation_shape, weight['pointer'], c_weight_shape, None if bias is None else bias['pointer'], c_int(stride))
        n = activation['shape'][0]
        oc = weight['shape'][0]
        oh = (activation['shape'][2] - weight['shape'][2]) // stride + 1
        ow = (activation['shape'][3] - weight['shape'][3]) // stride + 1
        cu_output_shape = (n, oc, oh, ow)
        return (cu_output_p, cu_output_shape)
    
    def cuda_optimized(self, activation, weight, bias, stride):
        c_activation_shape = (c_int * 4)(*activation['shape'])
        c_weight_shape = (c_int * 4)(*weight['shape'])
        cuo_output_p = cuo_dll.conv2d(activation['pointer'], c_activation_shape, weight['pointer'], c_weight_shape, None if bias is None else bias['pointer'], c_int(stride))
        n = activation['shape'][0]
        oc = weight['shape'][0]
        oh = (activation['shape'][2] - weight['shape'][2]) // stride + 1
        ow = (activation['shape'][3] - weight['shape'][3]) // stride + 1
        cuo_output_shape = (n, oc, oh, ow)
        return (cuo_output_p, cuo_output_shape)