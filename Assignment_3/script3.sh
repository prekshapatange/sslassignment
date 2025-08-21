#!/bin/bash
if [ $# -ne 1 ];then
	echo "provide one valid argument"
	exit 
fi

	var_name="$1"
	if [[ ! "$var_name" =~ ^[a-zA-Z_][a-zA-Z0-9_]+$ ]];then
		if [[ "$var_name" =~ ^[0-9] ]];then 
			echo "error:variables should not start with numbers" >&2
		elif [[ "$var_name" =~ [^a-zA-Z0-9_] ]];then
			echo "error:variables are having invalid characters other than the provided conditinos" >&2
		fi
	else
		echo "it is a valid name"
	fi

