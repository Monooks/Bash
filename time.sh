#!/bin/bash
while true; do
 current_time () {
        date +%T
 }
 current_time
 cat /proc/loadavg
  sleep 5
  if [[ $(($RANDOM%10)) -eq 5 ]]; then
      break;
  fi
done
