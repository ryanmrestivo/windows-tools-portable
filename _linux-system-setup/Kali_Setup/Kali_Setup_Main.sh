# Kali Setup   

# Note
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-
# Make sure file has needed perms
# chmod +x Kali_Setup.sh

#Prevent linux from going to sleep
#power manager -> display -> slide everything left to "never"

# Metasploit notes...  Armitage is broken on Kali 2021.x
#wget https://downloads.metasploit.com/data/releases/metasploit-latest-linux-x64-installer.run && wget https://downloads.metasploit.com/data/releases/metasploit-latest-linux-x64-installer.run.sha1 && echo $(cat metasploit-latest-linux-x64-installer.run.sha1)'  'metasploit-latest-linux-x64-installer.run > metasploit-latest-linux-x64-installer.run.sha1 && shasum -c metasploit-latest-linux-x64-installer.run.sha1 && chmod +x ./metasploit-latest-linux-x64-installer.run && sudo ./metasploit-latest-linux-x64-installer.run
# port 3790?
# if wget failed makes sure you are using wget-ssl
# if install hangs at 100% run: "sudo bash /opt/metasploit/ctlscript.sh restart"
# MSF_DATABASE_CONFIG=/opt/metasploit-framework/database.yml
# "database.yml" should go directly into "metasploit-framework". Also in terminal type the command line: MSF_DATABASE_CONFIG=/opt/metasploit-framework/database.yml
# Also make sure you go into a file called "profile" its in root/etc/profile. Profile is a text document, at the bottom add the line:
# export MSF_DATABASE_CONFIG=/opt/metasploit-framework/database.yml

# Update the System
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-
echo "\n\n\n System Update & Setup"

echo '* libraries/restart-without-asking boolean true' | sudo debconf-set-selections
echo "\n\n\n Quiet update + minimal interaction to prevent bugs."
sudo apt-get --purge remove postgresql postgresql-*
export DEBIAN_FRONTEND=noninteractive
export DEBIAN_PRIORITY=critical
sudo -E apt-get -qy update
yes | sudo apt-get upgrade
sudo -E apt-get -qy autoclean
ln -s /opt/ /home/kali/Desktop/opt

# Add search cache
sudo apt-cache search kali
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-


# Installing PipMyKali - https://github.com/Dewalt-arch/pimpmykali
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-
echo "\n\n\n Installing - PimyMyKali \n"
sudo git clone https://github.com/Dewalt-arch/pimpmykali /opt/sys_tool_install/pimpmykali/
sudo chmod +x /opt/sys_tool_install/pimpmykali/pimpmykali.sh
cd /opt/sys_tool_install/pimpmykali/
sudo ./pimpmykali.sh --all
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-


# Install Internet Browsers
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-
# Install Chrome
echo "\n\n\n Installing - Chrome \n"
sudo wget -P /opt/sys_tool_install/ https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
sudo apt-get install -y /opt/sys_tool_install/google-chrome-stable_current_amd64.deb 

# Install Chromium
#echo "\n\n\n Installing - chromium-browser \n"
#sudo apt-get install -y chromium-browser 
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-

# Install Dev Tools
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-
# Install Git - Should already be installed
echo "\n\n\n Installing - Git \n"
sudo apt-get install -y git 

# Install Perl
echo "\n\n\n Installing - perl \n"
sudo apt-get install -y perl  

# Install Python
echo "\n\n\n Installing - python3 & python \n"
sudo apt-get install -y python3 
sudo apt-get install -y python

# Install Pip
echo "\n\n\n Installing - python3-pip \n"
sudo apt-get -y --purge autoremove python3-pip
sudo apt-get install -y python3-pip 
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
rm get-pip.py
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-


# Install Building Tools
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-
echo "\n\n\n Installing - build-essential \n"
sudo apt-get install -y build-essential 

echo "\n\n\n Installing - manpages-dev \n"
sudo apt-get install -y manpages-dev

echo "\n\n\n Installing - libpcap-dev \n"
sudo apt-get install -y libpcap-dev

echo "\n\n\n Installing - gcc-mingw-w64 \n"
sudo apt-get install -y gcc-mingw-w64
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-


# Installing - Developer/Code Editors
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-
# Install Go - https://golang.org/doc/install
echo "\n\n\n Installing - Go \n"
sudo wget -P /opt/sys_tool_install/ https://golang.org/dl/go1.16.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf /opt/sys_tool_install/go1.16.linux-amd64.tar.gz
sudo export GOPATH=$HOME/go
sudo export PATH=$PATH:/usr/local/go/bin

# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-


