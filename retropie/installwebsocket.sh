#!/bin/bash
sudo apt-get install unzip
sudo wget http://retrobox.happyblocks.info/archives/setuptools-39.0.1.zip
unzip setuptools-39.0.1.zip -d /home/pi/setuptools-39.0.1
wget http://retrobox.happyblocks.info/archives/websocket_client-0.47.0.tar.gz
tar -xvzf websocket_client-0.47.0.tar.gz
sudo apt-get install python3-pip
cd /home/pi/setuptools-39.0.1
sudo python setup.py install
cd /home/pi/websocket_client-0.47.0
echo "Fin de l'installation de WebSocket, de python, de pip et de setuptools..."