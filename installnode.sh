echo "installing node.js..."
curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
sudo apt install -y nodejs
echo $(node -v)
echo $(npm -v)
echo "node.js installed"
