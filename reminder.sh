#!/bin/bash

cd /home/parmarnishika2/MedicineReminder

current=$(date +%H:%M)

echo "Reminder checked at $(date)" >> logs/reminders.txt

awk -F, -v t="$current" '
NR>1 && $2==t {
    print "Medicine due: " $1 " at " $2
}' data/meds.csv >> logs/reminders.txt
