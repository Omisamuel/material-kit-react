# Use Ubuntu for the next service
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    apache2 \
    wget \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory to Apache's default document root
WORKDIR /var/www/html

# Download, unzip and clean up in a single layer to reduce image size
RUN wget -O main.zip https://github.com/Omisamuel/material-kit-react/archive/refs/heads/main.zip && \
    unzip main.zip && \
    mv 2133_moso_interior-main/* . && \
    rm -rf 2133_moso_interior-main main.zip

# Expose HTTP port
EXPOSE 80

# Start Apache process in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

