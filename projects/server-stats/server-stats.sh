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
cpu_valor=$(echo "$cpu_user" | sed 's/%//')

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
process=$(ps aux --sort=-%cpu | head -n 6 | awk 'NR == 1 { printf "%-6s %-6s %-6s %-6s %-7s %-7s %s\n", $1, $2, $3, $4, $9, $10, $11 } NR > 1 { printf " %-6s %-6s %-6s %-6s %-7s %-7s %s\n", $1, $2, $3, $4, $9, $
10, $11 }')

#
echo -e "${COLOR_BLUE}+--------------------------+${NO_COLOR}"
echo -e "${COLOR_BLUE} Server Performance Stats ${NO_COLOR}"
echo -e "${COLOR_BLUE}+--------------------------+${NO_COLOR}"
echo -e "${COLOR_BLUE} User/Group:${NO_COLOR} $user_group "
echo -e "${COLOR_BLUE}+--------------------------+${NO_COLOR}"
echo -e "${COLOR_BLUE} IP:${NO_COLOR} $ip "
echo -e "${COLOR_BLUE} Netmask:${NO_COLOR} $netmask "
echo -e "${COLOR_BLUE} Broadcast:${NO_COLOR} $broadcast "
echo -e "${COLOR_BLUE}+--------------------------+"
printf "${COLOR_BLUE} CPU: ${NO_COLOR}%.2f%%\n" "$cpu_valor"
echo -e "${COLOR_BLUE}+--------------------------+"
echo -e "${COLOR_BLUE} Memory Total:${NO_COLOR} $mem_total "
echo -e "${COLOR_BLUE} Memory User:${NO_COLOR} $mem_user "
echo -e "${COLOR_BLUE} Memory Free:${NO_COLOR} $mem_free "
echo -e "${COLOR_BLUE} Memory Free%:${NO_COLOR} $mem_free_perc "
echo -e "${COLOR_BLUE}+--------------------------+${NO_COLOR}"
echo -e "${COLOR_BLUE} Disk Size:${NO_COLOR} $disk_size "
echo -e "${COLOR_BLUE} Disk Used:${NO_COLOR} $disk_used "
echo -e "${COLOR_BLUE} Disk Avail:${NO_COLOR} $disk_avail "
echo -e "${COLOR_BLUE} Disk Use%:${NO_COLOR} $disk_use_perc% "
echo -e "${COLOR_BLUE}+--------------------------+"
echo -e "${COLOR_BLUE} Temperature:${NO_COLOR} $tempe"
echo -e "${COLOR_BLUE}+----------------------------------------------------+${NO_COLOR}"
echo -e "${COLOR_BLUE} Top 5 processes (CPU/Memory):  ${NO_COLOR}"
echo -e " $process "
echo -e "${COLOR_BLUE}+----------------------------------------------------+${NO_COLOR}"