# Basic/Other Tools Install
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-
echo "\n\n\n Installing - Basic/Other Tools \n"
sudo apt-get install -y docker.io
docker volume create portainer_data
sudo systemctl enable docker --now
sudo apt-get install -y gedit
sudo apt-get install -y tree
sudo apt-get install -y htop
sudo apt-get install -y gedit
sudo apt-get install -y glances
sudo apt-get install -y most
sudo apt-get install -y ssh
sudo apt-get install -y rdesktop
sudo apt-get install -y freerdp-x11
sudo apt-get install -y ansible
sudo apt-get install -y bleachbit
sudo apt-get install -y net-tools
pip install pipenv
pip mitmproxy
pip3 install mechanicalsoup
pip3 install scrappy 
pip3 install name-that-hash
pip3 install search-that-hash
python2 -m pip install pipenv
python3 -m pip install pipenv
python3 -m pip install mitmproxy
sudo apt-get install -y gdu

# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-

# Grab Personal Repositories
cd /home/kali/Desktop
git clone https://github.com/ryanmrestivo/cloud-security-research-and-governance.git
git clone https://github.com/ryanmrestivo/red-team.git
git clone https://github.com/ryanmrestivo/threat-hunting-malware-analysis-incident-response.git
git clone https://github.com/ryanmrestivo/linux-system-setup.git
unzip cloud-security-research-and-governance
unzip red-team linux-system-setup
unzip threat-hunting-malware-analysis-incident-response
unzip red-team
rm cloud-security-research-and-governance.zip
rm red-team.zip
rm threat-hunting-malware-analysis-incident-response.zip
rm linux-system-setup.zip

# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-


# Hacking Tools & Dependencies Install
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-
echo "\n\n\n Installing - Tools & Dependencies \n"
sudo apt-get install -y gobuster
sudo apt-get install -y sslscan
sudo apt-get install -y nikto
sudo apt-get install -y joomscan
sudo apt-get install -y wpscan
sudo apt-get install -y smbmap
sudo apt-get install -y enum4linux
sudo apt-get install -y dnsrecon
sudo apt-get install -y odat
sudo apt-get install -y seclists
sudo apt-get install -y ffuf
sudo apt-get install -y curl 
sudo apt-get install -y nbtscan 
sudo apt-get install -y nmap 
sudo apt-get install -y onesixtyone 
sudo apt-get install -y oscanner 
sudo apt-get install -y smbclient 
sudo apt-get install -y snmp 
sudo apt-get install -y sipvicious 
sudo apt-get install -y tnscmd10g 
sudo apt-get install -y whatweb 
sudo apt-get install -y khtmltopdf 
sudo apt-get install -y smtp-user-enum 
sudo apt-get install -y nishang
sudo apt-get install -y finalrecon
sudo apt-get install -y feroxbuster
sudo apt-get install -y impacket-scripts
sudo apt-get install -y redis-tools
sudo apt-get install -y snmpwalk
sudo apt-get install -y svwar
sudo apt-get install -y wkhtmltopdf
pip install AsciiTable
pip3 install cherrypy_cors
pip3 install publicsuffixlist
pip3 install docopt
python3 -m pip install pipx
pipx ensurepath
pipx install crackmapexec
sudo apt-get install gnome-control-center

# Install python-xlrd
# Windows-Exploit-Suggester dependencies
echo "\n\n\n Installing - python-xlrd \n"
install python-xlrd, $ pip install xlrd --upgrade
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-


# searchsploit Tool Install
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-
# Install searchsploit
echo "\n\n\n Installing - searchsploit \n"
sudo apt update && sudo apt -y install exploitdb

echo "\n\n\n Installing - upgrading \n"
searchsploit -u
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-


# Installing - pip Tools
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-
echo "\n\n\n Installing - termcolor \n"
sudo pip3 install termcolor

echo "\n\n\n Installing - badchars \n"
sudo pip install badchars

echo "\n\n\n Installing - requests \n"
sudo pip install requests

echo "\n\n\n Installing - dnspython \n"
sudo pip install dnspython

echo "\n\n\n Installing - argparse \n"
sudo pip install argparse

# Install psutil - https://github.com/giampaolo/psutil/blob/master/INSTALL.rst
echo "\n\n\n Installing - psutil \n"
sudo apt-get install gcc python3-dev
sudo pip3 install -U psutil
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-


# Installing - Enumeration Tools
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-
# Insatll AutoRecon - https://github.com/Tib3rius/AutoRecon#installation
echo "\n\n\n Installing - Beta AutoRecon \n"
git clone --branch beta https://github.com/Tib3rius/AutoRecon /opt/_Tools/Autorecon
cd /opt/_Tools/Autorecon
sudo git pull
sudo checkout beta
sudo python3 -m pip install -r requirements.txt
# Creates a Symbolic Link to the file so you can call it from anywhere
#sudo ln -s /opt/Autorecon/autorecon.py /usr/local/bin/ #didnt work
sudo cp -r /opt/_Tools/Autorecon ~/Hacking/Autorecon

