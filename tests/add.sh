#/bin/sh

set -e

pacman -Syy

! pacman -Sy --noconfirm pandoc-bin

local-aur build --noconfirm pandoc-bin

pacman -Sy --noconfirm pandoc-bin
