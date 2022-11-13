#! /bin/bash

date > topprocess_1.temp
top -b -n 1 | head -n 8 | tail -n 1 > topprocess_2.temp

paste topprocess_1.temp topprocess_2.temp >> topprocess.log
rm topprocess_*.temp


