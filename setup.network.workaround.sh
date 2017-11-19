#!/usr/bin/env bash

echo "Add periodical access to the storage so it won't disconnect"
line='* * * * * touch /mnt/buga_storage/network_workaround/comp_'
line+=$(hostname)
# https://stackoverflow.com/a/9625233/365408
(crontab -u buga -l 2>/dev/null; echo "$line") | crontab -u buga -
