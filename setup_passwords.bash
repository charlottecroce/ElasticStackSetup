#
# must run as root
# setup default passwords
#

CYAN='\033[1;36m'
NC='\033[0m'

# Dependencies
apt-get install pwgen

ELASTICPASS=$(pwgen 16 1)
KIBANAPASS=$(pwgen 16 1)
LOGSTASHPASS=$(pwgen 16 1)
BEATSPASS=$(pwgen 16 1)
REMOTEMONITORINGUSERPASS=$(pwgen 16 1)

sed -i '/.*xpack.security.enabled.*/ s/^#//' /etc/elasticsearch/elasticsearch.yml

printf 'y\n${ELASTICPASS}\n${ELASTICPASS}\n${KIBANAPASS}\n${KIBANAPASS}\n${LOGSTASHPASS}\n${LOGSTASHPASS}\n${BEATSPASS}\n${BEATSPASS}\n${REMOTEMONITORINGUSERPASS}\n${REMOTEMONITORINGUSERPASS}' | /usr/share/elasticsearch/bin/elasticsearch-setup-passwords interactive

sed -i 's/.*elasticsearch.password.*/elasticsearch.password: "${KIBANAPASS}"/' /etc/kibana/kibana.yml
printf '${KIBANAPASS}' | /usr/share/kibana/bin/kibana-keystore add elasticsearch.password

echo -e "${CYAN}THESE PASSWORDS ARE NOT STORED ANYWHERE. SAVE THEM SOMEPLACE SAFE${NC}"
echo -e "${CYAN}|${NC}"
echo -e "${CYAN}elastic password: ${ELASTICPASS}${NC}"
echo -e "${CYAN}kibana_system password: ${KIBANAPASS}${NC}"
echo -e "${CYAN}logstash_system password: ${LOGSTASHPASS}${NC}"
echo -e "${CYAN}beats_system password: ${BEATSPASS}${NC}"
echo -e "${CYAN}remote_monitoring_user password: ${REMOTEMONITORINGUSERPASS}${NC}"
echo -e "${CYAN}|${NC}"
echo -e "${CYAN}THESE PASSWORDS ARE NOT STORED ANYWHERE. SAVE THEM SOMEPLACE SAFE${NC}"
