#!/bin/bash
while true; do
 current_uptime () {
        uptime
 }
 current_uptime
 cat /proc/loadavg
  sleep 5
  if [[ $(($RANDOM%10)) -eq 5 ]]; then
      break;
  fi
done
