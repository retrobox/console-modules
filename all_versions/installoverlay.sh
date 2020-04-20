#!/bin/sh

# verify if the script is launch as root
if [ "$(whoami)" != "root" ]; then
  echo "E: Not root"
  echo "(Please rerun this script with the root user)"
  exit
fi

# verify if npm or node is installed

whichNode=$(which node)
whichNpm=$(which npm)

if [ "$whichNode" != "/usr/local/bin/node" ]; then
  echo ""
  echo "E: Node is not installed"
  exit
fi
if [ "$whichNpm" != "/usr/local/bin/npm" ]; then
  echo ""
  echo "E: Npm is not installed"
  exit
fi

echo "At least node and npm are installed"

# install the overlay by downloading the latest tag version from github

# require node to be installed
# require zip and json gnome utils

whichUnzip=$(which unzip)

if [ "$whichUnzip" != "/usr/bin/unzip" ]; then
  echo ""
  echo "Installing unzip util..."
  echo ""
  sudo apt install -y unzip
fi

echo "unzip is installed"

whichJq=$(which jq)

if [ "$whichJq" != "/usr/bin/jq" ]; then
  echo ""
  echo "Installing json util (jq)..."
  echo ""
  sudo apt install -y jq
fi

echo "jq is installed"

if [ "$(which forever)" != "/usr/bin/forever" ]; then
  echo ""
  echo "Installing forever..."
  echo ""
  npm install --global pm2
fi

echo "Forever is installed"
echo ""

if [ "$(which Isof)" != "/usr/bin/Isof" ]; then
  echo ""
  echo "Installing Isof..."
  echo ""
  sudo apt-get install lsof
fi

echo "Isof is installed"
echo ""

echo ""
echo "Installing overlay..."
echo ""

cd ~
rm -R ~/overlay
rm -R ~/overlayinstall
mkdir ~/overlayinstall

echo ""
echo "Fetching release from github..."
echo ""

TAGNAME=$(curl -s 'https://api.github.com/repos/retrobox/overlay/releases' | jq -r '.[0].tag_name')

echo ""
echo "Using " $TAGNAME
echo $TAGNAME
PTAGNAME=$(echo $TAGNAME | tr "v" "-")
echo $PTAGNAME
URL="https://github.com/retrobox/overlay/archive/$TAGNAME.zip"
echo $URL
echo ""

echo "Downloading files..."
echo ""
wget -N -O ~/overlayinstall/overlay.zip $URL

cd ~/overlayinstall

echo ""
echo "Extracting files..."
echo ""
unzip -d ~/overlayinstall ~/overlayinstall/overlay.zip

mv ~/overlayinstall/overlay$PTAGNAME ~/overlay

cd ~/overlay

rm -Rf ~/overlayinstall
echo ""
echo "Installing npm dependencies..."
echo ""
tput sgr0

npm i

tput bold
tput setaf 2

echo ""
echo "Overlay installed"

tput sgr0
echo ""

# at this point the overlay is installed in /root/overlay
