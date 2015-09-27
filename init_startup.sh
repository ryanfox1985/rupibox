#!/bin/bash

# cp init_startup.sh /etc/init.d/init_startup.sh
# update-rc.d init_startup.sh defaults

do_start () {
	/usr/local/bin/docker-compose -f /root/rupibox/docker-compose.yml up -d
}

do_stop () {
	/usr/local/bin/docker-compose -f /root/rupibox/docker-compose.yml stop
}

case "$1" in
  start|"")
	do_start
	;;
  restart|reload|force-reload)
	do_stop
	;;
  stop)
	do_stop
	;;
  *)
	echo "Usage: init_startup.sh [start|restart|stop]" >&2
	exit 3
	;;
esac
