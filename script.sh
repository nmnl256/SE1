#!/bin/bash

input_dir="$1"
output_dir="$2"

find "$input_dir" -type f | while read -r file; do
    filename=$(basename "$file")
    echo $filename

    if [ -e "$output_dir/$filename" ]; then
        counter=0
        base="${filename%.*}"
        extension="${filename##*.}"
        
        new_filename="${base}_${counter}.${extension}"
        while [ -e "$output_dir/$new_filename" ]; do
            counter=$((counter + 1))
            new_filename="${base}_${counter}.${extension}"
        done
	
        filename=$new_filename
    fi

    cp "$file" "$output_dir/$filename"
done

