#!/bin/sh
# curl http://flora.leaskh.com/pac?proxy=SOCKS5%20127.0.0.1%3A8964 -o /usr/local/etc/proxy.pac

cp -rf *.plist /usr/local/opt/shadowsocks-libev/
cp -rf *.json /usr/local/etc/

mkdir -p /usr/local/opt/kcptun
sudo cp -rf ./kcptun/* /usr/local/opt/kcptun

mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/shadowsocks-libev/*.plist ~/Library/LaunchAgents

echo "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.shadowsocks-libev.plist" > /usr/local/bin/ssreload
echo "launchctl unload ~/Library/LaunchAgents/domain.kcptun.plist" >> /usr/local/bin/ssreload

echo "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.shadowsocks-libev.plist" >> /usr/local/bin/ssreload
echo "launchctl load ~/Library/LaunchAgents/domain.kcptun.plist" >> /usr/local/bin/ssreload

chmod +x /usr/local/bin/ssreload

/usr/local/bin/ssreload