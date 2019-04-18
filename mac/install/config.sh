#!/bin/sh

# No last login info
touch ~/.hushlogin
#open -a Go2Shell --args config

# Show all files
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

# Font smoothing
defaults -currentHost write -g AppleFontSmoothing -int 3
# Resize animation
defaults write -g NSAutomaticWindowAnimationEnabled -bool FALSE
# Showing and hiding Launchpad animation
defaults write com.apple.dock springboard-show-duration -int 0
defaults write com.apple.dock springboard-hide-duration -int 0
defaults write com.apple.dock springboard-page-duration -int 0
# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES
killall Dock

# Disable DS NetworkStores
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
find . -name '*.DS_Store' -type f -delete
# App store Download folder
defaults write com.apple.appstore ShowDebugMenu -bool true

# Disable Bonjour service advertising without disabling DNS
sudo /usr/libexec/PlistBuddy -c "Add :ProgramArguments: string '-NoMulticastAdvertisements'" /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
sudo launchctl unload /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
sudo launchctl load /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
sudo killall -HUP mDNSResponder

# Disable Hibernate
#sudo pmset -a hibernatemode 0
#sudo rm -rf /private/var/vm/sleepimage

#==============================================================================#

cp -rf ./dotfiles/gitconfig ~/.gitconfig
cp -rf ./dotfiles/gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

mkdir -p ~/.config/mpv/
cp -rf ./dotfiles/*.conf ~/.config/mpv/

# oh my zsh
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s `which zsh`


sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -s https://raw.githubusercontent.com/wesbos/Cobalt2-iterm/master/cobalt2.zsh-theme -o ~/.oh-my-zsh/themes/cobalt2.zsh-theme
curl -s https://raw.githubusercontent.com/wesbos/Cobalt2-iterm/master/cobalt2.itermcolors -o ~/Downloads/cobalt2.itermcolors
curl -s https://raw.githubusercontent.com/lysyi3m/osx-terminal-themes/master/schemes/Cobalt2.terminal
# plugins=( [plugins...] zsh-syntax-highlighting)
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
cp -rf ./dotfiles/zshrc ~/.zshrc

# vimrc awesome
git clone git://github.com/amix/vimrc.git ~/.vim\_runtime
# sh ~/.vim_runtime/install_basic_vimrc.sh
sh ~/.vim_runtime/install_awesome_vimrc.sh
cp -rf ./dotfiles/vimrc ~/.vimrc

#==============================================================================#

#remove google upgrade agent
~/Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle/Contents/Resources/GoogleSoftwareUpdateAgent.app/Contents/Resources/ksinstall --uninstall
rm -R ~/Library/Google/GoogleSoftwareUpdate
touch ~/Library/Google/GoogleSoftwareUpdate
rm -R ~/Library/Caches/com.google.SoftwareUpdate
rm -R ~/Library/Caches/com.google.Keystone