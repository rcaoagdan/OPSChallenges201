#!/bin/bash

#Script Name: OPS 201 Challenge 5
#Author: Ray Caoagdan
#Date of last revision: 02/20/2021
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
	while:
	do
		if [ "$process" == k ]; then
			kill_process
			#break
		else
			reset_process
		fi
	done

}

kill_process() {
	if [ "$process" ==k ]; then
		echo -e "Select process found in output.txt"
		read -r PID
		kill -9 "$PID"

		kill_reset
	fi
}

reset_process () {
	if [ "$process" ==r ]; then
		echo -e "Select Process found in output.txt"
		read -r PID
		kill -15 "$PID"

		kill_reset
	fi
}

kill_reset

#end







#asks to kill
#ask_to_kill() {
#	echo -e "Shall we kill a process? y/n?: "
#	read -r  option 
#	while :
#	do
#		echo -e "The Process lives another day"
#		break  #needed to  break the loop
#		else
#			kill_process #go to kill process if y is the option
#		fi
#	done
#}

#proceed to execute
#kill_process() {
#	if [ "$option" == y ]; then #if option is y then run commands below
#		echo -e "$target" 
#		echo -e "Select your target.For your convience PID printed in output.txt"
#		echo -e "$target">>output.txt 
#		read -r PID 
#		kill -9  "$PID" #kills -9 the process

#		ask_to_kill #infinte loops
#	fi
#}

 
#ask_to_kill

#end

# sources
# link to kill process https://www.linux.com/training-tutorials/how-kill-process-command-line/
# loops https://ryanstutorials.net/bash-scripting-tutorial/bash-loops.php
