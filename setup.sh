#!/bin/bash

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -q chef
sudo rm -rf /etc/chef
sudo git clone https://github.com/tuzz/pi /etc/chef
sudo chef-solo
