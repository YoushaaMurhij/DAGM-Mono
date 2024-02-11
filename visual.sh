#!/bin/bash
cd vis

for file in $(pwd)/../outputs/res/*
do
  echo $file
  # Extract the file name without extension
  filename=$(basename -- "$file")
  echo $filename
  filename="${filename%.*}"
  echo $filename
  # Run the python command with the file name as argument
  python3 vis_apollo.py --output ../outputs --file "$filename" --save vis_results
done
cd ..
