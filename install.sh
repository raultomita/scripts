# commands that install a new instance of FarmMonitorDaemon
# give rights: chmod u+x
#!/bin/bash

sudo apt-get update
sudo apt-get -y install git 
git clone https://github.com/raultomita/FarmMonitorDaemon.git

#install latest python
#from archive tar -zxvf python....
sudo apt-get -y install build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev
wget https://www.python.org/ftp/python/3.6.5/Python-3.6.5.tar.xz
tar xf Python-3.6.5.tar.xz
cd Python-3.6.5
./configure --enable-optimizations
make
sudo make altinstall

#clear build files
cd ..
sudo rm -r Python-3.6.5
rm Python-3.6.5.tar.xz
sudo apt-get -y --purge remove build-essential tk-dev
sudo apt-get -y --purge remove libncurses5-dev libncursesw5-dev libreadline6-dev
sudo apt-get -y --purge remove libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev
sudo apt-get -y --purge remove libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev
sudo apt-get -y autoremove
sudo apt-get clean

sudo pip3.6 install --upgrade pip
sudo pip3.6 install redis
sudo pip3.6 install gpiozero
sudo pip3.6 install RPi.GPIO

git clone https://github.com/antirez/redis.git

cd redis
git checkout 4.0
make
sudo make install
cd utils
sudo ./install_server.sh


