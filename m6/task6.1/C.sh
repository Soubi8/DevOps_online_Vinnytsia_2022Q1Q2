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