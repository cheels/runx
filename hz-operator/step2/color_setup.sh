#!/bin/bash
cat <<EOL > /root/assets/color_prompt.sh
#!/bin/bash
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
echo -e "\${YELLOW}\$1\${NC}"
EOL

chmod +x /root/assets/color_prompt.sh