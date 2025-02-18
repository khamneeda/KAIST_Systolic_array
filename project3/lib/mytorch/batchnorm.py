from .base import Functional, c_dll
from ctypes import *

class BatchNorm2d(Functional):
    """
        TODO
        Implement the BatchNorm2d with C and CUDA backend.
        Note that this function runs in restricted conditions.
        The eps value of this function is fixed to 1e-5.
        Also, under C or CUDA RunMode conditions, the array has a format below.
        Array: {
            'pointer'   : C pointer that can directly passed to c functions,
            'shape'     : python tuple of array
        }
    
        Inputs:
        - activation   : An array containing input data, of shape (N, c, h, w)
        - running_mean : An array of running mean, of shape (c,)
        - running_var  : An array of running var, of shape (c,)
        - weight       : An array of gamma, of shape (c,)
        - bias         : An array of beta, of shape (c,)

        Returns an array output:
        - out: output, of shape (N, c, h, w)
    """
    def c(self, activation, running_mean, running_var, weight, bias):
        n, c, h, w = activation['shape']
        output_p = c_dll.batch_norm(activation['pointer'], running_mean['pointer'], running_var['pointer'], \
                                 weight['pointer'], bias['pointer'], c_int(n), c_int(c), c_int(h), c_int(w))
        
        return output_p, activation['shape']