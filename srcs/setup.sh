#!/bin/bash

set -e

if [[ $(grep "rohoarau" /etc/hosts 1>/dev/null; echo $?) -eq 1 ]]; then
	echo "127.0.1.1	rohoarau.42.fr" >> /etc/hosts
fi

DATA_FOLDER=/home/rohoarau/data
mkdir -p "$DATA_FOLDER"/mariadb
mkdir -p "$DATA_FOLDER"/wordpress

echo "Setup complete."
