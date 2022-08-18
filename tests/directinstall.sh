#/bin/sh

set -e

pacman -Syy

! true | pandoc

local-aur build -i pandoc-bin

true | pandoc
