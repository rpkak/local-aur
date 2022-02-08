#/bin/sh

set -e

pacman -Syy

local-aur build pandoc-bin
local-aur remove pandoc-bin

! pacman -Sy --noconfirm pandoc-bin
