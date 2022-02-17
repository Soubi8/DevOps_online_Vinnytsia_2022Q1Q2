# Module 3 - Network Fundamentals
## Task 3.3 - Routing settings
1. This task was based on the setup completed in the previous 3.2 task (stage with step 11 configuration changes). I changed the IP addresses as described in the __task3.3__.

![Screenshot1](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.3/Screenshots/1.jpg)

In addition I configured the routing tables on the ISP1, ISP2, and ISP3 routers. One example is displayed below.

![Screenshot2](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.3/Screenshots/2.jpg)

| Router | Static Route 1 | Static Route 2 |
| - | - | - |
| ISP1 | 35.4.99.192/26 via 35.4.99.2 | 4.25.99.0/24 via 35.4.99.66 |
| ISP2 | 10.99.25.0/24 via 35.4.99.1 | 4.25.99.0/24 via 35.4.99.130 |
| ISP3 | 35.4.99.192/26 via 35.4.99.129 | 10.99.25.0/24 via 35.4.99.65 |

2. Configured routing on the __Home Router__ by adding IP of the __Router ISP2__ as the default gateway to the __Internet__ network.

![Screenshot3](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.3/Screenshots/3.jpg)

3. I checked the reachability from one network to another by using ping and tracert commands. The communication between networks was possible as I added the static routes previously. Below is an example of executing ping and tracert commands from __DNS Server__ to __DHCP Server__.

![Screenshot4](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.3/Screenshots/4.jpg)

### Additional task. Configuring dynamic routing
4. I deleted the existing static routes in the first place.
5. As the next step, I configured the RIP protocol on the routers. The networks which are directly connected to the source router were added to the RIP routing configuration in a class format. See the example of __RIP routing__ for __Router ISP3__ below.

![Screenshot5](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.3/Screenshots/5.jpg)

This table represents the entries made to the __RIP Routing__ for each router.

| Router | Entry 1 | Entry 2 |
| - | - | - |
| ISP1 | 35.0.0.0 | 10.0.0.0 |
| ISP2 | 35.0.0.0 | n/a |
| ISP3 | 35.0.0.0 | 4.0.0.0 |

6. Verified the communication using ping and checked the route from __Web Server 1__ to __Client2__ by executing tracert. Since RIP routing protocol was configured, the communication flew as expected. 

![Screenshot6](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.3/Screenshots/6.jpg)

## Summary
In this task I worked with the routing. I configured static routing as well as RIP routing on the ISP routers to enable the flow of communication between the separate networks. I used the ping tool to verify the network reachability and tracert to check the route for the traffic flow. The file __task3.3.pkt__ with the current mini-project state was exported and placed in the _m3/task3.3_ folder.
