#!/usr/bin/env bash
function check_memory_usage() {
  total_mem=$(free -m | awk '/Mem:/ {print $2}')
  used_mem=$(free -m | awk '/Mem:/ {print $3}')
  used_percent=$(awk -v total="$total_mem" -v used="$used_mem" 'BEGIN {printf "%d", int(used/total*100)}')
  echo $used_percent
  if [[ $used_percent -gt 90 ]]; then
    notify-send "Memory Usage High" "Memory usage is currently $used_percent%"
  fi
}

sleepTime=30
while true; do
  check_memory_usage
  sleep $sleepTime
done

exit 0

