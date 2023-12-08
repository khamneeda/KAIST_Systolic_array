from .mytorch import functional as F
import numpy as np

def gen_func(activation, weight):
    eps = 0.000001
    m = (2 ** 13) - 1

    origin_kernel, origin_bias = weight["conv"]["kernel"], weight["conv"]["bias"]
    
    # >>>>>>>>>>>>>>>>>>>> STEP2 >>>>>>>>>>>>>>>>>>>>
    # implement q and dq based on document
    activation_max = np.max(np.abs(activation))
    weight_max = np.max(np.abs(origin_kernel))
    bias_max = np.max(np.abs(origin_bias)) if origin_bias is not None else 0
    
    d = max(activation_max, weight_max, bias_max)
    
    if d == 0:
        d = eps
    
    q = lambda x : np.int16(np.clip(x / d * m, -m, m)) if x is not None else None
    dq = lambda x : (np.float32(x) * ((d / m) ** 2))
    
    # <<<<<<<<<<<<<<<<<<<< STEP2 <<<<<<<<<<<<<<<<<<<<
    
    qw = dict()
    qw['kernel'] = q(origin_kernel)
    qw['bias'] = q(origin_bias)
    
    return q, dq, qw

def YOLOv2(activation, weight):        
    for i in range(8):
        activation = F.pad(activation, (1, 1, 1, 1), 0)
        q, dq, qw = gen_func(activation, weight[i]) 
        activation = F.conv2d(q(activation), **qw, stride=1)
        activation = F.batch_norm(dq(activation), **weight[i]['bn'])
        
        if i < 5:
            activation = F.max_pool2d(activation, 2, 2)
        elif i == 5:
            activation = F.pad(activation, (0, 1, 0, 1), -float('inf'))
            activation = F.max_pool2d(activation, 2, 1)
        activation = F.leaky_relu(activation, 0.1)

    q, dq, qw = gen_func(activation, weight[8])
    activation = F.conv2d(q(activation), **qw, stride=1)
    return dq(activation)