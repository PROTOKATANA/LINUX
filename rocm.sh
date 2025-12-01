#!/bin/bash

if [ "$EUID" -ne 0 ] ; then echo "EJECUTAR SCRIPT COMO USUARIO ROOT" ; exit 1 ; fi

usermod -a -G render,video KATANA

rpm --import https://repo.radeon.com/rocm/rocm.gpg.key

zypper addrepo https://repo.radeon.com/rocm/zyp/zypper/ rocm-zypper

zypper refresh

zypper update -y

zypper install rocm

zypper remove rocm-opencl openmp-extras-devel

for iter in "$@" ; do

	if [ "$iter" == "--AMD" ] ; then

		zypper addrepo https://repo.radeon.com/amdgpu/latest/sle/15.6/main/x86_64/ amdgpu-latest

		zypper refresh

		zypper install amdgpu-dkms

		zypper install amdgpu-dkms-firmware

	fi

done
