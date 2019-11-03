#!/bin/bash
sudo sh -c 'printf "deb-src http://deb.debian.org/debian buster main contrib\n" > /etc/apt/sources.list.d/buster.list'
sudo apt-get update
sudo apt-get source slurm-llnl=18.08.5.2-1


