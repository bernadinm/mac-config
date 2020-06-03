#!/bin/bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

# xargs brew install < brew.txt
brew update
brew install spectacle
brew install terraform
brew install wget
brew install git gti
brew install hub
brew install gpg2
brew install pinentry-mac
brew install tmate
brew install lynx
brew install jq
brew install python-yq
brew install node; npm i -g json-to-js
brew install trash
brew install azure-cli
brew install awscli
brew install mas
brew install watch
brew install aria2
brew install go dep
brew install rustup
brew install tree
brew intsall packer
brew install shellcheck
brew install git-crypt
brew install glide
brew install ykman
brew install deno
brew install bash-completion
brew install speedtest-cli
brew install python3 && sudo easy_install pip
brew install bash; sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'

# Install xcode
xcode-select --install

# Vim 8 Packages
git clone https://github.com/rust-lang/rust.vim ~/.vim/pack/plugins/start/rust.vim # rust.vim
git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/terraform.vim # terraform.vim

# Vim vundle install
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Vim vundle packages
brew install fzf

# vim_rc
cat > ~/.vimrc <<'EOF'
filetype plugin indent on
syntax on
set list
set number
set ff=unix
set hlsearch
set cursorline
highlight LineNr ctermfg=darkgrey

" Vundle Config Below --
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" jsonnet plugin
Plugin 'google/vim-jsonnet'

" vim-arline / powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Add homebrew fzf to the vim path:
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'
map ; :Files<CR>

" Easy toggle off list and number
map <C-l> :set number! list!<CR>

" Vim folderNav
Plugin 'scrooloose/nerdtree'
map <C-o> :NERDTreeToggle<CR>

" Vundle Config End --
EOF

# Enable locate
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

# Kubernetes related binaries
brew install jsonnet
brew install ksonnet/tap/ks
go get -u -v github.com/heptio/sonobuoy
curl -O https://raw.githubusercontent.com/spinnaker/halyard/master/install/macos/InstallHalyard.sh
sudo bash InstallHalyard.sh
brew install kubernetes-cli
brew install kubernetes-helm
curl -sL -o kubefed.tgz https://github.com/kubernetes-sigs/kubefed/releases/download/v0.1.0-rc5/kubefedctl-0.1.0-rc5-darwin-amd64.tgz
tar -xvf kubefed.tgz
chmod +x kubefedctl
rm kubefed.tgz
mv kubefedctl /usr/local/bin/.

# GPG Config
# gpg-agent profile
cat > ~/.gnupg/gpg-agent.conf <<'EOF'
pinentry-program /usr/local/bin/pinentry-mac
enable-ssh-support
write-env-file
use-standard-socket
default-cache-ttl 600
max-cache-ttl 7200
EOF

killall gpg-agent

# mas (apple store install tool)
mas install 688211836  # easyres
mas install 595191960  # CopuCliip
mas install 1176895641 # SparkEmail
mas install 1054607607 # helium

# brew cask list | xargs -L1
brew cask install google-chrome
brew cask install brave-browser
brew cask install iterm2
brew cask install spectacle
brew cask install flux
brew cask install virtualbox
brew cask install atom
brew cask install marshallofsound-google-play-music-player
brew cask install slack
brew cask install docker
brew cask install cloudapp
brew cask install google-cloud-sdk
brew cask install vagrant
brew cask install virtualbox # this will fail (mac security settings)
brew cask install zoomus
brew cask install ngrok
brew cask install java
brew cask install visual-studio-code
brew cask install lunar

# GoTo Security and Priacy on Mac and allow Oracle
brew cask reinstall --force virtualbox

# Open Apps
open -a spectacle
open -a google-chrome
open -a brave-browser
open -a flux
open -a atom
open -a slack
open -a docker
open -a cloudapp
open -a copyclip
open -a marshallofsound-google-play-music-player

# Atom Settings
apm install Sublime-Style-Column-Selection
apm install sync-settings

# Mac Settings
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.speech.synthesis.general.prefs SpokenUIUseSpeakingHotKeyFlag -bool true
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 13
defaults write -g com.apple.trackpad.scaling 1.5
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.bluetooth" -bool true

# System Setup
mkdir -p ~/Sites

# Configure Pureline
# mkdir -p ~/Sites/chris-marsh
# git clone https://github.com/chris-marsh/pureline.git ~/Sites/chris-marsh/pureline
# cp ~/Sites/chris-marsh/pureline/configs/powerline_full_256col.conf ~/.pureline.conf
pip3.7 install --user powerline-status

# Install Powerline Font
mkdir -p ~/Sites/powerline
git clone https://github.com/powerline/fonts.git ~/Sites/powerline/fonts --depth=1
bash ~/Sites/powerline/fonts/install.sh

