#!/bin/bash
echo "Say me an IP-address!"
read ip
echo "Now, give me a port, username!"
read port
telnet $ip $port | sudo tee /var/log/syslog
sudo cat /var/log/syslog
