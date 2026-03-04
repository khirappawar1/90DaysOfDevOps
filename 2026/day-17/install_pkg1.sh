#!/bin/bash

#Check the rot user
if [ "$EUID" -ne 0 ];
then
	echo "Log in as root user"
	exit 1
fi

packages=("git" "docker.io" "python3" "nginx")

for pkg in "${packages[@]}"; 
do
	if dpkg -l | grep -q "$pkg"; 
	then
		echo "Packages already installed"
		else 
			sudo apt-get install -y "$pkg"
	fi 
done

