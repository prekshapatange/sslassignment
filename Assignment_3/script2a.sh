#!/bin/bash
awk 'BEGIN{
	print "Start of File"
	}
	{	print $0
	}' data1.txt
	
