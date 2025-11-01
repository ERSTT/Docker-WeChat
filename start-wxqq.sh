#!/bin/sh

WeChat="/usr/local/wechat_installed"
QQ="/usr/local/qq_installed"

if [ ! -f "$WeChat" ]; then
    {
        echo "Install WeChat"
        sudo curl -L -o /tmp/WeChatLinux_x86_64.deb \
            https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.deb
        sudo apt-get install -y /tmp/WeChatLinux_x86_64.deb
        sudo rm -rf /tmp/WeChatLinux_x86_64.deb
        sudo touch "$WeChat"
    } >> /usr/local/WeChat.log 2>&1
fi

if [ ! -f "$QQ" ]; then
    {
        echo "Install QQ"
        sudo curl -L -o /tmp/QQLinux_x86_64.deb \
            https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.20_251023_amd64_01.deb
        sudo apt-get install -y /tmp/QQLinux_x86_64.deb
        sudo rm -rf /tmp/QQLinux_x86_64.deb
        sudo touch "$QQ"
    } >> /usr/local/QQ.log 2>&1
fi

sleep 2

/usr/bin/wechat > /dev/null 2>&1 &

sleep 2

/usr/bin/qq > /dev/null 2>&1 &
