#!/bin/bash
clear
echo "Starting..."
while true; do
	clear
	echo -e "\e[96m=============================================================
           _       _   _                          _       _
          (_)     | | (_)                        (_)     | |
 _ __ ___  _ _ __ | |_ _ _ __ ___  _ __  ___ _ __ _  __ _| |
|  _   _ \| | |_ \| __| | |_   _ \| |_ \ /_ \ |__| |/ _  | |
| | | | | | | | | | |_| | | | | | | |_) | __/ |  | | (_| | |
|_| |_| |_|_|_| |_|\__|_|_| |_| |_| .__/ \__|_|  |_|\__ _|_|
                                  | |
                                  |_|
=============================================================\e[39m"
	echo -e "\e[93m== mintimperial-00 Status ==\e[39m"
	echo "Date: $(date)"
	echo "IP: $(ip -o -4 addr list enxb827eb5f0f4d | awk '{print $4}' | cut -d/ -f1)"
	echo -e "\e[93m== Memory ==\e[39m"
	echo "Avaliable: $(free -m  | grep ^Mem | tr -s ' ' | cut -d ' ' -f2)"
	echo "Used: $(free -m  | grep ^Mem | tr -s ' ' | cut -d ' ' -f3)"
	echo "Free: $(free -m  | grep ^Mem | tr -s ' ' | cut -d ' ' -f4)"
	echo -e "\e[93m== Cluster Status ==\e[39m"
	ansible -T5 all -a echo -f20 | grep mintimperial | grep -v 'Failed' | cut -d ' ' -f1,3
	echo -e "\e[93m== Network Monitor ==\e[39m"
	
	echo "- scottramsden.co.uk"
	
	if ping -c 1 scottramsden.co.uk &> /dev/null
	then
		echo -e "\e[92m"
		ping -c1 scottramsden.co.uk -4 | grep 'time=' | cut -d ' ' -f 8
		echo -e "\e[39m"
	else
		echo -e "\e[91m"
		echo -e "\e[91mOffline\e[39m"
		echo -e "\e[39m"
	fi


	echo "- mintimperial-sr.hopto.org"
	
	if ping -c 1 mintimperial-sr.hopto.org &> /dev/null
	then
		echo -e "\e[92m"
		ping -c1 mintimperial-sr.hopto.org -4 | grep 'time=' | cut -d ' ' -f 8
		echo -e "\e[39m"
	else
		echo -e "\e[91mOffline\e[39m"
	fi
	
	echo "- unimperial"
	
	if ping -c 1 192.168.0.15 &> /dev/null
	then
		echo -e "\e[92m"
		ping -c1 192.168.0.15 -4 | grep 'time=' | cut -d ' ' -f 7
		echo -e "\e[39m"
	else
		echo -e "\e[91mOffline\e[39m"
	fi
	
	sleep 30
done
