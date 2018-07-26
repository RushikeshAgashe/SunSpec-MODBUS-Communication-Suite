all:
	#Configure git
	read -p "Please enter your Name: " name && git config --global user.name $$name;
	read -p "Please enter your NCSU email ID: " email && git config --global user.email $$email;
	
	#Clone the SunSpec MODBUS Communcation Suite apps
	git clone https://github.ncsu.edu/ragashe/pysunspec-clone.git;
	git clone https://github.ncsu.edu/ragashe/sunspec_web_server.git;
	mkdir -p sunspec_database;
	
	#Update all packages
	sudo apt-get update;
	
	#Download and install Django
	mkdir -p /home/debian/packages;
	wget -O /home/debian/packages/Django-1.9.13.tar.gz "https://www.djangoproject.com/download/1.9.13/tarball/";
	tar -xvzf /home/debian/packages/Django-1.9.13.tar.gz -C /home/debian/packages/
	cd /home/debian/packages/Django-1.9.13 && sudo python setup.py install;
	
	#Download and Install sqlitebrowser (Optional: Uncomment line below to install)
	#sudo apt-get -y install sqlitebrowser;

	#Information
	@echo "\n\n\t########  PLEASE READ THE FOLLOWING  ##############"
	@echo "\n\t###################################################"
	@echo "\tTo use SunSpec MODBUS Communication Suite apps on\n\tthe BeagleBone Black, UART pins must be configured."
	@echo "\tTo do so, navigate to services/enable-uart-pins\n\tand enter: ./install.sh"
	@echo "\tFor changes to take effect, a system reboot is\n\trequired and can be done by typing: sudo reboot"
	@echo "\t###################################################"
	@echo "\n\t###################################################"
	@echo "\tTo use the ethernet port on the BeagleBone Black you\n\tmust configure eth0 manually"
	@echo "\tTo check your ethernet service enter the command:\n\t\tconnmanctl services"
	@echo "\tTo configure eth0 use the following command:"
	@echo "\t\tsudo connmanctl config <service> --ipv4 manual <ip_addr> <netmask> <gateway> --nameservers <dns_server>"
	@echo "\tExample :"
	@echo "\t\tsudo connmanctl config ethernet_c4f3127bf235_cable --ipv4 manual 10.76.56.42 255.255.254.0 10.76.56.1 --nameservers 8.8.8.8"
	@echo "\t###################################################"
	@echo "\n\t###################################################"
	@echo "\tYou can choose to auto start the web-server on\n\tstartup by using the service auto-start-web-server"
	@echo "\tTo do so, navigate to services/auto-start-web-server\n\tand enter: ./install.sh"
	@echo "\tFor changes to take effect, a system reboot is\n\trequired and can be done by typing: sudo reboot"
	@echo "\t###################################################\n\n"
clean:
	#Remove installed packges
	sudo rm -rf /home/debian/packages;
	
	#Remove SunSpec MODBUS Communication Suite apps
	sudo rm -rf sunspec_web_server;
	sudo rm -rf sunspec_database;
	sudo rm -rf pysunspec-clone;

	#Remove Django Installation
	sudo rm -rf /usr/local/lib/python2.7/dist-packages/Django-1.9.13-py2.7.egg
	sudo sed -i '/DEVICE_NAME/d' /etc/profile

update:
	cd pysunspec-clone && git pull https://github.ncsu.edu/ragashe/pysunspec-clone.git && cd ..
	cd sunspec_web_server && git pull https://github.ncsu.edu/ragashe/sunspec_web_server.git && cd ..
