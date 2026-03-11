FROM php:8.2-apache

# Instalar dependências do sistema para GD
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libwebp-dev \
    libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*

# Instalar extensões PHP necessárias (incluindo GD para manipulação de imagens)
RUN docker-php-ext-configure gd --with-jpeg --with-webp --with-freetype \
    && docker-php-ext-install mysqli pdo pdo_mysql gd

# Habilitar módulos do Apache (rewrite, headers, compressão, cache)
RUN a2enmod rewrite headers deflate expires

# Configurar o Apache para permitir .htaccess
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Configurar timezone PHP
RUN echo "date.timezone = America/Sao_Paulo" > /usr/local/etc/php/conf.d/timezone.ini

# Configurar upload e limites PHP
RUN echo "upload_max_filesize = 50M\npost_max_size = 50M\nmemory_limit = 256M\nmax_execution_time = 300" > /usr/local/etc/php/conf.d/custom.ini

# Copiar arquivos do projeto (excluindo node_modules via .dockerignore)
COPY . /var/www/html/

# Criar diretório de uploads e garantir permissões
RUN mkdir -p /var/www/html/uploads /var/www/html/logs

# Permissões
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 775 /var/www/html/uploads /var/www/html/logs

EXPOSE 80
