#!/usr/bin/bash

if [ "$EUID" -eq 0 ] ; then echo "EJECUTAR SCRIPT COMO USUARIO NOROOT" ; exit 1 ; fi

for iter in "$@" ; do

	if [ "$iter" == "--generador" ] ; then

		ssh-keygen -t rsa -b 4096 -C "PROTOKATANA@proton.me" -f $HOME/.ssh/proto

		if ! grep -F "ssh-add \$HOME/.ssh/proto" $HOME/.profile ; then

			echo "" >> $HOME/.profile

			echo "ssh-add \$HOME/.ssh/proto" >> $HOME/.profile

		fi

	fi

	if [ "$iter" == "--ssh" ] ; then

		echo "" >> $HOME/.profile

		if ! grep -F "if [ -z \"\$SSH_AGENT_PID\" ]" $HOME/.profile ; then

			echo 'if [ -z "$SSH_AGENT_PID" ] ; then eval "$(ssh-agent -s)" ; ssh-add "$HOME/.ssh/proto" ; fi' >> $HOME/.profile

		fi

	fi

	if [ "$iter" == "--cuenta" ] ; then

		git config --global user.name "PROTOKATANA"

		git config --global user.email "PROTOKATANA@proton.me"

	fi

done

# ejecutar : ssh-add ~/.ssh/proto
