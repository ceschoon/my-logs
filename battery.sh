#! /bin/bash

date > battery_1.temp
cat /sys/class/power_supply/BAT0/energy_full > battery_2.temp
cat /sys/class/power_supply/BAT0/capacity > battery_3.temp

paste battery_1.temp battery_2.temp battery_3.temp >> battery.log
rm battery_*.temp


