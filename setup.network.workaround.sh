echo "Edit crontab: add the following"
# echo * * * * * touch /mnt/buga_storage/”machine_name”
line='* * * * * touch /mnt/buga_storage/'
line+=$(hostname)
# https://stackoverflow.com/a/9625233/365408
(crontab -l 2>/dev/null; echo "$line") | crontab -
