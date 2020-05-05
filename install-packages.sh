#!/bin/sh

set -e
set -x

USER=septisse
HOME_DIR=/home/septisse

apt update
apt upgrade

# Utils

apt install -y sudo
apt install -y curl
apt install -y wget
apt install -y gdebi
apt install -y git
apt install -y ntfs-3g

# Xserver:
apt install -y xorg
apt install -y lightdm

# i3
apt install -y i3
apt install -y i3-wm
apt install -y dunst
apt install -y i3lock
apt install -y i3status
apt install -y suckless-tools
apt install -y compton
apt install -y hsetroot
apt install -y rxvt-unicode
apt install -y xsel
apt install -y rofi
apt install -y fonts-noto
apt install -y fonts-mplus
apt install -y xsettingsd
apt install -y lxappearance
apt install -y scrot
apt install -y viewnior

apt install -y urxvt
apt install -y alsa-utils

cd /tmp
git clone https://github.com/addy-dclxvi/i3-starterpack.git
cp -a i3-starterpack/. ~
chown -R $USER:$USER $HOME_DIR
cp -a /tmp/i3-starterpack/.xsettingsd $HOME_DIR
cp -a /tmp/i3-starterpack/.Xresources $HOME_DIR
cp -a /tmp/i3-starterpack/.fonts $HOME_DIR
cp -a /tmp/i3-starterpack/.urxvt $HOME_DIR
cp -a /tmp/i3-starterpack/.config/compton.conf $HOME_DIR/.config
cp -a /tmp/i3-starterpack/.config/dunst $HOME_DIR/.config
cp -a /tmp/i3-starterpack/.config/i3status $HOME_DIR/.config 
cp -a /tmp/i3-starterpack/.config/i3/config $HOME_DIR/.config/i3
rm -rf /tmp/i3-starterpack/

# Dev
apt install -y python
apt install -y python-pip
apt install -y python3
apt install -y python3-pip
apt install -y ruby

# Software
apt install -y firefox-esr
apt install -y okular
apt install -y vim
apt install -y tcpdump
apt install -y wireshark
apt install -y ssh
apt install -y kpcli
apt install -y sudo
apt install -y docker
apt install -y mc
apt install -y vlc
apt install -y texlive-full
apt install -y python3-scapy
apt install -y dnsutils
apt install -y sipcalc
apt install -y python-autopep8
apt install -y python3-autopep8
apt install -y aircrack-ng
apt install -y inotify-tools

# Codium
wget -pO - 'https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg' | sudo apt-key add -
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
apt update
apt install -y codium

# Zsh
apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/maters/tools/install.sh)"

# Hyper
wget -O /tmp/hyper.deb 'https://releases.hyper.is/download/deb'
gdebi /tmp/hyper.deb
rm /tmp/hyper.deb

# Spotify
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 4773BD5E130D1D45
echo 'deb http://repository.spotify.com stable non-free' | sudo tee /etc/apt/sources.list.d/spotify.list
apt update
apt install -y spotify-client

# Discord
wget -O /tmp/discord.deb 'https://discordapp.com/api/download?platform=linux&format=deb'
gdebi /tmp/discord.deb
rm /tmp/discord.deb

# PowerShell
apt-get install -y \
        less \
        locales \
        ca-certificates \
        libicu63 \
        libssl1.1 \
        libc6 \
        libgcc1 \
        libgssapi-krb5-2 \
        liblttng-ust0 \
        libstdc++6 \
        zlib1g \
        curl

	# Download the powershell '.tar.gz' archive
curl -L https://github.com/PowerShell/PowerShell/releases/download/v7.0.0-preview.4/powershell-7.0.0-preview.4-linux-x64.tar.gz -o /tmp/powershell.tar.gz

	# Create the target folder where powershell will be placed
sudo mkdir -p /opt/microsoft/powershell/7-preview

	# Expand powershell to the target folder
sudo tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7-preview

	# Set execute permissions
sudo chmod +x /opt/microsoft/powershell/7-preview/pwsh

	# Create the symbolic link that points to pwsh
sudo ln -s /opt/microsoft/powershell/7-preview/pwsh /usr/bin/pwsh-preview

#VMware WorkStation

#'https://download3.vmware.com/software/vmw-tools/nested-esxi/Nested_ESXi6.7u3_Appliance_Template_v1.ova'

wget -O /tmp/vmware-workstation.bundle 'https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-15.5.2-15785246.x86_64.bundle'
bash /tmp/vmware-workstation.bundle
rm /tmp/vmware-workstation.bundle

apt install -y linus-headers-$(uname -r) 

# Docker
apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

apt update
apt-get install -y docker-ce docker-ce-cli containerd.io

# RFC Viewer
mkdir -p $HOME_DIR/bin
curl -sL https://raw.githubusercontent.com/bfontaine/rfc/v0.2.6/rfc > $HOME_DIR/bin/rfc
chown -R $USER:$USER $HOME_DIR/bin
chmod u+x $HOME_DIR/bin/rfc

# Terminus
wget -O /tmp/terminus.deb https://github.com/Eugeny/terminus/releases/download/v1.0.104/terminus-1.0.104-linux.deb
gdebi /tmp/terminus.deb
rm /tmp/terminus.deb

# Chef
wget -O /tmp/chef-workstation 
gdebi /tmp/chef-workstation.deb
rm /tmp/chef-worstation.deb
