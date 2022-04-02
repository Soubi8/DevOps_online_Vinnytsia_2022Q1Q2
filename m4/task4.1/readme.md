# Module 4 - Linux Essentials
## Task 4.1 Part 1
### 1. Log in to the system as root (or sudo-er).
As the first step, I checked whether my current account is part of the group __sudo__ by executing `groups max`. 

![Screenshot1](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/1.jpg)

### 2. Use the passwd command to change the password. Examine the basic parameters of the command. What system file does it change *?
To change the password I used the `passwd` command. Familiarized myself with the manual for the same command by executing `man passwd`. The command changes the content of the file __/etc/shadow__. Passwords are hashed with SHA.

![Screenshot2](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/2.jpg)

### 3. Determine the users registered in the system, as well as what commands they execute. What additional information can be gleaned from the command execution?
To find out who is logged into the system and what command is used I executed the `w` command. Then I read through the manual for the same command and executed it with the options `-hs`, where `-h` removes the header and `-s` shows the output in the short form.

![Screenshot3](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/3.jpg)

### 4. Change personal information about yourself.
I used `chfn` command to change the user's information.

![Screenshot4](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/4.jpg)

### 5. Become familiar with the Linux help system and the man and info commands. Get help on the previously discussed commands, define and describe any two keys for these commands. Give examples.
Read the manuals about the `man` and `info` commands. Below are listed few of the available options that I found useful. Examples are shown on the screenshots as well.

| Command | Option | Description |
| - | - | - |
| man | -w | Prints the location of the manual file |
| man | -f | Displays a short description from the manual page, if available |
| info | -a | Uses all matching manuals and display them for a particular command |
| info | -k, --apropos=STRING | Looks up STRING in all indices of all manuals and then prints it |

![Screenshot5](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/5.jpg)

![Screenshot6](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/6.jpg)

![Screenshot7](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/7.jpg)

![Screenshot8](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/8.jpg)

### 6. Explore the more and less commands using the help system. View the contents of files .bash* using commands.
Used `more --help` and `less --help` to familiarize myself with the commands. Executed the `more .bash*` and `less .bash*`. 

![Screenshot9](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/9.jpg)

![Screenshot10](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/10.jpg)

![Screenshot11](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/11.jpg)

### 7. * Determine the last logon time for all users. Tip: You should read the documentation for the finger command.
Installed the __finger__ by running `sudo apt install finger` first, then ran it and captured that I logged in at 11:59 on the 2nd of April. 

![Screenshot12](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/12.jpg)

### 8. * List the contents of the home directory using the ls command, define its files and directories. Hint: Use the help system to familiarize yourself with the ls command.
Read through the manual for `ls` command, executed it with the options `-l`, which provides the output in long format and `-a` that shows all entried starting with the dot. 

![Screenshot13](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/13.jpg)

## Task 4.1 Part 2

### 1. Examine the tree command. Master the technique of applying a template, for example, display all files that contain a character c, or files that contain a specific sequence of characters. List subdirectories of the root directory up to and including the second nesting level.
I installed the __tree__ by running `sudo apt install tree`. Then I ran it in my home directory, it gave a visual output, as shown below.

![Screenshot14](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/14.jpg)

Ran the `tree -Pa 's*'` to display the tree listing only files that start with the letter __s__.

![Screenshot15](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/15.jpg)

Then I executed the `tree -Pa 'user*'` to display only the files containing __user__ word.

![Screenshot16](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/16.jpg)

As the final step for this subtask I ran the `tree -L 2 /`, where `-L 2 /` displays the depth of 2 in the root directory. 

![Screenshot17](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/17.jpg)

![Screenshot18](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/18.jpg)

### 2. What command can be used to determine the type of file (for example, text or binary)? Give an example.
The `file` command is used to determine the type of file. Example is below.

![Screenshot19](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/19.jpg)

### 3. Master the skills of navigating the file system using relative and absolute paths. How can you go back to your home directory from anywhere in the filesystem? 
Familiarized myself with the absolute and relative paths, navigated through the system using `cd` command. In order to go to the user's home folder, I found two ways: `cd ~`, `cd /home/max`.

![Screenshot20](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/20.jpg)

### 4. Become familiar with the various options for the ls command. Give examples of listing directories using different keys. Explain the information displayed on the terminal using the -l and -a switches.
`ls` command lists the folders and files in the current directory. Option `-l` displays the same with in long format, showing information related to permissions, number of links, owner name, owner group, file size, time of last modification and the name, while `-a` presents all entries, includding hidden and the ones starting with the dot. Example is displayed below.

![Screenshot21](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/21.jpg)

### 5. Perform the following sequence of operations:
- create a subdirectory in the home directory;
- in this subdirectory create a file containing information about directories located in the root directory (using I/O redirection operations);
- view the created file;
- copy the created file to your home directory using relative and absolute addressing.
- delete the previously created subdirectory with the file requesting removal;
- delete the file copied to the home directory.

To create the subdirectory in the home directory I ran `mkdir ~/Max`.

