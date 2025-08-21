#!/bin/bash
CPU_THRESHOLD=80
MEMORY_THRESHOLD=90
get_cpu_usage() {
   
    idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
    cpu_usage=$(echo "100 - $idle" | bc)
    echo "$cpu_usage"
}
get_memory_usage() {
   
    mem=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
    echo "$mem"
}

send_alert() {
    message="$1"
    echo "[ALERT] $message"
}

while true; do
    cpu_usage=$(get_cpu_usage)
    memory_usage=$(get_memory_usage)

    if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
        send_alert "High CPU Usage: ${cpu_usage}%"
    fi

    if (( $(echo "$memory_usage > $MEMORY_THRESHOLD" | bc -l) )); then
        send_alert "High Memory Usage: ${memory_usage}%"
    fi
    sleep 60
done
