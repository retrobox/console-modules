# install the overlay by downloading the latest tag version from github

# require node to be installed
# require zip and json gnome utils
echo " "
echo "Installing unzip util..."
echo " "

sudo apt install -y unzip

echo ""
echo "Installing json (jq) util..."
echo ""

sudo apt install -y jq

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
