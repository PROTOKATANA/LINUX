#!/usr/bin/bash

if [ "$EUID" -eq 0 ] ; then echo "EJECUTAR SCRIPT COMO USUARIO NOROOT" exit 1 ; fi

sudo zypper install --auto-agree-with-licenses -y rustup

rustup default stable
