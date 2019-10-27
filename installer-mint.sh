#!/bin/bash
echo
echo "DABlin installer to monitor the WhatTheMux? Mux"
echo "==============================================="
echo
echo "It will install zmq-sub, dablin"
echo "and all prerequisites to your machine."
echo -e "$GREEN For Linux Mint 17.x & 18.x $NORMAL"

sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/xUbuntu_14.04/ /' > /etc/apt/sources.list.d/network:messaging:zeromq:release-stable.list"
wget -nv https://download.opensuse.org/repositories/network:messaging:zeromq:release-stable/xUbuntu_14.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt update

echo -e "$GREEN Installing essential prerequisites $NORMAL"
sudo apt-get -y install g++-4.9 cmake3 git
sudo apt-get -y install cmake
sudo ln -s /usr/bin/g++-4.9 /usr/bin/g++
sudo apt-get -y install libmpg123-dev libfaad-dev libsdl2-dev libgtkmm-3.0-dev
sudo apt-get -y install libfdk-aac-dev libzmq3-dev libzmq5
sudo apt-get -y install build-essential 

echo -e "$GREEN Creation of the dab directory $NORMAL"
mkdir ~/dab
chmod +x launch.sh
cp launch.sh ~/dab

echo -e "$GREEN Compiling & Installing DabLin $NORMAL"
git clone https://github.com/Opendigitalradio/dablin.git
cd dablin
mkdir build
cd build
cmake ..
make
sudo make install

echo -e "$GREEN Installing LibZMQ necessary for the ZMQ connector $NORMAL"
sudo apt-get install libzmq3-dev

echo -e "$GREEN Installing ZMQ connector $NORMAL"
cd ~/dab
git clone https://github.com/mpbraendli/mmbtools-aux
cd mmbtools-aux/zmqtest/zmq-sub
make
sudo cp zmq-sub /usr/bin

echo -e "$GREEN Done installing all tools $NORMAL"
echo -e "ZMQ connector has been dowloaded to the dab/ folder"
echo -e "In order to launch DABLin with WTM trials,"
echo -e "just execute the launch.sh script located"
echo -e "in the $HOME/dab directory"
