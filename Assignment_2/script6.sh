  #!/bin/bash
  is_directory() {
    [ -d "$1" ]
}


if [ $# -ne 1 ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi


directory=$1
if ! is_directory "$directory"; then
    echo "Error: '$directory' is not a directory."
    exit 1
fi


echo "Searching for the largest files in $directory..."


files=$(find "$directory" -type f -exec du -h {} + | sort -rh | head -n 5)

# Check if files were found
if [ -z "$files" ]; then
    echo "No files found in the specified directory."
    exit 1
fi
echo "Top 5 largest files:"

while IFS= read -r line; do
    size=$(echo "$line" | awk '{print $1}')
    file=$(echo "$line" | awk '{print $2}')
    
    # Get file details
    path=$(realpath "$file")
    owner=$(stat -c '%U' "$file")
    modified=$(stat -c '%y' "$file")

    echo "File: $path"
    echo "Size: $size"
    echo "Owner: $owner"
    echo "Last Modified: $modified"
    echo "-----------------------------------"
done <<< "$files"

exit 0
