#!/bin/bash

# Functions

options ()	# Displays the list of available options with the syntax
{
    echo
    echo "Syntax: A.sh --[option] [target IP or network with CIDR]"
    echo
    echo "List of available options:"
    echo -e "\t--all\t\tDisplays the IP addresses and symbolic names of all hosts in the current subnet"
    echo -e "\t--target\tDisplays a list of open system TCP ports"
    echo
}

all ()	# Displays the IP addresses and symbolic names of all hosts in the current subnet
{
    nmap -sn -oG - $1
}

target ()	# Displays a list of open system TCP ports
{
    nmap -p- $1
}

error_msg ()    # Displays error message whenever non-existing option is entered
{
    echo "The specified option does not exist"
}

# Body. Checks whether an argument was entered, if so - runs script with the specified option or displays available options

if  [ "$1" = "--all" ]
then
    all $2
elif [ "$1" = "--target" ]
then
    target $2
elif [ "$#" = "0" ]
then
    options
else
    error_msg
fi