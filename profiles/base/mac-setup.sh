#!/bin/zsh

echo "Installing brew.sh as it requires sudo to install it. You may skip brew install by pressing ctrl + c."
# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
brew install python-yq yamllint pylint
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
brew tap sstadick/hck
brew install hck
brew install kind
brew install glow
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
brew install zsh-autocomplete
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
brew install mods # ai prompt cli
brew install poetry # python package tool
brew install logseq obsidian # knowledge graph
brew install notion # note taking app
brew install postgresql popsql # postgresql utils
brew install protonvpn # vpn
brew install actionlint # GHA linter
brew install git-delta # git delta color diff
brew install httpie # curl alternative
brew install xh # httpie alternative

# LSP Lanuage Server
brew install yaml-language-server # yaml
brew install python-lsp-server # python
brew install dockerfile-language-server # dockerfile

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

# Vim vundle packages
brew install fzf

# Enable locate
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

# Kubernetes related binaries
brew install jsonnet
brew install ksonnet/tap/ks
brew tap instrumenta/instrumenta
brew install kubeval
brew install prometheus
brew install tmux
brew install krew
brew install k9s
brew install pixie # ebpf monitoring
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

# brew cask list | xargs -L1
brew install --cask google-chrome
brew install --cask brave-browser
brew install --cask firefox
brew install --cask iterm2
brew install --cask spectacle
brew install --cask virtualbox
brew install --cask atom
brew install --cask slack
brew install --cask docker
brew install --cask google-cloud-sdk
brew install --cask vagrant
brew install --cask virtualbox # this will fail (mac security settings)
brew install --cask zoomus
brew install --cask ngrok
brew install --cask java
brew install --cask visual-studio-code
brew install --cask lunar
brew install --cask thunderbird
brew install --cask wireshark

# npm packages
npm install --global fast-cli # speedtest

# GoTo Security and Priacy on Mac and allow Oracle
brew cask reinstall --force virtualbox

# Open Apps
open -a google-chrome
open -a brave-browser
open -a atom
open -a slack
open -a docker
