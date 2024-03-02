# Server Performance Metrics Script

This script collects various performance metrics of a server and saves them to a CSV file. It formats incoming and outgoing traffic data into human-readable format (KB, MB, GB, TB).

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/server-performance-metrics.git
1. Change directory to the script folder:
   
  ```bash
  cd server-performance-metrics
  ````
2. Run the script:
  ```bash
  ./server_performance.sh
  ````

3. View the performance data:
  ```bash
  cat /var/log/performance_$(date +"%Y-%m-%d").txt | column -s, -t
  ```
## Author 

<div>
    <a href="https://github.com/aliraza170"><img src="https://avatars.githubusercontent.com/u/18546274?v=4" width="40" /></a>
</div>

## If you liked it then 

<a href="https://www.buymeacoffee.com/razadubai" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>
