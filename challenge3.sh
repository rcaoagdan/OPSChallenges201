#!/bin/bash

#Script Name: OPS201 Challenge Class 3
#Author: Ray Caoagdan
#Date of last revision : 2/14/2021
#Description of Purpose: Prints login hisotry of computer

#Declaration of Variables: 
login="last" 

#Declaration of Functions
show_last_login () {
	$login
}

#main
cat /dev/null >output.txt #deletes current contents of file
show_last_login >> output.txt

#end
