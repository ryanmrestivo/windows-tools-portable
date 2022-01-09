# Note
# ---------------------------------------
# Make sure file has needed perms
# chmod +x Kali_Setup.sh

echo "\n\n\n Update + Install Basics"


# Update the System
# ---------------------------------------
sudo apt-get clean -y
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y


# Cloning PipMyKali - https://github.com/Dewalt-arch/pimpmykali
# ---------------------------------------
echo "\n\n\n Cloning - PimyMyKali \n"
sudo git clone https://github.com/Dewalt-arch/pimpmykali /opt/pimpmykali/
sudo chmod +x /opt/pimpmykali/pimpmykali.sh
cd /opt/pimpmykali/
#sudo ./pimpmykali.sh

# Install Chrome
echo "\n\n\n Installing - Chrome \n"
sudo wget -P /opt/ https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
sudo apt-get install -y /opt/google-chrome-stable_current_amd64.deb 

# Install Chromium - Doesnt seem to work...
#echo "\n\n\n Installing - chromium-browser \n"
#sudo apt-get install -y chromium-browser 


# Install Dev Tools
# ---------------------------------------
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

# Install Basic Tools
echo "\n\n\n Installing - build-essential \n"
sudo apt-get install -y build-essential 

echo "\n\n\n Installing - manpages-dev \n"
sudo apt-get install -y manpages-dev

echo "\n\n\n Installing - libpcap-dev \n"
sudo apt-get install -y libpcap-dev

# Install Go - https://golang.org/doc/install
echo "\n\n\n Installing - Go \n"
sudo wget -P /opt/ https://golang.org/dl/go1.16.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf /opt/go1.16.linux-amd64.tar.gz
sudo export GOPATH=$HOME/go
sudo export PATH=$PATH:/usr/local/go/bin

# Install Atom
echo "\n\n\n Installing - Atom \n"
sudo apt-get install -y  software-properties-common apt-transport-https wget
sudo apt-get  install wget gpg
sudo wget -P /opt/ https://atom.io/download/deb
sudo apt-get install -y /opt/atom-amd64.deb

# Install VSCode
echo "\n\n\n Installing - VSCode \n"
sudo apt-get install -y software-properties-common apt-transport-https wget
sudo wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt-get update
sudo apt-get install -y code 

# Install ansible
echo "\n\n\n Installing - ansible \n"
sudo apt-get install -y ansible

# System Tool Install
# ---------------------------------------
echo "\n\n\n Installing - System Tools \n"
sudo apt-get install -y gedit
sudo apt-get install -y tree
sudo apt-get install -y htop
sudo apt-get install -y gedit
sudo apt-get install -y glances
sudo apt-get install -y most

# Hacking Tool Install
# ---------------------------------------
echo "\n\n\n Installing - Hacking Tools \n"
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


# pip3 Tool Install
# ---------------------------------------
# Install droopescan - https://github.com/droope/droopescan
echo "\n\n\n Installing - droopescan \n"
sudo pip install droopescan 

echo "\n\n\n Installing - termcolor \n"
sudo pip3 install termcolor

echo "\n\n\n Installing - badchars \n"
sudo pip install badchars

# Install droopescan - https://github.com/giampaolo/psutil/blob/master/INSTALL.rst
echo "\n\n\n Installing - psutil \n"
sudo apt-get install gcc python3-dev
sudo pip3 install -U psutil

# Install Reconbot - https://github.com/0bs3ssi0n/Reconbot
echo "\n\n\n Installing - Reconbot \n"
cd /opt/
sudo git clone https://github.com/0bs3ssi0n/Reconbot /opt/Reconbot/
sudo ln -s /opt/Reconbot/reconbot.sh /usr/local/bin/

# Install Impacket - https://github.com/SecureAuthCorp/impacket
echo "\n\n\n Installing - impacket \n"
sudo git clone https://github.com/SecureAuthCorp/impacket.git /opt/impacket/
cd /opt/impacket/
sudo pip install /opt/impacket/.

