#!/bin/bash
# a script for installing plex media server

sudo apt update
sudo apt-get install apt-transport-https
# plexmediaserver repository
wget -O- https://downloads.plex.tv/plex-keys/PlexSign.key | gpg --dearmor \
  | sudo tee /usr/share/keyrings/plexmediaserver-archive-keyring.gpg > /dev/null
sudo echo 'deb [signed-by=/usr/share/keyrings/plexmediaserver-archive-keyring.gpg] https://downloads.plex.tv/repo/deb public main' > /etc/apt/sources.list.d/plexmediaserver.list

# installation
sudo apt update
sudo apt -o Dpkg::Options::="--force-confdef" -y install plexmediaserver

## check installation
if [ $(sudo systemctl is-active plexmediaserver) == "active" ]; then
  echo "installation is successful."
else
  echo "sth is wrong."
fi