# install nmapAutomator - https://github.com/21y4d/nmapAutomator
echo "\n\n\n Installing - nmapAutomator \n"
cd /opt/
sudo git clone https://github.com/21y4d/nmapAutomator.git /opt/_Tools/nmapAutomator/
# Creates a Symbolic Link to the file so you can call it from anywhere
sudo ln -s /opt/_Tools/nmapAutomator/nmapAutomator.sh /usr/local/bin/

# Install Reconbot - https://github.com/0bs3ssi0n/Reconbot
echo "\n\n\n Installing - Reconbot \n"
cd /opt/
sudo git clone https://github.com/0bs3ssi0n/Reconbot /opt/_Tools/Reconbot/
# Creates a Symbolic Link to the file so you can call it from anywhere
sudo ln -s /opt/_Tools/Reconbot/reconbot.sh /usr/local/bin/

# install naabu - https://github.com/projectdiscovery/naabu.git
echo "\n\n\n Installing - naabu \n"
git clone https://github.com/projectdiscovery/naabu.git /opt/_Tools/naabu; cd /_Tools/opt/naabu/v2/cmd/naabu; go build; cp naabu /usr/local/bin/; naabu -version

# Install droopescan - https://github.com/droope/droopescan
echo "\n\n\n Installing - droopescan \n"
sudo pip install droopescan 
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-


# Install Terminal Tools + Customization
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-
echo "\n\n\n Installing - Terminal Tools + Customization \n"
sudo git clone https://github.com/cameronww7/Terminal-Customization /opt/Terminal-Customization/
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-


# Clone Useful Priv Esc Tools to Opt                              
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-

echo "\n\n\n Installing - Priv Esc File Structure \n"
sudo mkdir /opt/__PRIV_ESC

sudo mkdir /opt/__PRIV_ESC/_WINDOWS
sudo mkdir /opt/__PRIV_ESC/_WINDOWS/_EXECUTABLE
sudo mkdir /opt/__PRIV_ESC/_WINDOWS/_POWERSHELL
sudo mkdir /opt/__PRIV_ESC/_WINDOWS/_OTHER

sudo mkdir /opt/__PRIV_ESC/_LINUX


echo "\n\n\n Installing - Win/Lin Priv Esc Scripts \n"

echo "\n\n\n Installing - AlessandroZ/BeRoot \n"
sudo git clone https://github.com/AlessandroZ/BeRoot.git /opt/__PRIV_ESC/BeRoot-AlessandroZ
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-


# Linux                               
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-

echo "\n\n\n Installing - Linux Priv Esc Scripts \n"

echo "\n\n\n Installing - carlospolop/linPEAS \n"
sudo git clone https://github.com/carlospolop/PEASS-ng/tree/master/linPEAS  /opt/__PRIV_ESC/_LINUX/0-Start_linPEAS-carlospolop

echo "\n\n\n Installing - LinEnum \n"
sudo git clone https://github.com/rebootuser/LinEnum.git /opt/__PRIV_ESC/_LINUX/1_LinEnum-rebootuser

echo "\n\n\n Installing - Citadel \n"
sudo git clone https://github.com/redcode-labs/Citadel.git /opt/__PRIV_ESC/_LINUX/Citadel-redcode-labs

echo "\n\n\n Installing - Bashark \n"
sudo git clone https://github.com/redcode-labs/Bashark /opt/__PRIV_ESC/_LINUX/Bashark-redcode-labs

echo "\n\n\n Installing - linux-exploit-suggester \n"
sudo git clone https://github.com/mzet-/linux-exploit-suggester.git /opt/__PRIV_ESC/_LINUX/2_linux-exploit-suggester-mzet-

echo "\n\n\n Installing - linuxprivchecker-Py \n"
sudo git clone https://github.com/sleventyeleven/linuxprivchecker.git /opt/__PRIV_ESC/_LINUX/linuxprivchecker-Py-sleventyeleven

echo "\n\n\n Installing - linux-smart-enumeration \n"
sudo git clone https://github.com/diego-treitos/linux-smart-enumeration.git /opt/__PRIV_ESC/_LINUX/linux-smart-enumeration-diego-treitos

echo "\n\n\n Installing - ohpe/juicy-potato \n"
sudo git clone https://github.com/ohpe/juicy-potato.git /opt/__PRIV_ESC/_LINUX/juicy-potato-ohpe

# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-


# Windows Tools                            
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-

echo "\n\n\n Installing - Windows Priv Esc Scripts \n"

echo "\n\n\n Installing - carlospolop/winPEAS \n"
sudo git clone https://github.com/carlospolop/PEASS-ng/tree/master/winPEAS  /opt/__PRIV_ESC/_WINDOWS/0-Start_winPEAS-carlospolop

