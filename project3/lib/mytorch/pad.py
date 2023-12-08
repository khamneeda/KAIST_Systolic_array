from .base import Functional, c_dll
from ctypes import *

class Pad(Functional):
    """
        TODO
        Implement the Pad with C and CUDA backend.
        Note that this function runs in restricted conditions.
        For example, the tuple size of pad is fixed to 4, unlike original pad, which can take a variable sized tuple input.
        Also, under C or CUDA RunMode conditions, the array has a format below.
        Array: {
            'pointer'   : C pointer that can directly passed to c functions,
            'shape'     : python tuple of array
        }
    
        Inputs:
        - activation : An array containing input data, of shape (N, c, h, w)
        - pad        : A python tuple consisted of (left, right, top, bottom)
        - value      : A python float value to be filled
        
        Returns an array output:
        - out: output, of shape (N, oc, oh, ow)
               the expected height and width is at below
               oh = h+top+bottom
               ow = w+left+right
    """
    def c(self, activation, pad, value):
        n, c, h, w = activation['shape']
        lpad, rpad, tpad, bpad = pad

        output_p = c_dll.pad(activation['pointer'], c_int(n), c_int(c), c_int(h), c_int(w), \
                          c_int(lpad), c_int(rpad), c_int(tpad), c_int(bpad), c_float(value))
        
        return output_p, (n, c, h+tpad+bpad, w+lpad+rpad)