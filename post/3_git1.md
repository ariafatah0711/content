# 0️⃣3️⃣ – Mengelola Perubahan & Riwayat Git

## 📌 Steps

1️⃣ **Git stash** – Simpan perubahan sementara tanpa commit.
2️⃣ **Git reset** – Hilangkan commit dari riwayat (ubah history).
3️⃣ **Git revert** – Buat commit baru untuk membatalkan commit lama.
4️⃣ **Git reflog** – Lihat semua riwayat pergerakan HEAD (time machine Git).

---

## 💻 Command

### Stash perubahan sementara

```
git stash
git stash save "pesan"
git stash list
git stash apply <id>
git stash pop <id>
git stash drop <id>
git stash clear
```

### Reset commit

```
git reset --soft <hash_commit>
git reset --mixed <hash_commit>
git reset --hard <hash_commit>
```

### Revert commit

```
git revert <hash_commit>
git revert <hash1> <hash2>
git revert --abort
```

### Reflog (time machine Git)

```
git reflog
git checkout <hash_dari_reflog>
git reset --hard <hash_dari_reflog>
```

---

## 📎 Tips

* Gunakan **git stash** saat mau switch branch tapi ada kerjaan setengah jalan.
* **Git reset** sebaiknya hanya dipakai di branch lokal (ubah history).
* **Git revert** aman karena commit lama tetap tersimpan.
* Kalau commit “hilang”, coba cari di **git reflog** untuk restore.

---

\#Git #GitStash #GitReset #GitRevert #GitReflog #VersionControl #Coding
