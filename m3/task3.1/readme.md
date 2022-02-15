## Module 3 - Network Fundamentals
### Task 3.1 - Creating Home Office, Enterprise and Data Center networks
1. This and the other tasks in the module were completed in the Cisco Packet Tracer software. For the first sub-task I had to reproduce the network layout as shown in the hometask. This was achieved by dragging
the icons to the main area in the application. Below screenshot represents the achieved result.
_Note_: My date of birth is 03/08/1992. 

![Screenshot1](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.1/Screenshots/1.jpg)

2. Task required to use the custom static IP octets for the __Enterprise__ network. The following pattern was used __10.Y.D.0/24__, where __Y__ = __92__ (year of birth), __D__ = __3__ (day of birth), resulting to __10.92.3.0/24__ network. 
~~~
Client1 IP      = 10.92.3.10 
Client2 IP      = 10.92.3.20
DHCP_Server IP  = 10.92.3.100
~~~
3. Once the devices in the __Enterprise__ network have been connected, I tested the reachability utilizing the ping command. From Client1 I pinged the other two endpoints. 

![Screenshot2](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.1/Screenshots/2.jpg)

4. For the __Data Center__ network the static IP addresses followed the next pattern: __M.D.Y.0/24__, where __M__ = __8__, __D__ = __3__, __Y__ = __92__, resulting to __8.3.92.0/24__ network.
~~~
Web Server 1 IP = 8.3.92.50
Web Server 2 IP = 8.3.92.100
DNS Server IP   = 8.3.92.150
~~~
5. After assigning the static IP addresses to the endpoints I tested the connectivity using ping command.

![Screenshot3](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.1/Screenshots/3.jpg)

6. I installed WiFi module _PT-HOST-NM-1W_ instead of the Ethernet module on the __Client3__.
7. For __Client3__ I set the next the IP address - __192.168.0.13__ (D+10 for the last octet). 
8. Next, I verified the communication with the wireless router __Home Router__.

![Screenshot4](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.1/Screenshots/4.jpg)

### Additional task. Exploring the packet structure with the help of Wireshark packet analyzer
I installed the Wireshark software and set it to capture the traffic from my wireless network interface. I downloaded a Google Chrome standalone installer to get a traffic flow on the network interface and stopped the capture. I found and inspected the TCP segment and highlighted on the below screenshot the required details.

![Screenshot5](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.1/Screenshots/5.jpg)
~~~
Source MAC address:         18:56:80:cd:08:11
Destination MAC address:    00:15:5d:92:76:0d     
Source IP address:          172.29.12.121          
Destination IP address:     93.184.215.201
Source TCP port:            65466
Destination TCP port:       443
~~~
### Summary
In this task I created the predefined networks using Cisco Packet Tracer software. I set the IP addresses as required in the task and verified the communication presense between endpoints. I exported the file __task3.1.pkt__ and placed it in the _m3/task3.1_ folder.
