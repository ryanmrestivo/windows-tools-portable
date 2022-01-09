#!/usr/bin/env bash
tput setaf 5;echo "##############################"
tput setaf 5;echo "#        Updates only        #"
tput setaf 5;echo "##############################"

echo "[+] Update + Upgrade System.."
sudo apt update -qq 
sudo apt upgrade -qq -y
sudo npm install npm@latest -g
sudo npm update -g

echo "[+] Upgrading Kali version to latest..."
sudo apt dist-upgrade -qq -y
sudo apt full-upgrade -qq -y

echo "[+] 2021.4 OVA fixup..."

# Fix: ORIG_HEAD broken reference
sudo find /usr/share/ -name ORIG_HEAD -size -1b -delete

#################

tput setaf 5;echo "[+] Replace Kali Firefox Bookmarks..."
{
sudo wget -O /usr/share/firefox-esr/distribution/distribution.ini https://raw.githubusercontent.com/tracelabs/tlosint-live/master/kali-config/common/includes.chroot/usr/share/firefox-esr/distribution/distribution.ini
}
tput setaf 2;echo "[+] Done."

##################

tput setaf 5;echo "[+] Updating DumpsterDiver..."
{
        if [ -d "/usr/share/DumpsterDiver" ]; then        
	
		cd /usr/share/DumpsterDiver
		sudo git pull https://github.com/securing/DumpsterDiver.git --rebase
	else
		sudo git clone https://github.com/securing/DumpsterDiver /usr/share/DumpsterDiver
	fi
} 
tput setaf 2;echo "[+] Done."
