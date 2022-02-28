#!/bin/bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

# xargs brew install < brew.txt
brew update
brew install slate
brew install terraform
brew install wget
brew install git gti
brew install hub
brew install gpg-suite
brew install pinentry-mac
brew install tmate
brew install lynx
brew install jq
brew install python-yq yamllint
brew install node; npm i -g json-to-js state-machine-cat serverless-offline-python
brew install trash
brew install iproute2mac
brew install azure-cli
brew install awscli
brew install serverless
brew install mas
brew install watch
brew install aria2
brew install vault
brew install go dep
brew install rustup
brew install tree
brew intsall packer
brew install shellcheck
brew install git-crypt
brew install glide
brew install ykman
brew install htop
brew install deno
brew install gnu-tar # for building kubernetes
brew install bash-completion
brew install speedtest-cli
brew install youtube-dl
brew install yggdrasil
brew install coreutils
brew install websocat
brew install gopass
brew install notion
brew install the_silver_searcher
brew install rg
brew install sd
brew install fd
brew install navi
brew install graphviz
brew install python3 && sudo easy_install pip
brew install bash; sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
brew tap saulpw/vd # visidata
brew install visidata
brew install wtfutil
brew install romkatv/powerlevel10k/powerlevel10k
brew tap aws/tap
brew install aws-sam-cli
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
brew install zsh-syntax-highlighting

# Install Fonts
curl -so ~/Library/Fonts/MesloLGF-Regular.ttf "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
curl -so ~/Library/Fonts/MesloLGF-Bold.ttf "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
curl -so ~/Library/Fonts/MesloLGF-Italic.ttf "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
curl -so ~/Library/Fonts/MesloLGF-Bold-Italic.ttf "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"

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
syntax on
EOF

# Enable locate
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

# Kubernetes related binaries
brew install jsonnet
brew install ksonnet/tap/ks
brew tap instrumenta/instrumenta
brew install kubeval
brew install tmux
brew install krew
export PATH="${PATH}:${HOME}/.krew/bin"
kubectl krew install view-utilization
kubectl krew install unused-volumes
kubectl krew install konfig
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

# Golang utils
go get -u github.com/mgechev/revive
go get github.com/blushft/go-diagrams

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
mas install 1319778037 # iStats menus

# brew cask list | xargs -L1
brew install --cask google-chrome
brew install --cask brave-browser
brew install --cask iterm2
brew install --cask spectacle
brew install --cask flux
brew install --cask virtualbox
brew install --cask atom
brew install --cask marshallofsound-google-play-music-player
brew install --cask slack
brew install --cask docker
brew install --cask cloudapp
brew install --cask google-cloud-sdk
brew install --cask vagrant
brew install --cask virtualbox # this will fail (mac security settings)
brew install --cask zoomus
brew install --cask ngrok
brew install --cask java
brew install --cask visual-studio-code
brew install --cask lunar
brew install --cask krisp
brew install --cask iina
brew install --cask canon-eos-utility
brew install --cask adobe-creative-cloud
brew install --cask fanny
brew install --cask grammarly
brew install --cask amethyst
brew install --cask remarkable # https://github.com/Homebrew/homebrew-cask/pull/102776 (my PR)

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

# Mac ScreenSaver https://github.com/agarrharr/awesome-macos-screensavers
brew install --cask grid-clock
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName GridClock path /Users/$USER/Library/Screen\ Savers/Grid\ Clock.saver type 0
brew install --cask aerial
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName GridClock path /Users/$USER/Library/Screen\ Savers/Aerial.saver type 0

# System Setup
mkdir -p ~/git

# Configure Pureline
# mkdir -p ~/git/chris-marsh
# git clone https://github.com/chris-marsh/pureline.git ~/git/chris-marsh/pureline
# cp ~/git/chris-marsh/pureline/configs/powerline_full_256col.conf ~/.pureline.conf
pip3.7 install --user powerline-status

# Install Powerline Font
mkdir -p ~/git/powerline
git clone https://github.com/powerline/fonts.git ~/git/powerline/fonts --depth=1
bash ~/git/powerline/fonts/install.sh

# Configure iterm profiles
curl -sSL https://raw.githubusercontent.com/bernadinm/mac-config/master/iterm-profile.json > ~/Library/Application\ Support/iTerm2/DynamicProfiles/iterm-profile.json

# bash_profile
cat > ~/.bash_profile <<'EOF'
set -o ignoreeof
alias d='bws && eval $(bws -s -env)'
alias mp='until nc $(VBoxManage guestproperty get "NixOS" "/VirtualBox/GuestInfo/Net/0/V4/IP" | cut -d" " -f2) 22 -G 1 -w 0; do echo Connecting...; sleep 10; done && ssh mb@$(VBoxManage guestproperty get "NixOS" "/VirtualBox/GuestInfo/Net/0/V4/IP" | cut -d" " -f2)'
alias mx='Vboxmanage startvm "NixOS" --type headless && VBoxManage controlvm "NixOS" addencpassword "NixOS" -'
alias mm='VBoxManage controlvm NixOS poweroff NixOS'
alias up='find ~/git/DevOps/ -name terraform.tfstate | xargs -L1 ls -l | sort -rk5 --numeric-sort | awk "{if( \$5 > 10000) print \$0}"'
alias k='kubectl'
alias pp='cd $HOME/git/kfix/ddcctl/bin/release; ./ddcctl -d 1 -i 18 >/dev/null; cd - ; # hdmi-2'
alias ww='cd $HOME/git/kfix/ddcctl/bin/release; ./ddcctl -d 1 -i 27 >/dev/null; cd - ; # USB-C'
alias gpom='git pull origin master'
alias gPom='git push origin master'
alias gcb='git checkout -b '
alias gc='git checkout'
alias grh='git reset --hard'
alias grhom='git reset --hard origin/master'
alias gfa='git fetch --all'
alias grom='git rebase origin/master'
alias gp='git pull'
alias gph='git pull --hard'
alias gd='git diff'
alias gs='git status'
alias gds='git diff --staged'
alias gau='git add -u'
alias ll='ls -la'
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

