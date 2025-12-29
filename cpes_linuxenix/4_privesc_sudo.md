# Privilege Escalation via SUDO
## Apa itu Privilege Escalation via SUDO?
Privilege Escalation via SUDO adalah teknik yang digunakan oleh penyerang untuk mendapatkan hak akses administratif (root) pada sistem Linux dengan memanfaatkan konfigurasi SUDO yang salah atau celah keamanan.

## Bagaimana Cara Kerjanya?
- Privilege Escalation via SUDO bekerja dengan cara mengeksploitasi konfigurasi SUDO yang memungkinkan pengguna tertentu menjalankan perintah tertentu dengan hak akses root.
- Jika konfigurasi ini tidak diatur dengan benar, penyerang dapat menjalankan perintah yang seharusnya tidak diizinkan, sehingga mendapatkan akses root.

## membuat SUDO yang Rentan
Untuk membuat konfigurasi SUDO yang rentan, kita dapat menambahkan entri di file sudoers yang memungkinkan pengguna tertentu menjalankan perintah tertentu dengan hak akses root tanpa batasan. Berikut adalah langkah-langkah untuk membuat konfigurasi SUDO yang rentan:

1. Buka file sudoers menggunakan visudo:
   ```bash
   sudo visudo
   ```
2. Tambahkan entri berikut di akhir file sudoers untuk memberikan izin kepada pengguna tertentu (misalnya, user1) untuk menjalankan perintah tertentu (misalnya, /usr/bin/vim) dengan hak akses root tanpa batasan:
   ```bash
   user1 ALL=(ALL) NOPASSWD: /usr/bin/vim
   ```
3. Simpan dan keluar dari editor.

## Eksploitasi SUDO yang Rentan
Misalnya, jika seorang pengguna memiliki izin untuk menjalankan editor teks (seperti vim atau nano) dengan hak akses root melalui SUDO, penyerang dapat memanfaatkan editor tersebut untuk membuka shell root. Berikut adalah contoh langkah-langkah yang dapat diambil oleh penyerang:
1. Menemukan pengguna yang memiliki izin SUDO untuk menjalankan editor teks:
   ```bash
   sudo -l
   ```
   ![alt text](images/4_privesc_sudo/image.png)
2. Menjalankan editor teks dengan hak akses root:
   setelah mengetahui bahwa user1 dapat menjalankan vim dengan SUDO yang rentan seperti vim, penyerang dapat menjalankan perintah berikut:
   ```bash
    sudo vim
    ```
    ![alt text](images/4_privesc_sudo/image-2.png)
    setelah menjalankan :!bash di vim dapat menjalankan perintah dengan :!, jadi kita hanya perlu memanggil shell bash dengan perintah :!bash
3. Dalam editor teks, membuka shell dengan perintah:
    ```vim
    :!bash
    ```
    ![alt text](images/4_privesc_sudo/image-1.png)
4. Sekarang penyerang memiliki akses shell dengan hak akses root.
   ![alt text](images/4_privesc_sudo/image-3.png)

---

Privilege Escalation via SUDO adalah teknik menaikkan hak akses di Linux dengan memanfaatkan konfigurasi sudoers yang kurang tepat. Jika sebuah user diberi izin menjalankan perintah tertentu sebagai root, celah ini bisa dimanfaatkan untuk mendapatkan akses penuh ke sistem.

Biasanya prosesnya dimulai dengan mengecek izin SUDO menggunakan sudo -l. Dari sini bisa terlihat command apa saja yang boleh dijalankan. Beberapa binary seperti vim berbahaya jika diberikan akses SUDO tanpa pembatasan, karena dapat digunakan untuk membuka shell root.

Kesalahan kecil seperti penggunaan NOPASSWD pada binary tertentu sudah cukup untuk membuat user biasa berubah menjadi root, tanpa perlu exploit kernel atau teknik kompleks.

Materi ini menjadi bagian penting dalam pembahasan Linux Privilege Escalation, terutama untuk memahami bagaimana konfigurasi yang terlihat “normal” justru bisa menjadi celah serius.

🔗 Linuxenic Corp
https://linuxenic.com

🎓 CPES – Certified Privilege Escalation Specialist
https://linuxenic.com/cpes

@linuxenicorp @linuxenic

#CPES #Linuxenic #PrivilegeEscalation #SUDO
#LinuxSecurity #CyberSecurity #EthicalHacking #Linux
