#!/usr/bin/bash

if [ "$EUID" -ne 0 ] ; then echo "EJECUTAR SCRIPT COMO USUARIO ROOT" ; exit 1 ; fi

zypper install sddm xorg-x11-server

zypper install libqt5-qtquickcontrols2 libqt5-qtgraphicaleffects

git clone https://github.com/stepanzubkov/where-is-my-sddm-theme.git #[/usr/share/sddm/themes]

update-alternatives --config default-displaymanager

systemctl set-default graphical.target

systemctl start sddm
