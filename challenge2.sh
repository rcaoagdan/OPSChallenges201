#!/bin/bash

#Script Name: Ops Challenge Class 2
#Aurthor : Raymond Caoagdan
#Date of Last revision : 2/11/2021
#declare varialbes:

getStart(){
local a=$(ifconfig)
echo $a
}

 #main
network(){
v=$(getStart)
echo $v  >>output.txt
}

network

#end

