#!/bin/bash
echo "$(tput setaf 1)Installation de Websocket... $(tput sgr0)"
cd /home/pi/
sudo apt-get update
sudo apt-get install unzip
sudo wget http://static.retrobox.tech/package/setuptools-39.0.1.zip
unzip setuptools-39.0.1.zip -d /home/pi/setuptools-39.0.1
wget http://static.retrobox.tech/package/websocket_client-0.47.0.tar.gz
tar -xvzf websocket_client-0.47.0.tar.gz
sudo apt-get install python3-pip
cd /home/pi/
cd /home/pi/setuptools-39.0.1/setuptools-39.0.1
sudo python setup.py install
cd /home/pi/websocket_client-0.47.0
sudo python setup.py install
cd /home/pi/
echo "$(tput setaf 2)Fin de l'installation de WebSocket, de python, de pip et de setuptools..$(tput sgr0)."
