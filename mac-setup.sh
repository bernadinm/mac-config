#!/bin/zsh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

brew tap homebrew/cask-fonts
brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} brew install --cask {} || true

# xargs brew install < brew.txt
brew update
brew install slate
brew install terraform
brew install wget
brew install git gti gh
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
brew install gtop
brew install glances
brew install deno
brew install gnu-tar # for building kubernetes
brew install bash-completion
brew install zsh-completions
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
brew install tldr
brew install pwgen
brew install go-jira
brew install graphviz
brew install python3 && sudo easy_install pip
brew install rust
brew install maven
brew install bash; sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
brew tap saulpw/vd # visidata
brew install visidata
brew install wtfutil
brew install zsh-syntax-highlighting
brew tap sstadick/hck
brew install hck
brew install kind
brew install glow
brew install zsh-autosuggestions
brew install pass pass-otp
brew install ffmpeg
brew install saulpw/vd/visidata
brew install bmon
brew install cue
brew install dagger
brew install lsusb
brew install mermaid-cli # diagram as code
brew install helix # hx vim alternative
brew install hubble
brew install cilium-cli
brew install ddgr
brew install cloudflared
brew install glow # markdown reader
brew install ncdu # ncurses disk usage
brew install zoxide # cd alternative
brew install exa eza # ls alternative
brew install opa # open policy agent
brew install git-annex # git annex
brew install pre-commit # git commit hooks
brew install nap # code snippet save tool
brew install z # cd alternative
brew install pandoc # cd alternative


# AWS CLI UTIL
brew install awscli
brew install awscurl # performs requests to AWS services with request signing using curl interface
brew tap aws/tap
brew install aws-sam-cli
brew install --cask session-manager-plugin
sudo curl -Lo /usr/local/bin/ecs-cli https://amazon-ecs-cli.s3.amazonaws.com/ecs-cli-darwin-amd64-latest; sudo chmod +x /usr/local/bin/ecs-cli
brew install --cask amazon-chime

# GH extentions install
gh extension install meiji163/gh-notify
gh extension install dlvhdr/gh-dash

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
brew install k9s
export PATH="${PATH}:${HOME}/.krew/bin"
kubectl krew install view-utilization
kubectl krew install unused-volumes
kubectl krew install konfig
kubectl krew install sniff
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

# Key Imports
curl -sSL gpg.miguel.engineer  | gpg --import -
curl -sSL corp.gpg.miguel.engineer  | gpg --import -

# GPG Config
# gpg-agent profile
cat > ~/.gnupg/gpg-agent.conf <<EOF
pinentry-program /opt/homebrew/bin/pinentry-mac
enable-ssh-support
default-cache-ttl 600
max-cache-ttl 7200
EOF

killall gpg-agent

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
brew install --cask grammarly
brew install --cask thunderbird
brew install --cask rustdesk
brew install --cask wireshark

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

brew install --cask font-3270-nerd-font

# Install Starship Prompt
curl -sS https://starship.rs/install.sh | sh

# Configure iterm profiles
curl -sSL https://raw.githubusercontent.com/bernadinm/mac-config/master/iterm-profile.json > ~/Library/Application\ Support/iTerm2/DynamicProfiles/iterm-profile.json

