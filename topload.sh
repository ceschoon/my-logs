#! /bin/bash

date > topload_1.temp
top -b -n 1 | head -n 1 > topload_2.temp

paste topload_1.temp topload_2.temp >> topload.log
rm topload_*.temp


