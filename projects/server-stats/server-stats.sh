#!/usr/bin/env bash

# author: nfoj_@hotmail.com
# description: script for connection check
# system: arch linux

#!--------------------------------------!#

# Color

# Style           |   # Colors       | # background
# 00: none        |   # 30: black    | # 40: black
# 01: Bold        |   # 31: red      | # 41: red
# 03: Italic      |   # 32: green    | # 42: green
# 04: Underlined  |   # 33: yellow   | # 43: yellow
# 05: Blinking    |   # 34: blue     | # 44: blue
# 07: Reverse     |   # 35: magenta  | # 45: magenta
# 08: Hidden      |   # 36: cyan     | # 46: cyan
#                 |   # 37: white    | # 47: white

# Note:
# '\033[Style;Color;Backgroundm'
# STYLE_COLOR_BACKGROUND='\033[00;00;00m'

COLOR_BLUE='\033[1;34m'
COLOR_RED='\033[1;31m'
COLOR_GREEN='\033[1;32m'
NO_COLOR='\033[0m'

#!--------------------------------------!#

# install net-tool

# user + group
user_group=$(id -un)

# Ip
ip=$(ifconfig eth0 | grep 'inet ' | awk '{print $2}')

# Netmask
netmask=$(ifconfig eth0 | grep 'inet ' | awk '{print $4}')

# broadcast
broadcast=$(ifconfig eth0 | grep 'inet ' | awk '{print $6}')

# cpu - user
cpu_user=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')

# disk - size
disk_size=$(df -h | grep '^/dev/sd*' | awk '{ print $2 }' | cut -d'%' -f1)

# disk - used
disk_used=$(df -h | grep '^/dev/sd*' | awk '{ print $3 }' | cut -d'%' -f1)

# disk - avail
disk_avail=$(df -h | grep '^/dev/sd*' | awk '{ print $4 }' | cut -d'%' -f1)

# disk - use%
disk_use_perc=$(df -h | grep '^/dev/sd*' | awk '{ print $5 }' | cut -d'%' -f1)

# memory total
mem_total=$(free -h | grep 'Mem:' | awk '{print $2}')

# memory user
mem_user=$(free -h | grep 'Mem:' | awk '{print $3}')

# memory free + memory free %
mem_free=$(free -h | grep 'Mem:' | awk '{print $4}')
mem_free_perc=$(free -h | grep 'Mem:' | awk '{printf "%.2f%%\n", ($4/$2)*100}')

# temperature
tempe=$(cat /sys/class/thermal/thermal_zone*/temp 2>/dev/null | awk '{printf "%.1f°C\n", $1/1000}')

# process
process=$(ps aux --sort=-%cpu | head -n 6 | awk 'NR == 1 { printf "%-10s %-6s %-5s %-5s %-20s %s\n", $1, $2, $3, $4, $9, $10 } NR > 1 { printf " %-9s %-6s %-5s %-5s %-20s %s\n", $1, $2, $3, $4, $9, $10 }')

echo "+------------------------+"
echo " Server Performance Stats "
echo "+------------------------+"
echo " User/Group: $user_group "
echo "+------------------------+"
echo " IP: $ip "
echo " Netmask: $netmask "
echo " Broadcast: $broadcast "
echo "+------------------------+"
echo " CPU: $cpu_user "
echo "+------------------------+"
echo " Disk Size: $disk_size "
echo " Disk Used: $disk_used "
echo " Disk Avail: $disk_avail "
echo " Disk Use%: $disk_use_perc "
echo "+------------------------+"
echo " $process "

