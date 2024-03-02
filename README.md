# sysinfo.sh
This script collects server performance metrics such as CPU usage, memory usage, disk usage, incoming traffic, and outgoing traffic. It then appends these metrics along with the current datetime to a CSV file (/var/log/performance_$(date +"%Y-%m-%d").txt). If the file is empty, it adds a header line to it.
