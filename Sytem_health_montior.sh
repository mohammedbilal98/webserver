#!/bin/bash

DISK_THRESHOLD=80
CPU_THRESHOLD=80
PROCESS_THRESHOLD=80
MEMORY_THRESHOLD=80


disk_check() {
     disk_usage=$(df -h / | awk '/\// {print $(NF-1)}' | sed 's/%//')
    if (( $disk_usage > $DISK_THRESHOLD )); then
        echo "$(date +"%Y-%m-%d %H:%M:%S") - High disk usage: $disk_usage%" | tee -a /home/ubuntu/system_health_monitor.log
    fi
}


cpu_check() {
     cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
        echo "$(date +"%Y-%m-%d %H:%M:%S") - High CPU usage: $cpu_usage%" | tee -a /home/ubuntu/system_health_monitor.log
    fi

}


process_check() {
     process_count=$(ps aux | wc -l)
    if (( $process_count > $PROCESS_THRESHOLD )); then
        echo "$(date +"%Y-%m-%d %H:%M:%S") - High number of processes: $process_count" | tee -a /home/ubuntu/system_health_monitor.log
    fi
}

memory_check() {
     memory_usage=$(free | grep Mem| awk '{printf("%.2f"), $3/$2*100}')
    if (( $(echo "$memory_usage > $MEMORY_THRESHOLD" | bc -l) )); then
        echo "$(date +"%Y-%m-%d %H:%M:%S") - High memory usage: $memory_usage%" | tee -a /home/ubuntu/system_health_monitor.log
    fi
}



main() {
    while true; do
        disk_check
        cpu_check
        process_check
        memory_check
        sleep 180
    done
}

main