# Insatll AutoRecon - https://github.com/Tib3rius/AutoRecon#installation
echo "\n\n\n Installing - AutoRecon \n"
sudo python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git 

# install nmapAutomator - https://github.com/21y4d/nmapAutomator
echo "\n\n\n Installing - nmapAutomator \n"
cd /opt/
sudo git clone https://github.com/21y4d/nmapAutomator.git /opt/nmapAutomator/
sudo ln -s /opt/nmapAutomator/nmapAutomator.sh /usr/local/bin/

# install naabu - https://github.com/projectdiscovery/naabu.git
echo "\n\n\n Installing - naabu \n"
git clone https://github.com/projectdiscovery/naabu.git /opt/naabu; cd /opt/naabu/v2/cmd/naabu; go build; cp naabu /usr/local/bin/; naabu -version

# Install Terminal Tools + Customization
# ---------------------------------------
echo "\n\n\n Installing - Terminal Tools + Customization \n"
sudo git clone https://github.com/cameronww7/Terminal-Customization /opt/Terminal-Customization/

# Clone Useful Priv Esc Tools to Opt
# ---------------------------------------
# Windows - https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Windows%20-%20Privilege%20Escalation.md
# Linux - https://www.hackingarticles.in/linux-privilege-escalation-automated-script/

echo "\n\n\n Installing - Priv Esc File Structure \n"
sudo mkdir /opt/_privEsc
sudo mkdir /opt/_privEsc/_windows
sudo mkdir /opt/_privEsc/_linux


echo "\n\n\n Installing - Win/Lin Priv Esc Scripts \n"

echo "\n\n\n Installing - privilege-escalation-awesome-scripts-suite \n"
sudo git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git /opt/_privEsc/_privilege-escalation-awesome-scripts-suite-carlospolop

echo "\n\n\n Installing - AlessandroZ/BeRoot \n"
sudo git clone https://github.com/AlessandroZ/BeRoot.git /opt/_privEsc/BeRoot-AlessandroZ


echo "\n\n\n Installing - Linux Priv Esc Scripts \n"

echo "\n\n\n Installing - LinEnum \n"
sudo git clone https://github.com/rebootuser/LinEnum.git /opt/_privEsc/_linux/LinEnum-rebootuser

echo "\n\n\n Installing - Citadel \n"
sudo git clone https://github.com/redcode-labs/Citadel.git /opt/_privEsc/_linux/Citadel-redcode-labs

echo "\n\n\n Installing - Bashark \n"
sudo git clone https://github.com/redcode-labs/Bashark /opt/_privEsc/_linux/Bashark-redcode-labs

echo "\n\n\n Installing - linux-exploit-suggester \n"
sudo git clone https://github.com/mzet-/linux-exploit-suggester.git /opt/_privEsc/_linux/linux-exploit-suggester-mzet-

echo "\n\n\n Installing - linuxprivchecker \n"
sudo git clone https://github.com/sleventyeleven/linuxprivchecker.git /opt/_privEsc/_linux/linuxprivchecker-sleventyeleven

echo "\n\n\n Installing - linux-smart-enumeration \n"
sudo git clone https://github.com/diego-treitos/linux-smart-enumeration.git /opt/_privEsc/_linux/linux-smart-enumeration-diego-treitos

echo "\n\n\n Installing - ohpe/juicy-potato \n"
sudo git clone https://github.com/ohpe/juicy-potato.git /opt/_privEsc/_linux/juicy-potato-ohpe


echo "\n\n\n Installing - Windows Priv Esc Scripts \n"

echo "\n\n\n Installing - AonCyberLabs/Windows-Exploit-Suggester-AonCyberLabs \n"
sudo git clone https://github.com/AonCyberLabs/Windows-Exploit-Suggester.git /opt/_privEsc/_windows/Windows-Exploit-Suggester-AonCyberLabs

echo "\n\n\n Installing - pentestmonkey/windows-privesc-check-pentestmonkey \n"
sudo git clone https://github.com/pentestmonkey/windows-privesc-check.git /opt/_privEsc/_windows/windows-privesc-check-pentestmonkey

