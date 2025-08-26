FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  wget \
  gnupg \
  ca-certificates \
  curl \
  unzip \
  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | \
  gpg --dearmor | \
  tee /usr/share/keyrings/google-chrome-keyring.gpg > /dev/null && \
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | \
  tee /etc/apt/sources.list.d/google-chrome.list && \
  curl -fsSL https://bun.sh/install | bash && \
  apt-get update && apt-get install -y \
  fonts-liberation \
  google-chrome-stable \
  libappindicator3-1 \
  libasound2t64 \
  libatk-bridge2.0-0 \
  libgtk-3-0 \
  libnspr4 \
  libnss3 \
  libx11-xcb1 \
  libxss1 \
  libxtst6 \
  xdg-utils \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
