#!/bin/bash
set -e -x
sudo sh -c 'printf "deb-src http://deb.debian.org/debian buster main contrib\n" > /etc/apt/sources.list.d/buster.list'
sudo apt-get update
sudo apt-get --allow-unauthenticated source slurm-llnl=18.08.5.2-1
cd slurm-llnl-18.08.5.2
ls
# deb-helper >= 9
sed -i 's/11/9/g' ./debian/control
# libmysql-dev
sed -i 's/default-libmysql/libmysql/g' ./debian/control
sudo apt-get build-dep -aarmhf slurm-llnl=18.08.5.2-1
dpkg-buildpackage -aarmhf -us -uc

