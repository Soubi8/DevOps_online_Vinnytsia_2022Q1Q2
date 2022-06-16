# Module 5 - Linux Networking
## Task 5.1
### Prerequisites. Практична частина модуля Linux Networking передбачає створення засобами Virtual Box мережі, що показаний на рисунку 1.

<p align="center">
  <img src="https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/1.jpg" />
</p>

### Host – це комп’ютер, на якому запущений Virtual Box; Server_1 – Віртуальна машина, на якій розгорнуто ОС Linux. Int1 цієї машини в режимі «Мережевий міст» підключений до мережі Net1, тобто знаходиться в адресному просторі домашньої мережі. IP-адреса Int1 встановлюється статично відповідно до адресного простору, наприклад 192.168.1.200/24. Інтерфейси Int2 та Int3 відповідно підключено в режимі «Внутрішня мережа» до мереж Net2 та Net3. Client_1 та Client_2 – Віртуальні машини, на яких розгорнуто ОС Linux (бажано різні дистрибутиви, наприклад Ubuntu та CentOS). Інтерфейси підключені в режимі «Внутрішня мережа» до мереж Net2, Net3 та Net4 як показано на рисунку 1. Адреса мережі Net2 – 10.Y.D.0/24, де Y – дві останні цифри з вашого року народження, D – дата народження. Адреса мережі Net3 – 10.M.Y.0/24, де M – номер місяця народження. Адреса мережі Net4 – 172.16.D.0/24. __Увага!__ Якщо, адресний простір Net2, Net3 або Net4 перетинається з адресним простором Net1 – відповідну адресу можна змінити на власний розсуд.

Based on the prerequisites I prepared 3 VMs. Host PC is operated on the Windows 10 OS.

| VM | OS Version |
| - | - |
| Client1 | Ubuntu Desktop 20.04 |
| Server1 | Ubuntu Server 18.04 |
| Client2 | CentOS 7 |

![Screenshot2](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/2.jpg)

![Screenshot3](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/3.jpg)

![Screenshot4](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/4.jpg)

My date of birth is __03.08.1992__, based on this information the networks will be set as follows:

| Network | Address space with CIDR |  
| - | - |
| Net1 | 192.168.88.0/24 |
| Net2 | 10.92.3.0/24 |
| Net3 | 10.8.92.0/24 |
| Net4 | 172.16.3.0/24 |

While the interfaces will be set as displayed in the below table:

| Host | Interface | IP Address with CIDR |
| - | - | - |
| Host PC | WLAN | 192.168.88.254/24 |
| Server1 | Int1 | 192.168.88.253/24 |
| Server1 | Int2 | 10.92.3.1/24 |
| Server1 | Int3 | 10.8.92.1/24 |
| Client1 | Int1 | 10.92.3.2/24 |
| Client1 | Int2 | 172.16.3.1/24 |
| Client2 | Int1 | 10.8.92.2/24 |
| Client2 | Int2 | 172.16.3.2/24 |

![Screenshot5](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/5.jpg)

![Screenshot6](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/6.jpg)

![Screenshot7](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/7.jpg)

Host PC has the following NIC connected connected to the Internet. 

![Screenshot8](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/8.jpg)

### 1. На Server_1 налаштувати статичні адреси на всіх інтерфейсах.
In order to set the network configuration I modified the `00-installer-config.yaml` file located in `/etc/netplan` directory by using __nano__ editor `sudo nano /etc/netplan/00-installer-config.yaml`. `dchp4` has to be set to `no` in order to have a static IP address. Then the other options should be specified for each network interface.

    network:
      version: 2
      renderer: networkd
      ethernets:
        enp0s3:
          dhcp4: no
          addresses: [192.168.88.253/24]
          gateway4: 192.168.88.1
          nameservers:
              addresses: [192.168.88.1, 8.8.8.8, 8.8.4.4]
        enp0s8:
          dhcp4: no
          addresses: [10.92.3.1/24]
        enp0s9:
          dhcp4: no
          addresses: [10.8.92.1/24]

