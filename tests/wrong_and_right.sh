#/bin/sh

set -e

local-aur build visual-studio-code-bin pandoc-bin

pacman -Sy --noconfirm pandoc-bin

pandoc --version
