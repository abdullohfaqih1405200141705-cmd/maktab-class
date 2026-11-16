# Maktab Class Manager v2 – Panduan APK + Web (Supabase)

Satu proyek, dua hasil:
- **APK Android** (dibangun otomatis oleh GitHub, gratis, tanpa Android Studio)
- **Versi web/PWA** (GitHub Pages) – cadangan jika APK bermasalah

## Yang baru di v2
- Kegiatan absensi punya tombol **Masuk rapor**; kehadiran di rapor juga bisa dimatikan lewat kotak centang di Laporan. Fitur absensi bisa dimatikan total (Kelas > Kegiatan) agar aplikasi hanya untuk nilai ujian dan khatam.
- **Fan pokok ★** per kitab. Rapor menampilkan **Rata-rata Fan Pokok** dan **Rata-rata Fan Seluruh** (kitab pokok ikut dihitung di keduanya). **Khatam tidak memengaruhi nilai**, hanya ditampilkan.
- **Rapor ala ijazah**: bingkai ganda, judul, nama besar, tabel nilai, dua tanda tangan (wali kelas dan pimpinan).
- **Cakupan laporan**: 1 kelas, kelompok tertentu, atau santri tertentu (berlaku di Rekap Nilai, Rekap Kehadiran, Rapor). Semua laporan memuat 2 tanda tangan dan bisa diurutkan per kelompok atau nomor absen.
- **Imtihan**: *Input per kitab* (semua santri muncul) atau *Input per santri* (semua kitab muncul, ada tombol ‹ ›).
- **Nomor absen** semua santri: otomatis, bisa diubah, urut A–Z, rapikan. Santri lama otomatis diberi nomor.

## A. Supabase (sekali)
1. supabase.com > New project.
2. SQL Editor > New query > tempel isi `schema.sql` > Run.
3. Authentication > Sign In / Providers > Email: matikan **Confirm email**.
4. Project Settings > API: salin **Project URL** dan **anon/publishable key**.
(Jika sudah memakai versi sebelumnya, `schema.sql` TIDAK perlu dijalankan lagi, data lama tetap terbaca.)

## B. GitHub: unggah proyek
1. github.com > New repository (mis. `maktab`).
2. Ekstrak `maktab-v2.zip` di komputer, lalu **Add file > Upload files** dan seret SEMUA isi folder, termasuk folder `.github`, `www`, `package.json`, `capacitor.config.json`, `build.js`.
   - Jika folder `.github` tidak ikut terunggah: **Add file > Create new file**, ketik nama `.github/workflows/build-apk.yml`, tempel isi dari `github-workflows/build-apk.yml`; ulangi untuk `pages.yml`.
3. Commit changes.

## C. Ambil APK
1. Tab **Actions** > pilih **Build APK Android** > tunggu ±5–8 menit sampai centang hijau (jika belum jalan sendiri: **Run workflow**).
2. Buka run yang berhasil > bagian **Artifacts** > unduh **Maktab-APK** (ZIP berisi `app-debug.apk`).
3. Kirim `app-debug.apk` ke HP, buka, izinkan "Pasang dari sumber ini", lalu pasang.
Catatan: ini APK debug (aman untuk pemakaian pribadi, ditandatangani otomatis). Jika build merah, buka lognya dan kirimkan pesan error kepada saya.

## D. Versi web (opsional)
Settings > Pages > Source: **GitHub Actions**. Alamat: `https://NAMAANDA.github.io/maktab/`. Di Chrome: ⋮ > Instal aplikasi.

## E. Hubungkan ke Supabase (sekali per perangkat)
Buka aplikasi > ⚙ > tempel Project URL dan key > Simpan koneksi > Daftar akun baru / Masuk. HP dan PC pakai email yang sama agar data satu server.

## F. Cetak PDF
- Di APK: Laporan > **Cetak / Simpan PDF** > PDF dibuat lalu muncul menu bagikan (simpan ke Drive/WhatsApp/Berkas).
- Di web/komputer: dialog cetak > pilih "Simpan sebagai PDF".

## G. Catatan jujur
Saya tidak bisa menjalankan build Android dan memasang di HP dari sini, jadi pembuatan APK dan tombol PDF di APK belum teruji di perangkat nyata. Logika perhitungan dan semua tampilan laporan sudah saya uji dengan data contoh. Bila ada kendala saat build atau PDF di HP, kirim pesan error-nya.