I executed the `sudo netplan apply` command, which parses the `*.yaml` file and applies the changes to the system according to the content of the file. 

![Screenshot9](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/9.jpg)

Output of the `ifconfig` command is shown below.

![Screenshot10](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/10.jpg)

Output of the `ip addr` command.

![Screenshot11](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/11.jpg)

### 2. На Server_1 налаштувати DHCP сервіс, який буде конфігурувати адреси Int1 Client_1 та Client_2
In order to achieve this, first of all I installed the `dhcpd` by executing the `sudo apt install isc-dhcp-server` command on the Server1. The DHCP service configuration file resides in the following location - `/etc/dhcp/dhcpd.conf`.

I will edit it to assign IP addresses on the `Int1` of the `Client1` and `Client2` - `sudo nano /etc/dhcp/dhcpd.conf`. Adding the `Net2` and `Net3` details to the file.

    subnet 10.92.3.0 netmask 255.255.255.0 {
      range 10.92.3.1 10.92.3.10;
      option broadcast-address 10.92.3.255
      option routers 10.92.3.1;
      option domain-name-servers 10.92.3.1, 8.8.8.8, 8.8.4.4;
      default-lease-time 3600;
      max-lease-time 7200;
    }
    
    subnet 10.8.92.0 netmask 255.255.255.0 {
      range 10.8.92.2 10.8.92.10;
      option broadcast-address 10.8.92.255
      option routers 10.8.92.1;
      option domain-name-servers 10.8.92.1, 8.8.8.8, 8.8.4.4;
      default-lease-time 3600;
      max-lease-time 7200;
    }

Other than that, it is important to edit the `/etc/default/isc-dhcp-server` to specify the interfaces `dhcpd` should listen to. 

    INTERFACESv4="enp0s8 enp0s9"

![Screenshot12](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/12.jpg)

In addition, I uncommented the line with word `authoritative;`. Then I verified whether the parser found any errors in the configuration file by executing the following command - `dhcpd -t -cf /etc/dhcp/dhcpd.conf`.

![Screenshot13](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/13.jpg)

Adding the `dhcpd` service in the autostart and starting it.

    sudo systemctl enable isc-dhcp-server.service
    sudo systemctl start isc-dhcp-server.service

![Screenshot14](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/14.jpg)

On the __Client1__ I edited the `/etc/netplan/01-network-manager-all.yaml` file and set the adapter `enp0s3` to __DHCP__.

![Screenshot15](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/15.jpg)

I verified the leases by executing `dhcp-lease-list`. After running a command, I've noticed that the only __Client1__ received an IP address, while __Client2__ did not. 

On the __Client2__ I edited the file for the respective interface.

`sudo vi /etc/sysconfig/network-scripts/ifcfg-enp0s3`

Modified the last option `ONBOOT` and set it to `ONBOOT=yes`.

![Screenshot16](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/16.jpg)

Then executed the `systemctl restart NetworkManager` and verified whether the IP address was assigned.

![Screenshot17](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/17.jpg)

On the __Server1__ verified the leases once again and verified the assignment on the __Client1__.

![Screenshot18](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/18.jpg)

![Screenshot19](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/19.jpg)

The __Int2__ on the __Client1__ was set to static IP address.

![Screenshot20](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/20.jpg)

The __Int2__ on the __Client2__ was set to static IP address.

![Screenshot21](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/21.jpg)

### 3. За допомогою команд ping та traceroute перевірити зв'язок між віртуальними машинами. Результат пояснити. Увага! Для того, щоб з Client_1 та Client_2 проходили пакети в мережу Internet (точніше щоб повертались з Internet на Client_1 та Client_2) на Wi-Fi Router необхідно налаштувати статичні маршрути для мереж Net2 та Net3
Intsalled the `traceroute` utility on both client VMs. For this, temporarily enabled one more network adapter set to __Bridged Adapter__. After installing the utility, the interface was disabled.

