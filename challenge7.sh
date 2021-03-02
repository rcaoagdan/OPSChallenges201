#!/bin/bash

#Script Name: OPS 201 Challenge 7
#Author: Ray Caoagdan
#Date of last revision: 02/2528/2021
#Description of Purpose: lshw and grep to show system information

#main 
  
print_info () {
    echo -e "\nHello, Please look over the following commands"
    echo -e "1. Computer Name"
    echo -e "2. CPU Information"
    echo -e "3. RAM Information"
    echo -e "4. Display Adapter"
    echo -e "5. Network Adapter"
    echo -e "6. Exit"
    read -r sysinfo
    #cat /dev/null >output.txt #deletes any content currently in output.txt 
    #echo -e "$infosystem" >>output.txt 
     while : 
    do 
        if [ "$sysinfo" == 1 ] ; then
           comp_name
        elif [ "$sysinfo" == 2 ] ; then
           cpu_info
        elif [ "$sysinfo" == 3 ] ; then
            ram_info
         elif [ "$sysinfo" == 4 ] ; then
            disadapt
        elif [ "$sysinfo" == 5 ] ; then
            netdapt
         elif [ "$sysinfo" == 6 ] ; then
            clear_screen=$(clear)
            echo -e "$clear_screen" 
            break
        else 
            echo -e  "\n Please select a correct option" #ensures on selcted parameters can be used 
            print_info
        fi
    done
}

#end

#functions to be called upon to main 
# - class can be used to only show what you want 
comp_name () {
    if [ "$sysinfo" == 1 ] ; then
    compname=$(sudo lshw | grep -m1 "rcaoagdan") #-m1 only list first matching instance 
    echo -e "\nPrinting Computer Name:"
    echo -e "\n$compname"
    print_info 
    fi
}

cpu_info () {
    if [ "$sysinfo" == 2 ] ; then
    cpuinfo=$(sudo lshw -class CPU | grep -v "capabilities") #-v leaves out this information
    echo -e "\nDisplaying CPU Information:"
    echo -e "\n$cpuinfo" 
    print_info 
    fi
}

ram_info () {
     if [ "$sysinfo" == 3 ] ; then
    raminfo=$(lshw -class memory)
    echo -e "\nDisplaying Memory Information:"
    echo -e "\n$raminfo"
    print_info 
    fi
}

disadapt () {
     if [ "$sysinfo" == 4 ] ; then
    disinfo=$(lshw -class video  )
    echo -e "\nShowing Display Adapter Information"
    echo -e "\n$disinfo"
    print_info 
    fi
}

netdapt () {
     if [ "$sysinfo" == 5 ] ; then
    netinfo=$(lshw -class network | grep -B15 "*-network DISABLED" ) #-B "text" prints everything before said parameters
    echo -e "\nDisplaying Network:"
    echo -e "\n$netinfo"
    print_info 
    fi
}

print_info 