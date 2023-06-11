#! /bin/bash

date > gputemp_1.temp
nvidia-settings -c TV-0 -q [gpu:0]/GPUCoreTemp | grep "Attribute" | awk '{print $4}' > gputemp_2.temp

paste gputemp_1.temp gputemp_2.temp >> gputemp.log
rm gputemp_*.temp