# zshrc
cat > ~/.zshrc <<'EOF'
set -o ignoreeof
alias d='bws && eval $(bws -s -env)'
alias mp='until nc $(VBoxManage guestproperty get "NixOS" "/VirtualBox/GuestInfo/Net/0/V4/IP" | cut -d" " -f2) 22 -G 1 -w 0; do echo Connecting...; sleep 10; done && ssh mb@$(VBoxManage guestproperty get "NixOS" "/VirtualBox/GuestInfo/Net/0/V4/IP" | cut -d" " -f2)'
alias mx='Vboxmanage startvm "NixOS" --type headless && VBoxManage controlvm "NixOS" addencpassword "NixOS" -'
alias mm='VBoxManage controlvm NixOS poweroff NixOS'
alias up='find ~/git/DevOps/ -name terraform.tfstate | xargs -L1 ls -l | sort -rk5 --numeric-sort | awk "{if( \$5 > 10000) print \$0}"'
alias k='kubectl'
alias j='jira'
alias pp='cd $HOME/git/waydabber/m1ddc; ./m1ddc set input 18; cd - ; # hdmi-2'
alias ww='cd $HOME/git/waydabber/m1ddc; ./m1ddc set input 27; cd - ; # USB-C'
alias gpom='git pull origin master'
alias gPom='git push origin master'
alias ga='git add '
alias gcm='git commit -m '
alias gcma='git commit --amend -m '
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
alias gsp='git stash pop'
alias gds='git diff --staged'
alias gau='git add -u'
alias g='cd ~/git'
alias n='cd ~/git/bernadinm/nix-config'
alias vi='hx'
alias ll='exa -l'
alias ls='exa'
alias k='kubectl'
alias lsaltr='exa -al --sort=oldest --reverse'
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export PATH="$PATH:${HOME}/.deno/bin"
export PATH="$PATH:/opt/homebrew/bin/"
export PATH="$PATH:${HOME}/Library/Python/3.8/bin"
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export EDITOR="hx" # gh cli
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

export GPG_TTY=$(tty)
# Add the following to your shell init to set up gpg-agent automatically for every shell
if [ -n "$(pgrep gpg-agent)" ]; then
    # source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
else
    #gpg-connect-agent /bye
    eval $(gpg-agent --daemon)
fi

# Lynx ENV
export WWW_HOME=https://duckduckgo.com/lite/

# zsh-autosuggestion
# brew install zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Adding GNU make auto complete
zstyle ':completion:*:*:make:*' tag-order 'targets'

# Enable flag completion
autoload -U compinit && compinit

awsacct () {
  declare -A accounts=([dev]=12345678910 [space]=12345678910)
  if [ $# -eq 0 ]
  then
    aws configure list-profiles
  else
    export AWS_PROFILE=$1
    export AWS_DEFAULT_PROFILE=$1
    sh -c "echo $(pass otp onelogin-otp) | aws-auth-onelogin -u $(pass onelogin-username) --onelogin-password \"$(pass onelogin)\" -p $1 --aws-role-name CFN-Circle-SSO-Ops --aws-account-id ${accounts[$1]}"
  fi
}

# Adding Navi shortcut to zsh
eval "$(navi widget zsh)"
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

cat > ~/.gitconfig <<'EOF'
# This is Git's per-user configuration file.
[user]
        name = Miguel Bernadin
        email = Miguel.Bernadin@gmail.com
        signingkey = CF5D41CEBEE4D53C9FC738E2915FA8A6391DDAC6
[commit]
        gpgsign = true
[core]
        editor = /run/current-system/sw/bin/vim
        pager = delta
[filter "trimWhitespace"]
        clean = git-stripspace
[gpg]
        program = gpg2
[hub]
        protocol = git
[alias]
        cleanup = "!git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d"

[push]
        default = current
[credential "https://github.com"]
        helper = !/run/current-system/sw/bin/gh auth git-credential

[interactive]
        diffFilter = delta --color-only --features=interactive

[delta]
        features = decorations
        line-numbers = true
        side-by-side = true

[delta "interactive"]
        keep-plus-minus-markers = false

[delta "decorations"]
        commit-decoration-style = blue ol
        commit-style = raw
        file-style = omit
        hunk-header-decoration-style = blue box
        hunk-header-file-style = red
        hunk-header-line-number-style = "#067a00"
        hunk-header-style = file line-number syntax
EOF

# iTerm2 settings
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/dotfiles/iterm2" # TODO(mbernadin): find correct file and source it before running
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool false

# Ensure notifications stay longer
defaults write com.apple.notificationcenterui bannerTime 5

# Add import personal cmds to navi
navi repo add git@github.com:bernadinm/cheats

# Add enable starship prompt
eval "$(starship init zsh)"
