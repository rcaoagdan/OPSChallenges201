#!/bin/bash

#Script Name: OPS 201 Challenge 6
#Author: Ray Caoagdan
#Date of last revision: 02/22/2021
#Description of Purpose: Show Listening Ports

#variables
#openports=$(nc -z -v 192.168.1.104 1-1023) #prints all well known ports


#print listening ports
listening_ports () {
    echo -e "$openports"
}

getIPaddress() {
    echo -e "please enter an IP addresss: "
    read -r ipaddress
    openports=$(nc -z -v $ipaddress 1-1023)
}
listening_ports

