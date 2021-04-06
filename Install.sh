# exit with error status code if user is not root
if [[ $EUID -ne 0 ]]; then
  echo "* root privileges are required to run this script (sudo)." 1>&2
  exit 1
fi

echo "Installing dependencies."
sudo apt install software-properties-common
sudo apt-add-repository universe
## Because people may have trouble installing the php-fpm. But this work around worked for my install.

sudo apt install -y openssl curl nginx mysql-client mysql-server php-fpm php-cli php-curl php-mysql


## Make sure to set the MySQL root password when running this
sudo mysql_secure_installation

mkdir -p /srv && cd /srv
curl -L -o pufferpanel.tar.gz https://git.io/fNZYg
tar -xf pufferpanel.tar.gz
cd pufferpanel
chmod +x pufferpanel
./pufferpanel install