- `sudo apt install traceroute` on __Client1__
- `sudo yum install traceroute` on __Client2__

I attempted to `ping` and `traceroute` the other network addresses from __Client1__

![Screenshot22](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/22.jpg)

![Screenshot23](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/23.jpg)

| IP Address | Reachability |
| - | - |
| 10.92.3.1 | Yes |
| 10.8.92.2 | No |
| 172.16.3.2 | Yes |
| 8.8.8.8 | No |

I attempted to `ping` and `traceroute` the other network addresses from __Client2__

![Screenshot24](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/24.jpg)

![Screenshot25](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/25.jpg)

| IP Address | Reachability |
| - | - |
| 10.8.92.1 | Yes |
| 10.92.3.2 | No |
| 172.16.3.1 | Yes |
| 8.8.8.8 | No |

Basically, the clients are able to reach the IP addresses which they are connected to directly, because routing is switched off by default. Next, I enabled the routing on the __Server1__ which serves as a Default Gateway for both clients.

    sysctl net.ipv4.conf.all.forwarding     #Checks the status of the routing. 0 = Disabled, 1 = Enabled

Verified the status, found it disabled. Enabled the routing by editing `/etc/sysctl.conf` file. There I uncommented the `net.ipv4.ip_forward=1`. 

![Screenshot26](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/26.jpg)
![Screenshot55](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/55.jpg)

I added the static route on my router, as shown below in order to have the replies from ping to reach the clients.

![Screenshot27](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/27.jpg)

After that I repeated the scenario of pinging and tracerouting interfaces as done previously. Results are shown below. As expected, all worked fine.

![Screenshot28](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/28.jpg)
![Screenshot29](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/29.jpg)
![Screenshot30](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/30.jpg)
![Screenshot31](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/31.jpg)

### 4. На віртуальному інтерфейсу lo Client_1 призначити дві ІР адреси за таким правилом: 172.17.D+10.1/24 та 172.17.D+20.1/24. Налаштувати маршрутизацію таким чином, щоб трафік з Client_2 до 172.17.D+10.1 проходив через Server_1, а до 172.17.D+20.1 через Net4. Для перевірки використати traceroute.
To set the __lo__ interface on the __Client1__ to the following addresses I executed the following:

    sudo ip a add 172.17.13.1/24 dev lo
    sudo ip a add 172.17.23.1/24 dev lo

![Screenshot32](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/32.jpg)

To make the traffic path from __Client_2__ to the __172.17.13.1__ IP address through the __Server1__ I added a route on the __Server1__ as the first step -  
`sudo ip route add 172.17.13.0/24 via 10.92.3.2 metric 10`

![Screenshot33](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/33.jpg)

As the next step, I added the route on the __Client_2__ - `sudo ip route add 172.17.13.0/24 via 10.8.92.1 metric 10` 

![Screenshot34](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/34.jpg)

As the result, the traffic from __Client_2__ travels through __Server1__ to the __172.17.13.1__ IP address.

To make the traffic path from __Client_2__ to the __172.17.23.1__ IP address through the __Net4__ I ran the next command on the __Client_2__ -  
`sudo ip route add 172.17.23.0/24 via 172.16.3.1 metric 10`

![Screenshot35](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/35.jpg)

### 5. Розрахувати спільну адресу та маску (summarizing) адрес 172.17.D+10.1 та 172.17.D+20.1, при чому маска має бути максимально можливою. Видалити маршрути, встановлені на попередньому кроці та замінити їх об’єднаним маршрутом, якій має проходити через Server_1.
First of all, I calculated the common subnet mask for both IP addresses.

- 172.17.13.1 = 10101100.00010001.00001101.00000001 in binary
- 172.17.23.1 = 10101100.00010001.00010111.00000001 in binary

They both have __10101100.00010001.000__ in common, which results in __/19 CIDR__. It means, that the network will be __172.17.0.0/19__.

