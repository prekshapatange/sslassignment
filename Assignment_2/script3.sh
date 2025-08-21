#!/bin/bash


if [ $# -ne 0 ]; then
    echo "Please do not provide any arguments."
    exit 1
fi


read -p "Enter the temperature either in C or F " a
read -p "if the temperature is in C then type 1 orelse 0 for F" y
if [ $y -eq 1 ];then
	F=$(awk "BEGIN {print (1.8 * $a) + 32}")
	echo " the temperature in Farenheit is " $F "F"
elif [ $y -eq 0 ];then
	C=$(awk "BEGIN {print (0.556 * $a) - 17.78}")
	echo "the temperature in Celsius is " $C "C"
else
	echo "enter a valid input"
fi












