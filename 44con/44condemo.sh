#!/bin/sh

sudo ifdown eth1 && sudo ifup eth1
sudo ifconfig eth1:1 192.168.0.10 netmask 255.255.255.0
sudo route add 239.255.255.250 eth1

