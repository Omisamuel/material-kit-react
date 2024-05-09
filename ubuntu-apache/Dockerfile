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


# Set the ServerName directive to suppress the FQDN warning
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Set working directory to Apache's default document root
WORKDIR /var/www/html

# Download, unzip and clean up in a single layer to reduce image size
RUN wget -O main.zip https://github.com/Omisamuel/material-kit-react/archive/refs/heads/main.zip && \
    unzip main.zip && \
    mv material-kit-react-main/* . && \
    rm -rf material-kit-react-main main.zip

# Expose HTTP port
EXPOSE 8080

# Start Apache process in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