echo "\n\n\n Installing - absolomb/WindowsEnu-absolomb \n"
sudo git clone https://github.com/absolomb/WindowsEnum.git /opt/_privEsc/_windows/WindowsEnum-absolomb

echo "\n\n\n Installing - M4ximuss/Powerless-M4ximuss \n"
sudo git clone https://github.com/M4ximuss/Powerless.git /opt/_privEsc/_windows/Powerless-M4ximuss

echo "\n\n\n Installing - bitsadmin/wesngn-bitsadmin \n"
sudo git clone https://github.com/bitsadmin/wesng.git /opt/_privEsc/_windows/wesng-bitsadmin

echo "\n\n\n Installing - rasta-mouse/Sherlock-rasta-mouse \n"
sudo git clone https://github.com/rasta-mouse/Sherlock.git /opt/_privEsc/_windows/Sherlock-rasta-mouse

echo "\n\n\n Installing - rasta-mouse/Watson-rasta-mouse \n"
sudo git clone https://github.com/rasta-mouse/Watson.git /opt/_privEsc/_windows/Watson-rasta-mouse

echo "\n\n\n Installing - WindowsExploits-abatchy17 \n"
sudo git clone https://github.com/abatchy17/WindowsExploits.git /opt/_privEsc/_windows/WindowsExploits-abatchy17

echo "\n\n\n Installing - Windows-Exploit-Suggester-2-7Ragnarok7 \n"
sudo git clone https://github.com/7Ragnarok7/Windows-Exploit-Suggester-2.git /opt/_privEsc/_windows/Windows-Exploit-Suggester-2-7Ragnarok7

echo "\n\n\n Installing - PowerSploi-PowerShellMafia \n"
sudo git clone https://github.com/PowerShellMafia/PowerSploit /opt/_privEsc/_windows/PowerSploit-PowerShellMafia

echo "\n\n\n Installing - Windows-Privilege-Escalation-frizb \n"
sudo git clone https://github.com/frizb/Windows-Privilege-Escalation /opt/_privEsc/_windows/Windows-Privilege-Escalation-frizb

echo "\n\n\n Installing - windows-kernel-exploits-SecWiki \n"
sudo git clone https://github.com/SecWiki/windows-kernel-exploits /opt/_privEsc/_windows/windows-kernel-exploits-SecWiki


echo "\n\n\n Installing - Other Useful Scripts \n"
sudo mkdir /opt/_Payload_Scripts

echo "\n\n\n Installing - swisskyrepo/PayloadsAllTheThings \n"
sudo git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git /opt/_Payload_Script/PayloadsAllTheThings-swisskyrepo

echo "\n\n\n Installing - g0tmi1k/msfpc \n"
sudo git clonehttps://github.com/g0tmi1k/msfpc /opt/_Payload_Script/MSFvenom-Payload-Creator-g0tmi1k

echo "\n\n\n Installing - ShutdownRepo/shellerator \n"
sudo git clone https://github.com/ShutdownRepo/shellerator.git /opt/shellerator-ShutdownRepo


# Setup my File Strucutres 
sudo mkdir ~/Hacking
sudo chmod -R 755 ~/Hacking  
sudo chmod -R 755 /opt 


# Adding password feedback
# ---------------------------------------
echo "\n\n\n Installing - password feedback \n"
echo "" | sudo EDITOR='tee -a' visudo # Adds a Newline to the File
echo "Defaults	pwfeedback" | sudo EDITOR='tee -a' visudo
echo "" | sudo EDITOR='tee -a' visudo # Adds a Newline to the File


echo "\n\n\n Updating - RUnning FInal UPDATE CHECK! \n"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y


# Reboot Prompt
# ---------------------------------------
echo "\n\n\n Finished - REBOOT Time !\n"
echo "\n\n\n Finished - REBOOT Time !\n"
echo "\n\n\n Finished - REBOOT Time !\n"
