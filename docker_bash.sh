#!/bin/sh

set -e

cd "$(dirname $0)"

makepkg -sf

if groups | grep -q '\bdocker\b'; then
    DOCKER_SUDO=""
else
    DOCKER_SUDO="sudo "
fi

${DOCKER_SUDO}docker run \
    -v "$(makepkg --packagelist)":/local-aur.pkg.tar.zst \
    --rm \
    -it \
    archlinux /bin/sh -c "
    pacman -Syy --noconfirm glibc
    pacman -U --noconfirm /local-aur.pkg.tar.zst
    bash"
