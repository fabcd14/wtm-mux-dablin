# wtm-mux-dablin
DABlin installer to monitor and listen the WhatTheMux? trials

What the script does ?
======================

The `installer.sh` script downloads and installs the following tools :
- Dablin
- zmq-sub via the folliwing repo : https://github.com/mpbraendli/mmbtools-aux
- Tools necessary for Dablin such as :
    - Codecs : libmpg123, libfaad, libfdk-aac
    - GUI & H/W : libsdl2 libgtkmm-3.0
- Tools necessary to convert the ZMQ to ETI stream : libzmq3-dev libzmq5
- Development tools to compile zmq-sub such as gcc, g++ and cmake.

Installation
============

For Debian (and Ubuntu) use

    $ sudo apt install git
    $ git clone https://github.com/fabcd14/wtm-mux-dablin
    $ chmod +x installer.sh (or installer-mint.sh for Linux Mint 17.x)
    $ ./installer.sh
    

How to use
==========
The `launch.sh` script will launch Dablin in GUI mode, with the WhatTheMux ZMQ/ETI input.

To execute this script, just type : 

    $ $HOME/dab/launch.sh

where `$HOME` is your home directory
