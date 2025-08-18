## 0️⃣4️⃣ – Menggabungkan Branch pada Project Git

### 📌 Steps:

1️⃣ **Git merge** – Menggabungkan perubahan dari branch lain ke branch aktif.
2️⃣ **Git rebase** – Memindahkan urutan commit agar riwayat lebih rapi.
3️⃣ **Git cherry-pick** – Mengambil commit tertentu dari branch lain tanpa merge seluruh branch.

---

### 💻 Command:

```bash
# Pindah ke branch tujuan
git checkout <branch_tujuan>

# Merge branch lain ke branch aktif
git merge <branch_sumber>
git merge --abort       # Batalkan merge
git merge --continue    # Lanjutkan merge setelah konflik

# Rebase branch aktif ke branch lain
git rebase -i <branch_sumber>
git rebase --abort      # Batalkan rebase
git rebase --skip       # Lewati commit saat rebase
git rebase --continue   # Lanjutkan rebase setelah konflik

# Ambil commit spesifik dari branch lain
git cherry-pick <hash_commit>
git cherry-pick --abort     # Batalkan cherry-pick
git cherry-pick --skip      # Lewati commit saat cherry-pick
git cherry-pick --continue  # Lanjutkan cherry-pick setelah konflik
```

---

### 📎 Tips:

* Gunakan `git log --oneline --graph --all` untuk melihat struktur commit sebelum merge/rebase.
* Lakukan `git pull --rebase` jika ingin update branch dengan riwayat yang lebih bersih.

---

\#Git #GitMerge #GitRebase #GitCherryPick #VersionControl #Coding
