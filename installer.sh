#!/bin/bash
echo
echo "DABlin installer to monitor the WhatTheMux? Mux"
echo "==============================================="
echo
echo "It will install ODR-DabMux, ODR-DabMod, ODR-AudioEnc, ODR-PadEnc"
echo "and all prerequisites to your machine."

echo -e "$GREEN Updating debian package repositories $NORMAL"
sudo apt-get -y update

echo -e "$GREEN Installing essential prerquisites $NORMAL"
sudo apt-get -y install git gcc g++ cmake
sudo apt-get -y install libmpg123-dev libfaad-dev libsdl2-dev libgtkmm-3.0-dev
sudo apt-get -y install libfdk-aac-dev libzmq3-dev libzmq5

echo -e "$GREEN Installing DabLin $NORMAL"
sudo apt-get -y install dablin 

echo -e "$GREEN Installing ZMQ connector $NORMAL"
mkdir ~/dab
cd ~/dab
git clone https://github.com/mpbraendli/mmbtools-aux
cd mmbtools-aux/zmqtest/zmq-sub
make
sudo cp zmq-sub /usr/bin

echo -e "$GREEN Done installing all tools $NORMAL"
echo -e "ZMQ connector has been dowloaded to the dab/ folder"

