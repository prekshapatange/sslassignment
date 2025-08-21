#!/bin/bash

is_number() {
    local num="$1"
    if [[ $num =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
        return 0 
    else
        return 1 
    fi
}

if [ $# -eq 0 ]; then
    echo "Error:provide numbers of the array"
    exit 1
fi


for num in "$@"; do
    if [ ! is_number "$num" ]; then
        echo "Error: Invalid number detected: $num"
        exit 1
    fi
done
sorted_numbers=($(printf "%s\n" "$@" | sort -n))
min=${sorted_numbers[0]}
max=${sorted_numbers[-1]}
sum=$(printf "%s\n" "${sorted_numbers[@]}" | awk '{s+=$1} END {print s}')
average=$(awk -v sum="$sum" -v count="$#" 'BEGIN {print sum/count}')

# Count unique and duplicate numbers
unique_numbers=($(printf "%s\n" "${sorted_numbers[@]}" | uniq))
duplicate_count=$(($# - ${#unique_numbers[@]}))
echo "Original numbers: $@"
echo "Sorted numbers: ${sorted_numbers[@]}"
echo "Minimum value: $min"
echo "Maximum value: $max"
echo "Average value: $average"
echo "Number of unique numbers: ${#unique_numbers[@]}"
echo "Number of duplicate numbers: $duplicate_count"

exit 0
