FROM php:8.3-fpm

# Install dependensi sistem yang diperlukan untuk membangun dan menjalankan aplikasi PHP
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Bersihkan cache APT agar ukuran image lebih kecil
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mysqli mbstring exif pcntl bcmath gd intl

# Salin Composer dari image resmi Composer ke dalam container
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory di dalam container ke /var/www
WORKDIR /var/www

# Salin seluruh file aplikasi dari host ke dalam container di direktori kerja
COPY . /var/www

# Install dependenciesJalankan perintah composer install untuk menginstal semua dependensi PHP aplikasi
RUN composer install

# Ubah pemilik semua file di /var/www menjadi user dan group www-data (user PHP-FPM)
RUN chown -R www-data:www-data /var/www

# Membuka port 9000 agar container dapat menerima request PHP-FPM dari web server (misal Nginx)
EXPOSE 9000