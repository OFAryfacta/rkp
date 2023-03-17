#!/bin/bash

read -p 'enter your name:' name
echo -e "entered name is \e[33m $name \e[0m"

#functions : used to use set of commands

sample() {
    echo "I am Sample Function"
}
 
sample 
