#!/bin/bash

#Check if user logged in with root privilages

if [ $EUID -ne 0 ]; 
then
	echo "Kindly loging with root user"
	exit 1
fi

#Define list of pkg

packages=("nginx" "wget" "curl")

for  pkg in "${packages[@]}"; 
do 
	if dpkg -s "$pkg" &> /dev/null;
	then 
		echo "pckage alreday installed"
	else
		echo "Installing packages"
		apt-get update -y 
		apt-get install -y  $pkg  && echo "Packages installed successfuly" || echo "packages failed to install"
	fi
done

		

