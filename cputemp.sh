#! /bin/bash

date > cputemp_1.temp
sensors | grep CPU > cputemp_2.temp

paste cputemp_1.temp cputemp_2.temp >> cputemp.log
rm cputemp_*.temp


