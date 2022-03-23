#!/bin/bash

# Logs important information about system usage

CARBON_HOST="inspiron.local"
CARBON_PORT="2003"

# Memory
available=$(cat /proc/meminfo | grep "Available" | awk '{print $2}')
buffered=$(cat /proc/meminfo | grep "Buffers" | awk '{print $2}')
cached=$(cat /proc/meminfo | grep "^Cached:" | awk '{print $2}')

UPTIME=$(awk '{print $1}' /proc/uptime)

# CPU
cpuinfo=$(top -bn2 | grep "Cpu" | sed 1d )
user=$(echo $cpuinfo | awk '{print $2}')
system=$(echo $cpuinfo | awk '{print $4}')
user_nice=$(echo $cpuinfo | awk '{print $6}')
idle=$(echo $cpuinfo | awk '{print $8}')
iowait=$(echo $cpuinfo | awk '{print $10}')

# DISK

root_percet=$(df | grep '/$' | awk '{print $5}' | sed 's/%//')

# NETWORK


TIME=$(date +%s)

echo "argentina.memory.available" ${available} ${TIME} | nc ${CARBON_HOST} ${CARBON_PORT}
echo "argentina.memory.buffered" ${buffered} ${TIME} | nc ${CARBON_HOST} ${CARBON_PORT}
echo "argentina.memory.cached" ${cached} ${TIME} | nc ${CARBON_HOST} ${CARBON_PORT}
echo "argentina.cpu.user" ${user} ${TIME} | nc ${CARBON_HOST} ${CARBON_PORT}
echo "argentina.cpu.system" ${system} ${TIME} | nc ${CARBON_HOST} ${CARBON_PORT}
echo "argentina.cpu.nice" ${user_nice} ${TIME} | nc ${CARBON_HOST} ${CARBON_PORT}
echo "argentina.cpu.idle" ${idle} ${TIME} | nc ${CARBON_HOST} ${CARBON_PORT}
echo "argentina.cpu.iowait" ${iowait} ${TIME} | nc ${CARBON_HOST} ${CARBON_PORT}
echo "argentina.uptime" ${UPTIME} ${TIME} | nc ${CARBON_HOST} ${CARBON_PORT}
echo "argentina.disk.root" ${root_percet} ${TIME} | nc ${CARBON_HOST} ${CARBON_PORT}
echo "argentina.disk.home" ${home_percet} ${TIME} | nc ${CARBON_HOST} ${CARBON_PORT}

echo "Successful Usage upload: CPU active: ${user}. Free RAM: ${available} kB. Uptime ${UPTIME}"
