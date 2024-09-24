#!/bin/bash

# Ensure whiptail is installed
if ! command -v whiptail &> /dev/null
then
    sudo apt-get install -y whiptail
fi

# Use whiptail to prompt the user for the license key
LICENSE_KEY=$(whiptail --passwordbox "Please enter your License Key" 8 78 --title "License key" 3>&1 1>&2 2>&3)

# Echo the LICENSE_KEY back to the foreground script for further processing
echo "$LICENSE_KEY"
