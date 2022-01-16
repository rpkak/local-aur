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
    pacman -Syy
    pacman -U --noconfirm /local-aur.pkg.tar.zst
    echo 'nobody ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/nobody
    sudo -u nobody bash"
