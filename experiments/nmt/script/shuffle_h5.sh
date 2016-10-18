#!/bin/bash
END=81
mkdir data/shuf
for i in $(seq 0 $END); do
  echo "Shuffle file $i"
  python preprocess/shuffle-hdf5.py \
    data/h5/binarized_text.en.pkl-$i.h5 \
    data/h5/binarized_text.fr.pkl-$i.h5 \
    data/shuf/binarized_text.en.$i.shuf.h5 \
    data/shuf/binarized_text.fr.$i.shuf.h5
done
