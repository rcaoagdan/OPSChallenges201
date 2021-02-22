#!/bin/bash

#Script Name: OPS 201 Challenge 5
#Author: Ray Caoagdan
#Date of last revision: 02/21/2021
#Description of Purpose: Use Loops- Ask user for PID then kills process with PID

#declare variables
process=$(ps aux) #ps aux lists all processes

#main
kill_reset () {
	echo -e "Hello for your convience the process is printed in output.txt"
	cat /dev/null >output.txt #deletes any content currently in output.txt 
	echo -e "$process" >>output.txt #prints PID in output.txt 
	echo -e "Shall we kill-k or reset-r a process? k/r?"
	read -r option
	while :
	do
		if [ "$option" == k ]; then
			kill_process
			break
		else
			reset_process
		fi
	done

}

#end

#below are the fuction called upon to main

#kill the process
kill_process() {
	if [ "$option" == k ]; then
		echo -e "Select process found in output.txt"
		read -r PID
		kill -9 "$PID"

		kill_reset
	fi
}

#reset the process
reset_process () {
	if [ "$option" == r ]; then
		echo -e "Select Process found in output.txt"
		read -r PID
		kill -15 "$PID"
	
		kill_reset
	fi
}

kill_reset

# sources
# link to kill process https://www.linux.com/training-tutorials/how-kill-process-command-line/
# loops https://ryanstutorials.net/bash-scripting-tutorial/bash-loops.php
