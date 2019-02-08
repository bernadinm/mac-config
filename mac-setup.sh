#!/bin/bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

# xargs brew install < brew.txt
brew install spectacle
brew install terraform
brew install git
brew install hub
brew install gpg2
brew install tmate
brew install lynx
brew install jq
brew install trash
brew install azure-cli
brew install awscli
brew install mas

# mas (apple store install tool)
mas install 688211836 # easyres

# brew cask list | xargs -L1
brew cask install google-chrome
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
brew cask install virtualbox # this will fail (mac security settings)

# GoTo Security and Priacy on Mac and allow Oracle
brew cask reinstall --force virtualbox

# Open Apps
open -a spectacle
open -a google-chrome
open -a flux
open -a atom
open -a slack
open -a docker
open -a cloudapp
open -a marshallofsound-google-play-music-player

# Atom Settings
apm install Sublime-Style-Column-Selection
apm install sync-settings

# Mac Settings
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.speech.synthesis.general.prefs SpokenUIUseSpeakingHotKeyFlag -bool true
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 12
defaults write -g com.apple.trackpad.scaling 1.5

# bash_profile
cat > ~/.bash_profile <<'EOF'
set -o ignoreeof
alias dev='eval $(maws login 273854932432_Mesosphere-PowerUser)'
alias prod='eval $(maws login 633059600857_Mesosphere-PowerUser)'
alias demo='eval $(maws login 359820441116_Mesosphere-PowerUser)'
alias mp='ssh mb@$(VBoxManage guestproperty get "NixOS" "/VirtualBox/GuestInfo/Net/0/V4/IP" | cut -d" " -f2)'
alias mx='Vboxmanage startvm "NixOS" --type headless && VBoxManage controlvm "NixOS" addencpassword "NixOS" -'
alias mm='VBoxManage controlvm NixOS poweroff NixOS'
EOF

# iTerm2 settings
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2" # TODO(mbernadin): find correct file and source it before running
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# crontab -e
( crontab -l ; echo "*/29 * * * * /usr/local/bin/maws login 273854932432_Mesosphere-PowerUser" ) | crontab -

curl -O https://github.com/mesosphere/maws/releases/download/0.1.5/maws-darwin # AUTHENTICATION REQUIRED (BROKEN)
chmod +x maws-darwin
sudo mv maws-darwin /usr/local/bin/maws

# Install VBoxExtention
LatestVirtualBoxVersion=$(curl http://download.virtualbox.org/virtualbox/LATEST.TXT) && curl -O "http://download.virtualbox.org/virtualbox/${LatestVirtualBoxVersion}/Oracle_VM_VirtualBox_Extension_Pack-${LatestVirtualBoxVersion}.vbox-extpack"
diff <(shasum5.18 -a 256 Oracle_VM_VirtualBox_Extension_Pack-${LatestVirtualBoxVersion}.vbox-extpack) <(curl https://www.virtualbox.org/download/hashes/${LatestVirtualBoxVersion}/SHA256SUMS | grep Oracle_VM_VirtualBox_Extension_Pack-${LatestVirtualBoxVersion}.vbox-extpack | sed 's/\*/ /g')
sudo VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-${LatestVirtualBoxVersion}.vbox-extpack

# Download NixOS VirtualBox
curl -o ~/Downloads/nixos-18.09.1985.749a3a0d00b-x86_64-linux.ova https://d3g5gsiof5omrk.cloudfront.net/nixos/18.09/nixos-18.09.1985.749a3a0d00b/nixos-18.09.1985.749a3a0d00b-x86_64-linux.ova
# Import NixOS OVA
vboxmanage import --vsys 0 --vmname NixOS --cpus 2 --memory 8192  ~/Downloads/nixos-18.09.1985.749a3a0d00b-x86_64-linux.ova
# Select Networking
VBoxManage modifyvm NixOS --nic1 bridged
# Add Encryption
VBoxManage encryptmedium $(VBoxManage showvminfo NixOS | grep 'SATA.*UUID' | sed 's/^.*UUID: \(.*\))/\1/') --newpassword - --cipher "AES-XTS256-PLAIN64" --newpasswordid "NixOS"

# VirtualBox Expansion
FILENAME_PATH=$(find ~/VirtualBox\ VMs/ -name nixos-*.vmdk)
VBoxManage clonehd "$FILENAME_PATH" "$(echo $FILENAME_PATH | sed 's/\.vmdk/.vdi/g')" --format vdi
VBoxManage modifyhd "$(echo $FILENAME_PATH | sed 's/\.vmdk/.vdi/g')"  --resize 51200
VBoxManage clonehd  "$(echo $FILENAME_PATH | sed 's/\.vmdk/.vdi/g')"  "$(echo $FILENAME_PATH | sed 's/\.vmdk/.vmdk2/g')" --format vmdk
mv "$(echo $FILENAME_PATH | sed 's/\.vmdk/.vmdk2/g')"  "$(echo $FILENAME_PATH)"
