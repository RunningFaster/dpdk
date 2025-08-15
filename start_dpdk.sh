#!/bin/bash

# 启动UIO
modprobe uio

# 添加vfio-pci
/sbin/modprobe vfio enable_unsafe_noiommu_mode=1
/sbin/modprobe vfio-pci

cd /root/dpdk-20.11/usertools

# 查看网卡状态 
python3 dpdk-devbind.py -s
ifconfig
lshw -class network -businfo

# 网卡下线
ifconfig ens33 down

# 绑定dpdk网卡
python3 dpdk-devbind.py -b vfio-pci 02:01.0

# 查看和设置大页
python3 dpdk-hugepages.py -s
python3 dpdk-hugepages.py -p 2M --setup 2G