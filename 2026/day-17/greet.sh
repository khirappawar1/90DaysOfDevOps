#!/bin/bash

if [ -z "$1" ];
then
	echo "usage: ./greet.sh <name>"
	exit 1
fi
echo "Hello, $1"
