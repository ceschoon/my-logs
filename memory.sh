#! /bin/bash

logfile="memory.log"

if [ -f "$logfile" ]
then 
	echo ""
else
	echo "                            	              total        used        free      shared  buff/cache   available" > $logfile
fi

date > memory_1.temp
free -h | tail -n 2 | head -n 1 > memory_2.temp

paste memory_1.temp memory_2.temp >> $logfile
rm memory_*.temp


