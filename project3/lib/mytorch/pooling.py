from .base import Functional, c_dll
from ctypes import *

class MaxPool2d(Functional):
    """
        TODO
        Implement the MaxPool2d with C and CUDA backend.
        Note that this function runs in restricted conditions.
        Kernel is a 1d variable, unlike original MaxPool2d, which can take a tuple input.
        Stride is a 1d variable, unlike original MaxPool2d, which can take a tuple input.
        Padding options are restricted. You should instead use a proper pad operation before MaxPool2d.
        Also, under C or CUDA RunMode conditions, the array has a format below.
        Array: {
            'pointer'   : C pointer that can directly passed to c functions,
            'shape'     : python tuple of array
        }
    
        Inputs:
        - activation : An array containing input data, of shape (N, ic, h, w)
        - kernel     : A python integer of kernel size
        - stride     : A python integer of stride

        Returns an array output:
        - out: output, of shape (N, oc, oh, ow)
               Since the operation's ceil_mode is fixed to False, the expected height and width is as below
               oh = (h-k)//s + 1
               ow = (w-k)//s + 1
    """
    def c(self, activation, kernel, stride):
        n, c, h, w = activation['shape']
        k = kernel
        oh = (h - k) // stride + 1
        ow = (w - k) // stride + 1
        
        output_p = c_dll.max_pool2d(activation['pointer'], c_int(k), c_int(n), c_int(c), \
               c_int(h), c_int(w), c_int(stride))
        
        return output_p, (n,c,oh,ow)