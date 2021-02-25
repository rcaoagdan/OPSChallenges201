#!/bin/bash

#Script Name: OPS 201 Challenge 6
#Author: Ray Caoagdan
#Date of last revision: 02/22/2021
#Description of Purpose: Show Listening Ports

#sets variable set to users inputed IP ADDRESS 
echo -e "please enter your IP addresss: "
read -r ipaddress



#main
#print listening ports
print_ports () {
    #echo -e "$ipaddress"
    echo -e "\nWoud you like to view OPEN, CLOSED or ALL ports? EXIT to leave"
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
# ports 0-1023 are all well known ports 
open_ports () {
    if [ "$option" == OPEN ] ; then
        openports=$(nc -z -v $ipaddress 1-1023 2>&1 | grep succeeded) #show succeded (OPEN) ports -z tell nc to scan for open ports -v shows more info
        echo "$openports"
        print_ports
    fi
}

close_ports () {
    if [ "$option" == CLOSED ] ; then
        closeports=$(nc -z -v 192.168.1.104 1-1023 2>&1 | grep failed) #show failed well known ports (CLOSED)
        echo "$closeports"
        print_ports
    fi 
}

all_ports () {
    if [ "$option" == ALL ] ; then
        allports=$(netstat -tul | grep LISTEN) #list all ports that are listening -t shows TCP -u shows UDP -l displays server sockets
        echo "$allports"
        print_ports
    fi
}

print_ports

#sources
# nc commands https://linuxize.com/post/netcat-nc-command-with-examples/
# check for listening ports https://linuxize.com/post/check-listening-ports-linux/