#!/bin/sh

WeChat="/usr/local/wechat_installed"

if [ ! -f "$WeChat" ]; then
    sudo curl -L -o /tmp/WeChatLinux_x86_64.deb \
        https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.deb && \
    sudo apt-get install -y /tmp/WeChatLinux_x86_64.deb && \
    sudo rm -rf /tmp/WeChatLinux_x86_64.deb

    sudo touch "$WeChat"
fi

/usr/bin/wechat > /dev/null 2>&1 &
