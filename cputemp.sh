#! /bin/bash

date > cputemp_1.temp
sensors | grep -A 4 "coretemp" | grep "Package id 0:" > cputemp_2.temp

paste cputemp_1.temp cputemp_2.temp >> cputemp.log
rm cputemp_*.temp