Next, deleted the previously created routes.

![Screenshot36](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/36.jpg)

![Screenshot37](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/37.jpg)

Added the new route on the __Server1__ and tested the connection.

![Screenshot38](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/38.jpg)

![Screenshot39](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/39.jpg)

### 6. Налаштувати SSH сервіс таким чином, щоб Client_1 та Client_2 могли підключатись до Server_1 та один до одного.

The __SSH__ client was installed by default in all VMs. The connection was straight-forward, without making any additional steps. To connect from an instance to another instance the following template should be used: `ssh user@host -p 22`, where:
- `user` is the account which will be used for authentication
- `host` target machine
- `-p 22` specified port 22 for connection (default)

Screenshots with the sessions are displayed below:

![Screenshot40](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/40.jpg)

![Screenshot41](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/41.jpg)

![Screenshot42](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/42.jpg)

![Screenshot43](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/43.jpg)

### 7. Налаштуйте на Server_1 firewall таким чином:
### - Дозволено підключатись через SSH з Client_1 та заборонено з Client_2
### - З Client_2 на 172.17.D+10.1 ping проходив, а на 172.17.D+20.1 не проходив

To check the current firewall rules I executed `sudo iptables -L -vn`, where:
- `-L` lists all rules
- `-vn` verbose and numeric outputs

Then added the rules to allow __SSH__ from __Client_1__ and to block it from __Client_2__.

    sudo iptables -A INPUT -p tcp -s 10.92.3.2/255.255.255.0 --dport 22 -j ACCEPT
    sudo iptables -A INPUT -p tcp -s 10.8.92.2/255.255.255.0 --dport 22 -j DROP

![Screenshot44](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/44.jpg)

Tested the rules on both clients. 

![Screenshot45](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/45.jpg)

![Screenshot46](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/46.jpg)

In general, there was no need for the rule to allow the __SSH__ from the __Client_1__ as by default all traffic is permitted on Linux box, however that is a security breach on practice.

For the ping traffic from __Client_2__ I added the following rules on the __Server1__:

    sudo iptables -A FORWARD -p icmp -s 10.8.92.2/255.255.255.0 -d 172.17.13.1 -j ACCEPT
    sudo iptables -A FORWARD -p icmp -s 10.8.92.2/255.255.255.0 -d 172.17.23.1 -j DROP

![Screenshot47](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/47.jpg)

![Screenshot48](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/48.jpg)

### 8. Якщо в п.3 була налаштована маршрутизація для доступу Client_1 та Client_2 до мережі Інтернет – видалити відповідні записи. На Server_1 налаштувати NAT сервіс таким чином, щоб з Client_1 та Client_2 проходив ping в мережу Інтернет

Disabled the static route on my router. 

![Screenshot49](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/49.jpg)

Next, on the __Server1__ configured the __NAT__ service - `sudo iptables -t nat -A POSTROUTING -s 10.0.0.0/8 -j SNAT --to-source 192.168.88.253`. Tested by pinging the `8.8.8.8` before changes and afterwards. As expected, responses from `ping` return to the clients.

![Screenshot50](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/50.jpg)

![Screenshot51](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/51.jpg)

![Screenshot52](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/52.jpg)

To remove the rule - `sudo iptables -t nat -D POSTROUTING -s 10.0.0.0/8 -j SNAT --to-source 192.168.88.253`

The alternative method to __Source NAT__ is to use the __Masquerade__ - `sudo iptables -t nat -A POSTROUTING -j MASQUERADE`. 

![Screenshot53](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/53.jpg)

![Screenshot54](https://github.com/Soubi8/DevOps_online_Vinnytsia_2022Q1Q2/blob/main/m5/task5.1/Screenshots/54.jpg)

## Summary
During this task I worked with the basics of networking in Linux. Learned different methods about configuring interfaces, DHCP service, static routes and firewall rules. 
