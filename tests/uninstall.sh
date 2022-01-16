#/bin/sh

set -e

# Check if directory exist.
[ -d /var/lib/local-aur/ ]

pacman -Rs --noconfirm local-aur

# Check if directory is removed.
[ ! -d /var/lib/local-aur/ ]

# Pacman repo should be removed from /etc/pacman.conf
pacman -Syy
