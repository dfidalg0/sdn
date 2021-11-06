#! /usr/bin/bash

# Script para execução do ffw.py e captura de logs

# Executar como
# source ./run_ffw.sh

echo "Starting Ryu..."

ryu-manager --verbose ./ffw.py &> logs/ffw/ryu-manager.log &

sleep 2

echo "Starting mininet..."

function run_mininet {
    echo "h1 tcpdump -v > logs/ffw/tcpdump-h1.log &"
    echo "h2 tcpdump -v > logs/ffw/tcpdump-h2.log &"
    echo "h3 tcpdump -v > logs/ffw/tcpdump-h3.log &"

    echo "h1 echo h1 to h2"
    echo "h1 ping -c 3 h2"

    echo "h1 echo h2 to h1"
    echo "h2 ping -c 3 h1"

    echo "h1 echo h1 to h3"
    echo "h1 ping -c 3 h3"

    echo "h1 echo h3 to h1"
    echo "h3 ping -c 3 h1"

    echo "h1 echo h2 to h3"
    echo "h2 ping -c 3 h3"

    echo "h1 echo h3 to h2"
    echo "h3 ping -c 3 h2"

    echo "exit"
}

run_mininet | opennet &> logs/ffw/mininet.log

sudo chown mininet:mininet logs/ffw/*.log

kill %1

echo "Finished."
