#!/bin/bash

#Script Name: OPS 201 Challenge 6
#Author: Ray Caoagdan
#Date of last revision: 02/25/2021
#Description of Purpose: Show Listening Ports

#sets variable set to users inputed IP ADDRESS 
echo -e "please enter your IP addresss: "
read -r ipaddress
<<<<<<< HEAD
#openports=$(nc -z -v $ipaddress 1-1023)


=======



>>>>>>> 17a8fa243f23a61b6931cc4b0acf9dd46fe2b2ac
#main
#print listening ports
print_ports () {
    #echo -e "$ipaddress"
<<<<<<< HEAD
    echo -e "Woud you like to view OPEN, CLOSED or ALL ports? TYPE- EXIT to leave"
=======
    echo -e "\nWoud you like to view OPEN, CLOSED or ALL ports? EXIT to leave"
>>>>>>> 17a8fa243f23a61b6931cc4b0acf9dd46fe2b2ac
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
<<<<<<< HEAD
            echo " Have a nice day "
            break
        else
            echo "Please select a correct option" #ensures on selcted parameters can be used 
=======
            echo -e "\nHave a nice day "
            break
        else
            echo -e  "\nPlease select a correct option" #ensures on selcted parameters can be used 
>>>>>>> 17a8fa243f23a61b6931cc4b0acf9dd46fe2b2ac
            print_ports
        fi
    done
}

#end

#functons to be called upon to main 
<<<<<<< HEAD
open_ports () {
    if [ "$option" == OPEN ] ; then
        openports=$(netstat -tulpn  | grep succeed)
        echo "$openports"
=======
# ports 0-1023 are all well known ports 
open_ports () {
    if [ "$option" == OPEN ] ; then
        openports=$(nc -z -v $ipaddress 1-1023 2>&1 | grep succeeded) #show succeded (OPEN) ports -z tell nc to scan for open ports -v shows more info
        echo -e  "\n$openports"
        print_ports
    fi
}

close_ports () {
    if [ "$option" == CLOSED ] ; then
        closeports=$(nc -z -v $ipaddress 1-1023 2>&1 | grep failed) #show failed well known ports (CLOSED)
        echo -e "\n$closeports"
        print_ports
    fi 
}

all_ports () {
    if [ "$option" == ALL ] ; then
        allports=$(netstat -tul | grep LISTEN) #list all ports that are listening -t shows TCP -u shows UDP -l displays server sockets
        echo -e  "\n$allports"
>>>>>>> 17a8fa243f23a61b6931cc4b0acf9dd46fe2b2ac
        print_ports
    fi
}

<<<<<<< HEAD
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
=======
#grep is Global Regular Expression Print - searches files for lines that match a givin pattern (paramter) then writes each matching line to standard output


print_ports


#sources
# nc commands https://linuxize.com/post/netcat-nc-command-with-examples/
# check for listening ports https://linuxize.com/post/check-listening-ports-linux/
# grep https://linuxize.com/post/how-to-use-grep-command-to-search-files-in-linux/
>>>>>>> 17a8fa243f23a61b6931cc4b0acf9dd46fe2b2ac
