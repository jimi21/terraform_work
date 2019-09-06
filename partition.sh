#!/bin/bash
/sbin/mkfs -t ext4 /dev/sdc
/bin/mkdir /datadrive
/bin/mount /dev/sdc /datadrive
/bin/echo /dev/sdc /datadrive ext4 defaults,nofail 0 0 >> /etc/fstab
