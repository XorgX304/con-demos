#!/bin/sh

if [ ! -d /dev/pts ];
then
	mkdir /dev/pts
	mount -t devpts devpts /dev/pts
fi

cp -a tk /tmp
cd /tmp
tar zxvf tk/toolkit.tar.gz
rm tk/toolkit.tar.gz

touch /var/log/lastlog
touch /var/log/wtmp

/tmp/tk/dropbear -Y "foo" -H /tmp -p 192.168.0.254:2222 -r /tmp/tk/rsa-host-key 

