#!/bin/bash
 tail -n 5 test.txt | cut -d ' ' -f 2  | tac > file.txt | cat file.txt
 echo "work done(●'◡'●)"