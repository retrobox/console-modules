# install the overlay by downloading the latest tag version from github

# require node to be installed
# require zip and json gnome utils
echo "installing unzip util..."

sudo apt install -y unzip

echo "installing json (jq) util..."

sudo apt install -y jq

echo "installing overlay..."

cd ~
rm -R ~/overlay
mkdir ~/overlay
TAGNAME=$(curl -s 'https://api.github.com/repos/retrobox/overlay/releases' | jq -r '.[0].tag_name')
echo "Using " $TAGNAME
URL="https://github.com/retrobox/overlay/archive/" $TAGNAME ".zip"
echo $URL
wget -N -O overlay.zip $URL
unzip -d ~/overlay ~/overlay.zip
PATHOVERLAY=$(find ~/overlay -mindepth 1 -maxdepth 1 -type d)
echo $PATHOVERLAY
mv $PATHOVERLAY ~/overlay
cd ~/overlay
npm i

echo "overlay installed"
