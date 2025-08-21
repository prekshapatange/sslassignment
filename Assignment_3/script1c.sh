#!/bin/bash
awk 'BEGIN{
			sum=0
			count=0
			}

			 {
			if(($1 ~ /^[aeiouAEIOU]/) && $2 > 50){
				
				print $1 " - " $2
				sum=sum+$2
				count=count+1
				} 
				
			}
			END{
		if(count>0){
			avg=sum/count
			print "average score of these students:",avg
		}
		else{
			print "error"
			}
			}' data.txt

