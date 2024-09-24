#!/bin/bash
sudo apt-get install -y whiptail
mkdir scripts
cat << 'EOF' > password_prompt.sh
LICENSE_KEY=$(whiptail --passwordbox "Please enter your License Key" 8 78 --title "License key" 3>&1 1>&2 2>&3)
EOF
