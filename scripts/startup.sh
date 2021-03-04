#!/bin/bash
sudo apt-get update
sudo apt-get -y upgrade
# start webserver
sudo apt install -y apache2
sudo ufw app list
sudo ufw allow 'Apache'
sudo ufw status
sudo systemctl enable apache2
sudo systemctl status apache2
# mount ebs volume to /var/log
# create fs
sudo mkfs -t ext4 /dev/xvdf
sudo mkdir /mnt/new
sudo mount /dev/xvdf /mnt/new
cd /var/log
# copy logs to /dev/sdf
sudo cp -ax * /mnt/new
cd /var
mv log log.old

#mount EBS as new /var/log
sudo umount /dev/xvdf
sudo mkdir /var/log
sudo mount /dev/xvdf /var/log
sudo rm -r /mnt/new

#update fstab file to mount EBS on system startup
sudo bash -c 'echo "/dev/xvdf /var/log ext4 noatime 0 0" >> /etc/fstab'