#!/usr/bin/env bash
filename=app.log
status=("200" "200" "500" "200" "404")
if [ -f $filename ]; then rm -f $filename; fi
for i in {1..5}; do
    echo "[$(date +%Y-%m-%d)] Request $i - Status: ${status[$i-1]}" >> $filename
done
echo "Total requests   : $(grep -c Request $filename)"
echo "Successful (200) : $(grep -c 200 $filename)"
echo "Failed (500/404) : $(grep -c -v 200 $filename)"
