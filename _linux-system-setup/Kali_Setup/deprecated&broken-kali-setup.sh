#todo
	#fix unassisted install

#Setup
#sudo apt install kali-root-login
#enter password
#sudo passwd root
#enter password
#enter password

#Prevent linux from going to sleep
#power manager -> display -> slide everything left to "never"

#docker container management
#docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest
#0.0.0.0:9443 should be the default URL.
	

# make sure we're root
if [ "$HOME" != "/root" ]
then
		printf "Please run while logged in as root.\n"
    exit 1
	fi

		printf '\n============================================================\n'
		printf '[+]  Getting Started...\n'
		printf ' \n'
		printf '#Create a shortcut to opt on the Desktop... ---->\n'
		printf ' \n'
	ln -s /opt/ /home/kali/Desktop/opt
		printf ' \n'
		printf '# Making sure Downloads folder exists... ---->\n'
		printf ' \n'
	mkdir -p ~/Downloads 2>/dev/null
		printf '============================================================\n\n'

		printf '\n============================================================\n'
		printf '[+]  Updating System...\n'
		printf '============================================================\n\n'
	
	export DEBIAN_FRONTEND=noninteractive
	apt update
	apt -y upgrade
	apt -y dist-upgrade

if [ "$HOME" != "/root" ]

echo '\n'
echo '\n'
printf '\n============================================================\n'
printf '\n'
printf "\e[1;31m [+]  Please Read Carefully...\n\e[0m"
printf '      Reboot needs to be run the first time this script is run.\n'
printf '      The distribution is upgraded every so often.\n'
printf '\n'
printf '============================================================\n\n'
echo '(1) First run, reboot...\n'
echo '(2) Second run, continue!\n'
echo '(3) quit.\n'

read n
case $n in
  1) reboot now;;
  2) echo "let's continue!";;
  3) exit;;
  *) echo "invalid option";;
esac

if [ "$HOME" != "/root" ]

		printf '\n============================================================\n'
		printf '[+]  Installing The Basics...\n'
		printf '============================================================\n\n'
	apt -y install curl
	apt -y install python3-pip
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py
	rm get-pip.py
	apt -y install golang
	apt -y install docker.io
	#create portainer volume for later
	docker volume create portainer_data
# docker container ls -a
	sudo systemctl enable docker --now
	apt -y install python3-dev
	apt -y install python3-pip
	apt -y install patator
	apt -y install net-tools
	apt -y install bleachbit
	pip install pipenv
	pip mitmproxy
	pip3 install mechanicalsoup
	pip3 install scrappy 
	pip3 install name-that-hash
	pip3 install search-that-hash
	
	systemctl start postgresql
	systemctl enable postgresql
	python2 -m pip install pipenv
	python3 -m pip install pipenv
	python3 -m pip install mitmproxy

		printf '\n============================================================\n'
		printf '[+]  Downloading & Installing Tools...\n'
		printf '============================================================\n\n'
		
		printf '\n============================================================\n'
		printf '[+]  Installing 3lkon.\n'
		printf '============================================================\n\n'
	git clone https://github.com/eslam3kl/3klCon.git /opt/3lCkon/
	cd /opt/3lCkon/
	chmod +x install_tools.sh
	./install_tools.sh
	cd ..
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Downloading Metabigor.\n'
		printf '============================================================\n\n'
	git clone  https://github.com/j3ssie/metabigor.git /opt/metabigor
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Downloading Sudomy.\n'
		printf '============================================================\n\n'
	git clone https://github.com/screetsec/Sudomy.git /opt/sudomy
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Downloading lazyrecon.\n'
		printf '============================================================\n\n'
	git clone https://github.com/nahamsec/lazyrecon.git /opt/lazyrecon
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing vulscan.\n'
		printf '============================================================\n\n'
	cd /usr/share/nmap/scripts/vulscan
	git clone https://github.com/scipag/vulscan scipag_vulscan
	ln -s `pwd`/scipag_vulscan /usr/share/nmap/scripts/vulscan
	cd ..
	cd ..
	cd ..
	cd ..
		printf '\n'
		printf '\n'
