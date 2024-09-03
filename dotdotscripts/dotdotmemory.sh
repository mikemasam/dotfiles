#!/usr/bin/env bash
# Function to check memory usage and send a notification
function check_memory_usage() {
  # Get the total and used memory in kilobytes
  total_mem=$(free -m | awk '/Mem:/ {print $2}')
  used_mem=$(free -m | awk '/Mem:/ {print $3}')

  # Calculate the percentage of used memory
  used_percent=$(awk -v total="$total_mem" -v used="$used_mem" 'BEGIN {printf "%d", int(used/total*100)}')


  echo $used_percent
  # Check if memory usage is above 90%
  if [[ $used_percent -gt 90 ]]; then
    # Send a notification (replace with your preferred notification method)
    notify-send "Memory Usage High" "Memory usage is currently $used_percent%"
  fi
}

sleepTime=30
# Check memory usage every 5 minutes
while true; do
  check_memory_usage
  sleep $sleepTime
done

exit 0

