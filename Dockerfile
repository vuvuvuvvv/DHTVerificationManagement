FROM python:3.10-slim

# Set working dir
WORKDIR /app

# Install deps
RUN apt update && apt install -y \
  gcc \
  curl \
  libpq-dev \
  python3-dev \
  postgresql-client \
  build-essential \
  openssh-server \
  supervisor \
  git

# Install Node.js LTS v20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt install -y nodejs

# SSH config
RUN mkdir /var/run/sshd && \
    echo "root:root@123" | chpasswd && \
    sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Set environment variables
ENV FLASK_APP=manage:app
ENV PYTHONUNBUFFERED=1
ENV PATH="/root/.local/bin:$PATH"

# Copy backend
COPY flask-verification-management /app/flask-verification-management
WORKDIR /app/flask-verification-management
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy frontend
COPY nextjs-verification-management /app/nextjs
WORKDIR /app/nextjs
RUN npm install

# Copy supervisord config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose ports
EXPOSE 22 3000 5000

# Run all via supervisord
CMD ["/usr/bin/supervisord"]
