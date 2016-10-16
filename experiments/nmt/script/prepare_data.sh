#!/bin/bash
python preprocess/preprocess.py -d vocab.en.pkl -v 30000 -b binarized_text.en.pkl -p *.en
python preprocess/preprocess.py -d vocab.fr.pkl -v 30000 -b binarized_text.fr.pkl -p *.fr
python preprocess/invert-dict.py vocab.en.pkl ivocab.en.pkl
python preprocess/invert-dict.py vocab.fr.pkl ivocab.fr.pkl
python preprocess/convert-pkl2hdf5.py binarized_text.en.pkl binarized_text.en.h5
python preprocess/convert-pkl2hdf5.py binarized_text.fr.pkl binarized_text.fr.h5
python preprocess/shuffle-hdf5.py binarized_text.en.h5 binarized_text.fr.h5 binarized_text.en.shuf.h5 binarized_text.fr.shuf.h5

export PYTHONPATH=../..:/usr/lib/python2.7
export THEANO_FLAGS='device=gpu,floatX=float32' 
export PATH=/usr/local/cuda-8.0/bin:$PATH
