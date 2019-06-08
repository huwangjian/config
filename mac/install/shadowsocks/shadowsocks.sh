#!/bin/sh

#brew install shadowsocks-libev

mkdir tmp
pushd tmp/

curl -s https://api.github.com/repos/xtaci/kcptun/releases/latest \
| grep "kcptun-darwin-amd64" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

tarball="$(find . -name "kcptun-darwin-amd64*")"
tar -xvzf $tarball
chmod +x client_darwin_amd64

popd

cp -rf ./tmp/client_darwin_amd64 /usr/local/opt/shadowsocks-libev/bin

cp -rf *json /usr/local/etc/
cp -rf *.plist /usr/local/opt/shadowsocks-libev/

mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/shadowsocks-libev/*.plist ~/Library/LaunchAgents

echo "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.shadowsocks-libev.plist" > /usr/local/bin/ssreload
echo "launchctl unload ~/Library/LaunchAgents/domain.kcptun.plist" >> /usr/local/bin/ssreload

echo "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.shadowsocks-libev.plist" >> /usr/local/bin/ssreload
echo "launchctl load ~/Library/LaunchAgents/domain.kcptun.plist" >> /usr/local/bin/ssreload

chmod +x /usr/local/bin/ssreload

/usr/local/bin/ssreload

rm -rf tmp/