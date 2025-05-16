# SI-Monitoring-Kehadiran-Mahasiswa
## Membuat Struktur Proyek
```
project-docker/
│── backend/         # CodeIgniter Project
│── frontend/        # Laravel Project
│── docker/
│   ├── Dockerfile-php
│   ├── Dockerfile-nginx
│   ├── my.cnf
│   ├── default.conf
│── .env
│── docker-compose.yml
```
## Docker Setup
```
FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
```

## Konfigurasi Nginx
```
server {
    listen 80;
    server_name localhost;
    root /var/www/public;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_pass backend:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}
```

## docker-compose.yml
```
version: '3.8'

services:
  mysql:
    image: mysql:8
    container_name: mysql_container
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: mydatabase
      MYSQL_USER: user
      MYSQL_PASSWORD: password
    ports:
      - "3306:3306"
    volumes:
      - mysql_data:/var/lib/mysql

  backend:
    build:
      context: .
      dockerfile: docker/Dockerfile-php
    container_name: backend_container
    restart: always
    working_dir: /var/www
    volumes:
      - ./backend:/var/www
    depends_on:
      - mysql
    ports:
      - "9000:9000"

  frontend:
    build:
      context: .
      dockerfile: docker/Dockerfile-php
    container_name: frontend_container
    restart: always
    working_dir: /var/www
    volumes:
      - ./frontend:/var/www
    depends_on:
      - backend
    ports:
      - "5173:5173"

  nginx:
    build:
      context: .
      dockerfile: docker/Dockerfile-nginx
    container_name: nginx_container
    restart: always
    ports:
      - "8080:80"
    depends_on:
      - backend
      - frontend
    volumes:
      - ./backend:/var/www
      - ./docker/default.conf:/etc/nginx/conf.d/default.conf

volumes:
  mysql_data:
```
##Backend (CodeIgniter)
```
git clone https://github.com/username/codeigniter-backend.git backend
cd backend
composer install
cp env .env
php artisan key:generate
```
##Frontend (Laravel)
```
git clone https://github.com/username/laravel-frontend.git frontend
cd frontend
composer install
npm install
cp .env.example .env
php artisan key:generate
```
##build 
```
docker-compose up -d --build
```

