#!/bin/bash
clear
Logs=$(w)
Date=$(date +'%Y-%m-%d')
echo "" >> UserLogin.txt
echo "This is some new content for the document." >> UserLogin.txt
echo "$Logs" >> UserLogin.txt
echo "$Date" >> UserLogin.txt
echo "$Logs"
echo "$Date"