![Screenshot22](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/22.jpg)

As the next step I redirected the output of command `ls -d */` to the file __list_of_directories.txt__. `ls -d */ > ~/Max/list_of_directories.txt` and viewed its content by running `cat ~/Max/list_of_directories`. 

![Screenshot23](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/23.jpg)

Next, I copied the file to the user's directory using relative path by running the `cp Max/list_of_directories.txt list_of_directories.txt` command. As an alternative, ran `cp /home/max/Max/list_of_directories.txt /home/max/list_of_directories2.txt` command using absolute path. 

![Screenshot24](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/24.jpg)

Deleted the folder __Max__ and its content in the interactive mode by executing `rm -ri Max`.

![Screenshot25](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/25.jpg)

Deleted the other two files created previously - `rm list_of_directories.txt list_of_directories2.txt`.

![Screenshot26](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/26.jpg)

### 6. Perform the following sequence of operations:
- create a subdirectory test in the home directory;
- copy the .bash_history file to this directory while changing its name to
labwork2;
- create a hard and soft link to the labwork2 file in the test subdirectory;
- how to define soft and hard link, what do these concepts;
- change the data by opening a symbolic link. What changes will happen and why
- rename the hard link file to hard_lnk_labwork2;
- rename the soft link file to symb_lnk_labwork2 file;
- then delete the labwork2. What changes have occurred and why?

Created the subdirectory __test__ in the home directory - `mkdir test`. Copied the __.bash_history__ file and to the users home directory and renamed it to __labwork2__ - `cp .bash_history labwork2`.

![Screenshot27](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/27.jpg)

Then I created the hard and soft links for file __labwork2__ in the __test__ folder.
`ln labwork2 test/labwork2h`
`ln -s /home/max/labwork2 test/labwork2s`

![Screenshot28](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/28.jpg)

In short - a soft link is an actual link to the original file, whereas a hard link is a mirror copy of the original file. If the original file is deleted, then the soft link has no value, because it points to a non-existent file, while, the hard link is entirely opposite.
Even if you delete the original file, the hard link will still have the data of the original file. Because hard link acts as a mirror copy of the original file.

Then I modified the content of the symbolic link, which in turn modified the data of the original file __labwork2__

![Screenshot29](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/29.jpg)

Next, I renamed the links as shown below. 

![Screenshot30](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/30.jpg)

As the last step for this subtask I removed the __labwork2__ file. As a result, the hard link retained the last modification of the original file, while the soft link broke due to it being a link to the removed file. 

![Screenshot31](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/31.jpg)

### 7. Using the locate utility, find all files that contain the squid and traceroute sequence. 
To find all the files that contain the __squid__ and __traceroute__ sequence by using `locate` I executed the following - `locate *squid*` and `locate *traceroute*`.

![Screenshot32](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/32.jpg)

### 8. Determine which partitions are mounted in the system, as well as the types of these partitions.
`lsblk` command shows the partitions that are mounted to the system.

![Screenshot33](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/33.jpg)

### 9. Count the number of lines containing a given sequence of characters in a given file.
For this subtask, I chose to find the count of word __reboot__ in the file __.bash_history__. I executed the following command to achieve this `grep 'reboot' .bash_history | wc -l`

![Screenshot34](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/34.jpg)

### 10. Using the find command, find all files in the /etc directory containing the host character sequence.
To find all files containing the __host__ character sequence in the __/etc__ directory I used the following command `find /etc -name 'host*'`

![Screenshot35](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/35.jpg)

### 11. List all objects in /etc that contain the ss character sequence. How can I duplicate a similar command using a bunch of grep?
This time to find all files in the __/etc__ directory that contain the __ss__ character sequence I executed the following commands:
`find /etc -name '*ss*'`, `ls -la /etc | grep 'ss'`.

![Screenshot36](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/36.jpg)

![Screenshot37](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/37.jpg)

### 12. Organize a screen-by-screen print of the contents of the /etc directory. Hint: You must use stream redirection operations.
To organize a screen-by-screen print of the contents of the /etc directory I executed the following command `ls -la /etc | more`. On the other hand, the `ls -la /etc | less` could be used.

![Screenshot38](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/38.jpg)

### 13. What are the types of devices and how to determine the type of device? Give examples.
Linux supports three types of hardware device: character, block and network. For character devices, the first letter is __c__, while for block it is __b__. 

![Screenshot39](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/39.jpg)

### 14. How to determine the type of file in the system, what types of files are there?
There are seven types of files in Linux: normal files (-), block (b), character(c), symbolic links (l), pipes (p), sockets (s) and directories (d). `file` command is used to determine the type of the file.

![Screenshot40](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/40.jpg)

### 15. * List the first 5 directory files that were recently accessed in the /etc directory.
To find the last accessed 5 directories in the __/etc__ folder I ran the `ls -ltu /etc | grep ^d | head -5` command.

![Screenshot41](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/41.jpg)

## Summary
During this task I familiarized myself with the syntaxis of some common, frequently used commands and their options in Linux. 