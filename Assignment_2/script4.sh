#!/bin/bash
if [ $# -ne 3 ]; then
    echo "Error: You must provide exactly three arguments."
    echo "Usage: $0 <sentence> <old_word> <new_word>"
    exit 1
fi


sentence="$1"
word="$2"
new_word="$3"


modified_sentence=$(echo "$sentence" | sed "s/$word/$new_word/g")

# Display the original and modified sentences
echo "Original sentence: $sentence"
echo "Modified sentence: $modified_sentence"

