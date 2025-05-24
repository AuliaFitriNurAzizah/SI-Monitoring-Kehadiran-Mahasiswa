# SI-Monitoring-Kehadiran-Mahasiswa
🚀 Setup & Deployment Guide

📌 Prerequisites

Sebelum menjalankan proyek ini, pastikan Anda sudah menginstal:

- Docker Desktop
- Git
📥 Clone Repository

Jalankan perintah berikut untuk mengunduh proyek dari GitHub:
```
git https://github.com/AuliaFitriNurAzizah/SI-Monitoring-Kehadiran-Mahasiswa.git

cd repository-name
```
🛠️ Setup & Jalankan dengan Docker Compose

1. Pastikan Docker Desktop sudah berjalan.
2. Jalankan perintah berikut untuk membangun dan menjalankan container:
```
docker-compose up -d --build
```
3. Pastikan semua container berjalan dengan baik:
```
docker ps
```
🎯 Akses Aplikasi
- Backend (CodeIgniter): http://localhost:8080
- Frontend (Laravel): http://localhost:8082
- PHPMyAdmin (Opsional): http://localhost:8081

🛠️ Konfigurasi Database
- Host: database
- User: root
- Password: rootpassword
- Database Name: mydb

Jika ingin masuk ke MySQL dalam container:
```
docker exec -it nama_container_mysql mysql -u root -p
```
🔄 Update & Rebuild
Jika ada perubahan dalam kode, jalankan:

```git pull origin main
docker-compose up -d --build
```
🛑 Stop & Remove Containers
Jika ingin menghentikan layanan, jalankan:
```
docker-compose down
```

Berikut ini adalah langkah untuk menyatukan backend (BE) dan frontend (FE) dalam satu repositori GitHub supaya lebih terorganisir.

## Monorepo — Satu repositori untuk FE dan BE
- Buat satu repositori utama, yaitu SI-Monitoring-Kehadiran-Mahasiswa
- Di dalamnya, buat dua folder: /frontend dan /backend
- Masukkan kode frontend di folder /frontend, kode backend di folder /backend

Clone repo FE dan BE secara terpisah dulu:
```
git clone https://github.com/gerinnr/FrontEnd-SiMon.git
```
```
git clone https://github.com/NalindraDT/Simon-kehadiran.git
```
Pakai repo yang sudah ada untuk merepo
```
git clone https://github.com/AuliaFitriNurAzizah/SI-Monitoring-Kehadiran-Mahasiswa.git
cd SI-Monitoring-Kehadiran-Mahasiswa
```
Copy isi repo FE ke folder /frontend di monorepo:
```
mkdir frontend
cp -r ../FrontEnd-SiMon/* frontend/
```
Copy isi repo BE ke folder /backend di monorepo:
```
mkdir backend
cp -r ../Simon-kehadiran/* backend/
```
Commit perubahan:
```
git add .
git commit -m "Add frontend and backend as monorepo structure"
git push origin main
```


