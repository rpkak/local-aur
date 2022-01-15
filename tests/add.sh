#/bin/sh

set -e

pacman -Syy

! pacman -Sy --noconfirm visual-studio-code-bin

sudo -u nobody local-aur add --noconfirm visual-studio-code-bin

pacman -Sy --noconfirm visual-studio-code-bin
