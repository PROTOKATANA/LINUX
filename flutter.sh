#!/usr/bin/bash

if [ "$EUID" -eq 0 ] ; then echo "EJECUTAR SCRIPT COMO USUARIO NOROOT" ; exit 1 ; fi

carpeta='torio'

for iter in "$@" ; do

	if [ "$iter" == "--instalar" ] ; then

		mkdir -p "$HOME/$carpeta"

		wget -O "$HOME/$carpeta/flutter.tar.xz" "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.27.1-stable.tar.xz"

	fi

	if [ "$iter" == "--exportar" ] ; then

		if ! grep -F "export PATH=\"\$HOME/$carpeta/flutter/bin:\$PATH\"" $HOME/.bashrc ; then

			echo "" >> $HOME/.bashrc

			echo "export PATH=\"\$HOME/$carpeta/flutter/bin:\$PATH\"" >> $HOME/.bashrc

		fi

	fi

done
