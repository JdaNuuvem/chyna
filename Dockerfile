FROM php:8.2-apache

# Instalar extensões PHP necessárias
RUN docker-php-ext-install mysqli pdo pdo_mysql

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

# Permissões
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

EXPOSE 80
