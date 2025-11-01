#!/bin/sh

QQ="/usr/local/qq_installed"
QQLog="/config/log/QQ.log"

if [ ! -f "$QQ" ]; then
    echo "Install QQ" | tee -a "$QQLog"
    sudo curl -L -o /tmp/QQLinux_x86_64.deb \
        https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.20_251023_amd64_01.deb 2>&1 | tee -a "$QQLog"
    sudo apt-get install -y /tmp/QQLinux_x86_64.deb 2>&1 | tee -a "$QQLog"
    rm -rf /tmp/QQLinux_x86_64.deb 2>&1 | tee -a "$QQLog"
    sudo touch "$QQ" 2>&1 | tee -a "$QQLog"
fi

/usr/bin/qq > /dev/null 2>&1 &
