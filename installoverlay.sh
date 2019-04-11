# install the overlay by downloading the latest tag version from github

# require node to be installed
# require zip and json gnome utils

cd ~
rm -R ~/overlay
mkdir ~/overlay
URL="https://github.com/retrobox/overlay/archive/"$(curl -s 'https://api.github.com/repos/retrobox/overlay/releases' | jq -r '.[0].tag_name')".zip"
echo $URL
wget -N -O overlay.zip $URL
unzip -d ~/overlay ~/overlay.zip

result=$(ls --format=commas ~/overlay)
IFS=', ' read -r -a array <<< "$result"
mv ~/overlay/$array/* ~/overlay
rm -R ~/overlay/$array
cd ~/overlay
npm i
