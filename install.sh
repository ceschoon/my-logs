#!/bin/bash

#### Install scripts in user log folder

if [[ -d ~/.my-logs ]]
then
  echo "Creating a backup of existing log directory under \"~/.my-logs/backup.zip\""
  zip -r backup.zip ~/.my-logs/*.sh
  zip -r backup.zip ~/.my-logs/*.log
  mv backup.zip ~/.my-logs/
else
  echo "Creating new log directory"
  mkdir -p ~/.my-logs
fi

echo "Moving scripts to log directory"
cp *.sh ~/.my-logs/
cd ~/.my-logs/

#### Add rules to the user crontab

echo "Creating a backup of current crontab under \"~/.my-logs/crontab.backup\""
crontab -l > crontab.backup
crontab -l | grep -v "my-logs" > crontab_new.temp

echo "Adding new rules to current crontab"
echo " " >> crontab_new.temp
echo "0,10,20,30,40,50 * * * * cd .my-logs; ~/.my-logs/battery.sh"    >> crontab_new.temp
echo "0,10,20,30,40,50 * * * * cd .my-logs; ~/.my-logs/memory.sh"     >> crontab_new.temp
echo "0,10,20,30,40,50 * * * * cd .my-logs; ~/.my-logs/swap.sh"       >> crontab_new.temp
echo "0,10,20,30,40,50 * * * * cd .my-logs; ~/.my-logs/cputemp.sh"    >> crontab_new.temp
echo "0,10,20,30,40,50 * * * * cd .my-logs; ~/.my-logs/gputemp.sh"    >> crontab_new.temp
echo "0,10,20,30,40,50 * * * * cd .my-logs; ~/.my-logs/topload.sh"    >> crontab_new.temp
echo "0,10,20,30,40,50 * * * * cd .my-logs; ~/.my-logs/mouse.sh"      >> crontab_new.temp
echo "0,10,20,30,40,50 * * * * cd .my-logs; ~/.my-logs/topprocess.sh" >> crontab_new.temp
echo "0,10,20,30,40,50 * * * * cd .my-logs; ~/.my-logs/wgetip.sh"     >> crontab_new.temp
echo " " >> crontab_new.temp

echo "Finishing installation"
crontab crontab_new.temp
rm crontab*.temp

echo "Done!"


