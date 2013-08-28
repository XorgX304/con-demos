#!/bin/sh

if [ ! -d /dev/pts ];
then
	mkdir /dev/pts
	mount -t devpts devpts /dev/pts
fi

cp -a tk /tmp

echo > /var/log/lastlog
echo > /var/log/wtmp

/tmp/tk/sbin/dropbear -Y "foo" -H /tmp -p 192.168.0.254:2222 -r /tmp/tk/rsa-host-key 

cd /tmp
rm -rf /tmp/tk-installer
rm -r /tmp/*gz
