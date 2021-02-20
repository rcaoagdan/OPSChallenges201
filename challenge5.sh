#!/bin/bash

#Script Name: OPS 201 Challenge 5
#Author: Ray Caoagdan
#Date of last revision: 02/19/2021
#Description of Purpose: Use Loops- Ask user for PID then kills process with PID

#declare variables
target=$(ps aux)


#asks to kill
ask_to_kill() {
	echo -e "Shall we kill a process? y/n?: "
	read -r  option
	while :
	do
 		if [ "$option" == n ] ; then
		echo -e "The Process lives another day"
		break 
		else
			kill_process
		fi
	done
}

#proceed to execute
kill_process() {
	if [ "$option" == y ]; then
		echo -e "$target" 
		echo -e "Select your target"
		read -r PID
		kill -9  "$PID" 

		ask_to_kill
	fi
	donme

}

ask_to_kill
