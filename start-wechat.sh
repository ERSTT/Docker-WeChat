#!/bin/sh

MARKER="/usr/local/wechat_installed"

if [ ! -f "$MARKER" ]; then
    curl -L -o /tmp/WeChatLinux_x86_64.deb \
        https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.deb && \
    apt-get install -y /tmp/WeChatLinux_x86_64.deb && \
    rm -rf /tmp/WeChatLinux_x86_64.deb

    touch "$MARKER"
fi

/usr/bin/wechat > /dev/null 2>&1 &
