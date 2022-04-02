# Module 4 - Linux Essentials
## Task 4.1 Part 1
1. As the first step, I checked whether my the current account is part of the group __sudo__ by executing `groups max`. 

![Screenshot1](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/1.jpg)

2. To change the password I used the `passwd` command. Familiarized myself with the manual for the same command by executing `man passwd`. The command changes the content of the file __/etc/shadow__. Passwords are hashed with SHA.

![Screenshot2](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/2.jpg)

3. To find out who is logged into the system and what command is used I executed the `w` command. Then I read through the manual for the same command and executed it with the options `-hs`, where __-h__ removes the header and __-s__ shows the output in the short form.

![Screenshot3](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/3.jpg)

4. I used `chfn` command to change the user's information.

![Screenshot4](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/4.jpg)

5. Read the manuals about the `man` and `info` commands. Below are listed few of the available options that I found useful. Examples are shown on the screenshots as well.

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

6. Used `more --help` and `less --help` to familiarize myself with the commands. Executed the `more .bash*` and `less .bash*`. 

![Screenshot9](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/9.jpg)
![Screenshot10](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/10.jpg)
![Screenshot11](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/11.jpg)

7. Installed the __finger__ by running `sudo apt install finger` first, then ran it and captured that I logged in at 11:59 on the 2nd of April. 

![Screenshot12](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/12.jpg)

8. Read through the manual for `ls` command, executed it with the options `-l`, which provides the output in long format and `-a` that shows all entried starting with the dot. 

![Screenshot13](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/13.jpg)

## Task 4.1 Part 2

1. I installed the __tree__ by running `sudo apt install tree`. Then I ran it in my home directory, it gave a visual output, as shown below.

![Screenshot14](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/14.jpg)

Ran the `tree -Pa 's*'` to display the tree listing only files that start with the letter __s__.

![Screenshot15](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/15.jpg)

Then I executed the `tree -Pa 'user*'` to display only the files containing __user__ word.

![Screenshot16](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/16.jpg)

As the final step for this subtask I ran the `tree -L 2 /`, where __-L 2 /__ displays the depth of 2 in the root directory. 

![Screenshot17](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/17.jpg)
![Screenshot18](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/18.jpg)

2. The `file` command is used to determine the type of file. Example is below.

![Screenshot19](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/19.jpg)

3. Familiarized myself with the absolute and relative paths, navigated through the system using `cd` command. In order to go to the user's home folder, I found two ways:
a) `cd ~`
b) `cd /home/max`

![Screenshot20](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/20.jpg)

4. `ls` command lists the folders and files in the current directory. Option `-l` displays the same with in long format, showing information related to permissions, number of links, owner name, owner group, file size, time of last modification and the name, while `-a` presents all entries, includding hidden and the ones starting with the dot. Example is displayed below.

![Screenshot21](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/21.jpg)

5. To create the subdirectory in the home directory I ran `mkdir ~/Max`.

![Screenshot22](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/22.jpg)

As the next step I redirected the output of command `ls -d */` to the file __list_of_directories.txt__. `ls -d */ > ~/Max/list_of_directories.txt` and viewed its content by running `cat ~/Max/list_of_directories`. 

![Screenshot23](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/23.jpg)

Next, I copied the file to the user's directory using relative path by running the `cp Max/list_of_directories.txt list_of_directories.txt` command. As an alternative, ran `cp /home/max/Max/list_of_directories.txt /home/max/list_of_directories2.txt` command using absolute path. 

![Screenshot24](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/24.jpg)

Deleted the folder __Max__ and its content in the interactive mode by executing `rm -ri Max`.

![Screenshot25](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/25.jpg)

Deleted the other two files created previously - `rm list_of_directories.txt list_of_directories2.txt`.

![Screenshot26](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/26.jpg)

6. Created the subdirectory __test__ in the home directory - `mkdir test`. Copied the __.bash_history__ file and to the users home directory and renamed it to __labwork2__ - `cp .bash_history labwork2`.

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

7. To find all the files that contain the __squid__ and __traceroute__ sequence by using locate I executed the following - `locate *squid*` and `locate *traceroute*`.

![Screenshot32](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/32.jpg)

8. `lsblk` command shows the partitions that are mounted to the system.

![Screenshot33](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/33.jpg)

9. For this subtask, I chose to find the count of word __reboot__ in the file __.bash_history__. I executed the following command to achieve this `grep 'reboot' .bash_history | wc -l`

![Screenshot34](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/34.jpg)

10. To find all files containing the __host__ character sequence in the /etc directory I used the following command `find /etc -name 'host*'`

![Screenshot35](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/35.jpg)

11. This time to find all files in the __/etc__ directory that contain the __ss__ character sequence I executed the following commands:
`find /etc -name '*ss*'`
`ls -la /etc | grep 'ss'`

![Screenshot36](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/36.jpg)
![Screenshot37](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/37.jpg)

12. To organize a screen-by-screen print of the contents of the /etc directory I executed the following command `ls -la /etc | more`. On the other hand, the `ls -la /etc | less` could be used.

![Screenshot38](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/38.jpg)

13. Linux supports three types of hardware device: character, block and network. For character devices, the first letter is __c__, while for block - __b__. 

![Screenshot39](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/39.jpg)

14. There are seven types of files in Linux: normal files (-), block (b), character(c), symbolic links (l), pipes (p), sockets (s) and directories (d). `file` command is used to determine the type of the file.

![Screenshot40](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/40.jpg)

15. To find the last accessed 5 directories in the __/etc__ folder I ran the `ls -ltu /etc | grep ^d | head -5` command.

![Screenshot41](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.1/Screenshots/41.jpg)

## Summary
During this task I familiarized myself with the syntaxis of some common, frequently used commands and their options in Linux. 