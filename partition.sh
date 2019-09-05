#!/bin/bash
fdisk /dev/sdc
n
p
1
2048
104857599
p
w
EOF
mkfs -t ext4 /dev/sdc1
mkdir /datadrive
mount /dev/sdc1 /datadrive
echo /dev/sdc1  /datadrive ext4 defaults,nofail 0 2 >> /etc/fstab

