FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install cron & python
RUN apt update && apt install -y cron python3

# Buat user & group
RUN groupadd dev && useradd -m -G dev user1

# Buat direktori app
RUN mkdir -p /opt/app

# Copy script Python
COPY app/backup.py /opt/app/backup.py

# Permission TIDAK AMAN (kerentanan)
RUN chown -R root:dev /opt/app && chmod -R 775 /opt/app
RUN chown -R root:root /opt/app/backup.py

# Copy crontab
COPY crontab /etc/crontab

# Start cron
CMD cron -f
