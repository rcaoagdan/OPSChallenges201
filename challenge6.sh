#!/bin/bash

#Script Name: OPS 201 Challenge 6
#Author: Ray Caoagdan
#Date of last revision: 02/22/2021
#Description of Purpose: Show Listening Ports


getIPaddress() {
    echo -e "please enter your IP addresss: "
    read -r ipaddress
    openports=$(nc -z -v $ipaddress 1-1023)
}


#print listening ports
listening_ports () {
    echo -e "$openports"
}



getIPaddress

listening_ports

