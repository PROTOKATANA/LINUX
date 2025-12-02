#!/usr/bin/bash

if [ "$EUID" -ne 0 ] ; then echo "EJECUTAR SCRIPT COMO USUARIO ROOT" ; exit 1 ; fi

nvidia=(

	nvidia-video-G06

	nvidia-compute-utils-G06

	kernel-firmware-nvidia

	kernel-default-devel

	nvidia-gfxG06-kmp-default

	nvidia-openG06

    nvidia-glG06

    nvidia-utilsG06

	nvidia-computeG06

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

# nvidia-driver-G06-kmp-default

# uname -r

# rpm -qa | grep -E "nvidia|kernel-default"

# lsmod | grep -E "nouveau|nvidia"
