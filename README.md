# SI-Monitoring-Kehadiran-Mahasiswa
🚀 Setup & Deployment Guide
📌 Prerequisites
Sebelum menjalankan proyek ini, pastikan Anda sudah menginstal:

Docker Desktop
Git
📥 Clone Repository
Jalankan perintah berikut untuk mengunduh proyek dari GitHub:

git clone https://github.com/abdau88/jobsheet1.git
cd repository-name
🛠️ Setup & Jalankan dengan Docker Compose
Pastikan Docker Desktop sudah berjalan.
Jalankan perintah berikut untuk membangun dan menjalankan container:
docker-compose up -d --build
Pastikan semua container berjalan dengan baik:
docker ps
🎯 Akses Aplikasi
Backend (CodeIgniter): http://localhost:8000
Frontend (Laravel): http://localhost:3000
PHPMyAdmin (Opsional): http://localhost:8080
🛠️ Konfigurasi Database
Host: database
User: root
Password: root
Database Name: mydb
Jika ingin masuk ke MySQL dalam container:

docker exec -it nama_container_mysql mysql -u root -p
🔄 Update & Rebuild
Jika ada perubahan dalam kode, jalankan:

git pull origin main
docker-compose up -d --build
🛑 Stop & Remove Containers
Jika ingin menghentikan layanan, jalankan:

docker-compose down