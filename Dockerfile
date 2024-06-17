# Gunakan image ubuntu sebagai base image
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Buat direktori untuk menyimpan data
RUN mkdir /home/coder

# Salin file konfigurasi jika diperlukan (opsional)
# COPY config.yaml /home/coder/.config/code-server/config.yaml

# Set working directory
WORKDIR /home/coder

# Ekspose port yang digunakan oleh code-server
EXPOSE 8080

# Set user dan password untuk code-server
ENV PASSWORD=Edinst

# Jalankan code-server
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "."]
