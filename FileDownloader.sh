#!/usr/bin/env bash
url='https://filesamples.com/samples/code/json/sample1.json'
filename='posts.json'
if [ -f "$filename" ]; then rm -f $filename; fi
curl -s --retry 3 -o $filename $url
if [ -f "$filename" ]; then
    echo "Download successful! Size: $(du -h $filename | awk '{print $1}')"
else
    echo "Download failed!"
fi
