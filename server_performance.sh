#!/bin/bash
# getting servers performance

#getDateTime
datetime=$(date +"%Y-%m-%d %H:%M:%S")
cpu=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
mem=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
disk=$(df -h / | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $5}' | cut -d'%' -f1)
in_traffic=$(sudo ifconfig eth0 | awk '/RX packets/{print $5}')
out_traffic=$(sudo ifconfig eth0 | awk '/TX packets/{print $5}')
# Function to convert bytes to human-readable format
format_bytes() {
    bytes=$1
    if [ $bytes -ge 1099511627776 ]; then
        echo "$(echo "scale=2; $bytes / 1099511627776" | bc) TB"
    elif [ $bytes -ge 1073741824 ]; then
        echo "$(echo "scale=2; $bytes / 1073741824" | bc) GB"
    elif [ $bytes -ge 1048576 ]; then
        echo "$(echo "scale=2; $bytes / 1048576" | bc) MB"
    elif [ $bytes -ge 1024 ]; then
        echo "$(echo "scale=2; $bytes / 1024" | bc) KB"
    else
        echo "${bytes}B"
    fi
}

# Formatting traffic data
in_traffic_formatted=$(format_bytes $in_traffic)
out_traffic_formatted=$(format_bytes $out_traffic)
# Adding header if the file is empty
if [ ! -s performance_data.txt ]; then
    echo "datetime,cpu,mem,disk,in_traffic_formatted,out_traffic_formatted" > /var/log/performance_$(date +"%Y-%m-%d").txt
fi

echo "$datetime,$cpu,$mem,$disk,$in_traffic_formatted,$out_traffic_formatted" >> /var/log/performance_$(date +"%Y-%m-%d").txt

# Displaying tabular result
cat  /var/log/performance_$(date +"%Y-%m-%d").txt | column -s, -t
