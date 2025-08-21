#!/bin/bash
echo "The first and third columns of the file are : "
awk '{print $1 " - " $3}' data.txt
