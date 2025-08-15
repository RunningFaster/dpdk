# DPDK🇨🇳🇨🇳🇨🇳

- Dpdk学习过程中记录下来的代码

### 主要功能

1. 通过dpdk实现传输层tcp和upd协议
2. 通过dpdk实现网络层arp和icmp协议

![alt text](image.png)

### 安装

https://runningfaster.github.io/2025-05-14-Dpdk%E5%AE%89%E8%A3%85/

### 启动命令

#### 绑定网卡和配置大页

> bash start_dpdk.sh

```shell
[root@localhost ~]# bash start-dpdk.sh 

Network devices using kernel driver
===================================
0000:02:01.0 '82545EM Gigabit Ethernet Controller (Copper) 100f' if=ens33 drv=e1000 unused=vfio-pci *Active*
0000:02:02.0 '82545EM Gigabit Ethernet Controller (Copper) 100f' if=ens34 drv=e1000 unused=vfio-pci *Active*
0000:02:05.0 '82545EM Gigabit Ethernet Controller (Copper) 100f' if=ens37 drv=e1000 unused=vfio-pci *Active*
0000:02:06.0 '82545EM Gigabit Ethernet Controller (Copper) 100f' if=ens38 drv=e1000 unused=vfio-pci *Active*

No 'Baseband' devices detected
==============================

No 'Crypto' devices detected
============================

No 'Eventdev' devices detected
==============================

No 'Mempool' devices detected
=============================

No 'Compress' devices detected
==============================

No 'Misc (rawdev)' devices detected
===================================

No 'Regex' devices detected
===========================
ens33: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.42.154  netmask 255.255.255.0  broadcast 192.168.42.255
        inet6 fe80::8bf:a114:a057:c1e9  prefixlen 64  scopeid 0x20<link>
        ether 00:0c:29:ae:08:de  txqueuelen 1000  (Ethernet)
        RX packets 28804  bytes 2064811 (1.9 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2649  bytes 259694 (253.6 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

ens34: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.201.98  netmask 255.255.255.0  broadcast 192.168.201.255
        inet6 fe80::2d55:b16e:1c50:b9ef  prefixlen 64  scopeid 0x20<link>
        ether 00:0c:29:ae:08:e8  txqueuelen 1000  (Ethernet)
        RX packets 75249  bytes 10492559 (10.0 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 52259  bytes 6785829 (6.4 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

ens37: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.42.155  netmask 255.255.255.0  broadcast 192.168.42.255
        inet6 fe80::d136:8825:5434:317b  prefixlen 64  scopeid 0x20<link>
        ether 00:0c:29:ae:08:f2  txqueuelen 1000  (Ethernet)
        RX packets 27046  bytes 1733395 (1.6 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 440  bytes 86698 (84.6 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

ens38: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.42.156  netmask 255.255.255.0  broadcast 192.168.42.255
        inet6 fe80::6f3b:9876:9ae3:2cd4  prefixlen 64  scopeid 0x20<link>
        ether 00:0c:29:ae:08:fc  txqueuelen 1000  (Ethernet)
        RX packets 27045  bytes 1733053 (1.6 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 443  bytes 87724 (85.6 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

Bus info          Device      Class       Description
=====================================================
pci@0000:02:01.0  ens33       network     82545EM Gigabit Ethernet Controller (Copper)
pci@0000:02:02.0  ens34       network     82545EM Gigabit Ethernet Controller (Copper)
pci@0000:02:05.0  ens37       network     82545EM Gigabit Ethernet Controller (Copper)
pci@0000:02:06.0  ens38       network     82545EM Gigabit Ethernet Controller (Copper)
Node Pages Size Total

Hugepages mounted on /dev/hugepages
```

#### 启动程序

> make && gdb ./build/send

```shell
[root@localhost recv_send]# make &&  ./build/send
ln -sf send-shared build/send
初始化 DPDK 环境
EAL: Detected 4 lcore(s)
EAL: Detected 1 NUMA nodes
EAL: Detected shared linkage of DPDK
EAL: Multi-process socket /var/run/dpdk/rte/mp_socket
EAL: Selected IOVA mode 'PA'
EAL: No available hugepages reported in hugepages-1048576kB
EAL: Probing VFIO support...
EAL: VFIO support initialized
EAL:   using IOMMU type 8 (No-IOMMU)
EAL: Ignore mapping IO port bar(4)
EAL: Probe PCI driver: net_e1000_em (8086:100f) device: 0000:02:01.0 (socket 0)
EAL: No legacy callbacks, legacy socket not created
Using 0 -  3 worker lcores
nb_ports: 1
lcore 0 is using socket 0
lcore 1 is using socket 0
lcore 2 is using socket 0
lcore 3 is using socket 0
Invalid port_id=128
Invalid port_id=128
Invalid port_id=128
Invalid port_id=128

===== Port 128 Information =====
[Basic Info]
  - MAC Address: 00:00:00:00:00:00
  - Driver Name: (null)
[Link Status]
  - Status: DOWN
  - Speed: 2097152 Mbps
[Queue Capabilities]
  - Max RX Queues: 0
  - Max TX Queues: 0
  - Max RX Descriptors: 0
  - Max TX Descriptors: 0
[Statistics]
  - RX Packets: 4297179968
  - RX Errors: 140323278979336
  - RX Bytes: 140323278978480
  - TX Packets: 140323278989748
  - TX Errors: 0
  - TX Bytes: 0
  - RX Missed: 0
  - RX No-MBUFs: 4294996184
[Advanced Features]
  - RSS Support: No
  - VLAN Strip: No
================================
```

### Code
upd收发包，arp-resp