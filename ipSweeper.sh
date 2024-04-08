# this is a bash script

#!/bin/bash

# loop that executes for every given ip in the network range
for ip in `seq 1 254 `; do
# ping -c 1 ping one ip at the time
# $1.$ip $1 = user input, last octet is takend from the loop variable ip 
# grep "64 bytes" = filter to the response of size 64 bytes 
# cut -d "" -f 4 = cuts the whole response with the delimiter -d (default is space) and takes only the fourth field which is the ip address 
# tr -d ":" = remove : from output
ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &

done

# usage ./ipSweeper.sh [first three ranges of my ip]