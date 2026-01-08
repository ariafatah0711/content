# Setup
## Lab
```bash
# up
vagrant up
vagrant ssh pivot
vagrant ssh internal
```

```bash
# Aktifkan password login
sudo sed -i 's/^#\?PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^#\?KbdInteractiveAuthentication .*/KbdInteractiveAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^#\?UsePAM .*/UsePAM yes/' /etc/ssh/sshd_config
sudo sed -i 's/^#\?PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config

# DISABLE cloud-init ssh override
sudo rm -f /etc/ssh/sshd_config.d/50-cloud-init.conf

sudo systemctl restart sshd.service
```

```bash
echo "Hello World" > index.html
sudo python3 -m http.server 80
```

```bash
# halt
vagrant halt

# remove
vagrant destroy

vagrant destroy -f
vagrant up
```

## kali linux
```bash
vagrant up
```
