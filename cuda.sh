#!/bin/bash

if [ "$EUID" -eq 0 ] ; then echo "EJECUTAR SCRIPT COMO USUARIO NOROOT" ; exit 1 ; fi

sudo usermod -a -G render,video KATANA

sudo zypper refresh

sudo zypper update -y

sudo zypper install openSUSE-repos-Slowroll-NVIDIA

sudo zypper addrepo -p 100 https://developer.download.nvidia.com/compute/cuda/repos/opensuse15/x86_64/cuda-opensuse15.repo

sudo zypper refresh

sudo zypper install cuda-toolkit

if ! grep -F "export PATH=\"/usr/local/cuda/bin:\$PATH\"" $HOME/.bashrc ; then

	echo "" >> $HOME/.bashrc

	echo "export PATH=\"/usr/local/cuda/bin:\$PATH\"" >> $HOME/.bashrc

fi