echo "\n\n\n Installing - AonCyberLabs/Windows-Exploit-Suggester-AonCyberLabs \n"
sudo git clone https://github.com/AonCyberLabs/Windows-Exploit-Suggester.git /opt/__PRIV_ESC/_WINDOWS/_OTHER/Windows-Exploit-Suggester-AonCyberLabs

cd /opt/__PRIV_ESC/_WINDOWS/_OTHER/
touch howToUpdateWindowsExploiter.txt
echo "./windows-exploit-suggester.py --update" >> howToUpdateWindowsExploiter.txt
echo "./windows-exploit-suggester.py --database 2014-06-06-mssb.xlsx --systeminfo win7sp1-systeminfo.txt" >> howToUpdateWindowsExploiter.txt

echo "\n\n\n Installing - pentestmonkey/windows-privesc-check-pentestmonkey \n"
sudo git clone https://github.com/pentestmonkey/windows-privesc-check.git /opt/__PRIV_ESC/_WINDOWS/_OTHER/windows-privesc-check-pentestmonkey

echo "\n\n\n Installing - absolomb/WindowsEnu-absolomb \n"
sudo git clone https://github.com/absolomb/WindowsEnum.git /opt/__PRIV_ESC/_WINDOWS/2_WindowsEnum-absolomb

echo "\n\n\n Installing - M4ximuss/Powerless-M4ximuss \n"
sudo git clone https://github.com/M4ximuss/Powerless.git /opt/__PRIV_ESC/_WINDOWS/_OTHER/Powerless-M4ximuss

echo "\n\n\n Installing - bitsadmin/wesngn-bitsadmin \n"
sudo git clone https://github.com/bitsadmin/wesng.git /opt/__PRIV_ESC/_WINDOWS/_OTHER/wesng-bitsadmin

echo "\n\n\n Installing - rasta-mouse/Sherlock-rasta-mouse \n"
sudo git clone https://github.com/rasta-mouse/Sherlock.git /opt/__PRIV_ESC/_WINDOWS/_POWERSHELL/Sherlock-rasta-mouse

echo "\n\n\n Installing - rasta-mouse/Watson-rasta-mouse \n"
sudo git clone https://github.com/rasta-mouse/Watson.git /opt/__PRIV_ESC/_WINDOWS/_EXECUTABLE/Watson-rasta-mouse

echo "\n\n\n Installing - WindowsExploits-abatchy17 \n"
sudo git clone https://github.com/abatchy17/WindowsExploits.git /opt/__PRIV_ESC/_WINDOWS/_OTHER/WindowsExploits-abatchy17

echo "\n\n\n Installing - Windows-Exploit-Suggester-2-7Ragnarok7 \n"
sudo git clone https://github.com/7Ragnarok7/Windows-Exploit-Suggester-2.git /opt/__PRIV_ESC/_WINDOWS/1_Windows-Exploit-Suggester-2-7Ragnarok7

echo "\n\n\n Installing - PowerSploi-PowerShellMafia \n"
sudo git clone https://github.com/PowerShellMafia/PowerSploit/tree/master/Privesc /opt/__PRIV_ESC/_WINDOWS/_POWERSHELL/PowerSploit-PowerShellMafia

echo "\n\n\n Installing - Windows-Privilege-Escalation-frizb \n"
sudo git clone https://github.com/frizb/Windows-Privilege-Escalation /opt/__PRIV_ESC/_WINDOWS/_OTHER/Windows-Privilege-Escalation-frizb

echo "\n\n\n Installing - windows-kernel-exploits-SecWiki \n"
sudo git clone https://github.com/SecWiki/windows-kernel-exploits /opt/__PRIV_ESC/_WINDOWS/_OTHER/windows-kernel-exploits-SecWiki

echo "\n\n\n Installing - windows-GhostPack/SharpUp \n"
sudo git clone https://github.com/GhostPack/SharpUp /opt/__PRIV_ESC/_WINDOWS/_EXECUTABLE/windows-SharpUp-GhostPack

echo "\n\n\n Installing - windows-GhostPack/Seatbelti \n"
sudo git clone https://github.com/GhostPack/Seatbelt /opt/__PRIV_ESC/_WINDOWS/_EXECUTABLE/Seatbelti-GhostPack

echo "\n\n\n Installing - windows-411Hall/JAWS \n"
sudo git clone https://github.com/411Hall/JAWS /opt/__PRIV_ESC/_WINDOWS/_POWERSHELL/JAWS-411Hall
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-


# Downloads
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-

echo "\n\n\n Downloading - J3ssie/metabigor \n"
# https://github.com/j3ssie/metabigor
git clone  https://github.com/j3ssie/metabigor.git /opt/_Tools/metabigor