#vulsvan
#nmap -sV --script=vulscan/vulscan.nse scanme.nmap.org
#vulners
#nmap -sV --script vulners --script-args mincvss=5.0 scanme.nmap.org

		printf '\n============================================================\n'
		printf '[+]  Installing GO.\n'
		printf '============================================================\n\n'
	wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
	tar -xvf go1.13.4.linux-amd64.tar.gz
	mv go /usr/local
	export GOROOT=/usr/local/go
	export GOPATH=$HOME/go
	export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
	rm go1.13.4.linux-amd64.tar.gz
		printf '\n'
		printf '\n'
		
		printf '\n============================================================\n'
		printf '[+]  Installing takeover.\n'
		printf '============================================================\n\n'
	git clone https://github.com/m4ll0k/takeover.git /opt/takeover
	cd /opt/takeover
	python3 setup.py install
    cd ..    
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing Bashtop.\n'
		printf '============================================================\n\n'
	git clone https://github.com/aristocratos/bashtop.git /opt/bashtop
	cd /opt/bashtop/DEB
	./build
    cd ..    
		printf '\n'
		printf '\n'
		
		printf '\n============================================================\n'
		printf '[+]  Installing gdu.\n'
		printf '============================================================\n\n'
	apt install gdu
		printf '\n'
		printf '\n'
		
		printf '\n============================================================\n'
		printf '[+]  Installing DNSRecon.\n'
		printf '============================================================\n\n'
    git clone https://github.com/darkoperator/dnsrecon.git /opt/DNSRecon
    cd /opt/DNSRecon/
    pip3 install -r requirements.txt
    cd ..
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing dnstwist.\n'
		printf '============================================================\n\n'
    git clone https://github.com/elceef/dnstwist.git /opt/dnstwist
    apt -y install python3-dnspython python3-geoip python3-whois python3-requests python3-ssdeep 
    cd /opt/dnstwist/
    pip3 install -r requirements.txt
    cd ..
		printf '\n'
		printf '\n'    

		printf '\n============================================================\n'
		printf '[+]  Installing Domain Hunter.\n'
		printf '============================================================\n\n'
    git clone https://github.com/threatexpress/domainhunter.git /opt/Domain-Hunter
    cd /opt/Domain-Hunter/
    pip3 install -r requirements.txt
    chmod 755 domainhunter.py
    cd ..
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Downloading unicorn.\n'
		printf '============================================================\n\n'
    git clone https://github.com/trustedsec/unicorn.git /opt/unicorn
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing Veil.\n'
		printf '============================================================\n\n'
    git clone https://github.com/Veil-Framework/Veil /opt/Veil
    cd /opt/Veil/config/
    ./setup.sh --force --silent
	apt -y install veil
    cd ..
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
    	printf '[+]  Downloading cuteit.\n'
		printf '============================================================\n\n'
    git clone https://github.com/D4Vinci/Cuteit.git /opt/cuteit
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing SpookFlare.\n'
		printf '============================================================\n\n'
    git clone https://github.com/hlldz/SpookFlare.git /opt/spookflare
	cd /opt/spookflare
	pip install -r requirements.txt
	pip install AsciiTable
    cd ..
		printf '\n'
		printf '\n'
	
		printf '\n============================================================\n'
		printf '[+]  Installing Eternal Scanner.\n'
		printf '============================================================\n\n'
	git clone https://github.com/peterpt/eternal_scanner.git /opt/eternalscanner
	cd /opt/eternalscanner
	apt install masscan metasploit-framework wget python-pip python-crypto python-impacket python-pyasn1-modules netcat
	pip install crypto && pip install impacket && pip install pyasn1-modules
	chmod +x escan
    cd ..
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing ispy.\n'
		printf '============================================================\n\n'
	git clone https://github.com/Cyb0r9/ispy.git /opt/ispy
	cd /opt/ispy
	chmod +x setup.sh
	chmod +x ispy
    cd ..
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing Rapidscan.\n'
		printf '============================================================\n\n'
	git clone https://github.com/skavngr/rapidscan.git /opt/rapidscan
	cd /opt/rapidscan
	chmod +x rapidscan.py
    cd ..
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing Discover.\n'
		printf '============================================================\n\n'
	git clone https://github.com/leebaird/discover.git /opt/discover
	cd /opt/discover/
	./update.sh
	cd ..
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Downloading cloakify.\n'
		printf '============================================================\n\n'
	git clone https://github.com/TryCatchHCF/Cloakify.git /opt/cloakify
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing sandmap.\n'
		printf '============================================================\n\n'
	git clone https://github.com/trimstray/sandmap.git /opt/sandmap
	cd /opt/sandmap
	apt -y install xterm
	chmod +x setup.sh
 	./setup.sh install
    cd .. 
		printf '\n'
		printf '\n'
		
		printf '\n============================================================\n'
		printf '[+]  Downloading Red Hawk.\n'
		printf '============================================================\n\n'
	git clone https://github.com/Tuhinshubhra/RED_HAWK.git /opt/redhawk
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Downloading koadic.\n'
		printf '============================================================\n\n'
	git clone https://github.com/zerosum0x0/koadic.git /opt/koadic
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing spiderfoot.\n'
		printf '============================================================\n\n'
	git clone https://github.com/smicallef/spiderfoot.git /opt/spiderfoot
	cd /opt/spiderfoot
	pip3 install -r requirements.txt
	pip3 install cherrypy_cors
	pip3 install publicsuffixlist
    cd ..
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Downloading CHAOS.\n'
		printf '============================================================\n\n'
	git clone https://github.com/tiagorlampert/CHAOS /opt/CHAOS
		printf '\n'
		printf '\n'		
