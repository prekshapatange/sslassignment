#!/bin/bash
echo "academic status of students: "
awk '{
	if( $2 >= 40 ){
	       print $1 " :  Pass "
       }
	else{
 	       print $1 " : Fail "
       }
}' data.txt	
