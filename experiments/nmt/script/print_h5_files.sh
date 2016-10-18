#!/bin/bash
END=81
for i in $(seq 0 $END); do
  num_list="$i;$num_list"
done

array=( $(echo $num_list | sed -r 's/(.[^;]*;)/ \1 /g' | tr " " "\n" | shuf | tr -d " " ) )
#for i in $(seq 0 $END) do
for i in "${array[@]}"; do
  val="${i/;/}"  
  #echo $val
done

PWD=$(pwd)

for i in "${array[@]}"; do
  val="${i/;/}"
  echo \"$PWD/data/shuf/binarized_text.en.$val.shuf.h5\",
done
echo "END EN"

for i in "${array[@]}"; do
  val="${i/;/}"
  echo \"$PWD/data/shuf/binarized_text.fr.$val.shuf.h5\",
done
echo "END FR"