# cd CHAOS/
# Run
# PORT=8080 DATABASE_NAME=chaos go run cmd/chaos/main.go
# After running go to http://localhost:8080 and login with the default username: ***admin*** and password: ***changeme***.

		printf '\n============================================================\n'
		printf '[+]  Installing Vailyn.\n'
		printf '============================================================\n\n'
	git clone https://github.com/VainlyStrain/Vailyn.git /opt/Vailyn
	cd /opt/Vailyn
	pip install -r requirements.txt 
    cd ..
		printf '\n'
		printf '\n'
	
		printf '\n============================================================\n'
		printf '[+]  Downloading nmap automator\n'
		printf '============================================================\n\n'
	git clone https://github.com/21y4d/nmapAutomator.git /opt/nmapAutomator
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Downloading Sublister.\n'
		printf '============================================================\n\n'
	git clone https://github.com/aboul3la/Sublist3r.git /opt/Sublister
    printf '\n'
    printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing maryam.\n'
		printf '============================================================\n\n'
	git clone https://github.com/saeeddhqan/Maryam.git /opt/maryam
	cd /opt/maryam
	pip install maryam
    cd ..
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing Remot3d.\n'
		printf '============================================================\n\n'
	git clone https://github.com/KeepWannabe/Remot3d.git /opt/Remot3d
	cd /opt/Remot3d
	chmod +x setup.sh
	./setup.sh
	chmod +x Remot3d.sh
    cd ..
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing Silent Trinity.\n'
		printf '============================================================\n\n'
	git clone https://github.com/byt3bl33d3r/SILENTTRINITY.git /opt/SilentTrinity
	/opt/SilentTrinity
	pip3 install -r requirements.txt
	pip3 install docopt
	pip3 install --user pipenv && pipenv install
    cd ..
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing vulscan.\n'
		printf '============================================================\n\n'
	git clone https://github.com/scipag/vulscan /opt/vulscan
	ln -s `pwd`/vulscan /usr/share/nmap/scripts/vulscan
	# may need to change directory, will test.  See shortcuts for commands.
    cd ..
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing Sn1per.\n'
		printf '============================================================\n\n'
	git clone https://github.com/1N3/Sn1per.git /opt/sniper
	cd /opt/Sn1per
	chmod +x install.sh
	./install.sh
    cd ..
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing Osmedeus.\n'
		printf '============================================================\n\n'
    git clone https://github.com/j3ssie/Osmedeus.git /opt/Osmedeus
    cd /opt/Osmedeus/
    ./install.sh
    cd ..
		printf '\n'
		printf '\n'
#cd /opt/Osmedeus && python3 Osmedeus.py

		printf '\n============================================================\n'
		printf '[+]  Installing TIDoS-Framework.\n'
		printf '============================================================\n\n'
    git clone https://github.com/0xinfection/tidos-framework.git /opt/TIDoS-Framework
    cd /opt/TIDoS-Framework
	apt -y install libncurses5 libxml2 nmap tcpdump libexiv2-dev buildssential python3-pip libmariadbclient18 libmysqlclient-dev tor konsole
	pip3 install -r requirements.txt
    cd ..
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing Yuki Chan.\n'
		printf '============================================================\n\n'
	git clone https://github.com/Yukinoshita47/Yuki-Chan-The-Auto-Pentest.git /opt/Yuki-Chan-The-Auto-Pentest
	cd /opt/Yuki-Chan-The-Auto-Pentest
	chmod 777 wafninja joomscan install-perl-module.sh yuki.sh
	chmod 777 Module/WhatWeb/whatweb
	pip install -r requirements.txt
	./install-perl-module.sh
    cd ..    
		printf '\n'
		printf '\n'
		
		  
		printf '\n============================================================\n'
		printf '[+]  Installing Malwoverview.\n'
		printf '============================================================\n\n'
	git clone https://github.com/alexandreborges/malwoverview /opt/malwoverview
	cd /opt/malwoverview
	pip install -r requirements.txt
		printf '\n'
		printf '\n'
