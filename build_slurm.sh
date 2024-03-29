#!/bin/bash
set -e -x

sudo sed -i '$d' /etc/apt/sources.list
sudo sed -i '$d' /etc/apt/sources.list

sudo sh -c 'printf "deb-src http://deb.debian.org/debian buster main contrib\n" > /etc/apt/sources.list.d/buster.list'
sudo apt-get update
sudo apt-get --yes upgrade
apt-get --allow-unauthenticated source slurm-llnl=18.08.5.2-1
cd slurm-llnl-18.08.5.2
# deb-helper >= 9
sed -i 's/11/9/g' ./debian/control
# libmysql-dev
sed -i 's/default-libmysql/libmysql/g' ./debian/control
sudo apt-get install --yes --no-upgrade devscripts
sudo mk-build-deps --install --tool='apt-get -o APT::Architecture=armhf -o Dpkg::Options::="--refuse-overwrite" --yes --no-upgrade' debian/control
dpkg-buildpackage -aarmhf -us -uc

