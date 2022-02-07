## Module 2 - Virtualization and Cloud Basics
### Part 1. Hypervisors
#### What are the most popular hypervisors for infrastructure virtualization?
The most popular hypervisors for infrastructure virtualization are: VMware vSphere/ESXi, Microsoft Hyper-V, Citrix XenServer and KVM.
#### Briefly describe the main differences of the most popular hypervisors.
* VMware is the most stable hypervisor with an excellent performance and features among the others. It has the best support available, however at the same time it can be the most expensive solution.
* If the environment is running Windows Server virtual machines, then Hyper-V hypervisor is a good choice since it is available as a server role on Windows Server. In addition, the Hyper-V is free, but each Windows OS installed on the hosted VMs must be licensed separately. 
While Hyper-V and VMware vSphere/ESXi hypervisors are distributed under commercial license, the KVM is an open source (GPL license) hypervisor that comes with all the pros and cons of open source. 
* KVM is a virtualization module in Linux kernel that allows the kernel to function as hypervisor. It implies that the host OS is Linux based.
* Citrix XenServer is based on the Xen Project hypervisor. It is an industry-leading open-source platform for cost-effective cloud, server and desktop virtualization. Xen as well offers near native drivers for OSs like Microsoft Windows.
* Generally, all hypervisors have their usage advantages one over another and you should always consider the environment and cost, where those will be used to choose the most suitable solution for the needs of operation.

### Part 2. Work with VirtualBox
1. Downloaded and installed the VirtualBox. Separately downloaded the Ubuntu Server.
2. Created the VM VM1_Obukhovskyi, installed Ubuntu Server on it. Setup the necessary default settings.
Performed different actions with VM1_Obukhovskyi control as well as familiarized myself with the keyboard controls and
mouse capture functions.
3. Cloned the VM1_Obukhovskyi to VM2_Obukhovskyi, generated the new MAC address for NICs.
4. Created a group of two VMs: VM1_Obukhovskyi and VM2_Obukhovskyi. Viewed and tried available functions 
towards the new group.

![](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.1/images/1.jpg)

5. Changed the state of VM1_Obukhovskyi. Installed the net-tools, created a folder and a file. While doing
changes, I was creating few snapshots, as shown on the below screenshot.

![](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.1/images/2.jpg)

6. Successfully exported VM1_Obukhovskyi as an OVA file and then imported it back to the VirtualBox.
7. Navigated through the VM configuration options.
8. Configured the USB settings of the VM to make the USB stick plugged to host machine visible in the VM.
Mounted it to usb folder in the VM.

![](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.1/images/3.jpg)
![](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.1/images/4.jpg)

~~~
    cd /media                                     # Moved to /media folder
    sudo mkdir usb                                # Created usb folder
    sudo mount /dev/sdb1 /media/usb               # Mounted /dev/sdb1 content to /media/usb folder
~~~    
9. Shared the folder from host to the VM1_Obukhovskyi.

![](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.1/images/5.jpg)
![](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.1/images/6.jpg)

Executed few commands in Ubuntu, in order to access the shared folder
~~~
    sudo apt install virtualbox-guest-utils       # Installed Virtualbox guest utilities
    sudo adduser max vboxsf                       # Added user max to group vboxsf
    sudo reboot                                   # Performed reboot
    cd /media/sf_share                            # Relocated to the sf_share folder
    ls -la                                        # Listed the content
~~~
Folder is accessible and I can see the file that I created on the host machine previously.

![](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.1/images/7.jpg)

10. In the next task I tested the different modes for the network card adapter of the VMs. I used ping
command to test the reachability between the host machine, VMs and the internet. Below is the table with
findings

| Mode | Host->VM1,2 | VM1,VM2->Host | VM1<->VM2 | VM1,VM2->Internet, LAN | LAN->VM1,VM2 |
| ---- | ----------- | ------------- | --------- | ---------------------- | ------------ |
| NAT | PF | + | - | + | PF |
| Bridge| + | + | + | + | + |
| Internal | - | - | + | - | - |
| Host-only | + | + | + | - | - |
| NAT Network | PF | + | + | + | PF |

