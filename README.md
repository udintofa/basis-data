# 📘 Sistem Bimbel Privat

## 📌 Deskripsi Proyek
Proyek ini merupakan desain **Entity Relationship Diagram (ERD)** untuk sistem **Bimbingan Belajar (Bimbel) Privat**.  
Sistem dirancang untuk mengelola data siswa, tentor, sesi privat, tagihan, serta pembagian pendapatan antara tentor dan pihak bimbel.

Fokus utama desain adalah:
- Kejelasan alur bisnis
- Normalisasi data
- Pemisahan master data, transaksi, dan keuangan

---

## 🧩 Lingkup Sistem
Sistem ini mencakup:
- Manajemen siswa dan tentor
- Pencatatan sesi privat
- Pembuatan tagihan otomatis per sesi
- Pembagian hasil pembayaran (tentor & bimbel)
- Pengelolaan saldo tentor dan saldo bimbel

---

## 🗂️ Struktur Entitas

### 1. Siswa
Menyimpan data peserta bimbingan.
- id_siswa
- nama
- jenjang
- kelas

### 2. Tentor
Menyimpan data pengajar.
- id_tentor
- nama
- jenjang

### 3. Program
Menentukan jenjang dan biaya bimbingan.
- kode_program
- jenjang
- biaya

### 4. Sesi Privat
Merepresentasikan satu pertemuan bimbingan.
- id_sesi
- id_siswa
- id_tentor
- kode_program
- tanggal
- biaya

### 5. Tagihan
Tagihan yang dihasilkan dari satu sesi privat.
- id_tagihan
- id_sesi
- total
- status
- tanggal_bayar

### 6. Pembagian Tagihan
Mengatur pembagian pembayaran antara tentor dan bimbel.
- id_pembagian
- id_tagihan
- nominal_tentor
- nominal_bimbel

### 7. Dompet Tentor
Menyimpan saldo milik tentor.
- id_dompet
- id_tentor
- saldo

### 8. Saldo Bimbel
Menyimpan saldo milik pihak bimbel.
- id_saldo_bimbel
- saldo

---

## 🔄 Alur Bisnis Sistem
1. Siswa mengikuti sesi privat dengan tentor berdasarkan program tertentu
2. Setiap sesi privat menghasilkan satu tagihan
3. Tagihan diproses dan dibagi ke:
   - saldo tentor
   - saldo bimbel
4. Saldo diperbarui berdasarkan hasil pembagian tagihan

---

## 🧠 Catatan Desain
- Sistem **tidak menyimpan kolom `uang_masuk`** untuk menghindari redundansi data
- Saldo diperbarui berdasarkan transaksi pada tabel `pembagian_tagihan`
- Desain mengikuti prinsip **Third Normal Form (3NF)**
- Cocok sebagai dasar implementasi sistem backend atau database relasional

---

## 🛠️ Tools & Teknologi
- Perancangan ERD: **PlantUML**
- Target DBMS: MySQL / PostgreSQL

---

## 🎯 Tujuan Proyek
Proyek ini dibuat sebagai **portofolio** untuk menunjukkan pemahaman:
- desain database relasional
- relasi antar entitas
- alur bisnis sistem bimbel privat

---

## 📎 Catatan Tambahan
Proyek ini berfokus pada desain konseptual dan belum mencakup:
- autentikasi pengguna
- histori transaksi detail
- implementasi frontend
