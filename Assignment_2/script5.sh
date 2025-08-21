
#!/bin/bash


if [ $# -ne 3 ]; then
    echo "Enter 3 valid arguments: <directory> <file_name> <true|false>"
    exit 1
fi


if [ ! -d "$1" ]; then
    echo "The directory does not exist"
    exit 1
fi


dir=$1
file_name=$2
check_subdir=$3


if [ "$check_subdir" = "false" ]; then
    echo "Not searching in subdirectories"
    files=$(find "$dir" -maxdepth 1 -type f -name "${file_name}*")
elif [ "$check_subdir" = "true" ]; then
    echo "Searching in subdirectories"
    files=$(find "$dir" -type f -name "${file_name}*")
else
    echo "Invalid value for subdirectory search: use 'true' or 'false'"
    exit 1
fi


if [ -z "$files" ]; then
    echo "No files found"
    exit 1
fi


for file in $files; do
    echo "$file"
done

exit 0


