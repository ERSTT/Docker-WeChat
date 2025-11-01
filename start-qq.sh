#!/bin/sh

QQ="/usr/local/qq_installed"

if [ ! -f "$QQ" ]; then
    sudo curl -L -o /tmp/QQLinux_x86_64.deb \
        https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.20_251023_amd64_01.deb && \
    sudo apt-get install -y /tmp/QQLinux_x86_64.deb && \
    sudo rm -rf /tmp/QQLinux_x86_64.deb

    sudo touch "$QQ"
fi

/usr/bin/wechat > /dev/null 2>&1 &
