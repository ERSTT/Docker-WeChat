FROM lsiobase/selkies:debiantrixie

ENV TITLE=WeChat
ENV LC_ALL=zh_CN.UTF-8

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        fonts-noto-cjk \
        curl \
        ca-certificates && \
    mkdir -p /defaults && \
    curl -L -o /defaults/menu.xml \
        https://raw.githubusercontent.com/ERSTT/Docker-WeChat/refs/heads/main/menu.xml && \
    curl -L -o /usr/share/selkies/www/icon.png \
        https://raw.githubusercontent.com/ERSTT/Docker-WeChat/refs/heads/main/WeChat.png && \
    curl -L -o /usr/bin/start-wechat.sh \
        https://raw.githubusercontent.com/ERSTT/Docker-WeChat/refs/heads/main/start-wechat.sh && \
    curl -L -o /usr/local/wechat-icon.png \
        https://raw.githubusercontent.com/ERSTT/Docker-WeChat/refs/heads/main/wechat-icon.png && \
    chmod +x /usr/bin/start-wechat.sh && \
    echo "/usr/bin/start-wechat.sh" > /defaults/autostart && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
