#!/bin/bash

input_dir="$1"
output_dir="$2"

find "$input_dir" | while read -r file; do
    name=$(basename "$file")
    echo $name

    if [ -e "$output_dir/$name" ]; then
        base="${name%.*}"
        extension="${name##*.}"
        
        new_filename="${base}_${counter}.${extension}"
        while [ -e "$output_dir/$new_name" ]; do
            counter=$((counter + 1))
            new_name="${base}_${counter}.${extension}"
        done
	
        name=$new_name
    fi

    cp "$file" "$output_dir/$name"
done
