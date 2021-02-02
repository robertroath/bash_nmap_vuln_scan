#!/bin/bash

#prompting user to add subnet
echo "add your main subnet as the argument. i.e. bash_ping_sweep.sh 192.168.1"

#check to see if an argument was entered
if [ "$1" == "" ]
  then
  echo "You didn't add an IP network to scan:"
  echo "Syntax: ./bash_ping_sweep.sh <network>"
else

#scans a class c and saves it to file
for ip in `seq 1 254` ; do
 ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" >> live_ips.txt
 done
fi

# run the nmap to get details & vulns on the hosts
for ip in $(cat live_ips'txt); do nmap -A --script vuln $ip; 
  done

 