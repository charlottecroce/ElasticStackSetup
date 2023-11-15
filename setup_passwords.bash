#
# 
#


CYAN='\033[1;36m'
NC='\033[0m'

# Dependencies
echo -e "${CYAN}THIS SCRIPT IS NOT AUTOMATED. YOU MUST ENTER AND REMEMBER YOUR PASSWORDS. VIEWING SOURCE CODE BEFORE RUNNING IS ADVISED${NC}"
read -p "Continue (y/n)?" CONT
if [ "$CONT" = "y" ]; then
  echo "Enabling passwords...";
else
  exit;
fi

sed -i '/.*xpack.security.enabled.*/ s/^#//' /etc/elasticsearch/elasticsearch.yml

echo -e "${CYAN}Enter passwords for the default users for each service. I set them all to 'password' or 'changeme' for convenience, and change them later${NC}"
/usr/share/elasticsearch/bin/elasticsearch-setup-passwords interactive

read -p "${CYAN}Enter exactly what you entered for your kibana_system password${NC}" KIBANA_SYSTEM_PASSWORD

sed -i 's/.*elasticsearch.password.*/elasticsearch.password: "${KIBANA_SYSTEM_PASSWORD}"/' /etc/kibana/kibana.yml

/usr/share/kibana/bin/kibana-keystore add elasticsearch.password
# enter password



/usr/share/elasticsearch/bin/elasticsearch-users list #lists users
