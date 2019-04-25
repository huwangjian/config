#!/bin/sh

#install xcode first

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew install cask

curl -s https://gist.githubusercontent.com/atais/9c72e469b1cbec35c7c430ce03de2a6b/raw/36808a0544628398f26b48f7a3c7b309872ca2c6/cask_upgrade.sh -o /usr/local/bin/cask-upgrade
chmod +x /usr/local/bin/cask-upgrade

mkdir -p ~/.crontab
echo "0 12 * * * crontab ~/.crontab/crontab.list" > ~/.crontab/crontab.list
echo "0 12 * * * /usr/local/bin/brew update >> ~/.crontab/brew-update.log"  >> ~/.crontab/crontab.list
echo "0 13 * * * /usr/local/bin/brew upgrade >> ~/.crontab/brew-update.log"  >> ~/.crontab/crontab.list
echo "0 13 * * * /usr/local/bin/cask-upgrade >> ~/.crontab/brew-update.log"  >> ~/.crontab/crontab.list
crontab ~/.crontab/crontab.list

#==============================================================================#

brew install coreutils 

brew install zsh
brew install wget
brew install node
brew install python

brew install vim
#brew install macvim

brew install mpv
ln -Fs `find /usr/local/ -name "mpv.app"` /Applications/mpv.app

#brew install shadowsocks-libev

#==============================================================================#

brew cask install keka
#brew cask install iterm2
brew cask install go2shell
#brew cask install cheatsheet

#brew cask install atom
brew cask install visual-studio-code
#brew cask install github
#brew cask install mysqlworkbench

#brew cask install calibre
#brew cask install waterfox
brew cask install google-chrome
#brew cask install resilio-sync
#brew cask install neteasemusic

brew doctor

#==============================================================================#

mkdir fonts && cd fonts
curl -s https://raw.githubusercontent.com/powerline/fonts/master/Inconsolata/Inconsolata%20for%20Powerline.otf -o Powerline.otf
curl -s https://raw.githubusercontent.com/google/fonts/master/ofl/inconsolata/Inconsolata-Regular.ttf -o Inconsolata-Regular.ttf
curl -s https://raw.githubusercontent.com/google/fonts/master/ofl/inconsolata/Inconsolata-Bold.ttf -o Inconsolata-Bold.ttf
mv *.* /Library/Fonts/
cd .. && rm -rf fonts/