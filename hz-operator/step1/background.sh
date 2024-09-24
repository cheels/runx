# Install whiptail to prompt LicenseKey
sudo apt-get install -y whiptail
cat << 'EOF' > password_prompt.sh
while true; do
    LICENSE_KEY=$(whiptail --passwordbox "Please enter your License Key" 8 78 --title "License key" --nocancel 3>&1 1>&2 2>&3)
    if [ -n "$LICENSE_KEY" ]; then
        echo "$LICENSE_KEY"
        break
    fi
done
EOF

chmod +x password_prompt.sh

# Install clc
curl https://hazelcast.com/clc/install.sh | bash
sudo cp /root/.hazelcast/bin/clc /usr/local/bin