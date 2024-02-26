#!/bin/bash

# Set the working directory to the directory containing the script
working_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Specify the folder containing the zip files
source_folder="$working_dir"

# Specify the destination path for extraction
destination_path="/var/www/html/extensions"

# Check if the destination directory exists, create it if it doesn't
mkdir -p "$destination_path"

# Loop through each tar.gz file in the source folder
for tar_gz_file in "$source_folder"/*.tar.gz; do
    if [ -f "$tar_gz_file" ]; then
        # Extract the tar.gz file to the destination path
        tar -xzf "$tar_gz_file" -C "$destination_path"
        echo "Extracted $tar_gz_file to $destination_path"
    fi
done
