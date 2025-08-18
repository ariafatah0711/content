0️⃣5️⃣ – Sinkronisasi dengan Remote (Git Origin)

📌 Steps:
1️⃣ Git remote – Mengecek / menambahkan remote repository.
2️⃣ Git fetch – Mengambil update dari remote tanpa menggabungkannya.
3️⃣ Git pull – Mengambil sekaligus menggabungkan perubahan dari remote.
4️⃣ Git push – Mengirim perubahan lokal ke remote.

💻 Command:

```bash
# Lihat daftar remote
git remote -v

# Tambah remote baru (kalau belum ada)
git remote add origin <url_repo>

# Ambil update dari remote (tidak otomatis merge)
git fetch origin
git fetch --all      # Ambil semua remote

# Update branch aktif dengan remote (otomatis merge/rebase)
git pull origin <branch>        # menggunakan merge
git pull --rebase origin <branch>   # Riwayat lebih rapi

# Kirim branch lokal ke remote
git push origin <branch>

# Kirim semua tag sekaligus
git push origin --tags

# Jika branch baru, gunakan -u supaya tracking otomatis
git push -u origin <branch>
```

📎 Tips:

* `git fetch` aman untuk ngecek update tanpa ganggu branch lokal.
* `git pull = git fetch + git merge` (atau `--rebase` untuk riwayat rapi).
* `git push -u` cukup sekali, setelah itu cukup `git push`.

Bandingkan lokal vs remote:

```bash
git log origin/<branch>..<branch>
git status
```

\#Git #GitRemote #GitPush #GitPull #GitFetch #VersionControl #Coding
