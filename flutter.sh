#!/bin/bash

if [ "$EUID" -eq 0 ] ; then echo "EJECUTAR SCRIPT COMO USUARIO NOROOT" ; exit 1 ; fi

for iter in "$@" ; do

	if [ "$iter" == "--instalar" ] ; then

		mkdir -p $HOME/RECURSOS

		wget -O $HOME/RECURSOS/flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.27.1-stable.tar.xz

		tar -xf $HOME/RECURSOS/flutter.tar.xz

		shred -u $HOME/RECURSOS/flutter.tar.xz

	fi

	if [ "$iter" == "--exportar" ] ; then

		if ! grep -F "export PATH=\"\$HOME/RECURSOS/flutter/bin:\$PATH\"" $HOME/.bashrc ; then

			echo "" >> $HOME/.bashrc

			echo "export PATH=\"\$HOME/RECURSOS/flutter/bin:\$PATH\"" >> $HOME/.bashrc

		fi

	fi

done