echo "\n\n\n Downloading - streetsec/Sudomy \n"
# https://github.com/screetsec/Sudomy
git clone https://github.com/screetsec/Sudomy.git /opt/_Tools/sudomy

echo "\n\n\n Downloading - nahamsec/lazyrecon \n"
# https://github.com/nahamsec/lazyrecon
git clone https://github.com/nahamsec/lazyrecon.git /opt/_Tools/lazyrecon

echo "\n\n\n Downloading - trustedsec/unicorn \n"
# https://github.com/trustedsec/unicorn
git clone https://github.com/trustedsec/unicorn.git /opt/_Tools/unicorn

echo "\n\n\n Downloading - D4Vinci/Cuteit \n"
# https://github.com/D4Vinci/Cuteit
git clone https://github.com/D4Vinci/Cuteit.git /opt/_Tools/cuteit

echo "\n\n\n Downloading - TryCatchHCF/Cloakify \n"
# https://github.com/TryCatchHCF/Cloakify
git clone https://github.com/TryCatchHCF/Cloakify.git /opt/_Tools/cloakify

echo "\n\n\n Downloading - Tuhinshubhra/RED_HAWK \n"
# https://github.com/Tuhinshubhra/RED_HAWK
git clone https://github.com/Tuhinshubhra/RED_HAWK.git /opt/_Tools/redhawk

echo "\n\n\n Downloading - zerosum0x0/koadic \n"
# https://github.com/zerosum0x0/koadic
git clone https://github.com/zerosum0x0/koadic.git /opt/_Tools/koadic

echo "\n\n\n Downloading - tiagorlampert/CHAOS \n"
# https://github.com/tiagorlampert/CHAOS
git clone https://github.com/tiagorlampert/CHAOS.git /opt/_Tools/CHAOS

echo "\n\n\n Downloading - aboul3la/Sublist3r \n"
# https://github.com/aboul3la/Sublist3r
git clone https://github.com/aboul3la/Sublist3r.git /opt/_Tools/Sublister

echo "\n\n\n Creating - Other Useful Scripts Folder \n"
sudo mkdir /opt/_Payload_Scripts

echo "\n\n\n Downloading - swisskyrepo/PayloadsAllTheThings \n"
# https://github.com/swisskyrepo/PayloadsAllTheThings
sudo git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git /opt/_Payload_Scripts/PayloadsAllTheThings-swisskyrepo

sudo git clone https://github.com/g0tmi1k/msfpc /opt/_Payload_Scripts/MSFvenom-Payload-Creator-g0tmi1k
# https://github.com/g0tmi1k/msfpc
curl -k -L "https://raw.githubusercontent.com/g0tmi1k/mpc/master/msfpc.sh" > /usr/local/bin/msfpc
chmod 0755 /usr/local/bin/msfpc
echo "\n\n\n Downloading - g0tmi1k/msfpc \n"

echo "\n\n\n Downloading - ShutdownRepo/shellerator \n"
# https://github.com/ShutdownRepo/shellerator
sudo git clone https://github.com/ShutdownRepo/shellerator.git /opt/_Payload_Scripts/shellerator-ShutdownRepo

echo "\n\n\n Downloading - Gr1mmie/sumrecon \n"
# https://github.com/Gr1mmie/sumrecon
sudo git clone https://github.com/Gr1mmie/sumrecon.git /opt/_Payload_Scripts/sumrecon-Gr1mmie

echo "\n\n\n Downloading - danielmiessler/SecLists \n"
# https://github.com/danielmiessler/SecLists
sudo git clone https://github.com/danielmiessler/SecLists /opt/_Payload_Scripts/SecLists-danielmiessler

echo "\n\n\n Downloading - pwncat \n"
# https://github.com/calebstewart/pwncat
sudo pip install git+https://github.com/calebstewart/pwncat.git

echo "\n\n\n Downloading - r00t-3xp10it/resource_files \n"
# https://github.com/r00t-3xp10it/resource_files
sudo git clone  https://github.com/r00t-3xp10it/resource_files /opt/resource_files
cd resource_files && find ./ -name "*.sh" -exec chmod +x {} \;

echo "\n\n\n Downloading - One-Lin3r \n"
# https://github.com/D4Vinci/One-Lin3r
# one-lin3r -h
sudo git clone https://github.com/D4Vinci/One-Lin3r.git /opt/one-liner
pip install one-lin3r

echo "\n\n\n Downloading - GG-Dorking \n"
# https://github.com/eslam3kl/GG-Dorking
git clone https://github.com/eslam3kl/GG-Dorking.git /opt/gg-dorking
cd /opt/gg-dorking
python3 -m pip install -r requirements.txt

echo "\n\n\n Downloading - gimmeSH \n"
cd /opt/
sudo git clone https://github.com/A3h1nt/gimmeSH /opt/_Tools/gimmeSH/
# Creates a Symbolic Link to the file so you can call it from anywhere
sudo ln -s /opt/gimmeSH/gimmeSH.sh /usr/_Tools/local/bin/

