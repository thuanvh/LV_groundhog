#!/bin/bash

export PYTHONPATH=../..:/usr/lib/python2.7
export THEANO_FLAGS='device=gpu,floatX=float32'
export PATH=/usr/local/cuda-8.0/bin:$PATH 

python rolling_dicts.py --proto prototype_lv_state --state en-fr.state.py

python train.py --proto prototype_lv_state --state en-fr.state.py

