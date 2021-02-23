#!/bin/bash

#Script Name: OPS 201 Challenge 5
#Author: Ray Caoagdan
#Date of last revision: 02/21/2021
#Description of Purpose: Use Loops- Ask user for PID then kills process with PID

#declare variables
process=$(ps aux) #ps aux lists all processes

#main
echo -e "$process"
echo -e "\nHello for your convience the process will aslo be printed in output.txt"
cat /dev/null >output.txt #deletes any content currently in output.txt 
echo -e "$process" >>output.txt #prints PID in output.txt 

kill_reset () {
	echo -e "\nShall we kill-k or gracefully kill-g a process? k/g?" #ask to kill or reset
	read -r option #reads user input
	while :
	do
		if [ "$option" == k ]; then
			kill_process #calls function kill_process
			break #needed to break loop just in case
		else
			grace_process #calls function grace_process
		fi
	done

}

#end

#below are the fuctions called upon to main
	
#kill the process
kill_process() {
	if [ "$option" == k ]; then
		echo -e "Select process found in output.txt"
		read -r PID
		kill -9 "$PID" #kill the process

		kill_reset #go back to kill_rest
	fi
}

#reset the process
grace_process () {
	if [ "$option" == r ]; then
		echo -e "Select Process found in output.txt"
		read -r PID
		kill -15 "$PID" #sends SIGTERM to PID (gracefully kill)
	
		kill_reset #go back to kill_reset
	fi
}

kill_reset

# sources
# link to kill process https://www.linux.com/training-tutorials/how-kill-process-command-line/
# loops https://ryanstutorials.net/bash-scripting-tutorial/bash-loops.php
