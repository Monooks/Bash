#!/bin/bash
avg_file_size () {
  path=$1
  if [[ -d $path ]]; then
    echo "Nice!"
  else
    echo "No way!"
  fi
  for file in $path/*; do
    if [[ -f $file ]]; then
      z=$(stat -c "%s" $file)
      a=$(($a + $z))
      b=$(($b + 1))
    fi
  done
  c=$((a/b))
  echo "Average size of ($b) files in directory ($path/) is ($c) bytes!"
}
avg_file_size $1
