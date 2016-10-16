#!/bin/bash

export PYTHONPATH=../..:/usr/lib/python2.7
export THEANO_FLAGS='device=gpu,floatX=float32'
export PATH=/usr/local/cuda-8.0/bin:$PATH 

python utils/convert_state_local.py old/3/search_lv_state.pkl old/3/search_lv_state.final.pkl
python utils/build_final_model.py old/3/search_lv_model-1.npz old/3/search_lv_large-1.npz old/3/search_lv_model-1.final.npz

