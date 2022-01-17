#!/bin/sh

ssh root@192.168.2.12 "/usr/sbin/mntroot rw"

scp periodic-display.sh root@192.168.2.12:/periodic-display.sh
scp target/arm-unknown-linux-musleabi/release/life-dashboard root@192.168.2.12:/main
scp life-dashboard-init root@192.168.2.12:/etc/init.d/life-dashboard-init
scp pokemon.zip root@192.168.15.244:/pokemon.zip

ssh root@192.168.15.244 << EOF
	mkdir pokemon
	unzip pokemon.zip -d pokemon
	cd /
	chmod 777 start.sh
	chmod 777 main
	chmod 777 /etc/init.d/life-dashboard-init

	echo "Install complete, unplug Kindle now (or it will mess up the USB connection)."
EOF