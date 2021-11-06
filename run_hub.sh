#! /usr/bin/bash

# Script para execução do hub.py e captura de logs

# Executar como
# source ./run_hub.sh

echo "Starting Ryu..."

ryu-manager --verbose ./hub.py &> logs/hub/ryu-manager.log &

sleep 2

echo "Starting mininet..."

function run_mininet {
    echo "h1 tcpdump -v > logs/hub/tcpdump-h1.log &"
    echo "h1 echo"
    echo "h2 tcpdump -v > logs/hub/tcpdump-h2.log &"
    echo "h1 echo"
    echo "h3 tcpdump -v > logs/hub/tcpdump-h3.log &"
    echo "h1 sleep 0.5"
    echo "h1 echo"
    echo "h1 echo \"Ping from h1 to h3\""
    echo "h1 echo"
    echo "h1 ping -c 3 h3"
    echo "h1 echo"
    echo "exit"
    echo "h1 echo"
}

run_mininet | opennet &> logs/hub/mininet.log

sudo chown mininet:mininet logs/ffw/*.log

kill %1

echo "Finished."
