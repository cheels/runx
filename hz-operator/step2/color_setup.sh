#!/bin/bash
sudo apt-get install -y whiptail
LICENSE_KEY=$(whiptail --passwordbox "Please enter your License Key" 8 78 --title "License key" 3>&1 1>&2 2>&3)
