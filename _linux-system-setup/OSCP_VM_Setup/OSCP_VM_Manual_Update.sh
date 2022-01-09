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


# pip Tool Install
# ---------------------------------------
# Install droopescan - https://github.com/droope/droopescan
echo "\n\n\n Updating - droopescan \n"
sudo pip install droopescan -U

echo "\n\n\n Updating - termcolor \n"
sudo pip install termcolor -U

# Install droopescan - https://github.com/giampaolo/psutil/blob/master/INSTALL.rst
echo "\n\n\n Updating - psutil \n"
sudo pip3 install psutil -U

# Install Reconbot - https://github.com/0bs3ssi0n/Reconbot
echo "\n\n\n Updating - Reconbot \n"
cd /opt/Reconbot/
sudo git fetch -a
sudo git pull -f

# Install Impacket - https://github.com/SecureAuthCorp/impacket
echo "\n\n\n Updating - impacket \n"
cd /opt/impacket/
sudo git fetch -a
sudo git pull -f

# Insatll AutoRecon - https://github.com/Tib3rius/AutoRecon#installation
echo "\n\n\n Updating - AutoRecon \n"
sudo python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git 

# install nmapAutomator - https://github.com/21y4d/nmapAutomator
echo "\n\n\n Updating - nmapAutomator \n"
cd /opt/nmapAutomator/
sudo git fetch -a
sudo git pull -f


echo "\n\n\n Updating - privilege-escalation-awesome-scripts-suite \n"
cd /opt/_privEsc/_privilege-escalation-awesome-scripts-suite-carlospolop
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - AlessandroZ/BeRoot \n"
cd /opt/_privEsc/BeRoot-AlessandroZ
sudo git fetch -a
sudo git pull -f


echo "\n\n\n Updating - Linux Priv Esc Scripts \n"

echo "\n\n\n Updating - LinEnum \n"
cd /opt/_privEsc/_linux/LinEnum-rebootuser
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - Citadel \n"
cd /opt/_privEsc/_linux/Citadel-redcode-labs
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - Bashark \n"
cd /opt/_privEsc/_linux/Bashark-redcode-labs
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - linux-exploit-suggester \n"
cd /opt/_privEsc/_linux/linux-exploit-suggester-mzet-
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - linuxprivchecker \n"
cd /opt/_privEsc/_linux/linuxprivchecker-sleventyeleven
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - linux-smart-enumeration \n"
cd /opt/_privEsc/_linux/linux-smart-enumeration-diego-treitos
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - ohpe/juicy-potato \n"
cd /opt/_privEsc/_linux/juicy-potato-ohpe
sudo git fetch -a
sudo git pull -f


echo "\n\n\n Updating - Windows Priv Esc Scripts \n"

echo "\n\n\n Updating - AonCyberLabs/Windows-Exploit-Suggester-AonCyberLabs \n"
cd /opt/_privEsc/_windows/Windows-Exploit-Suggester-AonCyberLabs
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - pentestmonkey/windows-privesc-check-pentestmonkey \n"
cd /opt/_privEsc/_windows/windows-privesc-check-pentestmonkey
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - absolomb/WindowsEnu-absolomb \n"
cd /opt/_privEsc/_windows/WindowsEnum-absolomb
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - M4ximuss/Powerless-M4ximuss \n"
cd /opt/_privEsc/_windows/Powerless-M4ximuss
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - bitsadmin/wesngn-bitsadmin \n"
cd /opt/_privEsc/_windows/wesng-bitsadmin
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - rasta-mouse/Sherlock-rasta-mouse \n"
cd /opt/_privEsc/_windows/Sherlock-rasta-mouse
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - rasta-mouse/Watson-rasta-mouse \n"
cd /opt/_privEsc/_windows/Watson-rasta-mouse
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - WindowsExploits-abatchy17 \n"
cd /opt/_privEsc/_windows/WindowsExploits-abatchy17
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - Windows-Exploit-Suggester-2-7Ragnarok7 \n"
cd /opt/_privEsc/_windows/Windows-Exploit-Suggester-2-7Ragnarok7
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - PowerSploi-PowerShellMafia \n"
cd /opt/_privEsc/_windows/PowerSploit-PowerShellMafia
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - Windows-Privilege-Escalation-frizb \n"
cd /opt/_privEsc/_windows/Windows-Privilege-Escalation-frizb
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - windows-kernel-exploits-SecWiki \n"
cd /opt/_privEsc/_windows/windows-kernel-exploits-SecWiki
sudo git fetch -a
sudo git pull -f


echo "\n\n\n Updating - Other Useful Scripts \n"
sudo mkdir /opt/_Payload_Scripts

echo "\n\n\n Updating - swisskyrepo/PayloadsAllTheThings \n"
cd /opt/_Payload_Script/PayloadsAllTheThings-swisskyrepo
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - g0tmi1k/msfpc \n"
cd /opt/_Payload_Script/MSFvenom-Payload-Creator-g0tmi1k
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - ShutdownRepo/shellerator \n"
cd /opt/shellerator-ShutdownRepo
sudo git fetch -a
sudo git pull -f

echo "\n\n\n Updating - Gr1mmie/sumrecon \n"
cd /opt/sumrecon
sudo git fetch -a
sudo git pull -f


# Install Terminal Tools + Customization
# ---------------------------------------
echo "\n\n\n Updating - Terminal Tools + Customization \n"
cd /opt/Terminal-Customization/
sudo git fetch -a
sudo git pull -f

sudo ./opt/Terminal-Customization/Kali/manual_update.sh

# Setup my File Strucutres 
sudo mkdir ~/Hacking
sudo chmod -R 777 ~/Hacking  

sudo chmod -R 777 /opt 

# Reboot Prompt
# ---------------------------------------
echo "\n\n\n Finished - REBOOT \n"
