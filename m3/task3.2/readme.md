# Module 3 - Network Fundamentals
## Task 3.2 - Connecting individual networks using the Internet and VLAN configuration
### Connecting individual networks using the Internet
1. This task was based on the setup completed in the previous 3.1 task. To create the Internet network I used routers __PT-Empty__, each one of them got 5 of __1CGE__ modules. I followed the requirements described in the task to interconnect the networks and routers.
~~~
Switch (Enterprise Network) -> (GE0/0) Router ISP1
Switch (Data Center)        -> (GE0/0) Router ISP3
Home Router (Home Office)   -> (GE0/0) Router ISP2
~~~
The screenshot below represents the achieved result.

![Screenshot1](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.2/Screenshots/1.jpg)

2. Internet network had to be configured with the following pattern: __(D+10).M.Y.0/24__, which resulted into __13.8.92.0/24__ network. I subnetted it into the smaller networks with the /26 netmask. The table below shows those subnets with details.

| | Subnet1 | Subnet2 | Subnet3 | Subnet 4 |
| - | - | - | - | - |
| Network | 13.8.92.0/26 | 13.8.92.64/26 | 13.8.92.128/26 | 13.8.92.192/26 |
| Broadcast | 13.8.92.63 | 13.8.92.127 | 13.8.92.191 | 13.8.92.255 |
| HostMin | 13.8.92.1 | 13.8.92.65 | 13.8.92.129 | 13.8.92.193 |
| HostMax | 13.8.92.62 | 13.8.92.126 | 13.8.92.190 | 13.8.92.254 |

_Note_: My date of birth is 03/08/1992.

3. I set the IP addresses for the routers on the interfaces as follows:

| Interface | IP Address with Netmask |
| - | - |
| Router ISP1 GE0/0 | 10.92.3.1/24 |
| Router ISP1 GE1/0 | 13.8.92.66/26 |
| Router ISP1 GE2/0 | 13.8.92.129/26 |
| Router ISP2 GE0/0 | 13.8.92.1/26 |
| Router ISP2 GE1/0 | 13.8.92.65/26 |
| Router ISP2 GE3/0 | 13.8.92.194/26 |
| Router ISP3 GE0/0 | 8.3.92.1/24 |
| Router ISP3 GE2/0 | 13.8.92.130/26 |
| Router ISP3 GE3/0 | 13.8.92.193/26 |

4. On all endpoints I set the default gateway IP address, depending on the network belonging.

| Network | Default Gateway IP Address |
| - | - |
| Home | 13.8.92.1 |
| Enterprise | 10.92.3.1 |
| Data Center | 8.3.92.1 |

![Screenshot2](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.2/Screenshots/2.jpg)

5. Ping command was used to test the reachability.

![Screenshot3](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.2/Screenshots/3.jpg)
![Screenshot4](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.2/Screenshots/4.jpg)
![Screenshot5](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.2/Screenshots/5.jpg)

### Configuring VLAN in Data Center network

6. This sub-task requires to check the connectivity between the servers in the Data Center network. I tested this using ping command from each endpoint and all of the servers were reachable. In addition, I used tracert to determine the route from the source server to the destination. Since all of the servers are located within one network and are connected through switch, there is only one hop present in the route. Few screenshots below display the output of ping and tracert commands.

![Screenshot6](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.2/Screenshots/6.jpg)
![Screenshot7](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.2/Screenshots/7.jpg)

7. Changed the subnet mask from __/24__ to __/26__ on the servers within Data Center network.
8. Since I changed the subnet mask from __/24__ to __/26__ the servers were separated to the individual subnets. I defined the outcome from this change in the table below.

| Name | IP Address | New Subnet IP addresses range (from HostMin to HostMax) |
| - | - | - |
| Web Server 1 | 8.3.92.50 | 8.3.92.1 to 8.3.92.62 |
| Web Server 2 | 8.3.92.100 | 8.3.92.65 to 8.3.92.126 |
| DNS Server | 8.3.92.150 | 8.3.92.129 to 8.3.92.190 |

In theory, the servers should not be able to communicated with each other, however we have a router in Data Center network, that knows the way to reach each individual server. (I tested the reachability by turning off Router ISP3, as a result the servers could not talk to each other)
Ultimately, with the subnet mask change, the route changed and had an additional hop to the __Router ISP3__ first and then to the destination server, as presented on the below screenshot. 

![Screenshot8](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.2/Screenshots/8.jpg)

9. I created on the Data Center __Switch2__ new VLANs and assigned the interfaces as follows: __FE0/2__ – __VLAN2__, __FE0/3__ – __VLAN3__, __FE0/4__ – __VLAN4__.
10. I tested the communication between the servers and it failed. This was an expected behavior, as I separated the servers with VLANs on the __Switch2__. VLANs create a logical separation between switch ports, thus each VLAN behaves as a separate physical switch.

![Screenshot9](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.2/Screenshots/9.jpg)
![Screenshot10](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.2/Screenshots/10.jpg)

11. Skipped the sub-task 11 and moved to the additional task.

### Additional task. Configuring routing between VLANs

12. I changed the __FE0/1__ interface on the __Switch2__ to trunk mode.
13. Emptied the IP address and Subnet mask fields on the interface __GE0/0__.
14. Opened the CLI on the __Router ISP3__ and executed the commands as shown on the screenshot below.

![Screenshot11](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.2/Screenshots/11.jpg)

15. I modified the default gateway on the servers as follows:

| Name | Default Gateway IP |
| - | - |
| Web Server 1 | 8.3.92.1 |
| Web Server 2 | 8.3.92.65 |
| DNS Server | 8.3.92.129 |

16. I tested the communication between the servers in the __Data Center__ network and it was successful. Few examples below. 

![Screenshot12](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.2/Screenshots/12.jpg)
![Screenshot13](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.2/Screenshots/13.jpg)

## Summary
In this task I setup the Internet network and made modification to the interfaces on the various equipment. I worked with the ping and tracert tools, configured VLANs and executed commands in the CLI. I exported the file "task3.2.pkt" with the current mini-project state and placed it in the m3/task3.2 folder.