echo "\n\n\n Downloading - tomnomnom/assetfinder \n"
go get -u github.com/tomnomnom/assetfinder
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-


# Tools
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-                                                                             

echo "\n\n\n Installing - m4ll0k/takeover \n"
git clone https://github.com/m4ll0k/takeover.git /opt/_Tools/takeover
cd /opt/_Tools/takeover
python3 setup.py install

echo "\n\n\n Installing - ristocratos/bashtop \n"
git clone https://github.com/aristocratos/bashtop.git /opt/bashtop
cd /opt/bashtop/DEB
./build

echo "\n\n\n Installing - darkoperator/dnsrecon \n"
git clone https://github.com/darkoperator/dnsrecon.git /opt/_Tools/DNSRecon
cd /opt/_Tools/DNSRecon/
pip3 install -r requirements.txt

echo "\n\n\n Installing - elceef/dnstwist \n"
git clone https://github.com/elceef/dnstwist.git /opt/_Tools/dnstwist
apt -y install python3-dnspython python3-geoip python3-whois python3-requests python3-ssdeep 
cd /opt/_Tools/dnstwist/
pip3 install -r requirements.txt

echo "\n\n\n Installing - threatexpress/domainhunter \n"
git clone https://github.com/threatexpress/domainhunter.git /opt/_Tools/Domain-Hunter
cd /opt/_Tools/Domain-Hunter/
pip3 install -r requirements.txt
chmod 755 domainhunter.py	

echo "\n\n\n Installing - Veil-Framework/Veil \n"
git clone https://github.com/Veil-Framework/Veil.git /opt/_Tools/Veil
cd /opt/Veil/_Tools/config/
./setup.sh --force --silent
apt -y install veil	

echo "\n\n\n Installing - hlldz/SpookFlare \n"
git clone https://github.com/hlldz/SpookFlare.git /opt/_Tools/spookflare
cd /opt/_Tools/spookflare
pip install -r requirements.txt

echo "\n\n\n Installing - peterpt/eternal_scanner \n"
git clone https://github.com/peterpt/eternal_scanner.git /opt/_Tools/eternalscanner
cd /opt/_Tools/eternalscanner
apt install masscan wget python-pip python-crypto python-impacket python-pyasn1-modules netcat
pip install crypto && pip install impacket && pip install pyasn1-modules
chmod +x escan
	
echo "\n\n\n Installing - robotshell/magicRecon.git \n"
git clone https://github.com/robotshell/magicRecon.git /opt/_Tools/magicrecon
cd /opt/_Tools/magicrecon
chmod +x install.sh
./install.sh

echo "\n\n\n Installing - Cyb0r9/ispy.git \n"
git clone https://github.com/Cyb0r9/ispy.git /opt/_Tools/ispy
cd /opt/_Tools/ispy
chmod +x setup.sh
chmod +x ispy

echo "\n\n\n Installing - skavngr/rapidscan.git \n"
git clone https://github.com/skavngr/rapidscan.git /opt/_Tools/rapidscan
cd /opt/_Tools/rapidscan
chmod +x rapidscan.py

echo "\n\n\n Installing - leebaird/discover.git \n"
git clone https://github.com/leebaird/discover.git /opt/_Tools/discover
cd /opt/_Tools/discover/
./update.sh

echo "\n\n\n Installing - trimstray/sandmap \n"
git clone https://github.com/trimstray/sandmap.git /opt/_Tools/sandmap
cd /opt/_Tools/sandmap
apt -y install xterm
chmod +x setup.sh
./setup.sh install

echo "\n\n\n Installing - smicallef/spiderfoot \n"
git clone https://github.com/smicallef/spiderfoot.git /opt/_Tools/spiderfoot
cd /opt/_Tools/spiderfoot
pip3 install -r requirements.txt

echo "\n\n\n Installing - smicallef/spiderfoot \n"
git clone https://github.com/smicallef/spiderfoot.git /opt/_Tools/mosquito
cd /opt/_Tools/mosquito
git clone https://github.com/r00t-3xp10it/resource_files.git
./mosquito.sh -i

echo "\n\n\n Installing - Gr1mmie/sumrecon \n"
git clone https://github.com/VainlyStrain/Vailyn.git /opt/_Tools/Vailyn
cd /opt/_Tools/Vailyn
pip install -r requirements.txt 

echo "\n\n\n Installing - 21y4d/nmapAutomator \n"
git clone https://github.com/21y4d/nmapAutomator.git /opt/_Tools/nmapAutomator

echo "\n\n\n Installing - saeeddhqan/Maryam \n"
git clone https://github.com/saeeddhqan/Maryam.git /opt/_Tools/maryam
cd /opt/_Tools/maryam
pip install maryam

