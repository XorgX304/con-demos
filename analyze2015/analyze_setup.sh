#!/bin/sh

sudo ifdown eth1
sudo ifup eth1
sudo ifconfig eth1:1 10.12.34.56 netmask 255.255.255.0
