#!/bin/bash

# Functions

options ()   # Displays the list of available options with the syntax
{
    echo
    echo "Syntax: B.sh --[option] [logfile]"
    echo
    echo "List of available options:"
    echo -e "\t--popular_ip\t\tDisplays from which IP were the most requests"
    echo -e "\t--popular_page\t\tShows the most requested page"
    echo -e "\t--requests_by_ip\tShows how many requests were there from each IP"
    echo -e "\t--non_existing\t\tShows what non-existent pages were clients referred to"
    echo -e "\t--busy_time\t\tShows what time did site get the most requests"
    echo -e "\t--bots\t\t\tShows what search bots have accessed the site (UA + IP)"
    echo
}

popular_ip ()  # Displays from which IP were the most requests
{
    cat $1 | awk '{print $1}' | sort | uniq -c | sort -nr | head -1 | awk '{print $2" is the IP from which requests were sent the most\n"$1" is the amount of times requests were sent"}'
}

popular_page ()  # Shows the most requested page
{
    cat $1 | awk '{print $7}' | sort | uniq -c | sort -nr | head -1 | awk '{print $2" is the website which was accessed the most\n"$1" is the amount of times it was accessed"}'
}

requests_by_ip ()  # Shows how many requests were there from each IP
{
    echo "Requests from each IP:"
    cat $1 | awk '{print $1}' | sort | uniq -c | sort -nr
}

non_existing ()  # Shows what non-existent pages were clients referred to
{
    cat $1 | grep 404 | awk '{print $7}' | sort -n | uniq
}

busy_time ()  # Shows what time did site get the most requests
{
    echo "Displaying 10 time stamps when site got the most requests:"
    cat $1 | awk '{print $4}' | tr -d '[' | uniq -c | sort -nr | head -10
}

bots ()  # Shows what search bots have accessed the site (UA + IP)
{
    grep -i bot $1 | awk '{print "IP: " $1 "\tUserAgent: "$12,$14,$15}' | sort -nr | uniq
}

error_msg ()  # Displays error message whenever non-existing option is entered
{
    echo "The specified option does not exist"
}

# Body. Checks which of the options was chosen, runs the script with it, otherwise displays available options or error message

if [ "$1" = "--popular_ip" ]
then
    popular_ip $2
elif [ "$1" = "--popular_page" ]
then
    popular_page $2
elif [ "$1" = "--requests_by_ip" ]
then
    requests_by_ip $2
elif [ "$1" = "--non_existing" ]
then
    non_existing $2
elif [ "$1" = "--busy_time" ]
then
    busy_time $2
elif [ "$1" = "--bots" ]
then
    bots $2
elif [ "$#" = "0" ]
then
    options
else
    error_msg
fi