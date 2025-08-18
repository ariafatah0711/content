# 🌐 Deploy Website Statis dengan GitHub Pages

## 0️⃣2️⃣ – Deploy Website Statis Menggunakan GitHub Pages

### 📌 Langkah-langkah

1️⃣ Upload project ke repository GitHub
2️⃣ Aktifkan **GitHub Pages** di menu **Settings → Pages**
3️⃣ Website langsung bisa diakses di URL GitHub Pages 🌍

---

### 💻 Perintah Git

```bash
# Konfigurasi identitas pengguna
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

# Inisialisasi repository lokal
git init
git add .
git commit -m "Initial commit"

# Mengatur branch utama
git branch -M main

# Hubungkan ke repository GitHub (dengan token)
git remote add origin https://<user>:<token>@github.com/<user>/<repository>

# Push ke branch utama
git push -u origin main
```

---

### 🔗 Referensi

* [GitHub](https://github.com)
* [Dokumentasi GitHub Pages](https://docs.github.com/en/pages)

---

### 📌 Catatan Tambahan

* Pastikan branch yang digunakan sesuai dengan pengaturan di GitHub Pages (misalnya `main` atau `gh-pages`).
* Untuk project statis (HTML, CSS, JS), file akan langsung dilayani.
* Untuk framework (React, Vue, dll.), biasanya butuh proses build dulu sebelum push.

---

### 📢 Hashtags

\#GitHubPages #WebDevelopment #CodingForBeginners #PortfolioWebsite #BelajarCoding #GratisHosting
