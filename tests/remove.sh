#/bin/sh

set -e

pacman -Syy

sudo -u nobody local-aur build --noconfirm pandoc-bin
sudo -u nobody local-aur remove pandoc-bin

! pacman -Sy --noconfirm pandoc-bin
