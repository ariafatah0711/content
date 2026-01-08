## **Slide 1 – Judul**

**LINUXENIX EPS 1 – Privilege Escalation**

> “Pada materi kali ini, saya akan membahas Linux Privilege Escalation.
> Materi ini berfokus pada konsep dasar hingga praktik sederhana bagaimana privilege escalation bisa terjadi di sistem Linux.
> Presentasi ini bersifat hands-on agar kita tidak hanya paham teori, tapi juga melihat langsung contohnya.”

---

## **Slide 2 – Apa itu Privilege Escalation**

> “Privilege escalation adalah teknik serangan siber di mana penyerang berhasil mendapatkan hak akses yang lebih tinggi dari yang seharusnya dimiliki.
> Biasanya, penyerang memulai dari user biasa, lalu mencari celah agar bisa naik menjadi user dengan hak akses lebih tinggi, seperti root.
> Jika berhasil, penyerang dapat mengontrol sistem secara penuh.”

---

## **Slide 3 – Jenis-Jenis Privilege Escalation**

> “Privilege escalation terbagi menjadi dua jenis utama, yaitu horizontal dan vertical.
> Horizontal privilege escalation terjadi ketika penyerang berpindah ke akun lain dengan level hak akses yang sama.
> Sedangkan vertical privilege escalation terjadi ketika penyerang meningkatkan hak akses dari level rendah ke level yang lebih tinggi, misalnya dari user biasa menjadi root.”

---

## **Slide 4 – Teknik Linux Privilege Escalation**

> “Di Linux, privilege escalation sering terjadi karena kesalahan konfigurasi.
> Beberapa teknik yang umum digunakan antara lain penyalahgunaan SUID binary, kesalahan konfigurasi sudo, dan penyalahgunaan cron job.
> Teknik-teknik ini memanfaatkan fitur bawaan Linux yang seharusnya aman jika dikonfigurasi dengan benar.”

---

## **Slide 5 – SUID (Set User ID)**

> “SUID adalah permission khusus pada file executable di Linux.
> Jika sebuah file memiliki SUID dan dimiliki oleh root, maka program tersebut akan dijalankan dengan hak akses root, siapa pun user yang menjalankannya.
> Masalah muncul ketika binary SUID tersebut bisa disalahgunakan untuk menjalankan perintah lain.”

---

## **Slide 6 – Sudo Misconfiguration**

> “Sudo misconfiguration terjadi ketika file sudoers dikonfigurasi secara tidak aman.
> User bisa diberikan izin menjalankan perintah tertentu sebagai root, bahkan tanpa password.
> Jika perintah tersebut bisa dimanfaatkan untuk membuka shell, maka user bisa mendapatkan akses root.”

---

## **Slide 7 – Cron Job Abuse**

> “Cron job adalah task otomatis yang dijalankan sistem secara berkala.
> Banyak cron job berjalan menggunakan hak akses root.
> Jika file script cron tersebut dapat dimodifikasi oleh user biasa, maka user bisa menyisipkan perintah berbahaya yang akan dijalankan sebagai root.”

---

## **Slide 8 – PrivEsc via SUID Binaries**

> “Pada bagian ini kita fokus ke privilege escalation melalui SUID binary.
> Binary dengan SUID akan dijalankan menggunakan hak akses pemilik file.
> Jika pemiliknya adalah root, maka binary tersebut berpotensi digunakan untuk mendapatkan akses root.”

---

## **Slide 9 – Bit Permission Khusus**

> “Di Linux terdapat bit permission khusus selain read, write, dan execute.
> Yang pertama adalah SUID, yaitu program dijalankan dengan hak akses pemilik file.
> Kedua SGID, mirip dengan SUID tapi berbasis group.
> Dan yang ketiga adalah sticky bit, yang mencegah user menghapus file milik user lain.”

---

## **Slide 10 – Membuat SUID Binary Sederhana**

> “Di sini kita membuat contoh binary sederhana menggunakan bahasa C.
> Program ini akan mengatur user ID ke root dan menjalankan perintah dari argumen.
> Setelah dikompilasi, file executable diubah kepemilikannya menjadi root dan diberikan permission SUID.”

---

## **Slide 11 – Menambahkan Permission SUID**

> “Setelah permission SUID ditambahkan, kita jalankan kembali binary tersebut.
> Jika berhasil, perintah yang dijalankan akan dieksekusi sebagai root.
> Ini menunjukkan bagaimana SUID binary bisa menjadi celah privilege escalation.”

---

## **Slide 12 – Mencari SUID Binary**

> “Pada tahap ini, kita mencari semua file di sistem yang memiliki permission SUID.
> Perintah find digunakan untuk mencari file dengan bit SUID aktif.
> Setelah ditemukan, kita bisa mengecek apakah binary tersebut dapat dieksploitasi.”

---

## **Slide 13 – Eksploitasi dengan GTFOBins**

> “GTFOBins adalah website yang berisi daftar binary Linux yang bisa disalahgunakan.
> Jika kita menemukan binary SUID yang ada di GTFOBins, kemungkinan besar binary tersebut bisa digunakan untuk mendapatkan shell root.”

---

## **Slide 14 – PrivEsc via Sudo Misconfiguration**

> “Privilege escalation via sudo memanfaatkan konfigurasi sudo yang salah.
> Jika user diizinkan menjalankan aplikasi tertentu sebagai root, maka aplikasi tersebut bisa dimanfaatkan untuk membuka shell root.”

---

## **Slide 15 – Membuat SUDO yang Rentan**

> “Pada contoh ini, user diberikan izin menjalankan vim sebagai root tanpa password.
> Konfigurasi ini terlihat aman, tapi sebenarnya sangat berbahaya.
> Karena vim memiliki fitur untuk menjalankan perintah sistem.”

---

## **Slide 16 – Eksploitasi SUDO**

> “Setelah mengecek izin sudo, user menjalankan vim menggunakan sudo.
> Karena vim dijalankan sebagai root, maka perintah yang dijalankan di dalam vim juga dieksekusi sebagai root.”

---

## **Slide 17 – Mendapatkan Root Shell**

> “Dengan menjalankan perintah :!bash di dalam vim, user akan mendapatkan shell root.
> Jika berhasil, prompt akan berubah menjadi tanda pagar atau #, yang menandakan akses root.”

---

## **Slide 18 – Penutup**

> “Dari materi ini, kita bisa melihat bahwa privilege escalation sering terjadi bukan karena bug yang kompleks, tapi karena kesalahan konfigurasi.
> Oleh karena itu, penting untuk selalu membatasi permission, mengecek SUID binary, dan mengamankan konfigurasi sudo serta cron job.”

---

Kalau kamu mau:

* versi **lebih santai**
* versi **lebih formal akademik**
* atau **ringkas 1–2 kalimat per slide**

tinggal bilang ya 👍

```bash
sudo apt install gcc
adduser user1
# pass: 123

adduser user2
# pass: 123
```
