#!/bin/bash 

if [ $# -eq 2 ];
then
        startPort=$(echo $1 | tr '-' ' ' | awk '{print $1}')
        endPort=$(echo $1 | tr '-' ' ' | awk '{print $2}')
        rangePort=$(seq $startPort $endPort)
        host=$2

        echo -e "\n~ Starting port scanning...!\n"

        for port in $rangePort; 
        do
                timeout 2 bash -c "echo '' > /dev/tcp/$host/$port &>/dev/null" &>/dev/null && echo "[+] $port/open" & 
        done; wait 

        echo -e "\n~ Finished!"
else
        echo "### TCP Port Scanner ###"
        echo -e "\n[+] Use: $0 <port-range> <host>"
        echo -e "\n~ Example:"
        echo -e "\t$ $0 {1000..2000} sha-16.xyz"
        echo -e "\t$ $0 {0..1000} 172.17.0.2"
        echo -e "\n~ Happy Hacking!"
fi
