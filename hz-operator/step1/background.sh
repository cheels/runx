sudo apt-get install -y whiptail
cat << 'EOF' > password_prompt.sh
while true; do
    # Prompt the user for the license key using whiptail
    LICENSE_KEY=$(whiptail --passwordbox "Please enter your License Key" 8 78 --title "License key" --nocancel 3>&1 1>&2 2>&3)

    # Check if the LICENSE_KEY is not empty
    if [ -n "$LICENSE_KEY" ]; then
        # If valid, echo the LICENSE_KEY and break the loop
        echo "$LICENSE_KEY"
        break
    fi
done
EOF

chmod +x password_prompt.sh