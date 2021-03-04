#!/bin/bash
apt-get update
apt-get upgrade
apt install apache2
ufw app list
systemctl status apache2
