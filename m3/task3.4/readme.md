# Module 3 - Network Fundamentals
## Task 3.4 - Configuring DHCP, DNS, NAT
1. This task was based on the setup completed in the previous 3.3 task. 

![Screenshot1](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.4/Screenshots/1.jpg)

2. Configured and enabled the __DHCP Service__ on the __DHCP Server__.

![Screenshot2](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.4/Screenshots/2.jpg)

3. On the __Client1__ and __Client2__ set the IP Configuration to DHCP. 

![Screenshot3](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.4/Screenshots/3.jpg)
![Screenshot4](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.4/Screenshots/4.jpg)

4. Next, configured the DHCP on the __Home Router__. Set it on and verified whether the __Client3__ got the new IP configuration.

![Screenshot5](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.4/Screenshots/5.jpg)
![Screenshot6](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.4/Screenshots/6.jpg)

5. To verify the DNS service I made the following assignments: __Web Server 1__ = __domain1.com__, __Web Server 2__ = __domain2.com__.
6. On the __DNS Server__ I added the respective __A__ records and turned the service on, as shown below.

![Screenshot7](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.4/Screenshots/7.jpg)

7. Added the IP address of the __DNS Server__ to the DHCP settings on the __DHCP Server__. On the Client1, 2, 3, set the IP configuration to Static and then back to DHCP to get the updated configuration.
8. Checked the reachability from Client1, 2, 3, to the domain1.com and domain2.com. One example shown below.

![Screenshot8](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.4/Screenshots/8.jpg)

### Additional task. Configuring Port Forwarding on the Home Router
9. Added the __Home Server__ to the __Home Office__ network and set it with the static IP address - __192.168.0.100__.
10. Modified the index.html on the __Home Server__ as displayed below.

![Screenshot9](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.4/Screenshots/9.jpg)

11. Configured the Port Forwarding on the __Home Router__.

![Screenshot10](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.4/Screenshots/10.jpg)

12. Added the __A__ record of the __Home Server__ to the __DNS Server__.

![Screenshot11](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.4/Screenshots/11.jpg)

13. On the __Client1__ went to the __domain3.com__ using web browser. Website was displayed with the correct changes that were done to index.html file previously.

![Screenshot12](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m3/task3.4/Screenshots/12.jpg)

## Summary
I worked with the DHCP, DNS and NAT services within the scope of this task. It was quite an interesting journey of working with Cisco Packet Tracer in the Module 3. To summarize, I refreshed my memory on the network fundamentals. The file __task3.4.pkt__ with the final mini-project state was exported and placed in the _m3/task3.4 folder_.