Since machines were cloned, they got the same machine-id.
I used PuTTY to SSH to test the port forwarding. The port forwarding was configured as indicated on the
screenshot below.

![](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.1/images/8.jpg)

For the Bridge connection, I had to enable the VirtualBox Bridged Networking Driver on the host machine's NIC.
For the Internal mode, I had to create the DHCP network first. I used the vboxmanage to achieve this with the
following command:
~~~
    vboxmanage dhcpserver add --network=internal --server-ip=10.10.10.1 --netmask=255.255.255.0 --lower-ip=10.10.10.2 --upper-ip=10.10.10.250 --enable
~~~
The Host-only network and the NAT Network modes were fairly simple to setup. NAT mode is similar to NAT Network with only
difference that in the NAT network mode VMs are unable to communicate with each other.

11. The purpose of the last task was to familiare myself with the VBoxManage CLI. I executed the
following commands in it:
~~~
    VBoxManage showvminfo VM1_Obukhovskyi                                                 # Showed the details of the VM1_Obukhovskyi
    VBoxManage showvminfo VM2_Obukhovskyi                                                 # Showed the details of the VM2_Obukhovskyi
    VBoxManage snapshot VM1_Obukhovskyi list                                              # Listed available snapshots for VM1_Obukhovskyi
    VBoxManage snapshot VM1_Obukhovskyi delete "Snapshot 2 - Installed net-tools"         # Deleted Snapshot 2
    VBoxManage snapshot VM1_Obukhovskyi delete "Snapshot 3 - Created folder and file"     # Deleted Snapshot 3
    VBoxManage snapshot VM1_Obukhovskyi list                                              # Verified the deletion of snapshots
    VBoxManage createvm --name=VM3_Obukhovskyi --register                                 # Created VM VM3_Obukhovskyi and registered it in the VirtualBox
    VBoxManage startvm VM1_Obukhovskyi                                                    # Started the VM VM1_Obukhovskyi
    VBoxManage modifyvm VM2_Obukhovskyi --memory=2048                                     # Increased the RAM size to 2Gb of the VM2_Obukhovskyi
    VboxManage clonevm VM2_Obukhovskyi --name=VM4_Obukhovskyi --register                  # Cloned VM2_Obukhovskyi to VM4_Obukhovskyi and registered it in the VirtualBox
    VBoxManage startvm VM4_Obukhovskyi                                                    # Started VM4_Obukhovskyi
    VBoxManage controlvm VM4_Obukhovskyi nic1 nat                                         # Changed the NIC1 to the NAT mode
    VBoxManage controlvm VM4_Obukhovskyi poweroff                                         # Gracefully shutdown the VM4_Obukhovskyi
~~~
Overall, the CLI gives an ability to operate within the VirtualBox and speeds up the process of manipulating with the virtual machines.

### Part 3. Work with Vagrant
For this task, I downloaded the Vagrant and installed it on my pc. I initialized the environment with the
default Vagrant box by running `init hashicorp/precise64` in the vagrant_test folder.
Next I ran the `vagrant up` and observed how the VM booted. As a next step, I connected to the VM using
SSH and executed the `date` command.

![](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.1/images/9.jpg)

Finally I shutdown and deleted this virtual machine to move forward with the next task.
~~~
    vagrant halt      # Gracefully shutdowns the VM
    vagrant destroy   # Deletes the VM
~~~
To complete the last task in the list I decided to install an ubuntu/trusty64 vagrant box. I moved to the other folder and ran `init ubuntu/trusty64`.
I executed the `vagrant up` and connected through ssh to the box.

![](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.1/images/10.jpg)
![](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m2/task2.1/images/11.jpg)

### Summary
During the past few days while doing the tasks in VirtualBox and Vagrant I expanded my knowledge and understanding related to those
tools. I familiarized myself with the graphical interface of VirtualBox and the most commonly used CLI commands in Vagrant and VirtualBox.
I can admit, that working with CLI will increase the deployment speed of the sandbox with VMs.
