#!/usr/bin/env bash
diskcleanup(){
        usage="$(df / | awk 'NR==2{print $5}' | tr -d '%')"
if [[ $usage -gt 50 ]]
then
        count=$(find /var/log/myapp -type f -name "*.log" | wc -l)
        sudo find /var/log/myapp -type f -name "*.log" -delete
        echo "Number of log files deleted: $count"
        echo "Disk usage after cleanup: $(df / | awk 'NR==2{print $5}' | tr -d '%')"
else
        echo "Everything is normal"
fi
}
diskcleanup
