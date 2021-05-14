#!/bin/bash

# Define colors...
RED=`tput bold && tput setaf 1`
GREEN=`tput bold && tput setaf 2`
YELLOW=`tput bold && tput setaf 3`
BLUE=`tput bold && tput setaf 4`
NC=`tput sgr0`

function RED(){
    echo -e "\n${RED}${1}${NC}"
}
function GREEN(){
    echo -e "\n${GREEN}${1}${NC}"
}
function YELLOW(){
    echo -e "\n${YELLOW}${1}${NC}"
}
function BLUE(){
    echo -e "\n${BLUE}${1}${NC}"
}

# Testing if root...
if [ $UID -ne 0 ]
then
    RED "You must run this script as root!" && echo
    exit
fi


#BLUE "Fix missing public key bug"
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B56FFA946EB1660A

#BLUE "Switch to LTS-SECURITY repo"
#rm /etc/apt/sources.list.d/parrot.list
#echo "deb https://deb.parrot.sh/parrot/ lts-security main contrib non-free" > /etc/apt/sources.list.d/parrot.list

BLUE "Update, Upgrade, then Install Tools I Like"
apt update
apt install -y full-upgrade

BLUE "Installing vmtools..."
apt install -y open-vm-tools

BLUE "Installing xrdp..."
apt install -y install xrdp

BLUE "Installing wine..."
apt install -y net-tools wine

BLUE "Installing openssh-server..."
apt install -y openssh-server

BLUE "Installing vscodium..."
apt install -y vscodium

BLUE "Installing anonsurf..."
apt install -y anonsurf

BLUE "Installing tor..."
apt install -y tor

BLUE "Installing git..."
sudo apt install -y git

BLUE "Installing terminator..."
sudo apt install -y terminator

BLUE "Setting terminator as the default terminal emulator..."
sed -i s/Exec=gnome-terminal/Exec=terminator/g /usr/share/applications/gnome-terminal.desktop

BLUE "Enable Anonsurf at boot"
ananon enable-boot

BLUE "Installing openvpn..."
sudo apt install -y openvpn

BLUE "Installing nmap..."
sudo apt-get install -y nmap

BLUE "Installing RustScan..."
wget "https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb" -O rustscan_2.0.1_amd64.deb
sudo dpkg -i ./rustscan_2.0.1_amd64.deb

BLUE "Installing docker..."
sudo apt-get install -y docker.io
sudo groupadd docker
sudo usermod -aG docker `logname`

BLUE "Installing curl..."
sudo apt-get install -y curl

BLUE "Installing pinta..."
sudo apt-get install -y pinta

BLUE "Installing exiftool..."
sudo apt-get install -y exiftool

BLUE "Installing Python PIL..."
sudo apt-get install -y python-pil

BLUE "Installing sqlitebrowser..."
sudo apt-get install -y sqlitebrowser

BLUE "Installing Wireshark..."
sudo apt-get install -y wireshark

BLUE "Installing python-requests..."
pip install requests

BLUE "Installing Python flask..."
sudo pip install flask

BLUE "Installing Python flask-login..."
sudo pip install flask-login

BLUE "Installing Python colorama..."
sudo pip install colorama

BLUE "Installing Python passlib..."
sudo pip install passlib

BLUE "Installing Binwalk..."
sudo apt install -y binwalk

BLUE "Installing foremost..."
sudo apt install -y foremost

BLUE "Installing rot13..."
sudo apt install -y bsdgames

BLUE "Installing Python pwntools..."
sudo pip install pwntools

BLUE "Installing sqlite..."
sudo apt install -y sqlite

BLUE "Installing zbarimg..."
sudo apt install -y zbar-tools

BLUE "Installing qrencode..."
sudo apt install -y qrencode

BLUE "Installing pdfcrack..."
sudo apt install -y pdfcrack

BLUE "Downloading stegsolve.jar..."
wget "http://www.caesum.com/handbook/Stegsolve.jar" -O "stegsolve.jar"
chmod +x "stegsolve.jar"

BLUE "Installing fcrackzip..."
sudo apt install -y fcrackzip

BLUE "Installing unrar..."
sudo apt install -y unrar

BLUE "Installing steghide..."
sudo apt install -y steghide

BLUE "Installing ffmpeg..."
sudo apt install -y ffmpeg

BLUE "Installing Python library netifaces..."
sudo pip install netifaces

BLUE "Installing Python library iptools..."
sudo pip install iptools

BLUE "Installing Python library OpenSSL..."
sudo pip install pyopenssl

BLUE "Installing Python library pydispatch..."
sudo pip install pydispatch

BLUE "Installing GIMP..."
sudo apt install -y gimp

BLUE "Installing cmake..."
sudo apt install -y cmake

BLUE "Installing sshpass..."
sudo apt install -y sshpass

BLUE "Installing tcpflow..."
sudo apt install -y tcpflow

BLUE "Installing Python scapy..."
sudo pip install scapy