echo "\n\n\n Installing - KeepWannabe/Remot3d \n"
git clone https://github.com/KeepWannabe/Remot3d.git /opt/_Tools/Remot3d
cd /opt/_Tools/Remot3d
chmod +x setup.sh
./setup.sh
chmod +x Remot3d.sh

echo "\n\n\n Installing - byt3bl33d3r/SILENTTRINITY \n"
git clone https://github.com/byt3bl33d3r/SILENTTRINITY.git /opt/_Tools/SilentTrinity
/opt/SilentTrinity
pip3 install -r requirements.txt
pip3 install --user pipenv && pipenv install

echo "\n\n\n Installing - scipag/vulscan \n"
git clone https://github.com/scipag/vulscan.git /opt/_Tools/vulscan
ln -s `pwd`/vulscan /usr/share/nmap/scripts/vulscan
# may need to change directory, will test.  See shortcuts for commands.

echo "\n\n\n Installing - 1N3/Sn1per \n"
git clone https://github.com/1N3/Sn1per.git /opt/sniper
cd /opt/Sn1per
chmod +x install.sh
./install.sh

echo "\n\n\n Installing - j3ssie/Osmedeus \n"
git clone https://github.com/j3ssie/Osmedeus.git /opt/Osmedeus
cd /opt/Osmedeus/
./install.sh

echo "\n\n\n Installing - 0xinfection/tidos-framework \n"
# cd /opt/Osmedeus && python3 Osmedeus.py
git clone https://github.com/0xinfection/tidos-framework.git /opt/TIDoS-Framework
cd /opt/TIDoS-Framework
apt -y install libncurses5 libxml2 nmap tcpdump libexiv2-dev buildssential python3-pip libmariadbclient18 libmysqlclient-dev tor konsole
pip3 install -r requirements.txt

echo "\n\n\n Installing - Yukinoshita47/Yuki-Chan-The-Auto-Pentest \n"
git clone https://github.com/Yukinoshita47/Yuki-Chan-The-Auto-Pentest.git /opt/Yuki-Chan-The-Auto-Pentest
cd /opt/Yuki-Chan-The-Auto-Pentest
chmod 777 wafninja joomscan install-perl-module.sh yuki.sh
chmod 777 Module/WhatWeb/whatweb
pip install -r requirements.txt
./install-perl-module.sh
  
echo "\n\n\n Installing - securethelogs/Exnoscan \n"  
git clone https://github.com/securethelogs/Exnoscan.git /opt/exnoscan
cd /opt/exnoscan
chmod +x exnoscan.sh
./exnoscan.sh
	
echo "\n\n\n Installing - R0X4R/scvault \n"
cd /opt/scvault
apt install -y jq golang-go
go get -u github.com/ffuf/ffuf
go get -u github.com/tomnomnom/anew
go install github.com/OJ/gobuster/v3@latest
wget https://github.com/OWASP/Amass/releases/download/v3.13.4/amass_linux_amd64.zip -O amass.zip && unzip amass.zip && mv amass_linux_amd64/amass /usr/bin/ && rm -rf amass_linux_amd64/
git clone https://github.com/R0X4R/scvault.git && chmod +x scvault/*.sh && mv scvault/*.sh /usr/bin/

echo "\n\n\n Installing - R0X4R/Garud \n"
cd /opt/garud
git clone https://github.com/R0X4R/Garud.git && chmod +x garud install.sh && mv garud /usr/bin/ && ./install.sh

echo "\n\n\n Installing - alexandreborges/malwoverview \n"
git clone https://github.com/alexandreborges/malwoverview.git /opt/malwoverview
cd /opt/malwoverview
pip install -r requirements.txt
# cd /usr/local/bin/ && python3 malwoverview.py

echo "\n\n\n Installing - Screetsec/TheFatRat \n"
git clone https://github.com/Screetsec/TheFatRat.git /opt/thefatrat
cd /opt/thefatrat
chmod +x setup.sh
./setup.sh
chmod +x fatrat

echo "\n\n\n Installing - shmilylty/OneForAll \n"
git clone https://github.com/shmilylty/OneForAll.git /opt/oneforall
cd /opt/oneforall
python3 -m pip install -U pip setuptools wheel
pip3 install -r requirements.txt

echo "\n\n\n Installing - projectdiscovery/nuclei \n"
git clone https://github.com/projectdiscovery/nuclei.git /opt/nuclei
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

echo "\n\n\n Installing - D4Vinci/Cr3dOv3r \n"
git clone https://github.com/D4Vinci/Cr3dOv3r.git /opt/Cr3dOv3r
cd /opt/Cr3dOv3r
python3 -m pip install -r requirements.txt
# python3 Cr3d0v3r.py -h

