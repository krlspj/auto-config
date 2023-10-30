#!/bin/bash


python3 -m pip install --user -r ./scripts/requirements.txt

#wget https://addons.mozilla.org/en-US/firefox/addon/darkreader 
#"https://addons.mozilla.org/en-US/firefox/addon/darkreader/"
dr_link=$(python3 ./scripts/addon_get_dl.py "https://addons.mozilla.org/en-US/firefox/addon/darkreader/")
echo "DR link: $dr_link"
if [$dr_link=="NOT_FOUND"]; then
	echo "Download link for dark reader not found."
	exit 1
fi

mkdir -p tmp
cd tmp

wget $dr_link
filename=$(echo "$dr_link" | awk -F/ '{print $NF}')
echo "$filename"
firefox $filename

sleep 5s

cd ..
dr_link=$(python3 ./scripts/addon_get_dl.py "https://addons.mozilla.org/en-US/firefox/addon/adblock-plus/")
if [$dr_link=="NOT_FOUND"]; then
	echo "Download link for dark reader not found."
	exit 1
fi

mkdir -p tmp
cd tmp

wget $dr_link
filename=$(echo "$dr_link" | awk -F/ '{print $NF}')
echo "$filename"
firefox $filename

sleep 5s


