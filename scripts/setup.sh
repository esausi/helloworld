#!/bin/sh
#start helloworld
sudo chmod 664 /etc/systemd/system/helloworld-daemon.service
sudo systemctl daemon-reload