echo "\n\n\n Installing - BC-SECURITY/Empire \n"
git clone https://github.com/BC-SECURITY/Empire.git /opt/Empire
cd /opt/Empire/setup/
./install.sh    

echo "\n\n\n Installing - Gr1mmie/sumrecon \n"
apt -y install libssl-dev libffi-dev python-dev buildssential
git clone https://github.com/byt3bl33d3r/CrackMapExec.git /opt/CrackMapExec
cd /opt/CrackMapExec
apt install python3.9-venv

echo "\n\n\n Installing - chvancooten/BugBountyScanner \n"
git clone https://github.com/chvancooten/BugBountyScanner.git /opt/bugbountyscanner
cd /opt/bugbountyscanner
chmod +x BugBountyScanner.sh setup.sh
./setup.sh
# ./BugBountyScanner.sh --help

echo "\n\n\n Installing - impacket \n"
sudo git clone https://github.com/SecureAuthCorp/impacket.git /opt/_Tools/impacket/
cd /opt/impacket/
sudo pip install /opt/impacket/.

echo "\n\n\n Installing - eslam3kl/3klCon \n"
sudo git clone https://github.com/eslam3kl/3klCon.git /opt/_Tools/3lCkon/
cd /opt/_Tools/3lCkon/
chmod +x install_tools.sh
./install_tools.sh

echo "\n\n\n Unzipping RockYou \n"
gunzip /usr/share/wordlists/rockyou.txt.gz 2>/dev/null
ln -s /usr/share/wordlists ~/Downloads/wordlists 2>/dev/null

echo "\n\n\n Setup - scipag/vulscan.git \n"
git clone https://github.com/scipag/vulscan.git /usr/share/nmap/scripts/vulscan
ln -s `pwd`/scipag_vulscan /usr/share/nmap/scripts/vulscan

echo "\n\n\n Installing - r00t-3xp10it/venom \n"
# https://github.com/r00t-3xp10it/venom
# ./venom.sh -u
git clone https://github.com/r00t-3xp10it/venom.git /opt/
cd opt/venom
sudo find ./ -name "*.sh" -exec chmod +x {} \;
sudo find ./ -name "*.py" -exec chmod +x {} \;
cd aux && sudo ./setup.sh



# vulsvan
# nmap -sV --script=vulscan/vulscan.nse scanme.nmap.org
# vulners
# nmap -sV --script vulners --script-args mincvss=5.0 scanme.nmap.org

# CHAOS Usage
# Run
# PORT=8080 DATABASE_NAME=chaos go run cmd/chaos/main.go
# /opt/_Tools/CHAOS/client/main.go
# After running go to http://localhost:8080 and login with the default username: ***admin*** and password: ***changeme***.

# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-

# Setup Docker Tools
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-

# docker container ls -a
# docker container management
# docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
#    --restart=always \
#    -v /var/run/docker.sock:/var/run/docker.sock \
#    -v portainer_data:/data \
#    portainer/portainer-ce:latest
# 0.0.0.0:9443 should be the default URL.

docker pull iknowjason/aria-base:latest
# docker run -ti iknowjason/aria-base:latest
docker pull shmilylty/oneforall
# docker run -it --rm shmilylty/oneforall
docker pull offensivedockerfiles/v3n0m-scanner
# docker run -it offensivedockerfiles/v3n0m-scanner
docker pull offensivedockerfiles/gitminer
# docker run -it offensivedockerfiles/gitminer
docker pull koutto/jok3r
# docker run -i -t --name jok3r-container -w /root/jok3r -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --shm-size 2g --net=host koutto/jok3r
docker pull shmilylty/oneforall
# docker run -it --rm shmilylty/oneforall
docker pull vainlystrain/tidos-framework
# docker run -it vainlystrain/tidos-framework
docker pull rustscan/rustscan
# docker run -it rustscan/rustscan

# docker image ls

# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-

# Setup my File Strucutres 
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-
sudo mkdir ~/Hacking
sudo chmod -R 755 ~/Hacking  
sudo chmod -R 755 /opt 
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-


# Final Update Check
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-
echo "\n\n\n Updating - RUnning FInal UPDATE CHECK! \n"
sudo apt update
sudo apt upgrade -y
sudo apt upgrade -y
sudo apt autoremove -y
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-

sudo cd /opt/
sudo rm -rf google
sudo rm -rf requets


# Reboot Prompt
# ~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~--~-~-~-~-~--~-~-~-~-~--~-~-~-~-~-
echo "\n\n\n FINISHED - REBOOTING IN 60 Seconds !\n"
echo "\n\n\n FINISHED - REBOOTING IN 60 Seconds !\n"
echo "\n\n\n FINISHED - REBOOTING IN 60 Seconds !\n"
sleep 60
reboot