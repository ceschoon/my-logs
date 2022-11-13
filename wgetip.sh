#! /bin/bash

logfile="wgetip.log"

date > wgetip_1.temp

rm en
wget https://www.what-is-my-ipv4.com/en
cat en | grep "<strong class='ip'>" > wgetip_2.temp
rm en

paste wgetip_1.temp wgetip_2.temp >> $logfile
rm wgetip_*.temp


