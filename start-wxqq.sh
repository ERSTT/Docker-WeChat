#!/bin/sh

WeChat="/usr/local/wechat_installed"
QQ="/usr/local/qq_installed"

WeChatLog="/config/log/WeChat.log"
QQLog="/config/log/QQ.log"

if [ ! -f "$WeChat" ]; then
    echo "Install WeChat" | tee -a "$WeChatLog"
    sudo curl -L -o /tmp/WeChatLinux_x86_64.deb \
        https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.deb 2>&1 | tee -a "$WeChatLog"
    sudo apt-get install -y /tmp/WeChatLinux_x86_64.deb 2>&1 | tee -a "$WeChatLog"
    sudo rm -rf /tmp/WeChatLinux_x86_64.deb 2>&1 | tee -a "$WeChatLog"
    sudo touch "$WeChat" 2>&1 | tee -a "$WeChatLog"
fi

if [ ! -f "$QQ" ]; then
    echo "Install QQ" | tee -a "$QQLog"
    sudo curl -L -o /tmp/QQLinux_x86_64.deb \
        https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.20_251023_amd64_01.deb 2>&1 | tee -a "$QQLog"
    sudo apt-get install -y /tmp/QQLinux_x86_64.deb 2>&1 | tee -a "$QQLog"
    sudo rm -rf /tmp/QQLinux_x86_64.deb 2>&1 | tee -a "$QQLog"
    sudo touch "$QQ" 2>&1 | tee -a "$QQLog"
fi

/usr/bin/wechat > /dev/null 2>&1 &
/usr/bin/qq > /dev/null 2>&1 &
