#!/bin/bash
die () {
    echo >&2 "$@"
    exit 1
}
[ "$#" -eq 2 ] || die 'Usage: '"$0"' pass "command"'


if [[ -z $(which sshpass) ]]; then
    sudo apt-get install sshpass
fi

curl 'http://10.0.0.200/cgi?5' -H 'Origin: http://10.0.0.200' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.9,he;q=0.8' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36' -H 'Content-Type: text/plain' -H 'Accept: */*' -H 'Referer: http://10.0.0.200/' -H 'Cookie: Authorization=Basic YnVnYTpidWdh' -H 'Connection: keep-alive' --data-binary $'[LAN_HOST_ENTRY#0,0,0,0,0,0#0,0,0,0,0,0]0,0\r\n' --compressed 2>/dev/null > /tmp/dhcp_clients.txt
cat /tmp/dhcp_clients.txt | awk '(NR+6) % 8 == 0' | cut -c 11- > /tmp/dhcp_clients_ips.txt

NC="\033[0m"
COLOR="\033[1;34m"

IFS=$'\n'
set -f
for HOSTNAME in $(cat /tmp/dhcp_clients_ips.txt); do
    echo -e "${COLOR}${HOSTNAME}${NC}"
    if sshpass -p $1 ssh -oStrictHostKeyChecking=no -oConnectTimeout=2 ${HOSTNAME} "$2"; then
        echo OK
    else
        echo FAIL
    fi
done
