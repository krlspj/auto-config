#!/bin/bash

#repo_date="2023/08/05"
#repo_date=$(./process_repo_date.sh "2023/08/05")

echo "Update repositories date to: $1"

#file="mirrorlist"
file="/etc/pacman.d/mirrorlist"
new_line="Server=https://archive.archlinux.org/repos/$1/\$repo/os/\$arch"

# Check if the file exists
if [ -f "$file" ]; then
    # Create a temporary file
    tmpfile=$(mktemp)

    # Loop through the original file
    while IFS= read -r line; do
        # Check if the line is not empty and does not start with '#'
        if [[ -n "${line// }" && "${line:0:1}" != "#" ]]; then
            # Comment out the line and append it to the temporary file
            echo "#$line" >> "$tmpfile"
        else
            # If the line is already commented or empty, just append it to the temporary file
            echo "$line" >> "$tmpfile"
        fi
    done < "$file"

    # Add the new line at the end of the file
    echo "$new_line" >> "$tmpfile"

    # Replace the original file with the temporary file
    sudo mv "$tmpfile" "$file"
    #mv "$tmpfile" "$file"

    echo "File '$file' has been updated."
else
    echo "File '$file' does not exist."
fi

echo "End updating repositories"
