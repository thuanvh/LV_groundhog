#!/bin/bash
for filename in data/*.pkl; do
  echo "$filename"
  name=${filename##*/}
  base=${name%.pkl}
  python preprocess/convert-pkl2hdf5.py $filename "data/h5/$base.h5"
done
