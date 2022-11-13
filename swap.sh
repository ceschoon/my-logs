#! /bin/bash

logfile="swap.log"

if [ -f "$logfile" ]
then 
	echo ""
else
	echo "                            	              total        used        free" > $logfile
fi

date > swap_1.temp
free -h | tail -n 1 > swap_2.temp

paste swap_1.temp swap_2.temp >> $logfile
rm swap_*.temp


