# Module 4 - Linux Essentials
## Task 4.2 Part 1
### 1. Analyze the structure of the /etc/passwd and /etc/group file, what fields are present in it, what users exist on the system? Specify several pseudo-users, how to define them?

I analyzed my account entry in the `/etc/passwd` file `max:x:1000:1000:Max,123,380382009900,380382112233:/home/max:/bin/bash`.

![Screenshot1](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.2/Screenshots/1.jpg)

- username `max`
- password is stored in the `etc/shadow`
- the UID (User ID) and GID (Group ID) values are `1000`
- GECOS (User ID Info) has value `Max,123,380382009900,380382112233`
- home directory is located at `/home/max`
- user's shell `/bin/bash`
Here is the breakdown of the `/etc/group` file's `sudo:x:27:max` entry:

![Screenshot2](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.2/Screenshots/2.jpg)

- group name `sudo`
- password, generally not used and is set to blank
- GID (Group ID) value `27`
- group list with its members `max`
`getent /etc/passwd` command is used to see the existing users on the system. 
Pseudo users are related to system and program services. Example of pseudo-user is below.

![Screenshot3](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.2/Screenshots/3.jpg)

### 2. What are the uid ranges? What is UID? How to define it?

__UID__ is the User Identifier, the value, by which the Unix-like operating system identifies the user.

![Screenshot4](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.2/Screenshots/4.jpg)

- 0 is reserved for the root
- 1...999 are reserved by system for administrative and system accounts/users
- 65534 is called a nobody UID
- 65535 is not in use, because it was the API error return value when uid_t was 16 bits
- 1000...65533 and 65536…4294967294 are used for user accounts

`usermod -u 2022 testuser` can be executed to change the UID value.

### 3. What is GID? How to define it?

__GID__ is the Group Identifier, the value, which identifies the group.

- 0 is reserved for the root group
- 1...99 are reserved for the system and application use
- 100 and above are allocated for user groups

`groupmod -g 2022 testgroup` can be used to change the GID value.

### 4. How to determine belonging of user to the specific group?

`groups` command should be executed to identify the groups membership of the user.

![Screenshot5](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.2/Screenshots/5.jpg)

### 5. What are the commands for adding a user to the system? What are the basic parameters required to create a user?

`useradd` and `adduser` are used to add a user to the system. The minimum required information is the username. Other than that it might be necessary to create a home folder for the given user, it can be achieved by adding an `-m` option. Example is below.

![Screenshot6](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.2/Screenshots/6.jpg)

### 6. How do I change the name (account name) of an existing user?

To change the account name `usermod -l new_username old_username` should be ran. Example is below. 

![Screenshot7](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.2/Screenshots/7.jpg)

### 7. What is skell_dir? What is its structure?
__skel__ for skeleton, basic structure of the home directory. The `/etc/skel` directory contains files and directories that are automatically copied over to a new user’s when it is created from `useradd` command. The location of `/etc/skel` can be changed by editing the line that begins with `SKEL=` in the configuration file `/etc/default/useradd`.

![Screenshot8](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.2/Screenshots/8.jpg)

### 8. How to remove a user from the system (including his mailbox)?

`userdel -r username` should be used to remove the user and his mailbox from the system.

![Screenshot9](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.2/Screenshots/9.jpg)

### 9. What commands and keys should be used to lock and unlock a user account?

To unlock the user account: `passwd -u username` or `usermod -U username`.
To lock the user account: `passwd -l username` or `usermod -L username`.

![Screenshot10](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.2/Screenshots/10.jpg)

### 10. How to remove a user's password and provide him with a password-free login for subsequent password change?

`passwd -d username` can be used to remove the password, following with the `passwd -e username` to set the password to immediately expire, which in turn will force the user to change the password at the user's next login.

![Screenshot11](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.2/Screenshots/11.jpg)

![Screenshot12](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.2/Screenshots/12.jpg)

### 11. Display the extended format of information about the directory, tell about the information columns displayed on the terminal.

I will explain the information columns based on the below example of directory.

![Screenshot13](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.2/Screenshots/13.jpg)

- `d` file type
- `rwxr-xr-x` are permissions
- `2` number of hard links
- `max` owner's account
- `max` group name
- `4096` file size
- `бер 23 14:51` last modification time
- `Desktop` file name

### 12. What access rights exist and for whom (i. e., describe the main roles)? Briefly describe the acronym for access rights.

The permissions consist of 3 blocks:
- 3 bits of owner rights
- 3 bits of group rights
- 3 bits of everyone else's rights

Based on the next example, I will explain the rights in details.
`drwxr-xr-x 2 max max 4096 бер 23 14:51 Pictures`

The permissions are set as follows:
- `rwx` owner has read, write and execute rights
- `r-x` group has read and execute rights
- `r-x` everyone else has read and execute rights

### 13. What is the sequence of defining the relationship between the file and the user?

When it comes to the relationship between the file and the user who started the process, the role is determined as follows:

If the __UID__ of the file is the same as the __UID__ of the process, the user is the owner of the file. If the __GID__ of the file matches the __GID__ of any group the user belongs to, he is a member of the group to which the file belongs.
If neither the __UID__ no the __GID__ of a file overlaps with the __UID__ of the process and the list of groups that the user running it belongs to, that user is an outsider.

### 14. What commands are used to change the owner of a file (directory), as well as the mode of access to the file? Give examples, demonstrate on the terminal.

`chmod` command is used to change the access to the file.

![Screenshot14](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.2/Screenshots/14.jpg)

As displayed on the above example, I granted read, write and execute access to the owner, group and everyone else on the `file1` by running `chmod 777 file1`. Other than that I removed the read, write and execute permissions from group on `directory2` by executing `chmod g-rwx directory2`

`chown` command is used to change the owner of the file.

![Screenshot15](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.2/Screenshots/15.jpg)

### 15. What is an example of octal representation of access rights? Describe the umask command.

Each of the permission may be specified with an octal number:
- read = 4
- write = 2
- execute = 1 
- no permission = 0

The octal equivalents are derived by adding the numbers associated with the four basic permissions. Table below displays the breakdown.

| Octal number | Symbolic | Permission |
| - | - | - |
| 0 | --- | none |
| 1 | --x | execute |
| 2 | -w- | write |
| 3 | -wx | execute and write |
| 4 | r-- | read |
| 5 | r-x | read and execute |
| 6 | rw- | read and write |
| 7 | rwx | read, write and execute |

The `umask` is the utility that can be used to change the default permission mask in the system for the newly created folders and files. The default permissions for files are 66 (read and write), for directories are 777 (read, write and execute). 

I changed the default umask to 0022, so the permissions will be set as follows:
- File 666-022=644
- Directory 777-022=755

![Screenshot16](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.2/Screenshots/16.jpg)

### 16. Give definitions of sticky bits and mechanism of identifier substitution. Give an example of files and directories with these attributes.

The sticky bit is a special permission which prevents directory from being deleted by anyone except the owner and root. `chmod` is used to add the sticky bit to the file or directory.

![Screenshot17](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m4/task4.2/Screenshots/17.jpg)

The __SUID__ bit is present for files which have executable permissions. This bit indicates that when running the executable, it will set its permissions to that of the user who created it (owner), instead of setting it to the user who launched it. Similarly, there is a __SGID__ bit which does the same for the gid.

### 17. What file attributes should be present in the command script?

The command script should have `x` (executable) attribute in the permissions.

## Summary
During this task I familiarized myself with the access rights hierarchy, permissions and got an additional knowledge about structure of some system files in the Linux system.  