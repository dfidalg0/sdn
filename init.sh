#! /bin/bash

# Script para configuração total da máquina virtual mininet para a realização
# do laboratório

# Executar como
# source ./init.sh

dir=$PWD

cd ~

sudo apt update -y

alias opennet="sudo mn --top single,3 --mac --controller remote --switch ovsk,protocols=OpenFlow13"

echo 'alias opennet="sudo mn --top single,3 --mac --controller remote --switch ovsk,protocols=OpenFlow13"' >> ~/.bashrc

git clone git://github.com/osrg/ryu.git

cd ryu

sudo pip3 install -r tools/pip-requires
sudo pip3 install -r tools/optional-requires

sudo python3 ./setup.py install

cd "$dir"