# Configure iterm profiles
curl -sSL https://raw.githubusercontent.com/bernadinm/mac-config/master/iterm-profile.json > ~/Library/Application\ Support/iTerm2/DynamicProfiles/iterm-profile.json

# bash_profile
cat > ~/.bash_profile <<'EOF'
set -o ignoreeof
alias d='bws && eval $(bws -s -env)'
alias mp='until nc $(VBoxManage guestproperty get "NixOS" "/VirtualBox/GuestInfo/Net/0/V4/IP" | cut -d" " -f2) 22 -G 1 -w 0; do echo Connecting...; sleep 10; done && ssh mb@$(VBoxManage guestproperty get "NixOS" "/VirtualBox/GuestInfo/Net/0/V4/IP" | cut -d" " -f2)'
alias mx='Vboxmanage startvm "NixOS" --type headless && VBoxManage controlvm "NixOS" addencpassword "NixOS" -'
alias mm='VBoxManage controlvm NixOS poweroff NixOS'
alias up='find ~/Sites/DevOps/ -name terraform.tfstate | xargs -L1 ls -l | sort -rk5 --numeric-sort | awk "{if( \$5 > 10000) print \$0}"'
alias k='kubectl'
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export PATH="$PATH:${HOME}/.deno/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# Bash Completion Enable
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# git-crypt util: workaround for https://github.com/AGWA/git-crypt/issues/39
alias gpgcryptusers='pushd .git-crypt/keys/default/0; for file in *.gpg; do echo "${file} : " && git log -- ${file} | sed -n 9p; done; popd'

#if [ "$TERM" != "linux" ]; then
#    source ~/Sites/chris-marsh/pureline/pureline ~/.pureline.conf
#fi

# Powerline
export PATH=$PATH:$HOME/Library/Python/2.7/bin:$HOME/Library/Python/3.7/bin
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. ~/Library/Python/**/lib/python/site-packages/powerline/bindings/bash/powerline.sh

# gpg ssh configs
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Lynx ENV
export WWW_HOME=https://duckduckgo.com/lite/
EOF

# iTerm2 settings
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/dotfiles/iterm2" # TODO(mbernadin): find correct file and source it before running
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Install VBoxExtention
LatestVirtualBoxVersion=$(curl http://download.virtualbox.org/virtualbox/LATEST.TXT) && curl -O "http://download.virtualbox.org/virtualbox/${LatestVirtualBoxVersion}/Oracle_VM_VirtualBox_Extension_Pack-${LatestVirtualBoxVersion}.vbox-extpack"
diff <(shasum5.18 -a 256 Oracle_VM_VirtualBox_Extension_Pack-"${LatestVirtualBoxVersion}".vbox-extpack) <(curl https://www.virtualbox.org/download/hashes/"${LatestVirtualBoxVersion}"/SHA256SUMS | grep Oracle_VM_VirtualBox_Extension_Pack-"${LatestVirtualBoxVersion}".vbox-extpack | sed 's/\*/ /g')
sudo VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-"${LatestVirtualBoxVersion}".vbox-extpack

# Download NixOS VirtualBox
curl -o ~/Downloads/nixos-18.09.1985.749a3a0d00b-x86_64-linux.ova https://d3g5gsiof5omrk.cloudfront.net/nixos/18.09/nixos-18.09.1985.749a3a0d00b/nixos-18.09.1985.749a3a0d00b-x86_64-linux.ova
# Import NixOS OVA
vboxmanage import --vsys 0 --vmname NixOS --cpus 2 --memory 8192  ~/Downloads/nixos-18.09.1985.749a3a0d00b-x86_64-linux.ova
# Select Networking
VBoxManage modifyvm NixOS --nic1 bridged
VBoxManage modifyvm NixOS --natnet1 en0
# Disable audio
VBoxManage modifyvm NixOS --audio none
# Add Encryption
VBoxManage encryptmedium "$(VBoxManage showvminfo NixOS | grep 'SATA.*UUID' | sed 's/^.*UUID: \(.*\))/\1/')" --newpassword - --cipher "AES-XTS256-PLAIN64" --newpasswordid "NixOS"

# VirtualBox Expansion
#FILENAME_PATH=$(find ~/VirtualBox\ VMs/ -name nixos-*.vmdk)
#VBoxManage clonehd "$FILENAME_PATH" "$(echo $FILENAME_PATH | sed 's/\.vmdk/.vdi/g')" --format vdi
#VBoxManage modifyhd "$(echo $FILENAME_PATH | sed 's/\.vmdk/.vdi/g')"  --resize 51200
#VBoxManage clonehd  "$(echo $FILENAME_PATH | sed 's/\.vmdk/.vdi/g')"  "$(echo $FILENAME_PATH | sed 's/\.vmdk/.vmdk2/g')" --format vmdk
#mv "$(echo $FILENAME_PATH | sed 's/\.vmdk/.vmdk2/g')"  "$(echo $FILENAME_PATH)"
