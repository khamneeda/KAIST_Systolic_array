#!/bin/bash

# driver related configurations
echo "ServerAddress=172.10.4.251
ServerPort=7070
FeatureType=2" > /etc/nvidia/gridd.conf

systemctl restart nvidia-gridd

# run nvidia-smi to validate installations.
