#! /bin/bash

#Script: Ops Challenge 13
#Author: Ray Caoagdan
#Date of Last Revision: 03/21/21
#Purpose: Arrays : Bash Domain analysis 

#variables
echo -e "\nPlease enter a domain name?"
read -r ipvar 

#Main Function utilizeing whois, dig, nslookup

main_function (){
    whois $ipvar
    dig $ipvar
    host $ipvar
    nslookup $ipvar
}

#main
main_function >> challenge13.txt
#end 