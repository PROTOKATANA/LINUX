test -z "$PROFILEREAD" && . /etc/profile || true

eval $(ssh-agent -s)

sudo ssh-add $HOME/.ssh/proto

Hyprland
