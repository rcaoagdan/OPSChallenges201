#!/bin/bash

#Script Name: OPS 201 Challenge 6
#Author: Ray Caoagdan
#Date of last revision: 02/22/2021
#Description of Purpose: Show Listening Ports

#sets variable set to users inputed IP ADDRESS 
echo -e "please enter your IP addresss: "
read -r ipaddress
#openports=$(nc -z -v $ipaddress 1-1023)


#main
#print listening ports
print_ports () {
    #echo -e "$ipaddress"
    echo -e "Woud you like to view OPEN, CLOSED or ALL ports? TYPE- EXIT to leave"
    read -r option
    while : 
    do 
        if [ "$option" == OPEN ] ; then
            open_ports
        elif [ "$option" == CLOSED ] ; then
            close_ports
        elif [ "$option" == ALL ] ; then
            all_ports
        elif [ "$option" == EXIT ] ; then
            echo " Have a nice day "
            break
        else
            echo "Please select a correct option" #ensures on selcted parameters can be used 
            print_ports
        fi
    done
}

#end

#functons to be called upon to main 
open_ports () {
    if [ "$option" == OPEN ] ; then
        openports=$(netstat -tulpn  | grep succeed)
        echo "$openports"
        print_ports
    fi
}

close_ports () {
    if [ "$option" == CLOSED ] ; then
        closeports=$(netstat -tulpn | grep failed)
        echo "$closedports"
        print_ports
    fi 
}

all_ports () {
    if [ "$option" == ALL ] ; then
        allports=$(netstat -tulpn | grep LISTEN) #list all ports that are listening
        echo "$allports"
        print_ports
    fi
}

print_ports

