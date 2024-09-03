#!/usr/bin/env bash
#notify-send 'CustomScripts' 'Custom scripts started.'
script_dir=$(dirname "$0")
scripts_to_execute=("dotdotbattery.sh" "dotdotmemory.sh")
combined_scripts_message=$(IFS=' ' && echo "${scripts_to_execute[*]}")


function kill_running_process() {
  process_name="$1"
  if ps -ef | grep -v grep | grep "$process_name" > /dev/null; then
    kill $(ps -ef | grep -v grep | grep "$process_name" | awk '{print $2}')
    echo "Process $process_name killed."
  fi
}

for script in "${scripts_to_execute[@]}"; do
    process_name=$(basename "$script")  # Extract script name without path
    kill_running_process "$process_name"
    "$script_dir/$script" &
done

# Function to perform cleanup actions
function cleanup() {
  echo "Script is exiting. Performing cleanup..."
  for script in "${scripts_to_execute[@]}"; do
      process_name=$(basename "$script")  # Extract script name without path
      kill_running_process "$process_name"
  done
  # Your cleanup actions here
}

# Register the cleanup function to be executed on exit
trap cleanup EXIT

notify-send 'CustomScripts' "Custom scripts started. $combined_scripts_message"
wait

