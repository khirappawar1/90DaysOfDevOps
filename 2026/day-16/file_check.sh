#!/bin/bash

read -p "Enter file name:" filename
if [ -f "$filename" ]; then 
	echo "file exist"
else
	echo "file do not exist"
fi
