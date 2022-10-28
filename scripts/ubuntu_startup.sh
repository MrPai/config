#!/bin/bash

# https://linuxconfig.org/how-to-run-script-on-startup-on-ubuntu-20-04-focal-fossa-server-desktop

# sudo chmod 744 /root/config/scripts/ubuntu_startup.sh
# sudo chmod 664 /root/config/assets/mrpai-ubuntu.service
# sudo ln -s /root/config/assets/mrpai-ubuntu.service /etc/systemd/system/mrpai-ubuntu.service
# sudo systemctl daemon-reload
# sudo systemctl enable mrpai-ubuntu.service

cd $HOME/config && git pull
cd $HOME/parallel && git pull
