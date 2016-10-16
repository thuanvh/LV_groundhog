#!/bin/bash

export THEANO_FLAGS='device=gpu,floatX=float32,on_unused_input=warn'
export PATH=/usr/local/cuda-8.0/bin:$PATH 
export PYTHONPATH=../../..:.:/usr/lib/python2.7 

python sample_server.py --port=8888 --beam-search \
  --state=../old/3/search_lv_state.final.pkl \
  ../old/3/search_lv_model-1.final.npz

