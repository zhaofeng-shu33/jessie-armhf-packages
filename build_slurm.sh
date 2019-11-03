#!/bin/bash
sudo sh -c 'printf "deb-src http://deb.debian.org/debian buster main contrib\n" > /etc/apt/sources.list.d/buster.list'
sudo apt-get update
sudo apt-get --allow-unauthenticated source slurm-llnl=18.08.5.2-1
cd slurm-llnl-18.08.5.2
sudo apt-get build-dep -a armhf slurm-llnl=18.08.5.2-1

