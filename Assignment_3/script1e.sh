#!/bin/bash
awk '{
	if($2>=50 && $2<=70){
		print $1 " " $2+5
	}
	else if($2>90){
		print $1 " " $2 " Excellent"
	}
	else{
		print $1 " " $2
	}
}' data.txt
