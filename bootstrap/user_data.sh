#!/bin/bash
# Atualiza pacotes
apt-get update -y
apt-get upgrade -y

# Instala Docker
apt-get install -y docker.io

# Inicia e habilita Docker
systemctl start docker
systemctl enable docker

# Adiciona o usuário ubuntu ao grupo docker
usermod -aG docker ubuntu

# Baixa e executa a aplicação Node.js via Docker
docker run -d \
  --name node-app \
  -p 80:3000 \
  gabriel1304/node-app:latest
