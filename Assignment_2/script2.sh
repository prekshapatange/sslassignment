#!/bin/bash

# Function to find the k-th largest number
kth_largest() {
  k=$1
  shift
  numbers=("$@")

 
  sorted_numbers=($(for num in "${numbers[@]}"; do echo $num; done | sort -nr))


  echo "${sorted_numbers[$((k-1))]}"
}


if [ "$#" -lt 2 ]; then
  echo "Usage: $0 k num1 num2 ... numN"
  exit 1
fi

k=$1
shift

numbers=("$@")


if [ "$k" -le 0 ] || [ "$k" -gt "${#numbers[@]}" ]; then
  echo "Invalid value of k: $k. Must be between 1 and ${#numbers[@]}"
  exit 1
fi


result=$(kth_largest "$k" "${numbers[@]}")
echo "The ${k}th largest number is: $result"
