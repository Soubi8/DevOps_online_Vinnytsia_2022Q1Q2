# Module 4 - Linux Essentials
## Task 4.3 Part 1
### 1. How many states could has a process in Linux?
There are 5 process states in Linux:
- __RUNNING or RUNNABLE (R)__. RUNNING processes are processes using a CPU core right now, a RUNNABLE process is a process that has everything to run and is just waiting for a CPU core slot.
- __UNINTERRUPTABLE_SLEEP (D)__. Sleeping state indicates that the process is currently waiting on certain resources. When a process is in UNINTERRUPTABLE_SLEEP, it will not wake up from the middle of sleep even though new signals are sent to it.
- __INTERRUPTABLE_SLEEP (S)__. When a process is in INTERRUPTABLE_SLEEP, it will wake up from the middle of sleep and process new signals sent to it.
- __STOPPED (T)__. This state indicates that the process has been suspended from proceeding further. In Linux when you issue the `Ctrl + Z` command it will issue a SIGSTOP signal to the process. When the process receives this signal it will be suspended/stopped from executing further. When a process is in STOPPED state, it will only handle SIGKILL and SIGCONT signals. SIGKILL signal will terminate the process, but the SIGCONT signal will put the process back into RUNNING/RUNNABLE state.
- __ZOMBIE (Z)__. A process will terminate when it calls "system exit" API or when someone else kills the process. When a process terminates, it will release all the data structures and the resources it holds. However, it will not release its slot in the "process" table. Instead, the process will send a SIGCHLD signal to its parent process. Now it is up to the parent process to release the child process slot in the "process" table. The process will be in ZOMBIE state from the time the child process issues the SIGCHLD signal until the parent process releases the slot in the "process" table.

### 2. Examine the pstree command. Make output (highlight) the chain (ancestors) of the current process.
`pstree` command displays the currently running processes in a tree form. To highlight the chain (ancestors) of the current process the `-h` option should be used.

![Screenshot1](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/1.jpg)

### 3. What is a proc file system?
__proc__ is a pseudo-file system, which is created on the fly. It doesn't contain "real" files but runtime system information (e.g. system memory, devices mounted, hardware configuration, etc). For this reason it can be regarded as a control and information centre for the kernel. In Linux, `/proc` includes a directory for each running process, including kernel processes, in directories named `/proc/PID`.

### 4. Print information about the processor (its type, supported technologies, etc.).
There are several ways to display the details about processor. `lscpu` command displays the information about processor in the user-friendly format.

![Screenshot2](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/2.jpg)

The `/proc/cpuinfo` file in turn contains details about individual cpu cores. 

### 5. Use the ps command to get information about the process. The information should be as follows: the owner of the process, the arguments with which the process was launched for execution, the group owner of this process, etc.

To achieve the requested sequence of information I executed the `ps -eo "pid,gid,uid,comm,cputime,start,user" | head -10`

![Screenshot3](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/3.jpg)

### 6. How to define kernel processes and user processes?

In it is life span a process executes in user mode and kernel mode. The User mode is normal mode where the process has limited access. While the Kernel mode is the privileged mode where the process has unrestricted access to system resources like hardware, memory, etc.

### 7. Print the list of processes to the terminal. Briefly describe the statuses of the processes. What condition are they in, or can they be arriving in?

I executed the `ps au` to display the list of processes. The column __STAT__ displays their state. 

![Screenshot4](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/4.jpg)

Few different states can be observed on the above screenshot. 
- __S__ means interruptable sleep
- __T__ means that the process is stopped
- __+__ means that the process is in the foreground
- __l__ means it is multi-threaded
- __s__ means session leader
- __R__ means that the process is running or runnable

### 8. Display only the processes of a specific user.

![Screenshot5](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/5.jpg)

### 9. What utilities can be used to analyze existing running tasks (by analyzing the help for the ps command)?
`ps a` shows the processes in the running state only. 

![Screenshot6](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/6.jpg)

Other than that, manual suggests to use the other available utilities: `pgrep`, `top`, `pstree` and `proc`.

### 10. What information does top command display?

The `top` command (table of processes) displays the processor activity of the Linux system and also shows tasks managed by the kernel in real-time. It also presents information about CPU and memory utilization of a list of running processes.

### 11. Display the processes of the specific user using the top command.

`top -u username` is used to display the processes of a specific user.

![Screenshot7](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/7.jpg)

### 12. What interactive commands can be used to control the top command? Give a couple of examples.

There are several interractive commands available to control the `top` command, few examples are listed in the below table:

