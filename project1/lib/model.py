from .mytorch import functional as F

stride_conv = 1  # stride of convolutional layer
kernel_maxpool = 2  # kernel size of max pooling layer

# hyperparameter of leaky relu layer
leaky_relu_slope = 0.1

# hyperparameter of padding layer
padding_value = 0  # padding value of padding layer


def YOLOv2(activation, weight):
    """
    TODO
    Implement yolo network using given mytorch function and weights.

    activation: An array containing input data, of shape (N, C, H, W)
    weight: An array containing per layer weights.
    The parsed weight structure is given below.
    weight = [{
        'conv': {
            'kernel'    : np.ndarray
            'bias'      : None if there is no bias else np.ndarray
        },
        'bn': {
            'mean'      : np.ndarray
            'var'       : np.ndarray
            'gamma'     : np.ndarray
            'beta'      : np.ndarray
        }
    }, ...]

    Note that at last layer, there is no batch normalization layer.
    Also, to implement the conv2d returning the same size as the input, you should pad before applying convolution network.

    For specific layer configuration, refer to `./references/yolov2-tiniy-voc.cfg` or `./references/yolo2-tiniy-voc.onnx`.
    """
    (batch, input_channel, input_height,
     input_width) = activation.shape  # input shape
    for i, layer_weight in enumerate(weight):
        conv_params = layer_weight['conv']
        bn_params = layer_weight.get('bn', None)  # Check if 'bn' key exists

        (kernel_output_channel, kernel_input_channel, kernel_height,
         kernel_width) = conv_params['kernel'].shape

        # check if input channel is same as kernel input channel
        assert (kernel_input_channel == input_channel)

        (
            padding_left,
            padding_right,
            padding_top,
            padding_bottom,
            padded_height,
            padded_width
        ) = (1, 1, 1, 1, input_height+2, input_width+2) if i != 8 else (0, 0, 0, 0, input_height, input_width)
        (conv_channel, conv_height, conv_width) = (kernel_output_channel, (padded_height -
                                                                           kernel_height)//stride_conv + 1, (padded_width-kernel_width)//stride_conv + 1)
        # Run a padding layer if pad is (0,0,0,0)
        activation = F.pad(
            input=activation,
            pad=(padding_left, padding_right,
                 padding_top, padding_bottom),
            value=padding_value
        ) if (padding_left, padding_right, padding_top, padding_bottom) != (0, 0, 0, 0) else activation

        # Run a convolutional layer
        activation = F.conv2d(
            activation=activation,
            kernel=conv_params['kernel'],
            bias=conv_params['bias'],
            stride=stride_conv
        )

        # Run a batch normalization layer
        activation = F.batch_norm(
            activation=activation,
            mean=bn_params['mean'],
            var=bn_params['var'],
            gamma=bn_params['gamma'],
            beta=bn_params['beta']
        ) if bn_params is not None else activation

        # Run a leaky relu layer
        activation = F.leaky_relu(
            activation=activation.reshape(batch*conv_channel, conv_height*conv_width),
            negative_slope=leaky_relu_slope
        ).reshape(batch, conv_channel, conv_height, conv_width) if bn_params is not None else activation

        stride_maxpool = 2 if i != 5 else 1
        (
            padding_left,
            padding_right,
            padding_top,
            padding_bottom,
            padded_height,
            padded_width
        ) = (0, 0, 0, 0, conv_height, conv_width) if i != 5 else (0, 1, 0, 1, conv_height+1, conv_width+1)

        # Run a padding layer(if pad is (0,0,0,0), return activation)
        activation = F.pad(
            input=activation,
            pad=(padding_left, padding_right, padding_top, padding_bottom),
            value=padding_value
        ) if (padding_left, padding_right, padding_top, padding_bottom) != (0, 0, 0, 0) and i <= 5 else activation

        # Run a max pooling layer
        activation = F.max_pool2d(
            activation=activation,
            kernel=kernel_maxpool,
            stride=stride_maxpool
        ) if (i <= 5) else activation
        if (i <= 5):
            (max_pool_height, max_pool_width) = ((padded_height -
                                                  kernel_maxpool)//stride_maxpool + 1, (padded_width-kernel_maxpool)//stride_maxpool + 1)
            (input_channel, input_height,
             input_width) = (conv_channel, max_pool_height, max_pool_width)
        else:
            (input_channel, input_height,
             input_width) = (conv_channel, conv_height, conv_width)

    return activation
