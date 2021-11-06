#! /usr/bin/bash

# Script para configuração total da máquina virtual mininet para a realização
# do laboratório

# Executar como
# source ./init.sh

dir=$PWD

cd ~

if ! ifconfig eth1; then
    sudo ifconfig eth1 192.168.56.100
fi

sudo apt update -y

if ! type opennet; then
    cmd="sudo mn --top single,3 --mac --controller remote --switch ovsk,protocols=OpenFlow13"

    alias opennet="$cmd"

    echo "$cmd" >> ~/.bashrc
fi

if ! [[ -d ryu ]]; then
    git clone git://github.com/osrg/ryu.git

    cd ryu

    sudo pip3 install -r tools/pip-requires
    sudo pip3 install -r tools/optional-requires

    sudo python3 ./setup.py install
fi

cd "$dir"
