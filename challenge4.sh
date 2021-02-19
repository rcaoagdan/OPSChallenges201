#! /bin/bash

#Script: Ops Challenge 4
#Author: Ray Caoagdan
#Date of Last Revision: 02/18/2021
#Purpose: Arrays :Create 4 directories | Putting 4 directories in an array | Reference the array variable to create new text files in each directory


#making directory using loop
make_dir (){
    for i in {1..4}
    do
        command mkdir "directory$i"
    done
}

make_dir

#putting directories in an array

#end