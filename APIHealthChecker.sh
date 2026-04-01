#!/usr/bin/env bash
urls=("https://httpbin.org/status/200" "https://httpbin.org/status/500"
      "https://httpbin.org/status/400" "https://httpbin.org/status/100")
for url in "${urls[@]}"; do
    status=$(curl -s -o /dev/null -w "%{http_code}" $url) || true
    if [ "$status" -eq 200 ]; then
        echo "UP   — Status: $status — $url"
    else
        echo "DOWN — Status: $status — $url"
    fi
done
