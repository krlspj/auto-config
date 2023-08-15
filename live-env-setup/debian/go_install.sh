#!/bin/bash

link=$(python3 ./scripts/get_golang_dl.py "https://go.dev/dl/")
echo "get download link: $link"
filename=$(echo "$link" | awk -F/ '{print $NF}')
echo "get filename: $filename"

wget $link

echo "installing new version"
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf $filename


echo "remove trash"
rm $filename


# Directory to check
target_directory="/usr/local/go/bin"

# Check if the target directory is in the PATH
if echo "$PATH" | tr ':' '\n' | grep -q "$target_directory"; then
    echo "Directory $target_directory is in the PATH."
else
    echo "Directory $target_directory is not in the PATH."
	./scripts/save_to_fileRC.sh "# golang"
	./scripts/save_to_fileRC.sh "export PATH=\"\$PATH:/usr/local/go/bin\""
fi
