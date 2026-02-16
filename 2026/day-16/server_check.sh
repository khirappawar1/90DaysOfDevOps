#!/bin/bash

SERVICE="nginx"

read -p "Do ypu want to check the status of $SERVICE (Y/N):" choice

if [  "$choice" = "Y" ]; then 
	systemctl is-active --quiet $SERVICE
if [ $? -eq 0 ]; then 
	echo "Service is active"
else
	echo "Service is inactive"
fi

elif [ "$choice" = "N" ]; then
	echo "skipped"
else
	echo "Invalid input"
fi


