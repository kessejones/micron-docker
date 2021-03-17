#!/bin/bash

echo "Start apache"
sudo service apache2 start

echo "Start redis"
sudo service redis-server start

# Prender execução do docker
tail -f /dev/null
