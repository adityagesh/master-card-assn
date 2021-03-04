#!/bin/bash
sudo apt-get update
sudo apt-get -y upgrade
sudo apt install -y apache2
sudo ufw app list
sudo ufw allow 'Apache'
sudo ufw status
sudo systemctl status apache2
