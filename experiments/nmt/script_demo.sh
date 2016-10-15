python preprocess/preprocess.py -d vocab.en.pkl -v 30000 -b binarized_text.en.pkl -p *.en
python preprocess/preprocess.py -d vocab.fr.pkl -v 30000 -b binarized_text.fr.pkl -p *.fr
python preprocess/invert-dict.py vocab.en.pkl ivocab.en.pkl
python preprocess/invert-dict.py vocab.fr.pkl ivocab.fr.pkl
python preprocess/convert-pkl2hdf5.py binarized_text.en.pkl binarized_text.en.h5
python preprocess/convert-pkl2hdf5.py binarized_text.fr.pkl binarized_text.fr.h5
python preprocess/shuffle-hdf5.py binarized_text.en.h5 binarized_text.fr.h5 binarized_text.en.shuf.h5 binarized_text.fr.shuf.h5
export PYTHONPATH=../..:/usr/lib/python2.7
python rolling_dicts.py --proto prototype_lv_state --state en-fr.state.py
export THEANO_FLAGS='device=gpu,floatX=float32' 
python train.py --proto prototype_lv_state --state en-fr.state.py
tmux
python web-demo/sample_server.py --port=8888 --beam-search --state=web-demo/search_lv_state.pkl web-demo/search_lv_model0.npz
export PATH=/usr/local/cuda-8.0/bin:/usr/local/cuda-8.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
python utils/convert_state_local.py old/3/search_lv_state.pkl old/3/search_lv_state.final.pkl
python utils/build_final_model.py old/3/search_lv_model-1.npz old/3/search_lv_large-1.npz old/3/search_lv_model-1.final.npz
PYTHONPATH=../../..:.:/usr/lib/python2.7 python sample_server.py --port=8888 --beam-search --state=../old/3/search_lv_state.final.pkl ../old/3/search_lv_model-1.final.npz