#cd /usr/local/bin/ && python3 malwoverview.py

		printf '\n============================================================\n'
		printf '[+]  Installing The Fat Rat.\n'
		printf '============================================================\n\n'
	git clone https://github.com/Screetsec/TheFatRat.git /opt/thefatrat
	cd /opt/thefatrat
	chmod +x setup.sh
	./setup.sh
	chmod +x fatrat
    cd ..
		printf '\n'
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Installing OneForAll.\n'
		printf '============================================================\n\n'
	git clone https://github.com/shmilylty/OneForAll.git /opt/oneforall
	cd /opt/oneforall
	python3 -m pip install -U pip setuptools wheel
	pip3 install -r requirements.txt
    cd ..
		printf '\n'
		printf '\n'
		
		printf '\n============================================================\n'
		printf '[+]  Installing Nuclei.\n'
		printf '============================================================\n\n'
	git clone https://github.com/projectdiscovery/nuclei.git /opt/nuclei
	go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
		printf '\n'
		printf '\n'
	
		printf '\n============================================================\n'
		printf '[+]  Downloading AutoRecon.\n'
		printf '============================================================\n\n'
	git clone https://github.com/Tib3rius/AutoRecon.git /opt/autorecon
	apt -y install seclists curl enum4linux feroxbuster impacket-scripts nbtscan nikto nmap onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf
		printf '\n'
		printf '\n'
	
		printf '\n============================================================\n'
		printf '[+]  Installing cr3dOv3r.'
		printf '============================================================\n\n'
	git clone https://github.com/D4Vinci/Cr3dOv3r.git /opt/Cr3dOv3r
	cd /opt/Cr3dOv3r
	python3 -m pip install -r requirements.txt
#python3 Cr3d0v3r.py -h
		printf '\n'
		printf '\n'
	
		printf '\n============================================================\n'
		printf '[+]  Installing Empire.\n'
		printf '============================================================\n\n'
    git clone https://github.com/BC-SECURITY/Empire/ /opt/Empire
    cd /opt/Empire/setup/
    ./install.sh
	cd ..    
		printf '\n'
		printf '\n'


# docker tools
		printf '\n============================================================\n'
		printf '[+]  Docker Pull aria.\n'
		printf '============================================================\n\n'
	docker pull iknowjason/aria-base:latest
#docker run -ti iknowjason/aria-base:latest
		printf '\n'
		
		printf '\n============================================================\n'
		printf '[+]  Docker Pull oneforall.\n'
		printf '============================================================\n\n'
    docker pull shmilylty/oneforall
#docker run -it --rm shmilylty/oneforall
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Docker Pull V3n0m Scanner.\n'
		printf '============================================================\n\n'
    docker pull offensivedockerfiles/v3n0m-scanner
#docker run -it offensivedockerfiles/v3n0m-scanner
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Docker Pull Gitminer.\n'
		printf '============================================================\n\n'
    docker pull offensivedockerfiles/gitminer
#docker run -it offensivedockerfiles/gitminer
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Docker Pull Jok3r.\n'
		printf '============================================================\n\n'
    docker pull koutto/jok3r
#docker run -i -t --name jok3r-container -w /root/jok3r -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --shm-size 2g --net=host koutto/jok3r
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Docker Pull One For All.\n'
		printf '============================================================\n\n'
    docker pull shmilylty/oneforall
#docker run -it --rm shmilylty/oneforall
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Docker Pull Tidos Framework.\n'
		printf '============================================================\n\n'
    docker pull vainlystrain/tidos-framework
#docker run -it vainlystrain/tidos-framework
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Docker Pull Rustscan.\n'
		printf '============================================================\n\n'
    docker pull rustscan/rustscan
#docker run -it rustscan/rustscan
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Docker Pull CrackMapExec.\n'
		printf '============================================================\n\n'
    apt -y install libssl-dev libffi-dev python-dev buildssential
    git clone https://github.com/byt3bl33d3r/CrackMapExec.git /opt/CrackMapExec
    cd /opt/CrackMapExec
	apt install python3.9-venv
	python3 -m pip install pipx
	pipx ensurepath
	pipx install crackmapexec
		printf '\n'

		printf '\n============================================================\n'
		printf '[+]  Initializing Metasploit Database.\n'
		printf '============================================================\n\n'
	systemctl start postgresql
	systemctl enable postgresql
	msfdb init

		printf '\n============================================================\n'
		printf '[+]  Unzipping RockYou.\n'
		printf '============================================================\n\n'
	gunzip /usr/share/wordlists/rockyou.txt.gz 2>/dev/null
	ln -s /usr/share/wordlists ~/Downloads/wordlists 2>/dev/null

	then
		printf '\n============================================================\n'
		printf "[+]  Done. Don't forget to reboot! :)\n"
		printf '============================================================\n\n'
fi
then


exit
fi