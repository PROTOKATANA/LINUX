#!/usr/bin/bash

if [ "$EUID" -ne 0 ] ; then echo "EJECUTAR SCRIPT COMO USUARIO ROOT" ; exit 1 ; fi

nvidia=(

	nvidia-video-G06

	nvidia-compute-utils-G06

	kernel-firmware-nvidia

	kernel-default-devel

)

usermod -a -G render,video katana

zypper install openSUSE-repos-Slowroll-NVIDIA

zypper refresh

zypper update -y

instalacion() {

	if zypper search -i "$1" &>> /dev/null ; then echo -e "existente : [$1]"

	else zypper install --auto-agree-with-licenses -y "$1" 2>&1 ; fi

}

for iter in "${nvidia[@]}" ; do instalacion "$iter" ; done