| Command | Purpose |
| - | - |
| Shift+P | Sorts the processes by CPU utilization |
| Shift+M | Sorts the processes by memory usage |
| Shift+T | Sorts the processes by cumulative time |
| I | Shows idle processes |
| K | Kills the process, PID should be entered |
| Q | Exits the utility |

### 13. Sort the contents of the processes window using various parameters (for example, the amount of processor time taken up, etc.)

- `top -o TIME+` sorts the processes by the time
- `top -o %CPU` sorts the processes by the CPU utilization

![Screenshot8](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/8.jpg)

### 14. Concept of priority, what commands are used to set priority?

There are a total of 140 priorities and two distinct priority ranges implemented in Linux. The first one is a __nice__ value (niceness) which ranges from __-20__ (highest priority value) to __19__ (lowest priority value) and the default is __0__. The other is the real-time priority, which ranges from __1__ to __99__ by default, then __100__ to __139__ are meant for user-space. `ps -eo pid,ni,command` can be used to display the niceness of the processes.

On the below screenshot, the __NI__ the column shows the niceness of processes. 

![Screenshot9](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/9.jpg)

`nice -n niceness-value [command args]` can be used to set the niceness for the command. To modify the niceness of the process `renice -n niceness_value -p [pid]` should be utilized. 

### 15. Can I change the priority of a process using the top command? If so, how?

After executing the `top` command, press __R__ and specify the __PID__ value of the process. Then provide the `renice` value, from __-20__ to __19__.  

### 16. Examine the kill command. How to send with the kill command process control signal? Give an example of commonly used signals.

The `kill` command sends a signal to specified processes or process groups, causing them to act according to the signal. When the signal is not specified, it defaults to `-15` __(-TERM)__.

The most commonly used signals are:

- `1` __(HUP)__ - reloads a process
- `9` __(KILL)__ - kills a process
- `15` __(TERM)__ - gracefully stops a process

`kill -l` can be used to list all available signals.

![Screenshot10](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/10.jpg)

### 17. Commands jobs, fg, bg, nohup. What are they for? Use the sleep, yes command to demonstrate the process control mechanism with fg, bg.

`jobs` command is used to list the jobs that you are running in the background and in the foreground. 

`fg` command, short for the foreground, is a command that moves a background process on your current Linux shell to the foreground.

`bg` is a job control command. It resumes suspended jobs in the background, returning the user to the shell prompt while the job runs.

`nohup` is a command in Linux systems that runs the process even after logging out from the shell/terminal.

![Screenshot11](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/11.jpg)

## Task 4.3 Part 2
### 1. Check the implementability of the most frequently used OPENSSH commands in the MS Windows operating system. (Description of the expected result of the commands +screenshots: command – result should be presented)

`ssh username@servername` command can be used to ssh to the target system. On the below screenshot, I ssh to my Ubuntu box using port 5679 by specifying `-p` option.

![Screenshot12](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/12.jpg)

`ssh-keygen` can be used to generate the ssh keys.

### 2. Implement basic SSH settings to increase the security of the client-server connection (at least)

To increase the security level, I have changed several options:
- Changed the default port from 22 to another value
- Set the ``MaxAuthTries 3` and `MaxSessions 5`
- Restricted login without password `PermitEmptyPasswords no`
- Set `PasswordAuthentication no` to avoid logins with password
- Set `PubkeyAuthentication yes` to use public key infrastructure authentication

### 3. List the options for choosing keys for encryption in SSH. Implement 3 of them.

The available options are listed in the manual for `ssh-keygen`, those are displayed below.

![Screenshot13](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/13.jpg)

I used the following key `ssh-keygen -t rsa -b 4096 -o -a 250`, where: 

- `-t` - key type
- `-b` - number of bits in the key
- `-a` - number of encryption rounds

![Screenshot14](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/14.jpg)

### 4. Implement port forwarding for the SSH client from the host machine to the guest Linux virtual machine behind NAT.

![Screenshot15](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/15.jpg)

![Screenshot16](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/16.jpg)

### 5*. Intercept (capture) traffic (tcpdump, wireshark) while authorizing the remote client on the server using ssh, telnet, rlogin. Analyze the result.

I connected to the VM, where my Ubuntu is hosted using `ssh` and `telnet`. Below screenshots display the connection details. Wireshark's packet capture is available as well for both connections. 

![Screenshot17](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/17.jpg)

![Screenshot18](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/18.jpg)

![Screenshot19](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/Screenshots/19.jpg)

[ssh.pcapng](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/ssh.pcapng)
[telnet.pcapng](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.3/telnet.pcapng)

## Summary
During this task I familiarized myself with the processes and their states in Linux. I learned how to view the processes and their states using utilities like `ps`, `pstree` and `top`. Other than that, I enhanced my knowledge related to the SSH protocol.