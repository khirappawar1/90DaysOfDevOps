#!/bin/bash

read -p " Enter num:" num
if [ $num -gt 0 ]; then 
	echo "Entered num is grater than 0"
elif [ $num -lt 0 ]; then 
	echo "entered num is less than 0"
else
	echo "zero"
fi

