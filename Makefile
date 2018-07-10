all:
	#Configure git
	read -p "Please enter your Name: " name;
	read -p "Please enter your NCSU email ID: " email;
	git config --global user.name $$name;
	git config --global user.email $$email;

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

	#Configure UART pins on startup
	cp enable-uart-pins.sh /usr/bin/
	sudo chmod 755 /usr/bin/enable-uart-pins.sh
	cp enable-uart-pins.service /lib/systemd/system/
	sudo systemctl daemon-reload
	sudo systemctl enable enable-uart-pins.service
	
	#Auto-start web-server on startup
	cp auto-start-web-server.sh /usr/bin/
	sudo chmod 755 /usr/bin/auto-start-web-server.sh
	cp auto-start-web-server.service /lib/systemd/system/
	sudo systemctl enable auto-start-web-server.service
	
	#Information
	@echo "\n#################################################"
	@echo "You will have to configure eth0 manually"
	@echo "To check your ethernet service enter the command: connmanctl services"
	@echo "To configure eth0 use the following command:"
	@echo "sudo connmanctl config <service> --ipv4 manual <ip_addr> <netmask> <gateway> --nameservers <dns_server>"
	@echo "Example :"
	@echo "sudo connmanctl config ethernet_c4f3127bf235_cable --ipv4 manual 10.76.56.42 255.255.254.0 10.76.56.1 --nameservers 8.8.8.8"
	@echo "###################################################"

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

