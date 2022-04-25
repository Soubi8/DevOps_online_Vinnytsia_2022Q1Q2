# Module 6 - Linux Administration + Bash
## Task 6.1
### A. Create a script that uses the following keys:
## 1. When starting without parameters, it will display a list of possible keys and their description.
## 2. The --all key displays the IP addresses and symbolic names of all hosts in the current subnet
## 3. The --target key displays a list of open system TCP ports. The code that performs the functionality of each of the subtasks must be placed in a separate function

[A.sh](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m6/task6.1/A.sh)

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

![Screenshot1](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m6/task6.1/Screenshots/1.jpg)

### B. Using Apache log example create a script to answer the following questions:
## 1. From which ip were the most requests?
## 2. What is the most requested page?
## 3. How many requests were there from each ip?
## 4. What non-existent pages were clients referred to?
## 5. What time did site get the most requests?
## 6. What search bots have accessed the site? (UA + IP)

[B.sh](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m6/task6.1/B.sh)

[apache_logs.txt](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m6/task6.1/apache_logs.txt)

[example_log.log](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m6/task6.1/example_log.log)

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

![Screenshot2](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m6/task6.1/Screenshots/2.jpg)

![Screenshot3](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m6/task6.1/Screenshots/3.jpg)

### C. Create a data backup script that takes the following data as parameters:
## 1. Path to the syncing directory.
## 2. The path to the directory where the copies of the files will be stored. In case of adding new or deleting old files, the script must add a corresponding entry to the log file indicating the time, type of operation and file name. [The command to run the script must be added to crontab with a run frequency of one minute]

[C.sh](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m6/task6.1/C.sh)

    #!/bin/bash

    # Functions

    backup_1()	# Backup command if the source and destination pathes were specified
    {
	    rsync -av --delete $1 $2 --log-file=backup.log
    }

    backup_2()	# Backup command which requires to enter the pathes to source and destination directories
    {
	    read -p "Please enter the path to source directory: " src
            read -p "Please enter the path to destination directory: " dst
            rsync -av --delete $src $dst --log-file=backup.log
    }

    # Body
    # Checking whether the arguments were supplied when the script was run, if so - executing "backup_1", otherwise "backup_2"

    if [ "$#" -ne "2" ]
    then
	    backup_2
    else
	    backup_1 "$1" "$2"
    fi

![Screenshot4](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m6/task6.1/Screenshots/4.jpg)

![Screenshot5](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m6/task6.1/Screenshots/5.jpg)

![Screenshot6](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m6/task6.1/Screenshots/6.jpg)

![Screenshot7](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m6/task6.1/Screenshots/7.jpg)

## Summary
In this task I created three scripts which serve for different purposes. I tried to provide solutions by using different methods that I found useful. I believe that the code can be improved even in a better way, however the current state represents my knowledge and understanding of bash syntax at this particular moment.