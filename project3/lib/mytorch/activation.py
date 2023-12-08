from .base import Functional, c_dll
import numpy as np
from ctypes import *

class LeakyReLU(Functional):
    """
        TODO
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
    def c(self, activation, negative_slope):
        size = np.prod(activation['shape'])
        output_p = c_dll.leaky_relu(activation['pointer'], c_int(size), c_float(negative_slope))

        return output_p, activation['shape']