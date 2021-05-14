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

BLUE "Implementing DotFiles..."
cd; curl -#L https://github.com/simeononsecurity/dotfiles/tarball/main | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,.osx,LICENSE-MIT.txt}

BLUE "Adding REPOS..."
#Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common
#AnyDesk Repos
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
#TeamViewer Repos
#https://vitux.com/how-to-install-teamviewer-on-ubuntu/
wget https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc
sudo apt-key add TeamViewer2017.asc
sudo rm /etc/apt/sources.list.d/teamviewer.list
sudo sh -c 'echo "deb http://linux.teamviewer.com/deb stable main" >> /etc/apt/sources.list.d/teamviewer.list'
#Wine Repos
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv F987672F
# Enable Ubuntu Repos
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted

BLUE "Update and Upgrade"
sudo apt-get update
sudo apt-get install -y full-upgrade

BLUE "Configure Firewall"
#https://github.com/ChrisTitusTech/firewallsetup
sudo apt-get install -y ufw gufw iptables-persistent
# Drop ICMP echo-request messages sent to broadcast or multicast addresses
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
# Drop source routed packets
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
# Enable TCP SYN cookie protection from SYN floods
echo 1 > /proc/sys/net/ipv4/tcp_syncookies
# Don't accept ICMP redirect messages
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
# Don't send ICMP redirect messages
echo 0 > /proc/sys/net/ipv4/conf/all/send_redirects
# Enable source address spoofing protection
echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
# Log packets with impossible source addresses
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians
# Flush all chains
/sbin/iptables --flush
# Allow unlimited traffic on the loopback interface
/sbin/iptables -A INPUT -i lo -j ACCEPT
/sbin/iptables -A OUTPUT -o lo -j ACCEPT
# Set default policies
/sbin/iptables --policy INPUT DROP
/sbin/iptables --policy OUTPUT DROP
/sbin/iptables --policy FORWARD DROP
# Previously initiated and accepted exchanges bypass rule checking
# Allow unlimited outbound traffic
/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
#Ratelimit SSH for attack protection
/sbin/iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update --seconds 60 --hitcount 4 -j DROP
/sbin/iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set
/sbin/iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT
# Other rules for future use if needed.  Uncomment to activate
# /sbin/iptables -A INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT    # http
# /sbin/iptables -A INPUT -p tcp --dport 443 -m state --state NEW -j ACCEPT   # https
# UDP packet rule.  This is just a random udp packet rule as an example only
# /sbin/iptables -A INPUT -p udp --dport 5021 -m state --state NEW -j ACCEPT
# Allow pinging of your server
/sbin/iptables -A INPUT -p icmp --icmp-type 8 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
# Drop all other traffic
/sbin/iptables -A INPUT -j DROP
# print the activated rules to the console when script is completed
/sbin/iptables -nL
sudo /etc/init.d/netfilter-persistent save
sudo ufw allow 22
sudo ufw allow 3389
sudo ufw enable

BLUE "Installing Packages"
sudo apt-get install -y open-vm-tools curl ubuntu-restricted-extras libdvd-pkg ubuntu-restricted-addons gnome-tweak-tool synaptic net-tools docker.io flatpak gnome-software-plugin-flatpak vlc anydesk teamviewer openjdk-14-jre xrdp wine openssh-server tor git terminator openvpn nmap john hashcat hydra gtk2.0 hydra-gtk ophcrack libssl-dev libssh-dev libidn11-dev libpcre3-dev libgtk2.0-dev libmysqlclient-dev libpq-dev libsvn-dev firebird-dev pinta exiftool python-pil sqlitebrowser wireshark python3-pip binwalk foremost bsdgames sqlite zbar-tools qrencode pdfcrack fcrackzip unrar steghide ffmpeg exiftool unzip zip foremost p7zip-full gimp cmake sshpass tcpflow obs-studio

BLUE "Clone konstruktoid/hardening ..."
BLUE "Must modify ubuntu.cfg in ./hardening ..."
git clone https://github.com/konstruktoid/hardening.git

BLUE "Removing Apport and Web Launchers..."
sudo apt remove -y apport apport-gtk ubuntu-web-launchers

BLUE "Installing VMWare Workstation"
#https://gist.github.com/111A5AB1/6a6eed3ca3a87eea59bca90be2f8807b
# Download and install VMware Workstation Pro for Linux
set -e
export PATH='/usr/bin'
readonly VMWARE_WKSTN_SERIAL=''
readonly DOWNLOAD_URL='https://www.vmware.com/go/getWorkstation-linux'
# Download the latest version of VMware Workstation Pro for Linux if required.
if [ ! -f vmware.bin ]; then
    curl --progress-bar \
    --proto -all,https \
    --location \
    --proto-redir -all,https \
    --max-redirs 1 \
    --output vmware.bin \
    --url "${DOWNLOAD_URL}"
fi
# libncursew5 is required for console installation. Install the package if not
# already present on the system.
if ! dpkg-query -W -f='${Status}' libncurses5-dev | grep "ok installed"; then sudo apt install libncurses5-dev libncursesw5-dev --quiet --yes --no-install-recommends
fi
# Install VMware Workstation Pro
sudo sh ./vmware.bin \
--console \
--eulas-agreed \
--set-setting vmware-workstation serialNumber "${VMWARE_WKSTN_SERIAL}" \
--required
# Disable CEIP
sudo sed -i 's/dataCollectionEnabled = "yes"/dataCollectionEnabled = "no"/' /etc/vmware/config
# Disable automatic software updates
sudo sed -i 's/autoSoftwareUpdateEnabled = "yes"/autoSoftwareUpdateEnabled = "no"/' /etc/vmware/config

BLUE "Installing RustScan..."
wget "https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb" -O rustscan_2.0.1_amd64.deb
sudo dpkg -i ./rustscan_2.0.1_amd64.deb

BLUE "Installing SecLists..."
wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip \
&& unzip SecList.zip \
&& rm -f SecList.zip

BLUE "Installing python libraries"
sudo python3 -m pip install requests flask flask-login flask-login colorama passlib pwntools netifaces iptools pyopenssl pydispatch stegoveritas scapy

BLUE "Installing PowerShell..."
#https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7.1
# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb
# Update the list of products
sudo apt-get update
# Install PowerShell
sudo apt-get install -y powershell

BLUE "Installing Maltego"
wget "https://maltego-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v4.2.15.13632.deb" -O Maltego.v4.2.15.13632.deb
sudo dpkg -i Maltego.v4.2.15.13632.deb

BLUE "Downloading stegsolve.jar..."
wget "http://www.caesum.com/handbook/Stegsolve.jar" -O "stegsolve.jar"
chmod +x "stegsolve.jar"

BLUE "Cleaning Up..."
sudo apt-get autoclean -y
sudo apt-get autoremove -y
sudo apt-get clean -y
