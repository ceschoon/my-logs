#! /bin/bash

export DISPLAY=:0.0

date > mouse_1.temp
xdotool getmouselocation | head -n 1 > mouse_2.temp

paste mouse_1.temp mouse_2.temp >> mouse.log
rm mouse_*.temp


