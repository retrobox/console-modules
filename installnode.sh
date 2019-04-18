#!/bin/bash
echo "installing node.js..."
rm -R ~/nodeinstall
mkdir ~/nodeinstall
cd ~/nodeinstall
wget -O node.tar.xz https://nodejs.org/dist/v10.15.3/node-v10.15.3-linux-armv6l.tar.xz
echo "Downloaded."
tar xf node.tar.xz
echo "Extracted"
rm node.tar.xz
PATHNODE=$(find ~/nodeinstall -mindepth 1 -maxdepth 1 -type d)
echo $PATHNODE
sudo mv $PATHNODE ~/nodeinstall/node
#sudo cp -R  ~/nodeinstall/node/* /usr/local/
echo "Node installed!"
echo "Npm version:" $(npm -v)
echo "Node version:" $(node -v)
