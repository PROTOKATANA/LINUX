ESTOY UTILIZANDO OPENSUSE SLOWROLL, CON BTRFS Y EFI
MI HARDWARE ES AMD-NVIDIA
EL PROBLEMA ES QUE MIS DRIVERS SON NOUVEAU Y YO QUIERO LOS DRIVERS PRIVATIVOS
ESTOY UTILIZANDO WAYLAND HYPERLAND


sudo zypper addrepo --refresh https://download.nvidia.com/opensuse/tumbleweed NVIDIA
sudo zypper search nvidia-driver
sudo zypper install mkinitrd
sudo zypper install grub2
