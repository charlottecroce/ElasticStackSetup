#!/bin/sh

# this script returns the status of the relevant Elastic Stack services, which currently includes: elasticsearch, kibana, logstash, and filebeat
# to add/remove a service, edit the list of services on line 11

GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

for serv in "elasticsearch" "kibana" "logstash" "filebeat"
do
    serv_status=systemctl status $serv.service | grep Active)
    if [[ "${serv_status}" == *"running"* ]]; then
        COLOR=${GREEN}
    elif [[ "${serv_status}" == *"failed"* ]]; then
        COLOR=${RED}
    else
        COLOR=${YELLOW}
    fi

    let spaces=16-${#serv}

    for i in $(seq 1 $spaces)
    do
        echo -n " "
    done

    echo -e "${serv}:\t${COLOR}${serv_status#*:}${NC}"
done