# slate profile
cat > ~/.slate <<'EOF'
# Configuration options
config defaultToCurrentScreen true
config modalEscapeKey esc
config nudgePercentOf screenSize
config resizePercentOf screenSize
config windowHintsShowIcons true
config windowHintsIgnoreHiddenWindows false
config windowHintsSpread true
config windowHintsSpreadSearchWidth 200
config windowHintsSpreadSearchHeight 200

#--------------------------------------------------------------------
# Aliases
#--------------------------------------------------------------------
# Modal key
alias modal-key w,shift,cmd

# Some apps
alias app-browser 'Google Chrome'
alias app-irc 'Textual'
alias app-music 'Finder'
alias app-terminal 'iTerm'

# Easy helpers for long variable names...
alias sox screenOriginX
alias soy screenOriginY
alias ssx screenSizeX
alias ssy screenSizeY

# Positioning aliases
alias full move ${sox};${soy} ${ssx};${ssy}
alias left-half move ${sox};${soy} ${ssx}/2+1;${ssy}
alias right-half move ${sox}+${ssx}/2;${soy} ${ssx}/2;${ssy}
alias top-half move ${sox};${soy} ${ssx};${ssy}/2
alias bot-half move ${sox};${soy}+${ssy}/2 ${ssx};${ssy}/2
alias top-left-corner move ${sox};${soy} ${ssx}/2;${ssy}/2
alias top-right-corner move ${sox}+${ssx}/2;${soy} ${ssx}/2;${ssy}/2
alias bot-left-corner move ${sox};${soy}+${ssy}/2 ${ssx}/2;${ssy}/2
alias bot-right-corner move ${sox}+${ssx}/2;${soy}+${ssy}/2 ${ssx}/2;${ssy}/2

#--------------------------------------------------------------------
# Layouts
#--------------------------------------------------------------------
# This layout is used with one screen
layout 1coding 'Google Chrome':REPEAT ${full}
layout 1coding 'iTerm':REPEAT ${full}
layout 1coding 'Finder':REPEAT ${full}
layout 1coding 'Textual':REPEAT move ${sox}+550;${soy}+75 800;575
layout 1coding 'Tweetbot' move ${ssx}-480-40;${soy} 480;${ssy}

# This layout is used with two screens
layout 2coding 'Firefox':REPEAT move ${sox}+387;${soy}+100 1800;1200 0
layout 2coding 'Google Chrome':REPEAT move ${sox}+387;${soy}+100 1800;1200 0
layout 2coding 'iTerm':REPEAT ${full} 0
layout 2coding 'Finder':REPEAT ${full} 1
layout 2coding 'Textual':REPEAT move ${sox}+1200;${soy}+20 800;575 0
layout 2coding 'Tweetbot' move ${ssx}-480-40;${soy}+20 480;1000 0

# This layout is used with two screens where the big screen is on the right
layout 2rcoding 'Firefox':REPEAT move ${sox}+387;${soy}+100 1800;1200 1
layout 2rcoding 'Google Chrome':REPEAT move ${sox}+387;${soy}+100 1800;1200 1
layout 2rcoding 'iTerm':REPEAT ${full} 1
layout 2rcoding 'Finder':REPEAT ${full} 0
layout 2rcoding 'Textual':REPEAT move ${sox}+1200;${soy}+20 800;575 1
layout 2rcoding 'Tweetbot' move ${ssx}-480-40;${soy}+20 480;1000 1

# Push Bindings
bind right:ctrl;cmd  push right bar-resize:screenSizeX/3
bind left:ctrl;cmd   push left  bar-resize:screenSizeX/3
bind up:ctrl;cmd     push up    bar-resize:screenSizeY/2
bind down:ctrl;cmd   push down  bar-resize:screenSizeY/2

# Nudge Bindings
bind right:shift;cmd nudge +10% +0
bind left:shift;cmd  nudge -10% +0
bind up:shift;cmd    nudge +0   -10%
bind down:shift;cmd  nudge +0   +10%

#--------------------------------------------------------------------
# Bindings
#--------------------------------------------------------------------
# Activate layouts, this is all done via modal-keys
bind 1:${modal-key} sequence layout 1coding
bind 2:${modal-key} sequence layout 2coding
bind 3:${modal-key} sequence layout 2rcoding

# Focus windows in certain directions
bind h:cmd,shift focus left
bind l:cmd,shift focus right
bind j:cmd,shift focus down
bind k:cmd,shift focus up

# Move windows to certain locations on the screen
bind f:cmd,ctrl ${full}
bind h:cmd,ctrl ${left-half}
bind l:cmd,ctrl ${right-half}
bind j:cmd,ctrl ${bot-half}
bind k:cmd,ctrl ${top-half}
bind u:cmd,ctrl ${top-left-corner}
bind i:cmd,ctrl ${top-right-corner}
bind n:cmd,ctrl ${bot-left-corner}
bind m:cmd,ctrl ${bot-right-corner}

# Focus helpers
bind b:e,cmd focus ${app-browser}
bind i:e,cmd focus ${app-irc}
bind m:e,cmd focus ${app-music}
bind t:e,cmd focus ${app-terminal}
bind /:e,cmd hint
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
