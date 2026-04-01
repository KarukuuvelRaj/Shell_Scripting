#!/usr/bin/env bash
filename="health_report.txt"
echo "Today's Date & Time: $(date "+%d-%m-%Y %H:%M:%S")" > $filename
echo "Server Name: $(hostname)" >> $filename
echo "Server Running Time: $(uptime -p)" >> $filename
echo "CPU Cores: $(nproc)" >> $filename
Memory=$(free | awk 'NR==2 {print $3/$2*100}')
echo "Memory usage: $Memory" >> $filename
Disk=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
echo "Disk usage: $Disk" >> $filename
checkalert(){
        local memory=$1
        local disk=$2
        if (( $(echo "$memory > 50" | bc -l) )) || [[ $disk -gt 50 ]]
then
        echo "Report needs urgent attention"
else
        echo "All systems are normal"
fi
}
checkalert $Memory $Disk
