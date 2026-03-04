#!/bin/bash


read -p "Enter the num:" num 
while [ $num -ge 0 ]; do
       echo "$num" 
       ((num--))
done
echo "Done"



