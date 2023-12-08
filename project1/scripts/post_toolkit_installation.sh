#!/bin/bash

# nvcc related paths
CUDA="cuda-11.6"

echo "export PATH=\"/usr/local/$CUDA/bin:$PATH\"" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=\"/usr/local/$CUDA/lib64:$LD_LIBRARY_PATH\"" >> ~/.bashrc
