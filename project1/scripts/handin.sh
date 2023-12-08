#!/bin/bash
cd $(dirname ${BASH_SOURCE[0]})/..

./scripts/log.sh

tar -zcvf 4.tar.gz ./lib/model.py ./lib/mytorch/{activation,batchnorm,conv,pad,pooling}.py src Makefile log
