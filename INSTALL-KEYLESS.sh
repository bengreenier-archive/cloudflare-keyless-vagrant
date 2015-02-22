sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y wireshark tshark
sudo chmod 4711 `which dumpcap` #for wireshark to function properly
sudo apt-get install -y git
sudo apt-get install -y make gcc unzip automake libtool
echo Got dependencies and tools
if [ -d "keyless" ]; then
  echo Keyless directory already here, updating git repository
  cd keyless
  git pull origin master
else
  echo Keyless directory not found, cloning from github
  git clone https://github.com/cloudflare/keyless.git
  cd keyless
fi
sudo make && sudo make install
echo Tried to make and install keyless
cd ..
cp /vagrant/CAPTURE-TEST.sh CAPTURE-TEST.sh
echo Placed CAPTURE-TEST.sh in home directory