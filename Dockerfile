FROM lsiobase/selkies:debiantrixie

ENV TITLE=Tencent
ENV LC_ALL=zh_CN.UTF-8
ENV NO_FULL=true
ENV NO_GAMEPAD=true

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        fonts-noto-cjk \
        curl \
        ca-certificates \
        libgtk-3-0 \
        libnotify4 \
        libnss3 \
        libxss1 \
        libxtst6 \
        xdg-utils \
        libatspi2.0-0 \
        libuuid1 \
        libsecret-1-0 \
        libappindicator3-1 && \
    mkdir -p /defaults && \
    curl -L -o /defaults/menu.xml \
        https://raw.githubusercontent.com/ERSTT/Docker-WeChat/refs/heads/main/menu.xml && \
    curl -L -o /usr/share/selkies/www/icon.png \
        https://raw.githubusercontent.com/ERSTT/Docker-WeChat/refs/heads/main/Tencent.png && \
    curl -L -o /usr/bin/start-tencent.sh \
        https://raw.githubusercontent.com/ERSTT/Docker-WeChat/refs/heads/main/start-tencent.sh && \
    curl -L -o /usr/local/wechat-icon.png \
        https://raw.githubusercontent.com/ERSTT/Docker-WeChat/refs/heads/main/wechat-icon.png && \
    curl -L -o /usr/local/qq-icon.png \
        https://raw.githubusercontent.com/ERSTT/Docker-WeChat/refs/heads/main/qq-icon.png && \
    chmod +x /usr/bin/start-tencent.sh && \
    echo "/usr/bin/start-tencent.sh" > /defaults/autostart && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
